REM Generated by perl cmd2sql.pl (1.11)

REMARK *************************************************************************
REMARK Start of section 1
REMARK Please do NOT edit this section.
REMARK *************************************************************************

WHENEVER OSERROR CONTINUE
SET DEFINE '&'
SET FEEDBACK OFF VERIFY OFF TERMOUT OFF
COLUMN sessionid NEW_VALUE sessionid
SELECT LTRIM(USERENV('SESSIONID')) sessionid
FROM DUAL
/
DEFINE env_sql = 'env.&&sessionid..sql'
DEFINE connect_sql = 'connect.&&sessionid..sql'
DEFINE restore_sql = 'restore.&&sessionid..sql'
DEFINE host_bat = 'host.&&sessionid..bat'
SET FEEDBACK ON VERIFY ON TERMOUT ON
SET TERMOUT OFF SQLPROMPT '--'
UNDEFINE _O_VERSION
SPOOL &&restore_sql
SET DEFINE OFF
DEFINE
SET DEFINE '&'
PROMPT WHENEVER SQLERROR EXIT FAILURE
PROMPT WHENEVER OSERROR EXIT FAILURE
SPOOL OFF
SET TERMOUT ON SQLPROMPT 'SQL> '
STORE SET &&restore_sql APPEND
PROMPT Starting session &&sessionid

SET TERMOUT OFF SQLPROMPT '' VERIFY OFF ECHO OFF
SPOOL &&connect_sql
PROMPT SET DEFINE '~' VERIFY OFF FEEDBACK OFF PAGESIZE 0 TERMOUT OFF ECHO OFF
PROMPT WHENEVER SQLERROR EXIT FAILURE
PROMPT PROMPT Connecting to ~~1
PROMPT CONNECT ~~1
PROMPT SET DEFINE '&'
PROMPT UNDEFINE 1
PROMPT START &&restore_sql
SPOOL OFF
SET DEFINE '&'
START &&restore_sql

SET TERMOUT OFF SQLPROMPT '' VERIFY OFF ECHO OFF
SPOOL &&env_sql
PROMPT SET DEFINE '~'
PROMPT SET FEEDBACK OFF VERIFY OFF TERMOUT OFF ECHO OFF
PROMPT COLUMN delete_cmd FORMAT a20 NEW_VALUE delete_cmd
PROMPT COLUMN copy_cmd FORMAT a20 NEW_VALUE copy_cmd
PROMPT COLUMN batch_cmd FORMAT a20 NEW_VALUE batch_cmd
PROMPT COLUMN begin_cmd FORMAT a20 NEW_VALUE begin_cmd
PROMPT COLUMN end_cmd FORMAT a40 NEW_VALUE end_cmd
PROMPT COLUMN create_file_cmd FORMAT a20 NEW_VALUE create_file_cmd
PROMPT COLUMN set_file_readonly_cmd FORMAT a30 NEW_VALUE set_file_readonly_cmd
PROMPT COLUMN set_file_writable_cmd FORMAT a30 NEW_VALUE set_file_writable_cmd
PROMPT COLUMN on_error_exit_cmd FORMAT a30 NEW_VALUE on_error_exit_cmd
PROMPT COLUMN ignore_stdout FORMAT a30 NEW_VALUE ignore_stdout
PROMPT DEFINE os = 'Windows'
PROMPT REM accept os prompt 'Operating System (Windows|Unix) ? [~~os] ' default ~~os
PROMPT SELECT 'del' delete_cmd
PROMPT ,      'copy' copy_cmd
PROMPT ,      'call' batch_cmd
PROMPT ,      '@echo on' begin_cmd
PROMPT ,      '@exit' || chr(10) || ':error' || chr(10) || '@echo ERROR: last command failed.' || chr(10) || '@pause' end_cmd
PROMPT ,      '@echo. >' create_file_cmd
PROMPT ,      '@attrib +R' set_file_readonly_cmd
PROMPT ,      '@attrib -R' set_file_writable_cmd
PROMPT ,      '@if errorlevel 1 goto error' on_error_exit_cmd
PROMPT ,      '>nul' ignore_stdout
PROMPT FROM DUAL
PROMPT WHERE UPPER('~~os') LIKE 'WIN%'
PROMPT UNION ALL
PROMPT SELECT 'rm' delete_cmd
PROMPT ,      'cp' copy_cmd
PROMPT ,      'sh' batch_cmd
PROMPT ,      'ps1=$PS1; PS1=">"' begin_cmd
PROMPT ,      'PS1=$ps1' end_cmd
PROMPT ,      'touch' create_file_cmd
PROMPT ,      'chmod -w' set_file_readonly_cmd
PROMPT ,      'chmod +w' set_file_writable_cmd
PROMPT ,      'test $? -eq 0 || exit' on_error_exit_cmd
PROMPT ,      '1>/dev/null' ignore_stdout
PROMPT FROM DUAL
PROMPT WHERE UPPER('~~os') LIKE '%X'
PROMPT /
PROMPT UNDEFINE os
PROMPT SET DEFINE '&'
PROMPT COLUMN delete_cmd CLEAR
PROMPT COLUMN copy_cmd CLEAR
PROMPT COLUMN batch_cmd CLEAR
PROMPT COLUMN begin_cmd CLEAR
PROMPT COLUMN end_cmd CLEAR
PROMPT COLUMN create_file_cmd CLEAR
PROMPT COLUMN set_file_readonly_cmd CLEAR
PROMPT COLUMN set_file_writable_cmd CLEAR
PROMPT COLUMN on_error_exit_cmd CLEAR
PROMPT COLUMN ignore_stdout CLEAR
PROMPT START &&restore_sql
SPOOL OFF
SET DEFINE '&'
START &&restore_sql

