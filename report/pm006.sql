PROMPT
PROMPT	$RCSfile$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
PROMPT	Description:	Get SQL statements where search string is found.
REMARK
PROMPT	Parameters:	
PROMPT 			1 - Database
PROMPT			&&1
PROMPT 			2 - Search string
PROMPT			&&2
PROMPT			3 - Type of SQL statement
PROMPT			    ( I - Insert, S - Select, U - Update, D - Delete )
PROMPT			    Combination is possible, e.g. IUD for all DML's
PROMPT			&&3
REMARK
REMARK  $Log$
REMARK  Revision 1.4  2003/08/08 21:01:20  gpaulissen
REMARK  Release 4.2.1
REMARK
REMARK  Revision 1.3  1999/05/26 15:06:32  gpaulissen
REMARK  Added pmbrpt.sql and pmerpt.sql
REMARK
REMARK  Revision 1.2  1999/05/25 14:44:59  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.1  1999/05/06 15:12:41  gpaulissen
REMARK  Initial revision
REMARK
REMARK
REMARK

@@ pmbrpt.sql

define db = &&1
define search_string = &&2
define command_type = &&3

set linesize 132

VAR search_string varchar2(100);
VAR command_type varchar2(10);

BEGIN
	:db := UPPER('&&db');
	:search_string := UPPER('&&search_string');
	:command_type := UPPER('&&command_type');
END;
/

break on sql_id

SELECT	distinct
	pm_sql_id.sql_id
,	pm_sql_id.sql_text
FROM	pm_sql_id
,	pm_sql
WHERE	pm_sql.db = :db
AND	pm_sql.sql_id = pm_sql_id.sql_id
AND	INSTR
	( 
		:command_type
	,	DECODE
		( 
			pm_sql_id.command_type
		,	2 /* Insert */
		,	'I'
		,	3 /* Select */
		,	'S'
		,	6 /* Update */
		,	'U'
		,	7 /* Delete */
		,	'D'
		,	'X' 	
		)
	) > 0
AND	INSTR( UPPER(pm_sql_id.sql_text), :search_string ) > 0
ORDER BY 
	pm_sql_id.sql_id
/

undefine 1
undefine 2
undefine 3

undefine db
undefine search_string
undefine command_type

@@ pmerpt.sql
