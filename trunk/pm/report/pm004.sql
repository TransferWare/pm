PROMPT
PROMPT	$RCSfile$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
PROMPT	Description:	List statistics about sql area.
REMARK
REMARK  $Log$
REMARK  Revision 1.4  2003/08/08 21:01:19  gpaulissen
REMARK  Release 4.2.1
REMARK
REMARK  Revision 1.3  1999/05/26 14:14:17  gpaulissen
REMARK  pmbrpt.sql and pmerpt.sql used.
REMARK
REMARK  Revision 1.2  1999/05/25 14:44:50  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.1  1999/04/16 12:25:25  gpaulissen
REMARK  Initial revision
REMARK
REMARK
REMARK
PROMPT	Parameters:	
PROMPT 			1 - Database
PROMPT			&&1
PROMPT 			2 - Start time inclusive (Oracle YYYYMMDDHH24MISS format)
PROMPT			&&2
PROMPT 			3 - End time exclusive (Oracle YYYYMMDDHH24MISS format)
PROMPT			&&3
PROMPT 			4 - column to list (executions, kept_versions, etc.)
PROMPT			&&4
PROMPT 			5 - minimum value
PROMPT			&&5
PROMPT

@@ pmbrpt.sql

VAR minimum NUMBER;

BEGIN
	:date_format := '&&date_format';
	:db := UPPER('&&1');
	:start_time := '&&2';
	:end_time := '&&3';
	:minimum := '&&5';
END;
/

set verify off

define column = &4

BEGIN
	pm.get_run_range
	( 
		:db
	,	to_date( :start_time, :date_format )
	,	to_date( :end_time, :date_format )
	,	:lwb_run_id
	,	:upb_run_id 
	);
END;
/

column  value		heading '&column'	format 999,999,999,999

SELECT	/*+ ORDERED */
	sqlarea.value
,	sqlarea.sql_id
,	sqltext.sql_text
FROM	(
		SELECT	/*+ ORDERED */
			pm_sql.sql_id
		,	sum(pm_sqlarea.&column)	value
		FROM	pm_sqlarea
		,	pm_sql
		WHERE	pm_sqlarea.db = :db
		AND	pm_sqlarea.db = pm_sql.db
		AND	pm_sqlarea.hash_value = pm_sql.hash_value
		AND	pm_sqlarea.address = pm_sql.address
		AND	pm_sqlarea.run_id BETWEEN :lwb_run_id AND :upb_run_id
		GROUP BY
			pm_sql.sql_id
		HAVING 	sum(pm_sqlarea.&column) >= :minimum
	)		sqlarea
,	pm_sql_id	sqltext
WHERE	sqlarea.sql_id = sqltext.sql_id
ORDER BY 
	sqlarea.value
,	sqlarea.sql_id
/

undefine 1
undefine 2
undefine 3
undefine 4
undefine 5

undefine column

@@ pmerpt.sql