WHENEVER OSERROR EXIT FAILURE
START &&env_sql
REMARK *************************************************************************
REMARK End of section 1
REMARK *************************************************************************

REMARK *************************************************************************
REMARK Start of section 2
REMARK This section may be edited.
REMARK *************************************************************************

COMMIT
/

DEFINE log_file = 'output00001.&&sessionid..log'
PROMPT Log file: &&log_file
SPOOL &&log_file
START &&restore_sql
SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&pm_HOME\common/src/sql/set_common_sql_dir.sql "&&pm_HOME\common/src/sql/"
SET VERIFY ON DEFINE ON
PROMPT &&pm_HOME
START &&pm_HOME\common/src/sql/set_common_sql_dir.sql "&&pm_HOME\common/src/sql/"
SET DEFINE '&'
COMMIT
/

DEFINE log_file = 'output00002.&&sessionid..log'
PROMPT Log file: &&log_file
SPOOL &&log_file
START &&restore_sql
SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&pm_HOME\common/src/sql/check_sql_env.sql PRIVILEGE create_procedure
SET VERIFY ON DEFINE ON
START &&pm_HOME\common/src/sql/check_sql_env.sql PRIVILEGE create_procedure
SET DEFINE '&'
COMMIT
/

DEFINE log_file = 'output00003.&&sessionid..log'
PROMPT *** Installing packages: START ***
PROMPT Log file: &&log_file
SPOOL &&log_file
START &&restore_sql
SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&pm_HOME/db/gskdb.pck 
SET VERIFY ON DEFINE ON
START &&pm_HOME/db/gskdb.pck 
SET DEFINE '&'
COMMIT
/

DEFINE log_file = 'output00004.&&sessionid..log'
PROMPT Log file: &&log_file
SPOOL &&log_file
START &&restore_sql
SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&pm_HOME/db/pm.pck 
SET VERIFY ON DEFINE ON
START &&pm_HOME/db/pm.pck 
SET DEFINE '&'
COMMIT
/

DEFINE log_file = 'output00005.&&sessionid..log'
PROMPT Log file: &&log_file
SPOOL &&log_file
START &&restore_sql
SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&pm_HOME/db/pm_cfg.pck 
SET VERIFY ON DEFINE ON
START &&pm_HOME/db/pm_cfg.pck 
SET DEFINE '&'
COMMIT
/

DEFINE log_file = 'output00006.&&sessionid..log'
PROMPT Log file: &&log_file
SPOOL &&log_file
START &&restore_sql
SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&pm_HOME/db/pm_dpi.pks 
SET VERIFY ON DEFINE ON
START &&pm_HOME/db/pm_dpi.pks 
SET DEFINE '&'
COMMIT
/

DEFINE log_file = 'output00007.&&sessionid..log'
PROMPT Log file: &&log_file
SPOOL &&log_file
START &&restore_sql
SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&pm_HOME/db/pm_mpi.pks 
SET VERIFY ON DEFINE ON
START &&pm_HOME/db/pm_mpi.pks 
SET DEFINE '&'
COMMIT
/

