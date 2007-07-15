/*
    The Performance Monitor monitors your Oracle databases.
    Copyright (C) 2002  G.J. Paulissen, Transfer Solutions b.v., Leerdam, Netherlands

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/
PROMPT
PROMPT  $RCSfile$
REMARK 
REMARK  $Date$
REMARK
REMARK  $Author$
REMARK
REMARK  $Revision$
REMARK
REMARK  Description:    Create general package of Performance Monitor.
REMARK
REMARK  $Log$
REMARK  Revision 1.1  2003/08/28 14:44:48  gpaulissen
REMARK  Release 6.0.0
REMARK
REMARK  Revision 1.35  2003/07/29 20:25:48  gpaulissen
REMARK  Modifications for Oracle 7 thru 9 (dbms_sql)
REMARK
REMARK  Revision 1.34  2003/01/28 21:42:47  gpaulissen
REMARK  Update common
REMARK
REMARK  Revision 1.33  2002/12/22 19:55:11  gpaulissen
REMARK  Geen database link meer nodig.
REMARK
REMARK  Revision 1.32  2002/05/24 14:22:41  gpaulissen
REMARK  New release 4.1.0
REMARK
REMARK  Revision 1.31  2002/02/01 10:59:55  gpaulissen
REMARK  New make environment
REMARK
REMARK  Revision 1.30  2002/01/17 10:57:01  gpaulissen
REMARK  - make install enhanced.
REMARK  - make depend added (makedepend_oracle.pl, makedepend.sql, makestate.sql).
REMARK  - reports user text field widened (from 10 to 30) due to report 4.5 bug.
REMARK  - removed in install scripts:
REMARK    whenever sqlerror exit failure
REMARK    whenever oserror exit failure
REMARK
REMARK  Revision 1.29  2000/03/07 15:56:03  gpaulissen
REMARK  TPI added
REMARK
REMARK  Revision 1.28  2000/02/10 11:42:07  gpaulissen
REMARK  Check added.
REMARK
REMARK  Revision 1.27  1999/11/29 17:17:16  gpaulissen
REMARK  Commentaar Tom Bouwman verwerkt.
REMARK
REMARK  Revision 1.26  1999/10/20 13:01:46  gpaulissen
REMARK  Added WHENEVER SQLERROR/OSERROR CONTINUE
REMARK
REMARK  Revision 1.25  1999/10/07 15:06:47  gpaulissen
REMARK  PR-777. Better error checking.
REMARK
REMARK  Revision 1.24  1999/10/07 12:35:38  gpaulissen
REMARK  PR-777. Removed PM_SESS_IO
REMARK
REMARK  Revision 1.23  1999/10/07 09:51:36  gpaulissen
REMARK  Added cleanup_sess_io, collect_sess_io, process_sess_io
REMARK
REMARK  Revision 1.22  1999/10/01 15:15:28  gpaulissen
REMARK  PR-736 Version info added
REMARK
REMARK  Revision 1.21  1999/09/14 09:43:31  gpaulissen
REMARK  Enhanced error logging.
REMARK
REMARK  Revision 1.20  1999/09/13 12:56:49  gpaulissen
REMARK  Use pm$ instead of sys.pm$
REMARK
REMARK  Revision 1.19  1999/09/13 12:45:19  gpaulissen
REMARK  trc interface changed
REMARK
REMARK  Revision 1.18  1999/08/10 13:14:32  gpaulissen
REMARK  Added version function.
REMARK
REMARK  Revision 1.17  1999/08/09 08:33:04  gpaulissen
REMARK  Added column error_msg and removed column prev_run_id in table pm_run.
REMARK
REMARK  Revision 1.16  1999/07/09 09:32:21  gpaulissen
REMARK  Better debugging support. Problem with command type solved.
REMARK
REMARK  Revision 1.15  1999/06/30 14:44:25  tbouwman
REMARK  Temporary tables not truncated.
REMARK
REMARK  Revision 1.14  1999/06/25 11:43:18  gpaulissen
REMARK  Added dbug statements.
REMARK
REMARK  Revision 1.14  1999/06/10 21:34:26  gpaulissen
REMARK  Using dbug package.
REMARK
REMARK  Revision 1.13  1999/05/25 14:45:05  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.12  1999/05/21 10:09:50  gpaulissen
REMARK  - cleaning a range supported
REMARK  - cleanup the run just collected in case of errors
REMARK  - inserting into pm_sqlarea after pm_sql_id has been filled (integrity)
REMARK  - do not insert SQL statements which do not add any info (all columns 0)
REMARK
REMARK  Revision 1.11  1999/05/19 21:09:58  gpaulissen
REMARK  Update of pm_sqlarea was wrong.
REMARK
REMARK  Revision 1.10  1999/05/19 14:41:02  gpaulissen
REMARK  Enable constraint pm_ses_sql_fk1.
REMARK
REMARK  Revision 1.9  1999/05/12 11:37:24  gpaulissen
REMARK  pm_sqlarea modified: run_id part of the key.
REMARK
REMARK  Revision 1.8  1999/04/16 11:17:23  gpaulissen
REMARK  Commit added to collect/cleanup.
REMARK
REMARK  Revision 1.7  1999/04/16 10:50:26  gpaulissen
REMARK  Added print function to format commands.
REMARK
REMARK  Revision 1.6  1999/04/15 14:23:48  gpaulissen
REMARK  New version of pm package.
REMARK
REMARK  Revision 1.5  1999/04/07 15:02:48  dosuser
REMARK  Generated.
REMARK
REMARK  Revision 1.4  1999/02/21 15:39:36  dosuser
REMARK  retrieving db startup run id.
REMARK
REMARK  Revision 1.3  1998/12/22 16:29:04  gpauliss
REMARK  Added get_run_range procedure.
REMARK
REMARK  Revision 1.2  1998/11/26 13:33:45  gpaulissen
REMARK  Added standard header.

REM
REM  This ORACLE7 command file was generated by Oracle Server Generator
REM  Version 5.5.10.0.0 on 19-MAY-99
REM
REM For application PM version 1 database PM
REM
REM PACKAGE
REM      PM

REM
REM     Performance Monitor tasks
REM
PROMPT 
PROMPT Creating Package Specification pm

SET DOCUMENT OFF

DOCUMENT

The following documentation uses the Perl pod format. A html file
can be constructed by: 

  pod2html --infile=pm.pck --outfile=pm.html

=pod

=head1 NAME

pm - Performance Monitor tasks

=head1 SYNOPSIS

=cut

#

-- =pod

CREATE OR REPLACE PACKAGE pm AUTHID CURRENT_USER IS

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
  RETURN NUMBER;

  PRAGMA RESTRICT_REFERENCES( get_sql_id, WNDS, RNPS, WNPS );
  --
  -- Get the internal SQL text identifier by text lookup
  FUNCTION get_sql_id_by_text(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_text IN pm_sql_id.sql_text%TYPE )
  RETURN NUMBER;

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
  RETURN VARCHAR2;

  PRAGMA RESTRICT_REFERENCES( get_statement, WNDS );
  --
  -- Build a statement line
  PROCEDURE build_statement_line(
    i_piece IN INTEGER ,
    i_sql_text IN pm_sql_id.sql_text%TYPE ,
    io_sql_text IN OUT pm_sql_id.sql_text%TYPE );

  PRAGMA RESTRICT_REFERENCES( build_statement_line, RNDS, WNDS, RNPS, WNPS );
  --
  -- Get the statement by text lookup
  FUNCTION get_statement(
    i_sql_id IN pm_sql_id.sql_id%TYPE )
  RETURN VARCHAR2;

  PRAGMA RESTRICT_REFERENCES( get_statement, WNDS );
  --
  -- Done with this package
  PROCEDURE done;
  --
  -- Insert a combination (db, hash value, address, command type, sql text)
  PROCEDURE ins_pm_sql(
    i_db IN pm_sql.db%TYPE ,
    i_hash_value IN pm_sql.hash_value%TYPE ,
    i_address IN pm_sql.address%TYPE ,
    i_command_type IN pm_sql_id.command_type%TYPE ,
    i_sql_text IN pm_sql_id.sql_text%TYPE );
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

DOCUMENT

=head1 DESCRIPTION

The I<pm> package is used for collecting monitoring information.

It uses a two step approach: the first step consists of collecting information
from remote databases, putting it in temporary tables. The second step is to
calculate delta statistics and put them in the repository together with an
identification of the time.

=head2 ROUTINES

=over 4

=item get_db

This function returns the global name of the database if the I<i_db> parameter
is null. Otherwise it return I<i_db> in uppercase and right trimmed.

=item get_db_startup_time

This procedure sets the database startup time in parameter
I<o_db_startup_time> of a database identified by the database link I<i_db>.

=item new_run

This procedure initiates a new run of collecting and storing information. Input parameters is the database link I<i_db>. Output parameters are the new run id I<o_run_id> and the minimal run id for which the database startup time was the same time as now. This parameter is important for determining whether statistics carry history or not.

=item get_sql_id

This function retrieves the SQL text identifier of a sql statement as uniquely identified by the database, hash value and address.

=item get_sql_id_by_text

This function retrieves the SQL text identifier of a sql statement as uniquely identified by the database, hash value and text.

=item get_statement_id

Returns a unique statement id for use in explain plan. 

=item get_statement

Returns the SQL text of a SQL statement.

=item build_statement_line

Builds a statement from various pieces of text. The parameter I<io_sql_text> is set to input parameter I<i_sql_text> when I<i_piece> equals 0. The parameter I<io_sql_text> is concatenated with input parameter I<i_sql_text> when I<i_piece> not equals 0. 

=item done

Clean up tasks.

=item ins_pm_sql

Insert a record in pm_sql and pm_sql_id.

=item get_run_range

Determine for a database identified by database link I<i_db> the lower bound run id I<o_lwb_run_id> and upper bound run id I<o_upb_run_id> where timestamp of I<o_lwb_run_id> >= I<i_start_time> and timestamp of I<o_upb_run_id> < I<i_end_time>.

=item cleanup

Cleanup info for a database instance for a number of days I<i_nr_of_days>. All info before trunc(sysdate) - I<i_nr_of_days> is removed for that database instance.

=item cleanup_run

Cleanup pm_run info for database I<i_db> between run id I<i_lwb_run_id> and I<i_upb_run_id>.

=item cleanup_session

Cleanup pm_session info for database I<i_db> between run id I<i_lwb_run_id> and I<i_upb_run_id>.

=item cleanup_sql

Cleanup pm_sql info for database I<i_db> between run id I<i_lwb_run_id> and I<i_upb_run_id>.

=item cleanup_sqlarea

Cleanup pm_sqlarea info for database I<i_db> between run id I<i_lwb_run_id> and I<i_upb_run_id>.

=item cleanup_sysstat

Cleanup pm_sysstat info for database I<i_db> between run id I<i_lwb_run_id> and I<i_upb_run_id>.

=item cleanup_system_event

Cleanup pm_system_event info for database I<i_db> between run id I<i_lwb_run_id> and I<i_upb_run_id>.

=item collect

Collect (and process) info for a specific database instance identified by database link I<i_db>. This is the main routine for the Performance Monitor. See also C<cleanup> for cleaning up.

=item process

Process info from temporary tables; do not use remote database. Useful for debugging.

=item collect_session

Collect v$session info from a remote database.

=item collect_sqlarea

Collect v$sqlarea info from a remote database.

=item collect_sysstat

Collect v$sysstat info from a remote database.

=item collect_system_event

Collect v$system event info from a remote database.

=item process_session

Process v$session info for a run. 

=item process_sqlarea

Process v$sqlarea info for a run.

=item process_sysstat

Process v$sqlarea info for a run.

=item process_system_event

Process v$system event for a run.

=item version

Retrieves the information supplied by Revision Control System keyword $Name or $Revision.

=back

=head1 EXAMPLES

=head1 AUTHOR

Gert-Jan Paulissen, E<lt>gpaulissen@transfer-solutions.comE<gt>.

=head1 BUGS

=head1 SEE ALSO

=head1 COPYRIGHT

All rights reserved by Transfer Solutions b.v.

=cut

#

REM
PROMPT 
PROMPT Creating Package Body pm
CREATE OR REPLACE PACKAGE BODY pm IS
  --
  --
--/*DBUG*/  v_count INTEGER DEFAULT 0;
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
  EXCEPTION
    WHEN OTHERS
    THEN
      RETURN NULL;
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
    trc.enter( c_module_name );
    trc.add_arg( 'i_cursor', i_cursor );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_db_link', i_db_link );

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

