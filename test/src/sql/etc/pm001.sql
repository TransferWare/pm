set serveroutput on

define db_link = '&&1'

set verify off feedback off

alter session set nls_date_language = AMERICAN;

declare
  c_nl constant char(1) := CHR(10);

  v_db_startup_time_v7 varchar2(1000) :=
        'select to_date(idate.value, ''J'') + (isec.value/(60*60*24)) startup_time' || c_nl ||
        'from   v$instance<db_link> idate' || c_nl ||
        ',      v$instance<db_link> isec' || c_nl ||
        'where  idate.key=''STARTUP TIME - JULIAN''' || c_nl ||
        'and    isec.key=''STARTUP TIME - SECONDS''';

  v_db_startup_time_v8 varchar2(1000) :=
        'select startup_time' || c_nl ||
        'from   v$instance<db_link>';

  v_date date;
  v_db_startup_time date; 
  v_cursor integer;
  v_rows_processed integer;
  v_db pm_run.db%TYPE;
  v_db_link pm_run.db%TYPE;

  e_conn_descr_not_found exception;
  PRAGMA EXCEPTION_INIT(e_conn_descr_not_found, -2019);

begin
  if '&&db_link' is null
  then
    v_db_link := null;
  else
    v_db_link := '@&&db_link';
  end if;
  v_db := pm.get_db('&&db_link');

  v_db_startup_time_v7 := replace(v_db_startup_time_v7, '<db_link>', v_db_link);
  v_db_startup_time_v8 := replace(v_db_startup_time_v8, '<db_link>', v_db_link);

  dbms_output.put_line( chr(10) );
  dbms_output.put_line( 'v_db_startup_time_v7:' );
  dbms_output.put_line( v_db_startup_time_v7 );

  dbms_output.put_line( chr(10) );
  dbms_output.put_line( 'v_db_startup_time_v8:' );
  dbms_output.put_line( v_db_startup_time_v8 );

  v_cursor := dbms_sql.open_cursor;
  if ( substr( '&&_O_RELEASE', 1, 1 ) = '7' )
  then
    dbms_sql.parse(v_cursor, v_db_startup_time_v7, dbms_sql.native);
  else
    dbms_sql.parse(v_cursor, v_db_startup_time_v8, dbms_sql.native);
  end if;

  dbms_sql.define_column(v_cursor, 1, v_date);
  v_rows_processed := dbms_sql.execute(v_cursor);

  if dbms_sql.fetch_rows(v_cursor)>0 
  then
    -- get column values of the row
    dbms_sql.column_value(v_cursor, 1, v_date);
  end if;
  dbms_sql.close_cursor(v_cursor);

  dbms_output.put_line( chr(10) );
  dbms_output.put_line( 'pm.get_db_startup_time( v_db, v_db_startup_time );' );
  pm.get_db_startup_time( v_db, v_db_startup_time );
  dbms_output.put_line( to_char(v_db_startup_time, 'YYYY-MM-DD HH24:MI:SS') );

  dbms_output.put_line( chr(10) );
  dbms_output.put_line( 'pm.get_db_startup_time( v_db, v_db_startup_time );' );
  pm.get_db_startup_time( v_db, v_db_startup_time );
  dbms_output.put_line( to_char(v_db_startup_time, 'YYYY-MM-DD HH24:MI:SS') );

  begin
    dbms_output.put_line( chr(10) );
    dbms_output.put_line( 'pm.get_db_startup_time( null, v_db_startup_time );' );
    pm.get_db_startup_time( null, v_db_startup_time );
    /* GJP 22-12-2002 OK now */
    /* raise value_error; */
  exception
    when e_conn_descr_not_found
    then
      null;
    when others
    then
      raise;
  end;

  begin
    dbms_output.put_line( chr(10) );
    dbms_output.put_line( 'pm.get_db_startup_time( '''', v_db_startup_time );' );
    pm.get_db_startup_time( '', v_db_startup_time );
    /* GJP 22-12-2002 OK now */
    /* raise value_error; */
  exception
    when e_conn_descr_not_found
    then
      null;
    when others
    then
      raise;
  end;

  begin
    dbms_output.put_line( chr(10) );
    dbms_output.put_line( 'pm.get_db_startup_time( ''XXXX'', v_db_startup_time );' );
    pm.get_db_startup_time( 'XXXX', v_db_startup_time );
    raise value_error;
  exception
    when e_conn_descr_not_found
    then
      null;
    when others
    then
      raise;
  end;

  dbms_output.put_line( chr(10) );
  dbms_output.put_line( 'OK' );
end;
/

undefine 1
