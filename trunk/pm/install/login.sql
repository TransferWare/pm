REM
REM     $Header$
REM
REM     Author:         Gert-Jan Paulissen
REM
REM     Purpose:        Standard login for PM.
REM
REM     Dependencies:   project.sql
REM
REM     Parameters:     -

REM Must be disconnected (see initial login in &&tw_home/common/install/project.sql)

DISCONNECT

WHENEVER OSERROR EXIT FAILURE

REM Standard defines


define pm_schema = PM_OWNER
DEFINE dblink = 'X'
DEFINE app = 'PM'
DEFINE WKBASE = ..\..

REM DEFINE debug = ON

REM ========================================================
REM Build get_dir.bat to get the home directory of projects.
REM
REM After 
REM
REM   HOST get_dir.bat <project>
REM
REM a file get_dir.sql is created. Now run
REM
REM   @ get_dir.sql
REM
REM and DEFINE <project>_home is created.
REM ========================================================

SET SQLPROMPT '' TIME OFF TERMOUT OFF

SPOOL get_dir.bat

PROMPT @echo off
PROMPT echo set define '~'> get_dir.sql
PROMPT echo define dir = ->> get_dir.sql

REM directories gesorteerd op nieuwste eerst

PROMPT dir/b/a:d/o:-d &&wkbase\%1*>> get_dir.sql
PROMPT echo define %1_home = '..\..\~~dir'>> get_dir.sql
PROMPT echo undefine dir>> get_dir.sql
PROMPT echo set define on>> get_dir.sql

SPOOL OFF

SET SQLPROMPT 'SQL> ' TIME ON TERMOUT ON

PROMPT HOST get_dir.bat &&APP
HOST get_dir.bat &&APP
@ get_dir.sql

define tw_home = &&pm_home

REM ====================
REM Run project settings
REM ====================

PROMPT @ &&pm_home/install/project.sql
@ &&pm_home/install/project.sql

REM =======
REM Cleanup
REM =======
UNDEFINE pm_password
UNDEFINE pmid

@ &&common_sql_dir.delete_file.sql get_dir.bat
@ &&common_sql_dir.delete_file.sql get_dir.sql
