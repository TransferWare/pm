CREATE OR REPLACE PACKAGE "XXYSS_ADMIN"."PM" AUTHID CURRENT_USER IS

  --
  -- Return global_name if i_db is null
  FUNCTION get_db(
    i_db IN pm_run.db%TYPE )
  RETURN VARCHAR2;

  PRAGMA RESTRICT_REFERENCES( get_db, WNDS, RNPS, WNPS );
  --
  -- Get database startup time
  PROCEDURE get_db_startup_time(
    i_db IN pm_run.db%TYPE ,
    o_db_startup_time IN OUT pm_run.db_startup_time%TYPE );
  --
  -- Start a new run
  PROCEDURE new_run(
    i_db IN pm_run.db%TYPE ,
    o_run_id OUT pm_run.run_id%TYPE ,
    o_db_startup_run_id OUT pm_run.run_id%TYPE );
  --
  -- Get the internal SQL text identifier by key
  FUNCTION get_sql_id(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_address IN pm_sql.address%TYPE )
  RETURN pm_sql.sql_id%type;

  PRAGMA RESTRICT_REFERENCES( get_sql_id, WNDS, RNPS, WNPS );
  --
  -- Get the internal SQL text identifier by text lookup
  FUNCTION get_sql_id_by_text(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_text IN pm_sql_id.sql_text%TYPE )
  RETURN pm_sql.sql_id%type;

  PRAGMA RESTRICT_REFERENCES( get_sql_id_by_text, WNDS, RNPS, WNPS );
  --
  -- Get the statement id by text lookup
  FUNCTION get_statement_id(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_address IN pm_sql.address%TYPE )
  RETURN VARCHAR2;

  PRAGMA RESTRICT_REFERENCES( get_statement_id, WNDS, RNPS, WNPS );
  --
  -- Get the statement id by text lookup
  FUNCTION get_statement_id(
    i_sql_id IN pm_sql.sql_id%TYPE )
  RETURN VARCHAR2;

  PRAGMA RESTRICT_REFERENCES( get_statement_id, WNDS, RNPS, WNPS );
  --
  -- Get the statement by text lookup
  FUNCTION get_statement(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_address IN pm_sql.address%TYPE )
  RETURN pm_sql_id.sql_text%TYPE;

  PRAGMA RESTRICT_REFERENCES( get_statement, WNDS );
  --
  -- Get the statement by text lookup
  FUNCTION get_statement(
    i_sql_id IN pm_sql_id.sql_id%TYPE )
  RETURN pm_sql_id.sql_text%TYPE;

  PRAGMA RESTRICT_REFERENCES( get_statement, WNDS );
  --
  -- Done with this package
  PROCEDURE done;
  --
  -- Insert a combination (db, hash value, address, command type, sql text, sql id)
  PROCEDURE ins_pm_sql(
    i_db IN pm_sql.db%TYPE ,
    i_hash_value IN pm_sql.hash_value%TYPE ,
    i_address IN pm_sql.address%TYPE ,
    i_command_type IN pm_sql_id.command_type%TYPE ,
    i_sql_text IN pm_sql_id.sql_text%TYPE ,
    i_sql_id IN pm_sql.sql_id%TYPE );
  --
  -- Get a range of run ids between start and end time
  PROCEDURE get_run_range(
    i_db IN pm_sql.db%TYPE ,
    i_start_time IN DATE ,
    i_end_time IN DATE ,
    o_lwb_run_id OUT pm_run.run_id%TYPE ,
    o_upb_run_id OUT pm_run.run_id%TYPE );
  --
  -- Cleanup info for a database instance
  PROCEDURE cleanup(
    i_db IN pm_run.db%TYPE ,
    i_nr_of_days IN INTEGER );
  --
  -- Cleanup info for a database instance
  PROCEDURE cleanup(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE ,
    i_cleanup_run IN BOOLEAN DEFAULT TRUE );
  --
  -- Cleanup pm_run info
  PROCEDURE CLEANUP_RUN(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE );
  --
  -- Cleanup pm_session info
  PROCEDURE cleanup_session(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE );
  --
  -- Cleanup pm_sql info
  PROCEDURE CLEANUP_SQL(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE );
  --
  -- Cleanup pm_sqlarea info
  PROCEDURE cleanup_sqlarea(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE );
  --
  -- Cleanup pm_sysstat info
  PROCEDURE cleanup_sysstat(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE );
  --
  -- Cleanup pm_system_event info
  PROCEDURE cleanup_system_event(
    i_db IN pm_run.db%TYPE ,
    i_lwb_run_id IN pm_run.run_id%TYPE ,
    i_upb_run_id IN pm_run.run_id%TYPE );
  --
  -- Collect info for a specific database instance.
  PROCEDURE collect(
    i_db IN pm_run.db%TYPE := NULL );
  --
  -- Process info from temporary tables; do not use remote database
  PROCEDURE process(
    i_db IN pm_run.db%TYPE );
  --
  -- Collect v$session info from a remote database
  PROCEDURE collect_session(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE );
  --
  -- Collect v$sqlarea info from a remote database
  PROCEDURE collect_sqlarea(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE );
  --
  -- Collect v$sysstat info from a remote database
  PROCEDURE collect_sysstat(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE );
  --
  -- Collect v$system event info from a remote database
  PROCEDURE collect_system_event(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE );
  --
  -- Process v$session info for a run
  PROCEDURE process_session(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE );
  --
  -- Process v$sqlarea info for a run
  PROCEDURE process_sqlarea(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE );
  --
  -- Process v$sysstat info for a run
  PROCEDURE process_sysstat(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE );
  --
  -- Process v$system event info for a run
  PROCEDURE process_system_event(
    i_db IN pm_run.db%TYPE ,
    i_run_id IN pm_run.run_id%TYPE ,
    i_db_startup_run_id IN pm_run.run_id%TYPE );

  FUNCTION version
  RETURN VARCHAR2;

  PRAGMA RESTRICT_REFERENCES( version, rnds, wnds, rnps, wnps );

END pm;

-- =cut
/