--/*DBUG*/    dbug.print( 'info', 'Last database startup: %s', 
--/*DBUG*/      to_char( o_db_startup_time, 'DD-MM-YYYY HH24:MI:SS' ) 
--/*DBUG*/    );

    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;
--/*DBUG*/      dbug.print( 'error', 'SQLERRM: %s', SQLERRM );
--/*DBUG*/      v_error_position := dbms_sql.last_error_position;
--/*DBUG*/      v_sql_function_code := dbms_sql.last_sql_function_code;
--/*DBUG*/      dbug.print( 'error', 'Command: %s', c_command );
--/*DBUG*/      dbug.print( 'error', 'Error at position: %s', v_error_position );
--/*DBUG*/      dbug.print( 'error', 'SQL function code: %s', v_sql_function_code );
      RAISE;
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
    trc.enter( c_module_name );
    trc.add_arg( 'i_cursor', i_cursor );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_db_link', i_db_link );

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
      WHEN OTHERS
      THEN
        RAISE;
    END;
    END LOOP;

            /* will always find one, i.e. at least the last inserted one */
    OPEN c_db_startup_run_id( i_db, v_db_startup_time );
    FETCH c_db_startup_run_id
    INTO o_db_startup_run_id;
    CLOSE c_db_startup_run_id;

