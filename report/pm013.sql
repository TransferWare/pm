PROMPT
PROMPT	$RCSfile$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
PROMPT	Description:	This scripts list the modules, actions and usernames of a SQL text.
REMARK
PROMPT	Parameters:	
PROMPT 			1 - Database
PROMPT			&&1
PROMPT			2 - Sql id as stored in pm_sql
PROMPT			&&2
PROMPT
REMARK  $Log$
REMARK  Revision 1.4  2004/02/06 09:50:57  gpaulissen
REMARK  Release 6.4.0
REMARK
REMARK  Revision 1.3  2003/08/08 21:01:20  gpaulissen
REMARK  Release 4.2.1
REMARK
REMARK  Revision 1.2  1999/05/25 14:45:02  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.1  1999/04/29 10:08:16  gpaulissen
REMARK  Initial revision
REMARK
REMARK
REMARK

define db = &&1
define sql_id = &&2

set linesize 132
set trimspool on
set pagesize 66

VAR	db varchar2(20)
VAR	sql_id number

begin
	:db := UPPER('&&db');
	:sql_id := to_number('&&sql_id');
end;
/

column	module			heading "Module"	format a30
column	action			heading	"Action"	format a30
column	parsing_user_name	heading "Executed by"	format a30
column	parsing_schema_name	heading "From schema"	format a30

@@ pm013q1.sql

/

undefine db
undefine sql_id

undefine 1
undefine 2

