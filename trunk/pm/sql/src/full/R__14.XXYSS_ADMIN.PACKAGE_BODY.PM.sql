CREATE OR REPLACE PACKAGE BODY "XXYSS_ADMIN"."PM" IS
  --
  --
$if $$Debugging >= 1 $then
  v_count INTEGER DEFAULT 0;
$end
  --
  -- Maximum number of record to delete before a commit
  c_max_count CONSTANT INTEGER DEFAULT 10000;
  --
  /* PACKAGE DATA */
  v_dummy_command VARCHAR2(32767);
  SUBTYPE command_t IS v_dummy_command%TYPE;
  v_last_command command_t := NULL;
  v_dummy_module_name VARCHAR2(60);
  SUBTYPE module_name_t IS v_dummy_module_name%TYPE;

  /* LOCAL MODULES */
  -- Return the database link for a database
  FUNCTION get_db_link(
    i_db IN pm_run.db%TYPE )
  RETURN VARCHAR2
  IS
  BEGIN
    IF i_db IS NOT NULL
    THEN
      RETURN '@' || UPPER(RTRIM(i_db));
    ELSE
      RETURN NULL;
    END IF;
$if $$Testing $then
  EXCEPTION
    WHEN OTHERS
    THEN
      RETURN NULL;
$end
  END get_db_link;
  --
  -- Get database startup time (local variant)
  PROCEDURE get_db_startup_time_l(
    i_cursor IN INTEGER ,
    i_db IN pm_run.db%TYPE ,
    i_db_link IN pm_run.db%TYPE ,
    o_db_startup_time IN OUT pm_run.db_startup_time%TYPE )
  IS
    c_command CONSTANT command_t := '
  SELECT  inst.startup_time
  FROM    v$instance<db_link> inst';

    v_error_position INTEGER;
    v_sql_function_code INTEGER;
    v_nr_rows INTEGER;

    c_module_name CONSTANT module_name_t := 'PM.GET_DB_STARTUP_TIME';
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_cursor: %s', i_cursor );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_db_link: %s', i_db_link );
$end

    /*
      Retrieve the startup time of the remote database.
    */
    dbms_sql.parse
    (
      i_cursor
    , replace(c_command, '<db_link>', i_db_link)
    , dbms_sql.native
    );
    dbms_sql.define_column(i_cursor, 1, o_db_startup_time);
    v_nr_rows := dbms_sql.execute_and_fetch(i_cursor);
    IF v_nr_rows > 0
    THEN
        dbms_sql.column_value(i_cursor, 1, o_db_startup_time);
    ELSE
        RAISE no_data_found;
    END IF;

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Last database startup: %s',
      to_char( o_db_startup_time, 'DD-MM-YYYY HH24:MI:SS' )
    );
    dbug.leave;
$if $$Testing $then
  EXCEPTION
    WHEN OTHERS
    THEN
      dbug.leave_on_error;
      v_error_position := dbms_sql.last_error_position;
      v_sql_function_code := dbms_sql.last_sql_function_code;
      dbug.print( 'error', 'Command: %s', c_command );
      dbug.print( 'error', 'Error at position: %s', v_error_position );
      dbug.print( 'error', 'SQL function code: %s', v_sql_function_code );

      RAISE;
$end
$end
  END get_db_startup_time_l;
  --
  -- Start a new run (local variant)
  PROCEDURE new_run_l(
    i_cursor IN INTEGER ,
    i_db IN pm_run.db%TYPE ,
    i_db_link IN pm_run.db%TYPE ,
    o_run_id OUT pm_run.run_id%TYPE ,
    o_db_startup_run_id OUT pm_run.run_id%TYPE )
  IS
    v_run_id pm_run.run_id%TYPE;
    v_db_startup_time pm_run.db_startup_time%TYPE;
    v_nr_rows INTEGER;
    c_module_name CONSTANT module_name_t := 'PM.NEW_RUN';

    CURSOR c_next_run_id
    IS
      SELECT  pm_run_seq.nextval
      FROM    dual;

    CURSOR c_db_startup_run_id
    (
      i_db IN pm_run.db%TYPE
    , i_db_startup_time IN pm_run.db_startup_time%TYPE
    )
    IS
      SELECT  MIN(run_id)
      FROM    pm_run
      WHERE   db = i_db
      AND     db_startup_time = i_db_startup_time;

  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_cursor: %s', i_cursor );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_db_link: %s', i_db_link );
$end

    get_db_startup_time_l( i_cursor, i_db, i_db_link, v_db_startup_time );

    LOOP
    BEGIN
      OPEN c_next_run_id;
      FETCH c_next_run_id
      INTO v_run_id;
      IF c_next_run_id%NOTFOUND
      THEN
        CLOSE c_next_run_id;
        RAISE no_data_found;
      ELSE
        CLOSE c_next_run_id;
      END IF;

      INSERT INTO pm_run
      ( db, run_id, timestamp, db_startup_time, error_msg )
      values
      ( i_db, v_run_id, sysdate, v_db_startup_time, NULL );
      o_run_id := v_run_id;

      EXIT; /* just once */

    EXCEPTION
      WHEN dup_val_on_index
      THEN
        NULL;
    END;
    END LOOP;

            /* will always find one, i.e. at least the last inserted one */
    OPEN c_db_startup_run_id( i_db, v_db_startup_time );
    FETCH c_db_startup_run_id
    INTO o_db_startup_run_id;
    CLOSE c_db_startup_run_id;

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'new run id: %s', v_run_id );
$end

    COMMIT; /* pm_run modified */

$if $$Debugging >= 1 $then
    dbug.leave;
$end
$if $$Testing $then
  EXCEPTION
    WHEN OTHERS
    THEN
$if $$Debugging >= 1 $then
      dbug.leave_on_error;
$end
      IF c_next_run_id%ISOPEN
      THEN
        CLOSE c_next_run_id;
      END IF;
      o_run_id := NULL;
      o_db_startup_run_id := NULL;
      -- raise again
      RAISE;
$end
  END new_run_l;
  --
  -- Get the internal SQL text identifier by key (local variant)
  FUNCTION get_sql_id_l(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_address IN pm_sql.address%TYPE )
  RETURN pm_sql.sql_id%type
  IS
    v_sql_id pm_sql.sql_id%TYPE;

    CURSOR c_get_sql_id
    (
      i_db IN pm_sql.db%TYPE
    , i_sql_hash_value IN pm_sql.hash_value%TYPE
    , i_sql_address  IN pm_sql.address%TYPE
    )
    IS
      SELECT  sql_id
      FROM    pm_sql
      WHERE   db = i_db
      AND     hash_value = i_sql_hash_value
      AND     address = i_sql_address;
  BEGIN
    OPEN c_get_sql_id( i_db, i_sql_hash_value, i_sql_address );
    FETCH c_get_sql_id
    INTO v_sql_id;
    IF c_get_sql_id%NOTFOUND
    THEN
      v_sql_id := NULL;
    END IF;
    CLOSE c_get_sql_id;
    RETURN v_sql_id;
$if $$Testing $then
  EXCEPTION
    WHEN OTHERS
    THEN
      IF c_get_sql_id%ISOPEN
      THEN
        CLOSE c_get_sql_id;
      END IF;
      RETURN NULL;
$end
  END get_sql_id_l;
  --
  --  Get the internal SQL text identifier by text lookup
  FUNCTION get_sql_id_by_text_l(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_text IN pm_sql_id.sql_text%TYPE )
  RETURN pm_sql.sql_id%type
  IS
    v_sql_id pm_sql.sql_id%TYPE;

    CURSOR c_pm_sql
    (
      i_db IN pm_sql.db%TYPE
    , i_sql_hash_value IN pm_sql.hash_value%TYPE
    , i_sql_text  IN pm_sql_id.sql_text%TYPE
    )
    IS
      SELECT  pm_sql.sql_id
      FROM    pm_sql
      ,       pm_sql_id
      WHERE   pm_sql.db = i_db
      AND     pm_sql.hash_value = i_sql_hash_value
      AND     pm_sql_id.sql_id = pm_sql.sql_id
      AND     dbms_lob.compare(pm_sql_id.sql_text, i_sql_text) = 0;
  BEGIN
    OPEN c_pm_sql( i_db, i_sql_hash_value, i_sql_text );
    FETCH c_pm_sql
    INTO v_sql_id;
    IF c_pm_sql%NOTFOUND
    THEN
      v_sql_id := NULL;
    END IF;
    CLOSE c_pm_sql;

    RETURN v_sql_id;
$if $$Testing $then
  EXCEPTION
    WHEN OTHERS
    THEN
      IF c_pm_sql%ISOPEN
      THEN
        CLOSE c_pm_sql;
      END IF;
      RETURN NULL;
$end
  END get_sql_id_by_text_l;
  --
  -- Get the statement id by text lookup
  FUNCTION get_statement_id_l(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_address IN pm_sql.address%TYPE )
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN get_statement_id(
             get_sql_id_l(
               i_db => i_db
             , i_sql_hash_value => i_sql_hash_value
             , i_sql_address => i_sql_address
             )
           );
  EXCEPTION
    WHEN OTHERS
    THEN
      RETURN NULL;
  END get_statement_id_l;
  --
  -- Get the statement by text lookup
  FUNCTION get_statement_l(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_address IN pm_sql.address%TYPE )
  RETURN pm_sql_id.sql_text%TYPE
  IS
  BEGIN
    RETURN get_statement(
             get_sql_id_l(
               i_db => i_db
             , i_sql_hash_value => i_sql_hash_value
             , i_sql_address => i_sql_address
             )
           );
  EXCEPTION
    WHEN OTHERS
    THEN
      RETURN NULL;
  END get_statement_l;
  --
  -- Insert a combination (db, hash value, address, command type, sql text)
  PROCEDURE ins_pm_sql_l(
    i_db IN pm_sql.db%TYPE ,
    i_hash_value IN pm_sql.hash_value%TYPE ,
    i_address IN pm_sql.address%TYPE ,
    i_command_type IN pm_sql_id.command_type%TYPE ,
    i_sql_text IN pm_sql_id.sql_text%TYPE ,
    i_sql_id IN pm_sql.sql_id%TYPE )
  IS
    c_module_name CONSTANT module_name_t := 'PM.PM_INS_SQL';
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_hash_value: %s', i_hash_value );
    dbug.print( 'input', 'i_address: %s', i_address );
    dbug.print( 'input', 'i_command_type: %s', i_command_type );