--/*DBUG*/    dbug.print( 'info', 'new run id: %s', v_run_id );

    COMMIT; /* pm_run modified */

    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;
      IF c_next_run_id%ISOPEN
      THEN
        CLOSE c_next_run_id;
      END IF;
      o_run_id := NULL;
      o_db_startup_run_id := NULL;
      -- raise again
      RAISE;
  END new_run_l;
  --
  -- Get the internal SQL text identifier by key (local variant)
  FUNCTION get_sql_id_l(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_address IN pm_sql.address%TYPE )
  RETURN NUMBER
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
  EXCEPTION
    WHEN OTHERS
    THEN
      IF c_get_sql_id%ISOPEN
      THEN
        CLOSE c_get_sql_id;
      END IF;
      RETURN NULL;
  END get_sql_id_l;
  --
  --  Get the internal SQL text identifier by text lookup
  FUNCTION get_sql_id_by_text_l(
    i_db IN pm_sql.db%TYPE ,
    i_sql_hash_value IN pm_sql.hash_value%TYPE ,
    i_sql_text IN pm_sql_id.sql_text%TYPE )
  RETURN NUMBER
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
      AND     pm_sql_id.sql_text = i_sql_text;
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
  EXCEPTION
    WHEN OTHERS
    THEN
      IF c_pm_sql%ISOPEN
      THEN
        CLOSE c_pm_sql;
      END IF;
      RETURN NULL;
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
  RETURN VARCHAR2
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
    i_sql_text IN pm_sql_id.sql_text%TYPE )
  IS
    v_sql_id pm_sql_id.sql_id%TYPE;
    c_module_name CONSTANT module_name_t := 'PM.PM_INS_SQL';

    PROCEDURE ins_pm_sql(
      i_db IN pm_sql.db%TYPE
    , i_hash_value pm_sql.hash_value%TYPE
    , i_address pm_sql.address%TYPE
    , i_sql_id pm_sql.sql_id%TYPE
    )
    IS
    BEGIN
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
    EXCEPTION
      WHEN OTHERS
      THEN
          /* GJP 02-JUN-1999 
          || Strange bug/feature in Oracle: a insert statement
          || is sometimes treated as command type 2 (INSERT)
          || and sometimes as 4 (CREATE CLUSTER). Hence I
          || will ignore a violation of the primary key constraint
          || here.
          */
