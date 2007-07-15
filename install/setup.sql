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


define app_schema = PM_OWNER
DEFINE dblink = 'X'
DEFINE app = 'PM'
DEFINE WKBASE = ..\..

REM DEFINE debug = ON

SET SQLPROMPT 'SQL> ' TIME ON TERMOUT ON

define pm_home = ..
define tw_home = &&pm_home/../tw

REM ====================
REM Run project settings
REM ====================

@ &&pm_home/install/project.sql

REM =======
REM Cleanup
REM =======
UNDEFINE pm_password
UNDEFINE pmid