$end

    SAVEPOINT spt_sql;

    BEGIN
      INSERT INTO pm_sql_id
      (
        sql_id
      , command_type
      , created_by
      , creation_date
      , sql_text
      )
      VALUES
      (
        i_sql_id
      , i_command_type
      , user
      , sysdate
      , i_sql_text
      );
    EXCEPTION
      WHEN dup_val_on_index
      THEN
        NULL;
    END;

    INSERT INTO pm_sql
    (
      db
    , hash_value
    , address
    , sql_id
    )
    VALUES
    (
      i_db
    , i_hash_value
    , i_address
    , i_sql_id
    );

    COMMIT;

$if $$Debugging >= 1 $then
    dbug.leave;
$end
  EXCEPTION
    WHEN OTHERS
    THEN
$if $$Debugging >= 1 $then
      dbug.leave_on_error;
      dbug.print( 'error', 'error; sql id: ' || i_sql_id );
$end
      ROLLBACK TO spt_sql;
      RAISE;
  END ins_pm_sql_l;
  --
  -- Get a range of run id between start and end time
  PROCEDURE get_run_range_l(
    i_db IN pm_sql.db%TYPE ,
    i_start_time IN DATE ,
    i_end_time IN DATE ,
    o_lwb_run_id OUT pm_run.run_id%TYPE ,
    o_upb_run_id OUT pm_run.run_id%TYPE )
  IS
    CURSOR c_pm_run(i_db IN pm_run.db%TYPE) IS
      SELECT  MIN(lwb.run_id)
      ,       MAX(upb.run_id)
      FROM    pm_run lwb
      ,       pm_run upb
      WHERE   lwb.db = i_db
      AND     lwb.timestamp >= i_start_time
      AND     upb.db = i_db
      AND     upb.timestamp <  i_end_time;
  BEGIN
    OPEN c_pm_run(i_db);
    FETCH c_pm_run
    INTO o_lwb_run_id, o_upb_run_id;
    IF c_pm_run%NOTFOUND
    THEN
      o_lwb_run_id := NULL;
      o_upb_run_id := NULL;
      CLOSE c_pm_run;
    ELSE
      CLOSE c_pm_run;
    END IF;
  EXCEPTION
    WHEN OTHERS
    THEN
      IF c_pm_run%ISOPEN
      THEN
        CLOSE c_pm_run;
      END IF;
      o_lwb_run_id := NULL;
      o_upb_run_id := NULL;
  END get_run_range_l;
  --
  -- Parse and execute a dynamic SQL statement
  PROCEDURE parse_and_execute(
    i_command IN VARCHAR2 ,
    i_cursor IN INTEGER ,
    i_action IN VARCHAR2 := NULL ,
    i_db IN pm_run.db%TYPE := NULL ,
    i_db_link IN pm_run.db%TYPE := NULL ,
    i_run_id IN pm_run.run_id%TYPE := NULL )
  IS
    v_nr_rows INTEGER DEFAULT 0;
    v_command command_t := i_command;
    v_error_position INTEGER;
    v_sql_function_code INTEGER;
    c_module_name CONSTANT module_name_t := 'PM.PARSE_AND_EXECUTE';

$if $$Debugging >= 1 $then
    -- print a command with embedded new lines.
    PROCEDURE print( i_command IN command_t )
    IS
      -- New line
      c_nl CONSTANT CHAR(1) := CHR(10);
      v_pos INTEGER := 1;
      v_old_pos INTEGER := 0;
    BEGIN
      WHILE v_pos <> 0
      LOOP
        v_pos := instr( i_command, c_nl, v_old_pos + 1 );
        IF ( v_pos = 0 ) -- unsuccessful search
        THEN
          dbug.print( 'info',
                      to_char( v_old_pos + 1, '0000' ) || ': ' ||
                      substr( i_command, v_old_pos + 1 )
          );
        ELSE
          dbug.print(
                      'info',
                      to_char( v_old_pos + 1, '0000' ) || ': ' ||
                      substr( i_command, v_old_pos + 1, v_pos - v_old_pos - 1 )
          );
        END IF;
        v_old_pos := v_pos;
      END LOOP;
    END print;
$end
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_command: %s', i_command );
    dbug.print( 'input', 'i_action: %s', i_action );
$end

    /* i_db_link may be NULL bit still needs to be replaced */
    v_command := replace( v_command, '<db_link>', i_db_link );

$if $$Debugging >= 1 $then
    dbug.print( 'debug', 'v_command: %s', v_command );
$end

    v_last_command := v_command;
    dbms_sql.parse( i_cursor, v_command, dbms_sql.native );

    IF i_db IS NOT NULL
    THEN
      dbms_sql.bind_variable( i_cursor, ':db', i_db );
    END IF;

    IF i_run_id IS NOT NULL
    THEN
      dbms_sql.bind_variable( i_cursor, ':run_id', i_run_id );
    END IF;

    v_nr_rows := dbms_sql.execute( i_cursor );

$if $$Debugging >= 1 $then
    IF i_action = 'I'
    THEN
      dbug.print( 'info', 'Number of rows inserted: %s', v_nr_rows );
    ELSIF i_action = 'U'
    THEN
      dbug.print( 'info', 'Number of rows updated: %s', v_nr_rows );
    ELSIF i_action = 'D'
    THEN
      dbug.print( 'info', 'Number of rows deleted: %s', v_nr_rows );
    ELSE -- ??
      dbug.print( 'info', 'Number of rows processed: %s', v_nr_rows );
    END IF;

    dbug.leave;
$if $$Testing $then
  EXCEPTION
    WHEN    OTHERS
    THEN
      dbug.leave_on_error;
      print( v_command );
      v_error_position := dbms_sql.last_error_position;
      v_sql_function_code := dbms_sql.last_sql_function_code;
      dbug.print( 'error', 'Error at position: ' || to_char(v_error_position) );
      dbug.print( 'error', 'SQL function code: ' || to_char(v_sql_function_code) );

      RAISE;
$end
$end
  END parse_and_execute;
  --
  -- Cleanup pm_session info
  PROCEDURE cleanup_session_l(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE )
  IS
    c_module_name CONSTANT module_name_t := 'PM.CLEANUP_SESSION';
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_lwb_run_id: %s', i_lwb_run_id );
    dbug.print( 'input', 'i_upb_run_id: %s', i_upb_run_id );
$end

    DELETE
    FROM    pm_session
    WHERE   db = i_db
    AND     run_id BETWEEN i_lwb_run_id AND i_upb_run_id;

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Rows deleted from pm_session: %s', sql%ROWCOUNT );
$end

    COMMIT;

$if $$Debugging >= 1 $then
    dbug.leave;
$end
  END cleanup_session_l;
  --
  -- Cleanup pm_sqlarea info
  PROCEDURE cleanup_sqlarea_l(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE )
  IS
    c_module_name CONSTANT module_name_t := 'PM.CLEANUP_SQLAREA';
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_lwb_run_id: %s', i_lwb_run_id );
    dbug.print( 'input', 'i_upb_run_id: %s', i_upb_run_id );
$end

$if $$Debugging >= 1 $then
    v_count := 0;
$end
    LOOP
      DELETE
      FROM    pm_sqlarea are
      WHERE   rownum <= c_max_count
      AND     are.db = i_db
      AND     are.run_id BETWEEN i_lwb_run_id AND i_upb_run_id;

      COMMIT;

      EXIT WHEN sql%ROWCOUNT < c_max_count;

$if $$Debugging >= 1 $then
      v_count := v_count + sql%ROWCOUNT;
$end
    END LOOP;

    COMMIT;

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Rows deleted from pm_sqlarea: %s', v_count );
    dbug.leave;
$end
  END cleanup_sqlarea_l;
  --
  -- Cleanup pm_sql info (local variant)
  PROCEDURE cleanup_sql_l(
    i_cursor IN INTEGER ,
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE )
  IS
    c_module_name CONSTANT module_name_t := 'PM.CLEANUP_SQL';
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_lwb_run_id: %s', i_lwb_run_id );
    dbug.print( 'input', 'i_upb_run_id: %s', i_upb_run_id );
$end

    parse_and_execute( 'truncate table pm_sql_current', i_cursor );

    INSERT INTO pm_sql_current
      SELECT  db
      ,       hash_value
      ,       address
      FROM    pm_sqlarea
      UNION
      SELECT  db
      ,       sql_hash_value  hash_value
      ,       sql_address     address
      FROM    pm_session
      WHERE   sql_hash_value IS NOT NULL /* force NON NULL combinations */
      AND     sql_address IS NOT NULL;

    DELETE
    FROM    pm_sql
    WHERE   NOT EXISTS
            (
                    SELECT  1
                    FROM    pm_sql_current
                    WHERE   pm_sql_current.db = pm_sql.db
                    AND     pm_sql_current.hash_value = pm_sql.hash_value
                    AND     pm_sql_current.address = pm_sql.address
            );
    COMMIT;

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Rows deleted from pm_sql: %s', sql%ROWCOUNT );
    dbug.leave;