--/*DBUG*/        dbug.print( 'info', 'db: ' || i_db );
--/*DBUG*/        dbug.print( 'info', 'hash_value: ' || to_char(i_hash_value) );
--/*DBUG*/        dbug.print( 'info', 'address: ' || i_address );
--/*DBUG*/        dbug.print( 'info', 'sql_id: ' || to_char(i_sql_id) );
        NULL;
    END ins_pm_sql;

    PROCEDURE ins_pm_sql_id(
      io_sql_id IN OUT pm_sql_id.sql_id%TYPE
    , i_command_type IN pm_sql_id.command_type%TYPE
    , i_sql_text IN pm_sql_id.sql_text%TYPE
    )
    IS
      CURSOR c_get_seq IS
        SELECT  pm_sql_seq.nextval
        FROM    dual;
    BEGIN
      LOOP
      BEGIN
        OPEN c_get_seq;
        FETCH c_get_seq
        INTO io_sql_id;
        CLOSE c_get_seq;

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
          io_sql_id
        , i_command_type
        , user
        , sysdate
        , i_sql_text
        );
      
        EXIT;
      EXCEPTION
        WHEN dup_val_on_index
        THEN    
          NULL;
        WHEN OTHERS
        THEN
          RAISE;
      END;
      END LOOP;
    EXCEPTION
      WHEN OTHERS
      THEN
        IF c_get_seq%ISOPEN
        THEN
          CLOSE c_get_seq;
        END IF;
        RAISE;
    END ins_pm_sql_id;
  BEGIN
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_hash_value', i_hash_value );
    trc.add_arg( 'i_address', i_address );
    trc.add_arg( 'i_command_type', i_command_type );

    SAVEPOINT spt_sql;
            /*
            || Situation A: pm_sqltext found.
            || Only pm_sql needs updating
            || Situation B: pm_sqltext not found.
            || pm_sql_id, pm_sqltext and pm_sql need updating
            */
    v_sql_id :=
      pm.get_sql_id_by_text_l
      (
        i_db
      , i_hash_value
      , i_sql_text
      );

--/*DBUG*/    dbug.print( 'info', 'sql id found: ' || v_sql_id );

    IF v_sql_id IS NOT NULL
    THEN
      /* Situation A */
      ins_pm_sql
      (
        i_db
      , i_hash_value
      , i_address
      , v_sql_id
      );
    ELSE
      /* Situation B */
      ins_pm_sql_id( v_sql_id, i_command_type,  i_sql_text );
      ins_pm_sql
      (
        i_db
      , i_hash_value
      , i_address
      , v_sql_id
      );
    END IF;

--/*DBUG*/    dbug.print( 'info', 'sql id: ' || v_sql_id );
        
    COMMIT;

    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;
--/*DBUG*/      dbug.print( 'error', 'error; sql id: ' || v_sql_id );
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

