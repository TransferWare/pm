define pm_home = '..'

whenever oserror continue
@ $HOME/bin/login.sql
whenever oserror exit failure

alter session set PLSQL_CCFlags = 'Debugging:true,Testing:false';

/*
--execute dbug.activate('dbms_output')
execute dbug.activate('dbms_application_info')
-- execute dbug.activate('profiler')
*/