$end
  END cleanup_sql_l;
  --
  -- Cleanup pm_system_event info
  PROCEDURE cleanup_system_event_l(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE )
  IS
    c_module_name CONSTANT module_name_t := 'PM.CLEANUP_SYSTEM_EVENT';
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_lwb_run_id: %s', i_lwb_run_id );
    dbug.print( 'input', 'i_upb_run_id: %s', i_upb_run_id );
$end

    DELETE
    FROM    pm_system_event
    WHERE   db = i_db
    AND     run_id BETWEEN i_lwb_run_id AND i_upb_run_id;

    COMMIT;

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Rows deleted from pm_system_event: %s', sql%ROWCOUNT );
    dbug.leave;
$end
  END cleanup_system_event_l;
  --
  -- Cleanup pm_sysstat info
  PROCEDURE cleanup_sysstat_l(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE )
  IS
    c_module_name CONSTANT module_name_t := 'PM.CLEANUP_SYSSTAT';
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_lwb_run_id: %s', i_lwb_run_id );
    dbug.print( 'input', 'i_upb_run_id: %s', i_upb_run_id );
$end

    DELETE
    FROM    pm_sysstat
    WHERE   db = i_db
    AND     run_id BETWEEN i_lwb_run_id AND i_upb_run_id;

    COMMIT;

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Rows deleted from pm_sysstat: %s', sql%ROWCOUNT );
    dbug.leave;
$end
  END  cleanup_sysstat_l;
  --
  -- Cleanup pm_run info
  PROCEDURE cleanup_run_l(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE )
  IS
    c_module_name CONSTANT module_name_t := 'PM.CLEANUP_RUN';
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_lwb_run_id: %s', i_lwb_run_id );
    dbug.print( 'input', 'i_upb_run_id: %s', i_upb_run_id );
$end

    DELETE
    FROM    pm_run
    WHERE   db = i_db
    AND     run_id BETWEEN i_lwb_run_id AND i_upb_run_id;

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Rows deleted from pm_run: %s', sql%ROWCOUNT );
    dbug.leave;
$end
  END cleanup_run_l;
  --
  -- Cleanup info for a database instance
  PROCEDURE cleanup_l(
    i_cursor IN INTEGER ,
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE ,
    i_cleanup_run IN BOOLEAN := TRUE )
  IS
    c_module_name CONSTANT module_name_t := 'PM.CLEANUP';
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_lwb_run_id: %s', i_lwb_run_id );
    dbug.print( 'input', 'i_upb_run_id: %s', i_upb_run_id );
    dbug.print( 'input', 'i_cleanup_run: %s', i_cleanup_run );
$end

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Lower bound run id: %s', i_lwb_run_id );
    dbug.print( 'info', 'Upper bound run id: %s', i_upb_run_id );
$end

    cleanup_session_l( i_db, i_lwb_run_id, i_upb_run_id );
    cleanup_sqlarea_l( i_db, i_lwb_run_id, i_upb_run_id );
    cleanup_sql_l( i_cursor, i_db, i_lwb_run_id, i_upb_run_id );
    cleanup_system_event_l( i_db, i_lwb_run_id, i_upb_run_id );
    cleanup_sysstat_l( i_db, i_lwb_run_id, i_upb_run_id );
    IF i_cleanup_run
    THEN
      cleanup_run_l( i_db, i_lwb_run_id, i_upb_run_id );
    END IF;

    COMMIT;
$if $$Debugging >= 1 $then
    dbug.leave;