--/*DBUG*/    -- print a command with embedded new lines.
--/*DBUG*/    PROCEDURE print( i_command IN command_t )
--/*DBUG*/    IS
--/*DBUG*/      -- New line
--/*DBUG*/      c_nl CONSTANT CHAR(1) := CHR(10);
--/*DBUG*/      v_pos INTEGER := 1;
--/*DBUG*/      v_old_pos INTEGER := 0;
--/*DBUG*/    BEGIN
--/*DBUG*/      WHILE v_pos <> 0 
--/*DBUG*/      LOOP
--/*DBUG*/        v_pos := instr( i_command, c_nl, v_old_pos + 1 );
--/*DBUG*/        IF ( v_pos = 0 ) /* unsuccessful search */
--/*DBUG*/        THEN
--/*DBUG*/          dbug.print( 'info', 
--/*DBUG*/                      to_char( v_old_pos + 1, '0000' ) || ': ' ||
--/*DBUG*/                      substr( i_command, v_old_pos + 1 ) 
--/*DBUG*/          );
--/*DBUG*/        ELSE
--/*DBUG*/          dbug.print( 
--/*DBUG*/                      'info', 
--/*DBUG*/                      to_char( v_old_pos + 1, '0000' ) || ': ' ||
--/*DBUG*/                      substr( i_command, v_old_pos + 1, v_pos - v_old_pos - 1 ) 
--/*DBUG*/          );
--/*DBUG*/        END IF;
--/*DBUG*/        v_old_pos := v_pos;
--/*DBUG*/      END LOOP;
--/*DBUG*/    END print;
  BEGIN
    trc.enter( c_module_name );
    trc.add_arg( 'i_command', i_command );
    trc.add_arg( 'i_action', i_action );

    /* i_db_link may be NULL bit still needs to be replaced */
    IF i_db IS NOT NULL OR i_run_id IS NOT NULL
    THEN
      v_command := replace( v_command, '<db>', '''' || i_db || '''' );
      v_command := replace( v_command, '<db_link>', i_db_link );
      v_command := replace( v_command, '<run_id>', i_run_id );
    END IF;

    v_last_command := v_command;
    dbms_sql.parse( i_cursor, v_command, dbms_sql.native );
    v_nr_rows := dbms_sql.execute( i_cursor );

--/*DBUG*/    IF i_action = 'I'
--/*DBUG*/    THEN
--/*DBUG*/            dbug.print( 'info', 'Number of rows inserted: %s', v_nr_rows );
--/*DBUG*/    ELSIF i_action = 'U'
--/*DBUG*/    THEN
--/*DBUG*/            dbug.print( 'info', 'Number of rows updated: %s', v_nr_rows );
--/*DBUG*/    ELSIF i_action = 'D'
--/*DBUG*/    THEN
--/*DBUG*/            dbug.print( 'info', 'Number of rows deleted: %s', v_nr_rows );
--/*DBUG*/    ELSE /* ?? */
--/*DBUG*/            dbug.print( 'info', 'Number of rows processed: %s', v_nr_rows );
--/*DBUG*/    END IF;

    trc.leave;
  EXCEPTION
    WHEN    OTHERS
    THEN
      trc.leave_on_error;
--/*DBUG*/      dbug.print( 'error', 'SQLERRM: ' || SQLERRM );
--/*DBUG*/      print( v_command );
--/*DBUG*/      v_error_position := dbms_sql.last_error_position;
--/*DBUG*/      v_sql_function_code := dbms_sql.last_sql_function_code;
--/*DBUG*/      dbug.print( 'error', 'Error at position: ' || to_char(v_error_position) );
--/*DBUG*/      dbug.print( 'error', 'SQL function code: ' || to_char(v_sql_function_code) );
      RAISE;
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
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_lwb_run_id', i_lwb_run_id );
    trc.add_arg( 'i_upb_run_id', i_upb_run_id );

    DELETE
    FROM    pm_session
    WHERE   db = i_db
    AND     run_id BETWEEN i_lwb_run_id AND i_upb_run_id;

--/*DBUG*/    dbug.print( 'info', 'Rows deleted from pm_session: %s', sql%ROWCOUNT );

    COMMIT;

    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;
      RAISE;
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
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_lwb_run_id', i_lwb_run_id );
    trc.add_arg( 'i_upb_run_id', i_upb_run_id );

--/*DBUG*/    v_count := 0;
    LOOP
      DELETE
      FROM    pm_sqlarea are
      WHERE   rownum <= c_max_count
      AND     are.db = i_db
      AND     are.run_id BETWEEN i_lwb_run_id AND i_upb_run_id;

      COMMIT;

      EXIT WHEN sql%ROWCOUNT < c_max_count;

--/*DBUG*/      v_count := v_count + sql%ROWCOUNT;
    END LOOP;

    COMMIT;

--/*DBUG*/    dbug.print( 'info', 'Rows deleted from pm_sqlarea: %s', v_count );

    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;
      RAISE;
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
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_lwb_run_id', i_lwb_run_id );
    trc.add_arg( 'i_upb_run_id', i_upb_run_id );

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

--/*DBUG*/      dbug.print( 'info', 'Rows deleted from pm_sql: %s', sql%ROWCOUNT );

    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;
      RAISE;
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
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_lwb_run_id', i_lwb_run_id );
    trc.add_arg( 'i_upb_run_id', i_upb_run_id );

    DELETE
    FROM    pm_system_event
    WHERE   db = i_db
    AND     run_id BETWEEN i_lwb_run_id AND i_upb_run_id;

    COMMIT;

--/*DBUG*/    dbug.print( 'info', 'Rows deleted from pm_system_event: %s', sql%ROWCOUNT );

    trc.leave;
  EXCEPTION
    WHEN    OTHERS
    THEN
      trc.leave_on_error;
      RAISE;
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
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_lwb_run_id', i_lwb_run_id );
    trc.add_arg( 'i_upb_run_id', i_upb_run_id );

    DELETE
    FROM    pm_sysstat
    WHERE   db = i_db
    AND     run_id BETWEEN i_lwb_run_id AND i_upb_run_id;

    COMMIT;

--/*DBUG*/    dbug.print( 'info', 'Rows deleted from pm_sysstat: %s', sql%ROWCOUNT );

    trc.leave;
  EXCEPTION
    WHEN    OTHERS
    THEN
      trc.leave_on_error;
      RAISE;
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
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_lwb_run_id', i_lwb_run_id );
    trc.add_arg( 'i_upb_run_id', i_upb_run_id );

    DELETE
    FROM    pm_run
    WHERE   db = i_db
    AND     run_id BETWEEN i_lwb_run_id AND i_upb_run_id;

--/*DBUG*/      dbug.print( 'info', 'Rows deleted from pm_run: %s', sql%ROWCOUNT );
    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;
      RAISE;
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
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_lwb_run_id', i_lwb_run_id );
    trc.add_arg( 'i_upb_run_id', i_upb_run_id );
    trc.add_arg( 'i_cleanup_run', i_cleanup_run );

--/*DBUG*/    dbug.print( 'info', 'Lower bound run id: %s', i_lwb_run_id );
--/*DBUG*/    dbug.print( 'info', 'Upper bound run id: %s', i_upb_run_id );

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
    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;
      RAISE;
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
      )
        SELECT  <db>
        ,       <run_id>
        ,       s.event
        ,       s.total_waits
        ,       s.total_timeouts
        ,       s.time_waited
        ,       s.average_wait
        FROM    v$system_event<db_link> s';

    c_module_name CONSTANT module_name_t := 'PM.COLLECT_SYSTEM_EVENT';
  BEGIN
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_run_id', i_run_id );
    trc.add_arg( 'i_db_startup_run_id', i_db_startup_run_id );