DEFINE log_file = 'output00008.&&sessionid..log'
PROMPT Log file: &&log_file
SPOOL &&log_file
START &&restore_sql
SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&pm_HOME/db/trc.pck 
SET VERIFY ON DEFINE ON
START &&pm_HOME/db/trc.pck 
SET DEFINE '&'
COMMIT
/

DEFINE log_file = 'output00009.&&sessionid..log'
PROMPT *** Installing packages: OK ***
PROMPT *** Installing package_bodies: START ***
PROMPT *** Installing package_bodies: OK ***
PROMPT *** Installing functions: START ***
PROMPT *** Installing functions: OK ***
PROMPT *** Installing procedures: START ***
PROMPT *** Installing procedures: OK ***
PROMPT Log file: &&log_file
SPOOL &&log_file
START &&restore_sql
SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&pm_HOME\common/src/sql/check_sql_env.sql PRIVILEGE create_view
SET VERIFY ON DEFINE ON
START &&pm_HOME\common/src/sql/check_sql_env.sql PRIVILEGE create_view
SET DEFINE '&'
COMMIT
/

DEFINE log_file = 'output00010.&&sessionid..log'
PROMPT *** Installing views: START ***
PROMPT Log file: &&log_file
SPOOL &&log_file
START &&restore_sql
SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&pm_HOME/db/pm_vw_sqlarea.vw 
SET VERIFY ON DEFINE ON
START &&pm_HOME/db/pm_vw_sqlarea.vw 
SET DEFINE '&'
COMMIT
/

DEFINE log_file = 'output00011.&&sessionid..log'
PROMPT *** Installing views: OK ***
PROMPT *** Installing triggers: START ***
PROMPT *** Installing triggers: OK ***
PROMPT Log file: &&log_file
SPOOL &&log_file
START &&restore_sql
SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&pm_HOME\common/src/sql/recomp.sql 
SET VERIFY ON DEFINE ON
START &&pm_HOME\common/src/sql/recomp.sql 
SET DEFINE '&'
COMMIT
/

DEFINE log_file = 'output00012.&&sessionid..log'
PROMPT *** Installing grants: START ***
PROMPT *** Installing grants: OK ***
PROMPT Log file: &&log_file
SPOOL &&log_file
START &&restore_sql
SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&pm_HOME\common/src/sql/check_sql_env.sql CONNECT "&&userid"
SET VERIFY ON DEFINE ON
PROMPT &&userid
START &&pm_HOME\common/src/sql/check_sql_env.sql CONNECT "&&userid"
SET DEFINE '&'
COMMIT
/

SPOOL OFF
REMARK *************************************************************************
REMARK End of section 2
REMARK *************************************************************************

REMARK *************************************************************************
REMARK Start of section 3
REMARK Please do NOT edit this section.
REMARK *************************************************************************

WHENEVER OSERROR CONTINUE
HOST &&copy_cmd output?????.&&sessionid..log output.&&sessionid..tmp &&ignore_stdout
HOST &&delete_cmd output?????.&&sessionid..log &&ignore_stdout
HOST &&copy_cmd output.&&sessionid..tmp output.&&sessionid..log &&ignore_stdout
HOST &&delete_cmd output.&&sessionid..tmp &&ignore_stdout
HOST &&delete_cmd &&connect_sql &&ignore_stdout
HOST &&delete_cmd &&restore_sql &&ignore_stdout
HOST &&delete_cmd &&env_sql &&ignore_stdout
UNDEFINE batch_cmd
UNDEFINE begin_cmd
UNDEFINE connect_sql
UNDEFINE copy_cmd
UNDEFINE create_file_cmd
UNDEFINE delete_cmd
UNDEFINE end_cmd
UNDEFINE env_sql
UNDEFINE host_bat
UNDEFINE ignore_stdout
UNDEFINE log_file
UNDEFINE on_error_exit_cmd
UNDEFINE restore_sql
UNDEFINE sessionid
UNDEFINE set_file_readonly_cmd
UNDEFINE set_file_writable_cmd
REMARK *************************************************************************
REMARK End of section 3
REMARK *************************************************************************

SET TERMOUT ON SQLPROMPT 'SQL> '
PROMPT pm_upgrade.sql READY. Enter EXIT to leave SQL*Plus... 