$end
  END cleanup_l;
  --
  -- Collect v$system_event info from a remote database
  PROCEDURE collect_system_event_l(
    i_cursor IN INTEGER ,
    i_db IN pm_run.db%TYPE ,
    i_db_link IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
    c_command command_t := '
      INSERT INTO pm_system_event_tmp
      (
        db
      , run_id
      , event
      , total_waits
      , total_timeouts
      , time_waited
      , average_wait
      , time_waited_micro
      , event_id
      , wait_class_id
      , wait_class#
      , wait_class
      )
        SELECT  :db
        ,       :run_id
        ,       s.event
        ,       s.total_waits
        ,       s.total_timeouts
        ,       s.time_waited
        ,       s.average_wait
        ,       time_waited_micro
        ,       event_id
        ,       wait_class_id
        ,       wait_class#
        ,       wait_class
        FROM    v$system_event<db_link> s';

    c_module_name CONSTANT module_name_t := 'PM.COLLECT_SYSTEM_EVENT';
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_run_id: %s', i_run_id );
    dbug.print( 'input', 'i_db_startup_run_id: %s', i_db_startup_run_id );
$end

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Adding v$system_event info' );
$end
    parse_and_execute( c_command, i_cursor, 'I', i_db, i_db_link, i_run_id );
    COMMIT;

$if $$Debugging >= 1 $then
    dbug.leave;
$end
  END collect_system_event_l;
  --
  -- Collect v$sysstat info from a remote database
  PROCEDURE collect_sysstat_l(
    i_cursor IN INTEGER ,
    i_db IN pm_run.db%TYPE ,
    i_db_link IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
    c_command command_t := '
      INSERT INTO pm_sysstat_tmp
      (
              db
      ,       run_id
      ,       name
      ,       class
      ,       value
      ,       stat_id
      )
        SELECT  :db
        ,       :run_id
        ,       sysstat.name
        ,       sysstat.class
        ,       sysstat.value
        ,       sysstat.stat_id
        FROM    v$sysstat<db_link> sysstat';

    c_module_name CONSTANT module_name_t := 'PM.COLLECT_SYSSTAT';
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_run_id: %s', i_run_id );
    dbug.print( 'input', 'i_db_startup_run_id: %s', i_db_startup_run_id );

    dbug.print( 'info', 'Adding v$sysstat info' );
$end
    parse_and_execute( c_command, i_cursor, 'I', i_db, i_db_link, i_run_id );

    COMMIT;

$if $$Debugging >= 1 $then
    dbug.leave;
$end
  END collect_sysstat_l;
  --
  -- Collect v$sqlarea info from a remote database
  PROCEDURE collect_sqlarea_l(
    i_cursor IN INTEGER ,
    i_db IN pm_run.db%TYPE ,
    i_db_link IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
    c_command command_t := q'[
declare
  l_clob clob;
begin
  dbms_lob.createtemporary
  ( lob_loc => l_clob
  , cache => true
  );
  for r_sqlarea in
  ( select  :db as db
    ,       to_date
            ( s.first_load_time
            , 'YYYY-MM-DD/HH24:MI:SS'
            ) as first_load_time
    ,       s.hash_value
    ,       rawtohex(s.address) as address
    ,       ( select usr.username from all_users<db_link> usr where usr.user_id = s.parsing_user_id ) as parsing_user_name
    ,       ( select sch.username from all_users<db_link> sch where sch.user_id = s.parsing_schema_id ) as parsing_schema_name
    ,       :run_id as run_id
    ,       s.executions
    ,       s.buffer_gets
    ,       s.disk_reads
    ,       s.parse_calls
    ,       s.sorts
    ,       s.kept_versions
    ,       s.loads
    ,       s.rows_processed
    ,       s.invalidations
    ,       s.module
    ,       s.action
    ,       case
              when t.piece is not null
              then t.sql_text
              else s.sql_text /* no v$sqltext_with_newlines so only one row with seq is 1 */
            end as sql_text
    ,       s.command_type
    ,       row_number() over (partition by t.address, t.hash_value order by t.piece desc) as seq
    ,       s.sql_id
    ,       s.direct_writes
    ,       s.application_wait_time
    ,       s.concurrency_wait_time
    ,       s.cluster_wait_time
    ,       s.user_io_wait_time
    ,       s.plsql_exec_time
    ,       s.java_exec_time
    ,       s.cpu_time
    ,       s.elapsed_time
    ,       s.sql_profile
    ,       (select o.object_name from dba_objects<db_link> o where o.object_id = s.program_id) as program_name
    ,       s.program_line#
    from    v$sqlarea<db_link> s
            left outer join v$sqltext_with_newlines<db_link> t
            on t.address = s.address and t.hash_value = s.hash_value
    order by
            s.address
    ,       s.hash_value
    ,       t.piece
  )
  loop
    dbms_lob.writeappend
    ( lob_loc => l_clob
    , amount => length(r_sqlarea.sql_text)
    , buffer => r_sqlarea.sql_text
    );

    if r_sqlarea.seq = 1
    then
      insert into pm_sqlarea_tmp
      ( db
      , first_load_time
      , hash_value
      , address
      , parsing_user_name
      , parsing_schema_name
      , run_id
      , executions
      , buffer_gets
      , disk_reads
      , parse_calls
      , sorts
      , kept_versions
      , loads
      , rows_processed
      , invalidations
      , module
      , action
      , sql_text
      , command_type
      , sql_id
      , direct_writes
      , application_wait_time
      , concurrency_wait_time
      , cluster_wait_time
      , user_io_wait_time
      , plsql_exec_time
      , java_exec_time
      , cpu_time
      , elapsed_time
      , sql_profile
      , program_name
      , program_line#
      )
      values
      ( r_sqlarea.db
      , r_sqlarea.first_load_time
      , r_sqlarea.hash_value
      , r_sqlarea.address
      , r_sqlarea.parsing_user_name
      , r_sqlarea.parsing_schema_name
      , r_sqlarea.run_id
      , r_sqlarea.executions
      , r_sqlarea.buffer_gets
      , r_sqlarea.disk_reads
      , r_sqlarea.parse_calls
      , r_sqlarea.sorts
      , r_sqlarea.kept_versions
      , r_sqlarea.loads
      , r_sqlarea.rows_processed
      , r_sqlarea.invalidations
      , r_sqlarea.module
      , r_sqlarea.action
      , l_clob
      , r_sqlarea.command_type
      , r_sqlarea.sql_id
      , r_sqlarea.direct_writes
      , r_sqlarea.application_wait_time
      , r_sqlarea.concurrency_wait_time
      , r_sqlarea.cluster_wait_time
      , r_sqlarea.user_io_wait_time
      , r_sqlarea.plsql_exec_time
      , r_sqlarea.java_exec_time
      , r_sqlarea.cpu_time
      , r_sqlarea.elapsed_time
      , r_sqlarea.sql_profile
      , r_sqlarea.program_name
      , r_sqlarea.program_line#
      );
      dbms_lob.trim(l_clob, 0);
    end if;
  end loop;
  dbms_lob.freetemporary(l_clob);
end;
]';

    c_module_name CONSTANT module_name_t := 'PM.COLLECT_SQLAREA';
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_run_id: %s', i_run_id );
    dbug.print( 'input', 'i_db_startup_run_id: %s', i_db_startup_run_id );

    dbug.print( 'info', 'Adding v$sqlarea info' );
$end

    parse_and_execute( c_command, i_cursor, 'I', i_db, i_db_link, i_run_id );

    COMMIT;

$if $$Debugging >= 1 $then
    dbug.leave;
$end
  END collect_sqlarea_l;
  --
  -- Collect v$session info from a remote database
  PROCEDURE collect_session_l(
    i_cursor IN INTEGER ,
    i_db IN pm_run.db%TYPE ,
    i_db_link IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
    c_command command_t := '
      INSERT INTO pm_session_tmp(
        db
      , run_id
      , sid
      , username
      , program
      , sql_hash_value
      , sql_address
      , sql_id
      , prev_sql_id
      , logon_time
      , last_call_et
      )
        SELECT  :db
        ,       :run_id
        ,       s.sid
        ,       CASE WHEN s.username IS NULL THEN ''ORACLE'' ELSE s.username END
        ,       s.program
        ,       CASE WHEN s.sql_hash_value = 0 THEN NULL ELSE s.sql_hash_value END
        ,       CASE WHEN rawtohex(s.sql_address) = ''00'' THEN NULL ELSE rawtohex(s.sql_address) END
        ,       s.sql_id
        ,       s.prev_sql_id
        ,       s.logon_time
        ,       s.last_call_et
        FROM    v$session<db_link> s';
    c_module_name CONSTANT module_name_t := 'PM.COLLECT_SESSION';
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_run_id: %s', i_run_id );
    dbug.print( 'input', 'i_db_startup_run_id: %s', i_db_startup_run_id );
$end

    parse_and_execute
    (
            'alter table pm_session disable constraint pm_ses_sql_fk1'
    ,       i_cursor
    );
$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Adding v$session info' );
$end
    parse_and_execute( c_command, i_cursor, 'I', i_db, i_db_link, i_run_id );

    COMMIT;

$if $$Debugging >= 1 $then
    dbug.leave;
$end
  END collect_session_l;
  --
  -- Process v$sqlarea info from a remote database
  PROCEDURE process_sqlarea_l(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
    c_module_name CONSTANT module_name_t := 'PM.PROCESS_SQLAREA';

            /* Get all new (db, hash value, address) combinations.
            */
    cursor  c_new_sql
    IS
            SELECT  art.db
            ,       art.hash_value
            ,       art.address
            ,       art.sql_text
            ,       art.command_type
            ,       art.sql_id
            ,       art.direct_writes
            ,       art.application_wait_time
            ,       art.concurrency_wait_time
            ,       art.cluster_wait_time
            ,       art.user_io_wait_time
            ,       art.plsql_exec_time
            ,       art.java_exec_time
            ,       art.cpu_time
            ,       art.elapsed_time
            ,       art.sql_profile
            ,       art.program_name
            ,       art.program_line#
            FROM    pm_sqlarea_tmp art
            WHERE   NOT EXISTS
                    (
                            SELECT  1
                            FROM    pm_sql
                            WHERE   pm_sql.db = art.db
                            AND     pm_sql.hash_value = art.hash_value
                            AND     pm_sql.address = art.address
                    )
            ORDER BY
                    art.db
            ,       art.hash_value
            ,       art.address
            ;

    cursor  c_sqlarea_tot
    (
            i_db IN pm_sqlarea.db%TYPE
    ,       i_first_load_time IN pm_sqlarea.first_load_time%TYPE
    ,       i_hash_value IN pm_sqlarea.hash_value%TYPE
    ,       i_address IN pm_sqlarea.address%TYPE
    ,       i_parsing_user_name IN pm_sqlarea.parsing_user_name%TYPE
    ,       i_parsing_schema_name IN pm_sqlarea.parsing_schema_name%TYPE
    )
    IS
            SELECT  NVL(sum(old.executions), 0)            executions
            ,       NVL(sum(old.buffer_gets), 0)           buffer_gets
            ,       NVL(sum(old.disk_reads), 0)            disk_reads
            ,       NVL(sum(old.parse_calls), 0)           parse_calls
            ,       NVL(sum(old.sorts), 0)                 sorts
            ,       NVL(sum(old.kept_versions), 0)         kept_versions
            ,       NVL(sum(old.loads), 0)                 loads
            ,       NVL(sum(old.rows_processed), 0)        rows_processed
            ,       NVL(sum(old.invalidations), 0)         invalidations
            ,       NVL(sum(old.direct_writes), 0)         direct_writes
            ,       NVL(sum(old.application_wait_time), 0) application_wait_time
            ,       NVL(sum(old.concurrency_wait_time), 0) concurrency_wait_time
            ,       NVL(sum(old.cluster_wait_time), 0)     cluster_wait_time
            ,       NVL(sum(old.user_io_wait_time), 0)     user_io_wait_time
            ,       NVL(sum(old.plsql_exec_time), 0)       plsql_exec_time
            ,       NVL(sum(old.java_exec_time), 0)        java_exec_time
            ,       NVL(sum(old.cpu_time), 0)              cpu_time
            ,       NVL(sum(old.elapsed_time), 0)          elapsed_time
            FROM    pm_sqlarea old
            WHERE   old.db = i_db
            AND     old.first_load_time = i_first_load_time
            AND     old.hash_value = i_hash_value
            AND     old.address = i_address
            AND     old.parsing_user_name = i_parsing_user_name
            AND     old.parsing_schema_name = i_parsing_schema_name
            AND     old.run_id BETWEEN i_db_startup_run_id AND i_run_id - 1;

    r_sqlarea_tot   c_sqlarea_tot%ROWTYPE;
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_run_id: %s', i_run_id );
    dbug.print( 'input', 'i_db_startup_run_id: %s', i_db_startup_run_id );
$end

    /*
    || Before inserting into pm_sqlarea we have to update pm_sql
    || in order to keep the foreign key constraint
    || from pm_sqlarea to pm_sql valid.
    */

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Processing pm_sql' );
$end

    FOR r_new_sql IN c_new_sql
    LOOP
    BEGIN
      pm.ins_pm_sql_l
      (
        r_new_sql.db
      , r_new_sql.hash_value
      , r_new_sql.address
      , r_new_sql.command_type
      , r_new_sql.sql_text
      , r_new_sql.sql_id
      );
    EXCEPTION
      WHEN OTHERS
      THEN
$if $$Debugging >= 1 $then
        dbug.print( 'error', 'db: %s; hash_value: %s; address: %s; command_type: %s',
                    r_new_sql.db,
                    r_new_sql.hash_value,
                    r_new_sql.address,
                    r_new_sql.command_type );
        dbug.print( 'error', r_new_sql.sql_text );
$end
        RAISE;
    END;
    END LOOP;

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Processing pm_sqlarea' );
$end

    /*
    || Calculate delta values for pm_sqlarea_tmp.
    || Do not insert records which do not contain any
    || info: executions, sorts, buffer_gets, etc. all 0.
    */
$if $$Debugging >= 1 $then
    v_count := 0;
$end

    FOR r_sqlarea_tmp IN
    (
      SELECT  art.db
      ,       art.first_load_time
      ,       art.hash_value
      ,       art.address
      ,       art.parsing_user_name
      ,       art.parsing_schema_name
      ,       art.run_id
      ,       art.executions
      ,       art.buffer_gets
      ,       art.disk_reads
      ,       art.parse_calls
      ,       art.sorts
      ,       art.kept_versions
      ,       art.loads
      ,       art.rows_processed
      ,       art.invalidations
      ,       art.module
      ,       art.action
      ,       art.sql_id
      ,       art.direct_writes
      ,       art.application_wait_time
      ,       art.concurrency_wait_time
      ,       art.cluster_wait_time
      ,       art.user_io_wait_time
      ,       art.plsql_exec_time
      ,       art.java_exec_time
      ,       art.cpu_time
      ,       art.elapsed_time
      ,       art.sql_profile
      ,       art.program_name
      ,       art.program_line#
      FROM    pm_sqlarea_tmp art
    )
    LOOP
      IF i_db_startup_run_id IS NOT NULL
      THEN
        /*
        || Now the statistics may have been stored in previous run's:
        || calculate delta's
        */
        OPEN c_sqlarea_tot
        (
          r_sqlarea_tmp.db
        , r_sqlarea_tmp.first_load_time
        , r_sqlarea_tmp.hash_value
        , r_sqlarea_tmp.address
        , r_sqlarea_tmp.parsing_user_name
        , r_sqlarea_tmp.parsing_schema_name
        );
        FETCH c_sqlarea_tot
        INTO r_sqlarea_tot;

        IF c_sqlarea_tot%FOUND
        THEN
          r_sqlarea_tmp.executions :=
            r_sqlarea_tmp.executions - r_sqlarea_tot.executions;
          r_sqlarea_tmp.buffer_gets :=
            r_sqlarea_tmp.buffer_gets - r_sqlarea_tot.buffer_gets;
          r_sqlarea_tmp.disk_reads :=
            r_sqlarea_tmp.disk_reads - r_sqlarea_tot.disk_reads;
          r_sqlarea_tmp.parse_calls :=
            r_sqlarea_tmp.parse_calls - r_sqlarea_tot.parse_calls;
          r_sqlarea_tmp.sorts :=
            r_sqlarea_tmp.sorts - r_sqlarea_tot.sorts;
          r_sqlarea_tmp.kept_versions :=
            r_sqlarea_tmp.kept_versions - r_sqlarea_tot.kept_versions;
          r_sqlarea_tmp.loads :=
            r_sqlarea_tmp.loads - r_sqlarea_tot.loads;
          r_sqlarea_tmp.rows_processed :=
            r_sqlarea_tmp.rows_processed - r_sqlarea_tot.rows_processed;
          r_sqlarea_tmp.invalidations :=
            r_sqlarea_tmp.invalidations - r_sqlarea_tot.invalidations;
          r_sqlarea_tmp.direct_writes :=
            r_sqlarea_tmp.direct_writes - r_sqlarea_tot.direct_writes;
          r_sqlarea_tmp.application_wait_time :=
            r_sqlarea_tmp.application_wait_time - r_sqlarea_tot.application_wait_time;
          r_sqlarea_tmp.concurrency_wait_time :=
            r_sqlarea_tmp.concurrency_wait_time - r_sqlarea_tot.concurrency_wait_time;
          r_sqlarea_tmp.cluster_wait_time :=
            r_sqlarea_tmp.cluster_wait_time - r_sqlarea_tot.cluster_wait_time;
          r_sqlarea_tmp.user_io_wait_time :=
            r_sqlarea_tmp.user_io_wait_time - r_sqlarea_tot.user_io_wait_time;
          r_sqlarea_tmp.plsql_exec_time :=
            r_sqlarea_tmp.plsql_exec_time - r_sqlarea_tot.plsql_exec_time;
          r_sqlarea_tmp.java_exec_time :=
            r_sqlarea_tmp.java_exec_time - r_sqlarea_tot.java_exec_time;
          r_sqlarea_tmp.cpu_time :=
            r_sqlarea_tmp.cpu_time - r_sqlarea_tot.cpu_time;
          r_sqlarea_tmp.elapsed_time :=
            r_sqlarea_tmp.elapsed_time - r_sqlarea_tot.elapsed_time;
        END IF;
        CLOSE c_sqlarea_tot;
      END IF;

      IF
      ( /* check constraint PM_ARE_CK2 */
        r_sqlarea_tmp.executions >= 0 AND
        r_sqlarea_tmp.buffer_gets >= 0 AND
        r_sqlarea_tmp.disk_reads >= 0 AND
        r_sqlarea_tmp.parse_calls >= 0 AND
        r_sqlarea_tmp.sorts >= 0 AND
        r_sqlarea_tmp.kept_versions >= 0 AND
        r_sqlarea_tmp.loads >= 0 AND
        r_sqlarea_tmp.rows_processed >= 0 AND
        r_sqlarea_tmp.invalidations >= 0 AND
        r_sqlarea_tmp.direct_writes >= 0 AND
        r_sqlarea_tmp.application_wait_time >= 0 AND
        r_sqlarea_tmp.concurrency_wait_time >= 0 AND
        r_sqlarea_tmp.cluster_wait_time >= 0 AND
        r_sqlarea_tmp.user_io_wait_time >= 0 AND
        r_sqlarea_tmp.plsql_exec_time >= 0 AND
        r_sqlarea_tmp.java_exec_time >= 0 AND
        r_sqlarea_tmp.cpu_time >= 0 AND
        r_sqlarea_tmp.elapsed_time >= 0
      )
      AND
      ( /* check constraint PM_ARE_CK3 */
        r_sqlarea_tmp.executions +
        r_sqlarea_tmp.buffer_gets +
        r_sqlarea_tmp.disk_reads +
        r_sqlarea_tmp.parse_calls +
        r_sqlarea_tmp.sorts +
        r_sqlarea_tmp.kept_versions +
        r_sqlarea_tmp.loads +
        r_sqlarea_tmp.rows_processed +
        r_sqlarea_tmp.invalidations +
        r_sqlarea_tmp.direct_writes +
        r_sqlarea_tmp.application_wait_time +
        r_sqlarea_tmp.concurrency_wait_time +
        r_sqlarea_tmp.cluster_wait_time +
        r_sqlarea_tmp.user_io_wait_time +
        r_sqlarea_tmp.plsql_exec_time +
        r_sqlarea_tmp.java_exec_time +
        r_sqlarea_tmp.cpu_time +
        r_sqlarea_tmp.elapsed_time > 0
      )
      THEN
      BEGIN
        INSERT INTO pm_sqlarea
        (
          db
        , first_load_time
        , hash_value
        , address
        , parsing_user_name
        , parsing_schema_name
        , run_id
        , executions
        , buffer_gets
        , disk_reads
        , parse_calls
        , sorts
        , kept_versions
        , loads
        , rows_processed
        , invalidations
        , module
        , action
        , sql_id
        , direct_writes
        , application_wait_time
        , concurrency_wait_time
        , cluster_wait_time
        , user_io_wait_time
        , plsql_exec_time
        , java_exec_time
        , cpu_time
        , elapsed_time
        , sql_profile
        , program_name
        , program_line#
        )
        values
        (
          r_sqlarea_tmp.db
        , r_sqlarea_tmp.first_load_time
        , r_sqlarea_tmp.hash_value
        , r_sqlarea_tmp.address
        , r_sqlarea_tmp.parsing_user_name
        , r_sqlarea_tmp.parsing_schema_name
        , r_sqlarea_tmp.run_id
        , r_sqlarea_tmp.executions
        , r_sqlarea_tmp.buffer_gets
        , r_sqlarea_tmp.disk_reads
        , r_sqlarea_tmp.parse_calls
        , r_sqlarea_tmp.sorts
        , r_sqlarea_tmp.kept_versions
        , r_sqlarea_tmp.loads
        , r_sqlarea_tmp.rows_processed
        , r_sqlarea_tmp.invalidations
        , r_sqlarea_tmp.module
        , r_sqlarea_tmp.action
        , r_sqlarea_tmp.sql_id
        , r_sqlarea_tmp.direct_writes
        , r_sqlarea_tmp.application_wait_time
        , r_sqlarea_tmp.concurrency_wait_time
        , r_sqlarea_tmp.cluster_wait_time
        , r_sqlarea_tmp.user_io_wait_time
        , r_sqlarea_tmp.plsql_exec_time
        , r_sqlarea_tmp.java_exec_time
        , r_sqlarea_tmp.cpu_time
        , r_sqlarea_tmp.elapsed_time
        , r_sqlarea_tmp.sql_profile
        , r_sqlarea_tmp.program_name
        , r_sqlarea_tmp.program_line#
        );
$if $$Debugging >= 1 $then
        v_count := v_count + 1;
$end
      EXCEPTION
        WHEN    OTHERS
        THEN
$if $$Debugging >= 1 $then
          dbug.print( 'error', 'hash_value: ' || r_sqlarea_tmp.hash_value );
          dbug.print( 'error', 'address: ' || r_sqlarea_tmp.address );
          dbug.print( 'error', 'first_load_time: ' || r_sqlarea_tmp.first_load_time );
          dbug.print( 'error', 'parsing_user_name: ' || r_sqlarea_tmp.parsing_user_name );
          dbug.print( 'error', 'parsing_schema_name: ' || r_sqlarea_tmp.parsing_schema_name );
$end
          NULL;
      END;
      END IF;
    END LOOP;

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Rows added to pm_sqlarea: %s', v_count );
$end

    COMMIT;

$if $$Debugging >= 1 $then
    dbug.leave;
$end
  END process_sqlarea_l;
  --
  -- Process v$sysstat info from a remote database
  PROCEDURE process_sysstat_l(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
    /*
    ||
    || Update the system statistics table.
    || If the combination (db, run_id, db_startup_time, name) already
    || exists, the value must be adjusted to reflect changes since the last
    || snapshot.
    ||
    */
    c_module_name CONSTANT module_name_t := 'PM.PROCESS_SYSSTAT';

    cursor  c_sysstat_tot( i_name IN pm_sysstat.name%TYPE )
    IS
            SELECT  NVL(sum(value), 0)      value
            FROM    pm_sysstat old
            WHERE   old.db = i_db
            AND     old.run_id BETWEEN i_db_startup_run_id AND i_run_id - 1
            AND     old.name = i_name;

    r_sysstat_tot c_sysstat_tot%ROWTYPE;
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_run_id: %s', i_run_id );
    dbug.print( 'input', 'i_db_startup_run_id: %s', i_db_startup_run_id );

    dbug.print( 'info', 'Processing pm_sysstat' );
    v_count := 0;
$end

    /* subtract old values */
    FOR r_sysstat_tmp IN
    (
      SELECT  db
      ,       run_id
      ,       name
      ,       class
      ,       value
      ,       stat_id
      FROM    pm_sysstat_tmp
    )
    LOOP
      IF i_db_startup_run_id IS NOT NULL
      THEN
        OPEN c_sysstat_tot( r_sysstat_tmp.name );
        FETCH c_sysstat_tot
        INTO r_sysstat_tot;

        IF c_sysstat_tot%FOUND
        THEN
          r_sysstat_tmp.value := r_sysstat_tmp.value - r_sysstat_tot.value;
        END IF;
        CLOSE c_sysstat_tot;
      END IF;

        /* Check constraint PM_SYS_CK2 */
      IF ( r_sysstat_tmp.value >= 0 )
      THEN
      BEGIN
        INSERT INTO pm_sysstat
        (
          db
        , run_id
        , name
        , class
        , value
        , stat_id
        )
        values
        (
          r_sysstat_tmp.db
        , r_sysstat_tmp.run_id
        , r_sysstat_tmp.name
        , r_sysstat_tmp.class
        , r_sysstat_tmp.value
        , r_sysstat_tmp.stat_id
        );
$if $$Debugging >= 1 $then
        v_count := v_count + 1;
$end
      EXCEPTION
        WHEN OTHERS
        THEN
$if $$Debugging >= 1 $then
          dbug.print( 'error', 'db: %s; run_id: %s; name: %s; class: %s; value: %s',
                      r_sysstat_tmp.db,
                      r_sysstat_tmp.run_id,
                      r_sysstat_tmp.name,
                      r_sysstat_tmp.class,
                      r_sysstat_tmp.value );
$end
          NULL;
      END;
      END IF;
    END LOOP;
    COMMIT;

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Rows added to pm_sysstat: %s', v_count );
    dbug.leave;
$end
  END process_sysstat_l;
  --
  -- Process v$session info for a run
  PROCEDURE process_session_l(
    i_cursor IN INTEGER ,
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
    c_module_name CONSTANT module_name_t := 'PM.PROCESS_SESSION';

    cursor c_session IS
      SELECT  db
      ,       run_id
      ,       sid
      FROM    pm_session
      WHERE   db = i_db
      AND     sql_hash_value IS NOT NULL
      AND     sql_address IS NOT NULL
      AND     NOT EXISTS
              (
                SELECT  1
                FROM    pm_sql
                WHERE   pm_sql.db = pm_session.db
                AND     pm_sql.hash_value = pm_session.sql_hash_value
                AND     pm_sql.address = pm_session.sql_address
              )
      FOR UPDATE OF
              sql_hash_value
      ,       sql_address;

    BEGIN
$if $$Debugging >= 1 $then
      dbug.enter( c_module_name );
      dbug.print( 'input', 'i_db: %s', i_db );
      dbug.print( 'input', 'i_run_id: %s', i_run_id );
      dbug.print( 'input', 'i_db_startup_run_id: %s', i_db_startup_run_id );

      dbug.print( 'info', 'Processing pm_session' );
$end

      FOR r_session_tmp IN
      (
        SELECT  db
        ,       run_id
        ,       sid
        ,       username
        ,       program
        ,       sql_hash_value
        ,       sql_address
        ,       sql_id
        ,       prev_sql_id
        ,       logon_time
        ,       last_call_et
        FROM    pm_session_tmp
      )
      LOOP
      BEGIN
        INSERT INTO pm_session
        (
          db
        , run_id
        , sid
        , username
        , program
        , sql_hash_value
        , sql_address
        , sql_id
        , prev_sql_id
        , logon_time
        , last_call_et
        )
        values
        (
          r_session_tmp.db
        , r_session_tmp.run_id
        , r_session_tmp.sid
        , r_session_tmp.username
        , r_session_tmp.program
        , r_session_tmp.sql_hash_value
        , r_session_tmp.sql_address
        , r_session_tmp.sql_id
        , r_session_tmp.prev_sql_id
        , r_session_tmp.logon_time
        , r_session_tmp.last_call_et
        );
      EXCEPTION
        WHEN OTHERS
        THEN
$if $$Debugging >= 1 $then
          dbug.print( 'error', 'db: ' || r_session_tmp.db );
          dbug.print( 'error', 'run_id: ' || r_session_tmp.run_id );
          dbug.print( 'error', 'sid: ' || r_session_tmp.sid );
          dbug.print( 'error', 'username: ' || r_session_tmp.username );
          dbug.print( 'error', 'program: ' || r_session_tmp.program );
          dbug.print( 'error', 'sql_hash_value: ' || r_session_tmp.sql_hash_value );
          dbug.print( 'error', 'sql_address: ' || r_session_tmp.sql_address );
          dbug.print( 'error', 'sql_id: ' || r_session_tmp.sql_id );
          dbug.print( 'error', 'prev_sql_id: ' || r_session_tmp.prev_sql_id );
          dbug.print( 'error', 'logon_time: ' || r_session_tmp.logon_time );
          dbug.print( 'error', 'last_call_et: ' || r_session_tmp.last_call_et );
$end
          NULL;
      END;
      END LOOP;

        /*
        ||
        || Keep the foreign key constraint PM_SESSION - PM_SQL valid.
        ||
        */
$if $$Debugging >= 1 $then
      v_count := 0;
$end
      FOR r_session IN c_session
      LOOP
        UPDATE  pm_session
        SET     sql_hash_value = NULL
        ,       sql_address = NULL
        WHERE current OF c_session;
$if $$Debugging >= 1 $then
        v_count := v_count + 1;
$end
      END LOOP;

$if $$Debugging >= 1 $then
      dbug.print( 'info', 'Rows updated of pm_session: %s', v_count );
$end

      parse_and_execute
      (
        'alter table pm_session enable constraint pm_ses_sql_fk1'
      , i_cursor
      );

$if $$Debugging >= 1 $then
      dbug.leave;
$end
  END process_session_l;
  --
  -- Process v$system_event info from a remote database
  PROCEDURE process_system_event_l(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
    /*
    ||
    || Update the system event table.
    || If the combination (db, run_id, db_startup_time, event) already exists,
    || the number of total waits, etc. must adjusted to reflect changes since
    || the last snapshot.
    ||
    */
    c_module_name CONSTANT module_name_t := 'PM.PROCESS_SYSTEM_EVENT';

    cursor c_system_event_tot( i_event IN pm_system_event.event%TYPE )
    IS
      SELECT  NVL(sum(total_waits), 0)        total_waits
      ,       NVL(sum(total_timeouts), 0)     total_timeouts
      ,       NVL(sum(time_waited), 0)        time_waited
      ,       NVL(sum(time_waited_micro), 0)  time_waited_micro
      FROM    pm_system_event old
      WHERE   old.db = i_db
      AND     old.run_id BETWEEN i_db_startup_run_id AND i_run_id - 1
      AND     old.event = i_event;

    r_system_event_tot c_system_event_tot%ROWTYPE;
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
    dbug.print( 'input', 'i_run_id: %s', i_run_id );
    dbug.print( 'input', 'i_db_startup_run_id: %s', i_db_startup_run_id );

    dbug.print( 'info', 'Processing pm_system_event' );

    dbug.print( 'info', 'inserting into pm_system_event' );

    v_count := 0;
$end

    FOR r_system_event_tmp IN
    (
      SELECT  db
      ,       run_id
      ,       event
      ,       total_waits
      ,       total_timeouts
      ,       time_waited
      ,       time_waited_micro
      ,       event_id
      ,       wait_class_id
      ,       wait_class#
      ,       wait_class
      FROM    pm_system_event_tmp
    )
    LOOP
      IF i_db_startup_run_id IS NOT NULL
      THEN
        /* subtract old values */

        OPEN c_system_event_tot( r_system_event_tmp.event );
        FETCH c_system_event_tot
        INTO r_system_event_tot;

        IF c_system_event_tot%FOUND
        THEN
          r_system_event_tmp.total_waits :=
            r_system_event_tmp.total_waits - r_system_event_tot.total_waits;
          r_system_event_tmp.total_timeouts :=
            r_system_event_tmp.total_timeouts - r_system_event_tot.total_timeouts;
          r_system_event_tmp.time_waited :=
            r_system_event_tmp.time_waited - r_system_event_tot.time_waited;
          r_system_event_tmp.time_waited_micro :=
            r_system_event_tmp.time_waited_micro - r_system_event_tot.time_waited_micro;
        END IF;
        CLOSE   c_system_event_tot;
      END IF;

      /* Check constraint PM_SEV_CK2 */
      IF r_system_event_tmp.total_waits >= 0
      AND r_system_event_tmp.total_timeouts >= 0
      AND r_system_event_tmp.time_waited >= 0
      AND r_system_event_tmp.time_waited_micro >= 0
      THEN
      BEGIN
        INSERT  INTO pm_system_event
        (
          db
        , run_id
        , event
        , total_waits
        , total_timeouts
        , time_waited
        , average_wait
        , time_waited_micro
        , event_id
        , wait_class_id
        , wait_class#
        , wait_class
        )
        values
        (
          r_system_event_tmp.db
        , r_system_event_tmp.run_id
        , r_system_event_tmp.event
        , r_system_event_tmp.total_waits
        , r_system_event_tmp.total_timeouts
        , r_system_event_tmp.time_waited
        , decode
          (
            NVL(r_system_event_tmp.total_waits, 0)
          , 0
          , 0
          , r_system_event_tmp.time_waited / r_system_event_tmp.total_waits
          )
        , r_system_event_tmp.time_waited_micro
        , r_system_event_tmp.event_id
        , r_system_event_tmp.wait_class_id
        , r_system_event_tmp.wait_class#
        , r_system_event_tmp.wait_class
        );

$if $$Debugging >= 1 $then
        v_count := v_count + 1;
$end
      EXCEPTION
        WHEN OTHERS
        THEN
$if $$Debugging >= 1 $then
          dbug.print( 'error', 'db: %s; run_id: %s; event: %s',
                      r_system_event_tmp.db,
                      r_system_event_tmp.run_id,
                      r_system_event_tmp.event );
$end
          NULL;
      END;
      END IF;
    END LOOP;

    COMMIT;

$if $$Debugging >= 1 $then
    dbug.print( 'info', 'Rows added to pm_system_event: %s', v_count );
    dbug.leave;
$end
  END process_system_event_l;
  --
  -- Collect info for a specific database instance. (local variant)
  PROCEDURE collect_l(
    i_cursor IN INTEGER ,
    i_db IN pm_run.db%TYPE ,
    i_db_link IN pm_run.db%TYPE )
  IS
    v_run_id                pm_run.run_id%TYPE;
    v_db_startup_run_id     pm_run.run_id%TYPE;
    c_module_name           CONSTANT module_name_t := 'PM.COLLECT';

    PROCEDURE truncate_temp_tables
    IS
    BEGIN
      FOR r_table IN
      (
        SELECT  table_name
        FROM    user_tables
        WHERE   table_name like 'PM_%_TMP'
      )
      LOOP
        parse_and_execute( 'truncate table ' || r_table.table_name, i_cursor );
      END LOOP;
    END truncate_temp_tables;
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
$end

      /*
      || prevent errors with database links
      */
    parse_and_execute( 'alter session set global_names = false', i_cursor );
    truncate_temp_tables;
    new_run_l( i_cursor, i_db, i_db_link, v_run_id, v_db_startup_run_id );
    collect_system_event_l( i_cursor, i_db, i_db_link, v_run_id, v_db_startup_run_id );
    collect_sysstat_l( i_cursor, i_db, i_db_link, v_run_id, v_db_startup_run_id );
    collect_sqlarea_l( i_cursor, i_db, i_db_link, v_run_id, v_db_startup_run_id );
    collect_session_l( i_cursor, i_db, i_db_link, v_run_id, v_db_startup_run_id );
    process_system_event_l( i_db, v_run_id, v_db_startup_run_id );
    process_sysstat_l( i_db, v_run_id, v_db_startup_run_id );
    process_sqlarea_l( i_db, v_run_id, v_db_startup_run_id );
    process_session_l( i_cursor, i_db, v_run_id, v_db_startup_run_id );

    /*
       GJP 30-JUN-1999
       do not truncate in order to record and playback
    */

    /*
    truncate_temp_tables;
    */

    COMMIT;

$if $$Debugging >= 1 $then
    dbug.leave;
$end
$if $$Testing $then
  EXCEPTION
    WHEN OTHERS
    THEN
$if $$Debugging >= 1 $then
      dbug.leave_on_error;
$end
              /* remove all children of this run but not the run and error itself */
      pm.cleanup_l( i_cursor, i_db, v_run_id, v_run_id, false );

      DECLARE
        v_error_msg CONSTANT pm_run.error_msg%type := SUBSTR(sqlerrm, 1, 4000);
      BEGIN
        UPDATE  pm_run
        SET     error_msg = v_error_msg
        WHERE   run_id = v_run_id;
      END;

      RAISE;
$end
  END collect_l;
  --
  -- Process info from temporary tables; do not use remote database
  PROCEDURE process_l(
    i_cursor IN INTEGER ,
    i_db IN pm_run.db%TYPE )
  IS
    v_run_id                pm_run.run_id%TYPE;
    v_db_startup_run_id     pm_run.run_id%TYPE;
    c_module_name           CONSTANT module_name_t := 'PM.PROCESS';

    cursor c_last_run( i_db IN pm_run.db%TYPE )
    IS
      SELECT  MAX(run_id)
      FROM    pm_run run
      WHERE   run.db = i_db;
  BEGIN
$if $$Debugging >= 1 $then
    dbug.enter( c_module_name );
    dbug.print( 'input', 'i_db: %s', i_db );
$end

    OPEN c_last_run( i_db );
    FETCH c_last_run
    INTO v_run_id;
    IF c_last_run%NOTFOUND
    THEN
      RAISE NO_DATA_FOUND;
    END IF;
    CLOSE c_last_run;
    v_db_startup_run_id := v_run_id; /* is an error !!!! */

    process_system_event_l( i_db, v_run_id, v_db_startup_run_id );
    process_sysstat_l( i_db, v_run_id, v_db_startup_run_id );
    process_sqlarea_l( i_db, v_run_id, v_db_startup_run_id );
    process_session_l( i_cursor, i_db, v_run_id, v_db_startup_run_id );
      /*
         GJP 30-JUN-1999
         do not truncate in order to record and playback
      */
    /*truncate_temp_tables;*/
    COMMIT;

$if $$Debugging >= 1 $then
    dbug.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      dbug.leave_on_error;
      RAISE;
$end
  END process_l;

  /* GLOBAL MODULES */
  --
  -- Return global_name if i_db is null
  FUNCTION get_db(
    i_db IN pm_run.db%TYPE )
  RETURN VARCHAR2
  IS
    v_db pm_run.db%TYPE;
  BEGIN
    IF i_db IS NULL
    THEN
      SELECT  global_name
      INTO    v_db
      FROM    global_name
      WHERE   ROWNUM = 1;
    ELSE
      v_db := i_db;
    END IF;
    RETURN UPPER(RTRIM(v_db));
  EXCEPTION
    WHEN OTHERS
    THEN
      RETURN NULL;
  END get_db;
  --
  -- Get database startup time
  PROCEDURE get_db_startup_time(
    i_db IN pm_run.db%TYPE ,
    o_db_startup_time IN OUT pm_run.db_startup_time%TYPE )
  IS
    v_cursor INTEGER := NULL;
  BEGIN
    v_cursor := dbms_sql.open_cursor;
    pm.get_db_startup_time_l(
      v_cursor
    , pm.get_db(i_db)
    , pm.get_db_link(i_db)
    , o_db_startup_time );
    dbms_sql.close_cursor(v_cursor);
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
  END get_db_startup_time;
  --
  -- Start a new run
  PROCEDURE new_run(
    i_db IN pm_run.db%TYPE ,
    o_run_id OUT pm_run.run_id%TYPE ,
    o_db_startup_run_id OUT pm_run.run_id%TYPE )
  IS
    v_cursor INTEGER := NULL;
  BEGIN
    v_cursor := dbms_sql.open_cursor;
    pm.new_run_l(
      v_cursor
    , pm.get_db(i_db)
    , pm.get_db_link(i_db)
    , o_run_id
    , o_db_startup_run_id );
    dbms_sql.close_cursor(v_cursor);
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
  END new_run;
  --
  -- Get the internal SQL text identifier by key
  FUNCTION get_sql_id(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_address IN pm_sql.address%TYPE )
  RETURN pm_sql.sql_id%type
  IS
  BEGIN
    RETURN pm.get_sql_id_l( pm.get_db(i_db), i_sql_hash_value, i_sql_address );
  END get_sql_id;
  --
  --  Get the internal SQL text identifier by text lookup
  FUNCTION get_sql_id_by_text(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_text IN pm_sql_id.sql_text%TYPE )
  RETURN pm_sql.sql_id%type
  IS
  BEGIN
    RETURN pm.get_sql_id_by_text_l( pm.get_db(i_db), i_sql_hash_value, i_sql_text );
  END;
  --
  -- Get the statement id by text lookup
  FUNCTION get_statement_id(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_address IN pm_sql.address%TYPE )
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN get_statement_id_l(
             pm.get_db(i_db)
           , i_sql_hash_value
           , i_sql_address );
  END get_statement_id;
  --
  -- Get the statement id by text lookup
  FUNCTION get_statement_id(
    i_sql_id IN pm_sql.sql_id%TYPE )
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'ORAMNTR-' || to_char( i_sql_id );
  EXCEPTION
    WHEN OTHERS
    THEN
      RETURN NULL;
  END;
  --
  -- Get the statement by text lookup
  FUNCTION get_statement(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_address IN pm_sql.address%TYPE )
  RETURN pm_sql_id.sql_text%TYPE
  IS
  BEGIN
    RETURN get_statement_l(
             pm.get_db(i_db)
           , i_sql_hash_value
           , i_sql_address );
  END get_statement;
  --
  -- Get the statement by text lookup
  FUNCTION get_statement(
    i_sql_id IN pm_sql_id.sql_id%TYPE )
  RETURN pm_sql_id.sql_text%TYPE
  IS
    v_statement pm_sql_id.sql_text%TYPE := NULL;
  BEGIN
    SELECT  sql_text
    INTO    v_statement
    FROM    pm_sql_id
    WHERE   sql_id = i_sql_id;

    RETURN v_statement;
  EXCEPTION
    WHEN OTHERS
    THEN
      RETURN NULL;
  END get_statement;
  --
  -- Done with this package
  PROCEDURE done
  IS
  BEGIN
    NULL;
  END;
  --
  -- Insert a combination (db, hash value, address, command type, sql text)
  PROCEDURE ins_pm_sql(
    i_db IN pm_sql.db%TYPE ,
    i_hash_value IN pm_sql.hash_value%TYPE ,
    i_address IN pm_sql.address%TYPE ,
    i_command_type IN pm_sql_id.command_type%TYPE ,
    i_sql_text IN pm_sql_id.sql_text%TYPE ,
    i_sql_id IN pm_sql.sql_id%TYPE )
  IS
  BEGIN
    ins_pm_sql_l(
      pm.get_db(i_db)
    , i_hash_value
    , i_address
    , i_command_type
    , i_sql_text
    , i_sql_id
    );
  END ins_pm_sql;
  --
  -- Get a range of run id between start and end time
  PROCEDURE get_run_range(
    i_db IN pm_sql.db%TYPE ,
    i_start_time IN DATE ,
    i_end_time IN DATE ,
    o_lwb_run_id OUT pm_run.run_id%TYPE ,
    o_upb_run_id OUT pm_run.run_id%TYPE )
  IS
  BEGIN
    get_run_range_l(
      pm.get_db(i_db)
    , i_start_time
    , i_end_time
    , o_lwb_run_id
    , o_upb_run_id
    );
  END get_run_range;
  --
  -- Cleanup info for a database instance
  PROCEDURE cleanup(
    i_db IN pm_run.db%TYPE ,
    i_nr_of_days IN INTEGER )
  IS
    c_db CONSTANT pm_run.db%TYPE := pm.get_db(i_db);
    v_cursor INTEGER := NULL;
    v_last_run_to_keep pm_run.run_id%TYPE;

    CURSOR c_last_run_to_keep(
      b_db IN pm_run.db%TYPE
    , b_last_day_to_keep IN DATE )
    IS
      SELECT  MIN(run.run_id)
      FROM    pm_run run
      WHERE   run.db = b_db
      AND     run.timestamp >= b_last_day_to_keep
      UNION ALL /* get any run id higher than maximum */
      SELECT  MAX(run.run_id) + 1
      FROM    pm_run run
      WHERE   run.db = b_db;
  BEGIN
    v_cursor := dbms_sql.open_cursor;

    OPEN    c_last_run_to_keep(c_db, TRUNC(sysdate) - i_nr_of_days);
    FETCH   c_last_run_to_keep
    INTO    v_last_run_to_keep;
    IF      v_last_run_to_keep IS NULL
    THEN
      FETCH   c_last_run_to_keep
      INTO    v_last_run_to_keep;
      IF      v_last_run_to_keep IS NULL
      THEN
              /* no db found */
              CLOSE   c_last_run_to_keep;
              RAISE   no_data_found;
      ELSE
              CLOSE   c_last_run_to_keep;
      END IF;
    ELSE
      CLOSE   c_last_run_to_keep;
    END IF;

    pm.cleanup_l( v_cursor, c_db, 1, v_last_run_to_keep-1 );

    dbms_sql.close_cursor(v_cursor);
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
  END cleanup;
  --
  -- Cleanup info for a database instance
  PROCEDURE cleanup(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE ,
    i_cleanup_run IN BOOLEAN )
  IS
    v_cursor INTEGER := NULL;
  BEGIN
    v_cursor := dbms_sql.open_cursor;
    pm.cleanup_l( v_cursor, pm.get_db(i_db), i_lwb_run_id, i_upb_run_id, i_cleanup_run );
    dbms_sql.close_cursor(v_cursor);
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
  END cleanup;
  --
  -- Cleanup pm_run info
  PROCEDURE cleanup_run(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE )
  IS
  BEGIN
    cleanup_run_l( pm.get_db(i_db), i_lwb_run_id, i_upb_run_id );
  END cleanup_run;
  --
  -- Cleanup pm_session info
  PROCEDURE cleanup_session(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE )
  IS
  BEGIN
    cleanup_session_l( pm.get_db(i_db), i_lwb_run_id, i_upb_run_id );
  END cleanup_session;
  --
  -- Cleanup pm_sql info
  PROCEDURE cleanup_sql(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE )
  IS
    v_cursor INTEGER := NULL;
  BEGIN
    v_cursor := dbms_sql.open_cursor;
    cleanup_sql_l(
      v_cursor
    , pm.get_db(i_db)
    , i_lwb_run_id
    , i_upb_run_id );
    dbms_sql.close_cursor(v_cursor);
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
  END cleanup_sql;
  --
  -- Cleanup pm_sqlarea info
  PROCEDURE cleanup_sqlarea(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE )
  IS
  BEGIN
    cleanup_sqlarea_l( pm.get_db(i_db), i_lwb_run_id, i_upb_run_id );
  END cleanup_sqlarea;
  --
  -- Cleanup pm_sysstat info
  PROCEDURE cleanup_sysstat(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE )
  IS
  BEGIN
    cleanup_sysstat_l( pm.get_db(i_db), i_lwb_run_id, i_upb_run_id );
  END cleanup_sysstat;
  --
  -- Cleanup pm_system_event info
  PROCEDURE cleanup_system_event(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE )
  IS
  BEGIN
    cleanup_system_event_l( pm.get_db(i_db), i_lwb_run_id, i_upb_run_id );
  END cleanup_system_event;
  --
  -- Collect info for a specific database instance.
  PROCEDURE collect(
    i_db IN pm_run.db%TYPE )
  IS
    v_cursor INTEGER := NULL;
  BEGIN
    v_cursor := dbms_sql.open_cursor;
    collect_l( v_cursor, pm.get_db(i_db), pm.get_db_link(i_db) );
    dbms_sql.close_cursor(v_cursor);
$if $$Testing $then
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
$end
  END collect;
  --
  -- Process info from temporary tables; do not use remote database
  PROCEDURE process(
    i_db IN pm_run.db%TYPE )
  IS
    v_cursor INTEGER := NULL;
  BEGIN
    v_cursor := dbms_sql.open_cursor;
    pm.process_l( v_cursor, pm.get_db(i_db) );
    dbms_sql.close_cursor(v_cursor);
$if $$Testing $then
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
$end
  END process;
  --
  -- Collect v$session info from a remote database
  PROCEDURE collect_session(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
    v_cursor INTEGER := NULL;
  BEGIN
    v_cursor := dbms_sql.open_cursor;
    pm.collect_session_l(
      v_cursor
    , pm.get_db(i_db)
    , pm.get_db_link(i_db)
    , i_run_id
    , i_db_startup_run_id
    );
    dbms_sql.close_cursor(v_cursor);
$if $$Testing $then
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
$end
  END collect_session;
  --
  -- Collect v$sqlarea info from a remote database
  PROCEDURE collect_sqlarea(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
    v_cursor INTEGER := NULL;
  BEGIN
    v_cursor := dbms_sql.open_cursor;
    pm.collect_sqlarea_l(
      v_cursor
    , pm.get_db(i_db)
    , pm.get_db_link(i_db)
    , i_run_id
    , i_db_startup_run_id
    );
    dbms_sql.close_cursor(v_cursor);
$if $$Testing $then
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
$end
  END collect_sqlarea;
  --
  -- Collect v$sysstat info from a remote database
  PROCEDURE collect_sysstat(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
    v_cursor INTEGER := NULL;
  BEGIN
    v_cursor := dbms_sql.open_cursor;
    pm.collect_sysstat_l(
      v_cursor
    , pm.get_db(i_db)
    , pm.get_db_link(i_db)
    , i_run_id
    , i_db_startup_run_id
    );
    dbms_sql.close_cursor(v_cursor);
$if $$Testing $then
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
$end
  END collect_sysstat;
  --
  -- Collect v$system_event info from a remote database
  PROCEDURE collect_system_event(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
    v_cursor INTEGER := NULL;
  BEGIN
    v_cursor := dbms_sql.open_cursor;
    pm.collect_system_event_l(
      v_cursor
    , pm.get_db(i_db)
    , pm.get_db_link(i_db)
    , i_run_id
    , i_db_startup_run_id
    );
    dbms_sql.close_cursor(v_cursor);
$if $$Testing $then
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
$end
  END collect_system_event;
  --
  -- Process v$session info for a run
  PROCEDURE process_session(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
    v_cursor INTEGER := NULL;
  BEGIN
    v_cursor := dbms_sql.open_cursor;
    pm.process_session_l( v_cursor, pm.get_db(i_db), i_run_id, i_db_startup_run_id );
    dbms_sql.close_cursor(v_cursor);
$if $$Testing $then
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
$end
  END process_session;
  --
  -- Process v$sqlarea info from a remote database
  PROCEDURE process_sqlarea(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
  BEGIN
    pm.process_sqlarea_l( pm.get_db(i_db), i_run_id, i_db_startup_run_id );
  END process_sqlarea;
  --
  -- Process v$sysstat info from a remote database
  PROCEDURE process_sysstat(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
  BEGIN
    pm.process_sysstat_l( pm.get_db(i_db), i_run_id, i_db_startup_run_id );
  END process_sysstat;
  --
  -- Process v$system_event info from a remote database
  PROCEDURE process_system_event(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE )
  IS
  BEGIN
    pm.process_system_event_l( pm.get_db(i_db), i_run_id, i_db_startup_run_id );
  END process_system_event;

  /* return either the (value of) keyword Name or Revision */
  FUNCTION version
  RETURN VARCHAR2
  IS
    v_keyword VARCHAR2(100) := NULL;
    v_length INTEGER;
    v_pos INTEGER;
    v_result v_keyword%TYPE := NULL;
  BEGIN
    FOR nr IN 1..2
    LOOP
      IF nr = 1
      THEN
        v_keyword := '$Name$';
        v_length := 9; /* length with a ':  ' after Name */
      ELSE
        v_keyword := '$Revision: 1512 $';
        v_length := 13; /* length with a ':  ' after Revision */
      END IF;

      v_pos := instr( v_keyword, ':' );
            /* If the characters following keyword are ':  ' then skip */
      IF ( v_pos > 0 AND length(v_keyword) > v_length )
      THEN
        v_result := substr( v_keyword, v_pos + 2, length( v_keyword ) - v_length );
        EXIT;
      END IF;
    END LOOP;

    RETURN  v_result;
$if $$Testing $then
  EXCEPTION
    WHEN OTHERS
    THEN
      RETURN NULL;
$end
  END version;

END pm;
/