--/*DBUG*/    dbug.print( 'info', 'Adding v$system_event info' );
    parse_and_execute( c_command, i_cursor, 'I', i_db, i_db_link, i_run_id );
    COMMIT;

    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;
      RAISE;
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
      ,       statistic#
      ,       value
      )
        SELECT  <db>
        ,       <run_id>
        ,       sysstat.statistic#
        ,       sysstat.value
        FROM    v$sysstat<db_link> sysstat';

    c_module_name CONSTANT module_name_t := 'PM.COLLECT_SYSSTAT';
  BEGIN
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_run_id', i_run_id );
    trc.add_arg( 'i_db_startup_run_id', i_db_startup_run_id );

--/*DBUG*/    dbug.print( 'info', 'Adding v$sysstat info' );
    parse_and_execute( c_command, i_cursor, 'I', i_db, i_db_link, i_run_id );

    COMMIT;

    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;
      RAISE;
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
    c_command command_t := '
      INSERT INTO pm_sqlarea_tmp
      (
              db
      ,       first_load_time
      ,       hash_value
      ,       address
      ,       parsing_user_name
      ,       parsing_schema_name
      ,       run_id
      ,       executions
      ,       buffer_gets
      ,       disk_reads
      ,       parse_calls
      ,       sorts
      ,       kept_versions
      ,       loads
      ,       rows_processed
      ,       invalidations
      ,       module
      ,       action
      ,       sql_text
      ,       command_type
      )
        SELECT  <db>
        ,       to_date
                ( s.first_load_time
                , ''YYYY-MM-DD/HH24:MI:SS''
                ) as first_load_time
        ,       s.hash_value
        ,       rawtohex(s.address) as address
        ,       usr.username as parsing_user_name
        ,       sch.username as parsing_schema_name
        ,       <run_id>
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
        ,       s.sql_text
        ,       s.command_type
        FROM    v$sqlarea<db_link> s
        ,       all_users usr
        ,       all_users sch
        where   usr.user_id = s.parsing_user_id
        and     sch.user_id = s.parsing_schema_id';
 
    c_module_name CONSTANT module_name_t := 'PM.COLLECT_SQLAREA';
  BEGIN
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_run_id', i_run_id );
    trc.add_arg( 'i_db_startup_run_id', i_db_startup_run_id );

--/*DBUG*/    dbug.print( 'info', 'Adding v$sqlarea info' );
    parse_and_execute( c_command, i_cursor, 'I', i_db, i_db_link, i_run_id );

    COMMIT;

    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;
      RAISE;
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
      )
        SELECT  <db>
        ,       <run_id>
        ,       s.sid
        ,       CASE WHEN s.username IS NULL THEN ''ORACLE'' ELSE s.username END
        ,       s.program
        ,       CASE WHEN s.sql_hash_value = 0 THEN NULL ELSE s.sql_hash_value END
        ,       CASE WHEN rawtohex(s.sql_address) = ''00'' THEN NULL ELSE rawtohex(s.sql_address) END
        FROM    v$session<db_link> s';
    c_module_name CONSTANT module_name_t := 'PM.COLLECT_SESSION';
  BEGIN
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_run_id', i_run_id );
    trc.add_arg( 'i_db_startup_run_id', i_db_startup_run_id );

    parse_and_execute
    (
            'alter table pm_session disable constraint pm_ses_sql_fk1'
    ,       i_cursor
    );
--/*DBUG*/    dbug.print( 'info', 'Adding v$session info' );
    parse_and_execute( c_command, i_cursor, 'I', i_db, i_db_link, i_run_id );

    COMMIT;

    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;
      RAISE;
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
               The sql_text is limited to about 1000 characters 
               (see Oracle documentation). Since sql_text is able 
               to store 2000 characters I will retrieve them from 
               pm_sqltext_tmp
            */
    cursor  c_new_sql
    IS
            SELECT  art.db
            ,       art.hash_value
            ,       art.address
            ,       art.sql_text
            ,       art.command_type
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
            SELECT  NVL(sum(old.executions), 0)     executions
            ,       NVL(sum(old.buffer_gets), 0)    buffer_gets
            ,       NVL(sum(old.disk_reads), 0)     disk_reads
            ,       NVL(sum(old.parse_calls), 0)    parse_calls
            ,       NVL(sum(old.sorts), 0)          sorts
            ,       NVL(sum(old.kept_versions), 0)  kept_versions
            ,       NVL(sum(old.loads), 0)          loads
            ,       NVL(sum(old.rows_processed), 0) rows_processed
            ,       NVL(sum(old.invalidations), 0)  invalidations
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
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_run_id', i_run_id );
    trc.add_arg( 'i_db_startup_run_id', i_db_startup_run_id );

            /*
            || Before inserting into pm_sqlarea we have to update pm_sql
            || in order to keep the foreign key constraint 
            || from pm_sqlarea to pm_sql valid.
            */

--/*DBUG*/      dbug.print( 'info', 'Processing pm_sql' );

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
      );
    EXCEPTION
      WHEN OTHERS
      THEN
--/*DBUG*/        dbug.print( 'error', 'db: %s; hash_value: %s; address: %s; command_type: %s',
--/*DBUG*/                    r_new_sql.db,
--/*DBUG*/                    r_new_sql.hash_value,
--/*DBUG*/                    r_new_sql.address,
--/*DBUG*/                    r_new_sql.command_type );
--/*DBUG*/        dbug.print( 'error', r_new_sql.sql_text );
        RAISE;
    END;
    END LOOP;

--/*DBUG*/    dbug.print( 'info', 'Processing pm_sqlarea' );

      /* 
      || Calculate delta values for pm_sqlarea_tmp.
      || Do not insert records which do not contain any
      || info: executions, sorts, buffer_gets, etc. all 0.
      */
--/*DBUG*/        v_count := 0;

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
        r_sqlarea_tmp.invalidations >= 0
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
        r_sqlarea_tmp.invalidations > 0
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
        );
--/*DBUG*/        v_count := v_count + 1;
      EXCEPTION
        WHEN    OTHERS
        THEN
--/*DBUG*/          dbug.print( 'error', 'hash_value: ' || r_sqlarea_tmp.hash_value );
--/*DBUG*/          dbug.print( 'error', 'address: ' || r_sqlarea_tmp.address );
--/*DBUG*/          dbug.print( 'error', 'first_load_time: ' || r_sqlarea_tmp.first_load_time );
--/*DBUG*/          dbug.print( 'error', 'parsing_user_name: ' || r_sqlarea_tmp.parsing_user_name );
--/*DBUG*/          dbug.print( 'error', 'parsing_schema_name: ' || r_sqlarea_tmp.parsing_schema_name );
        NULL;
      END;
      END IF;       
    END LOOP;

--/*DBUG*/    dbug.print( 'info', 'Rows added to pm_sqlarea: %s', v_count );

    COMMIT;

    trc.leave;
  EXCEPTION
    WHEN    OTHERS
    THEN
      trc.leave_on_error;
      RAISE;
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
    || If the combination (db, run_id, db_startup_time, statistic#) already
    || exists, the value must be adjusted to reflect changes since the last 
    || snapshot.
    ||
    */
    c_module_name CONSTANT module_name_t := 'PM.PROCESS_SYSSTAT';

    cursor  c_sysstat_tot( i_statistic# IN pm_sysstat.statistic#%TYPE )
    IS
            SELECT  NVL(sum(value), 0)      value
            FROM    pm_sysstat old
            WHERE   old.db = i_db
            AND     old.run_id BETWEEN i_db_startup_run_id AND i_run_id - 1
            AND     old.statistic# = i_statistic#;

    r_sysstat_tot c_sysstat_tot%ROWTYPE;
  BEGIN
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_run_id', i_run_id );
    trc.add_arg( 'i_db_startup_run_id', i_db_startup_run_id );

--/*DBUG*/    dbug.print( 'info', 'Processing pm_sysstat' );
                        /* subtract old values */
--/*DBUG*/    v_count := 0;
    FOR r_sysstat_tmp IN
    (
      SELECT  db
      ,       run_id
      ,       statistic#
      ,       value
      FROM    pm_sysstat_tmp
    )
    LOOP
      IF i_db_startup_run_id IS NOT NULL
      THEN
        OPEN c_sysstat_tot( r_sysstat_tmp.statistic# );
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
        , statistic#
        , value
        )
        values
        (
          r_sysstat_tmp.db
        , r_sysstat_tmp.run_id
        , r_sysstat_tmp.statistic#
        , r_sysstat_tmp.value
        );
--/*DBUG*/        v_count := v_count + 1;
      EXCEPTION
        WHEN OTHERS
        THEN
--/*DBUG*/          dbug.print( 'error', 'db: %s; run_id: %s; statistic#: %s; value: %s',
--/*DBUG*/                      r_sysstat_tmp.db,
--/*DBUG*/                      r_sysstat_tmp.run_id,
--/*DBUG*/                      r_sysstat_tmp.statistic#,
--/*DBUG*/                      r_sysstat_tmp.value );
          NULL;
      END;
      END IF;
    END LOOP;
    COMMIT;

--/*DBUG*/    dbug.print( 'info', 'Rows added to pm_sysstat: %s', v_count );

    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;
      RAISE;
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
      trc.enter( c_module_name );
      trc.add_arg( 'i_db', i_db );
      trc.add_arg( 'i_run_id', i_run_id );
      trc.add_arg( 'i_db_startup_run_id', i_db_startup_run_id );

--/*DBUG*/    dbug.print( 'info', 'Processing pm_session' );

      FOR r_session_tmp IN
      ( 
        SELECT  db
        ,       run_id
        ,       sid
        ,       username
        ,       program
        ,       sql_hash_value
        ,       sql_address
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
        );
      EXCEPTION
        WHEN OTHERS
        THEN
--/*DBUG*/          dbug.print( 'error', 'db: ' || r_session_tmp.db );
--/*DBUG*/          dbug.print( 'error', 'run_id: ' || r_session_tmp.run_id );
--/*DBUG*/          dbug.print( 'error', 'sid: ' || r_session_tmp.sid );
--/*DBUG*/          dbug.print( 'error', 'username: ' || r_session_tmp.username );
--/*DBUG*/          dbug.print( 'error', 'program: ' || r_session_tmp.program );
--/*DBUG*/          dbug.print( 'error', 'sql_hash_value: ' || r_session_tmp.sql_hash_value );
--/*DBUG*/          dbug.print( 'error', 'sql_address: ' || r_session_tmp.sql_address );
          NULL;
      END;
      END LOOP;

        /*
        ||
        || Keep the foreign key constraint PM_SESSION - PM_SQL valid.
        ||
        */
--/*DBUG*/      v_count := 0;
      FOR r_session IN c_session
      LOOP
        UPDATE  pm_session
        SET     sql_hash_value = NULL
        ,       sql_address = NULL
        WHERE current OF c_session;
--/*DBUG*/        v_count := v_count + 1;
      END LOOP;

--/*DBUG*/      dbug.print( 'info', 'Rows updated of pm_session: %s', v_count );

      parse_and_execute
      (
        'alter table pm_session enable constraint pm_ses_sql_fk1'
      , i_cursor
      );

      trc.leave;
    EXCEPTION
      WHEN OTHERS
      THEN
        trc.leave_on_error;
        RAISE;
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
      FROM    pm_system_event old
      WHERE   old.db = i_db
      AND     old.run_id BETWEEN i_db_startup_run_id AND i_run_id - 1
      AND     old.event = i_event;

    r_system_event_tot c_system_event_tot%ROWTYPE;
  BEGIN
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );
    trc.add_arg( 'i_run_id', i_run_id );
    trc.add_arg( 'i_db_startup_run_id', i_db_startup_run_id );

--/*DBUG*/    dbug.print( 'info', 'Processing pm_system_event' );

--/*DBUG*/    dbug.print( 'info', 'inserting into pm_system_event' );

--/*DBUG*/    v_count := 0;
    FOR r_system_event_tmp IN
    (
      SELECT  db
      ,       run_id
      ,       event
      ,       total_waits
      ,       total_timeouts
      ,       time_waited
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
        END IF;
        CLOSE   c_system_event_tot;
      END IF;

      /* Check constraint PM_SEV_CK2 */
      IF r_system_event_tmp.total_waits >= 0 
      AND r_system_event_tmp.total_timeouts >= 0 
      AND r_system_event_tmp.time_waited >= 0 
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
        );

--/*DBUG*/        v_count := v_count + 1;
      EXCEPTION
        WHEN OTHERS
        THEN
--/*DBUG*/          dbug.print( 'error', 'db: %s; run_id: %s; event: %s',
--/*DBUG*/                      r_system_event_tmp.db,
--/*DBUG*/                      r_system_event_tmp.run_id,
--/*DBUG*/                      r_system_event_tmp.event );
          NULL;
      END;
      END IF;
    END LOOP;

    COMMIT;

--/*DBUG*/    dbug.print( 'info', 'Rows added to pm_system_event: %s', v_count );

    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
--/*DBUG*/      dbug.print( 'error', 'error in process_system_event' );
      trc.leave_on_error;
      RAISE;
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
    v_error_msg             pm_run.error_msg%TYPE;
    v_calls                 VARCHAR2(32767);
    v_format_call_stack     VARCHAR2(32767);

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
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );

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

    trc.leave;
  EXCEPTION
    WHEN OTHERS
    THEN
      trc.leave_on_error;
      v_error_msg := trc.get_first_error_msg;
      v_calls := trc.get_first_calls;
      v_format_call_stack := trc.get_first_format_call_stack;

              /* remove all children of this run but not the run and error itself */
      pm.cleanup_l( i_cursor, i_db, v_run_id, v_run_id, false ); 

      UPDATE  pm_run
      SET     error_msg = v_error_msg
      WHERE   run_id = v_run_id;


      /* Use DBMS_OUTPUT here */
      dbms_output.put_line( '*** dbms_utility.format_call_stack ***' );
      dbms_output.put_line( substr( v_format_call_stack, 1, 255 ) );
      dbms_output.put_line( '*** call stack ***' );
      dbms_output.put_line( substr( v_calls, 1, 255 ) );

      RAISE;
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
    trc.enter( c_module_name );
    trc.add_arg( 'i_db', i_db );

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

    trc.leave;
  EXCEPTION
    WHEN    OTHERS
    THEN
      trc.leave_on_error;
      RAISE;
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
  RETURN 
  NUMBER 
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
  RETURN NUMBER 
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
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN get_statement_l(
             pm.get_db(i_db)
           , i_sql_hash_value
           , i_sql_address );
  END get_statement;
  --
  -- Build a statement line
  PROCEDURE build_statement_line(
    i_piece IN INTEGER ,
    i_sql_text IN pm_sql_id.sql_text%TYPE ,
    io_sql_text IN OUT pm_sql_id.sql_text%TYPE )
  IS
  BEGIN
    IF i_piece = 0
    THEN
      io_sql_text := i_sql_text;
    ELSE
      io_sql_text := io_sql_text || i_sql_text;
    END IF;
  END build_statement_line;
  --
  -- Get the statement by text lookup
  FUNCTION get_statement(
    i_sql_id IN pm_sql_id.sql_id%TYPE )
  RETURN VARCHAR2
  IS
    v_statement VARCHAR2(32767) := NULL;
  BEGIN
     /* build statement */
    FOR r_sqltext IN
    (
      SELECT  0 piece
      ,       sql_text
      FROM    pm_sql_id
      WHERE   sql_id = i_sql_id
    )
    LOOP
      build_statement_line
      (
        r_sqltext.piece
      , r_sqltext.sql_text
      , v_statement
      );
    END LOOP;
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
    i_sql_text IN pm_sql_id.sql_text%TYPE )
  IS
  BEGIN
    ins_pm_sql_l(
      pm.get_db(i_db)
    , i_hash_value
    , i_address
    , i_command_type
    , i_sql_text
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
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
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
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
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
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
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
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
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
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
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
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
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
  EXCEPTION
    WHEN OTHERS
    THEN
      IF dbms_sql.is_open(v_cursor)
      THEN
        dbms_sql.close_cursor(v_cursor);
      END IF;
      RAISE;
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
        v_keyword := '$Revision$';
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
  EXCEPTION
    WHEN OTHERS
    THEN
      RETURN NULL;
  END version;

END pm;
/

