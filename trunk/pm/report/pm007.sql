PROMPT
PROMPT	$RCSfile$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
PROMPT	Description:	Identify high load on the database related to sessions.
REMARK
PROMPT	Parameters:	
PROMPT 			1 - Database
PROMPT			&&1
PROMPT 			2 - Start time inclusive (Oracle YYYYMMDDHH24MISS format)
PROMPT			&&2
PROMPT 			3 - End time exclusive (Oracle YYYYMMDDHH24MISS format)
PROMPT			&&3
PROMPT 			4 - Minimum of disk reads and buffer gets
PROMPT			&&4
REMARK
REMARK  $Log$
REMARK  Revision 1.5  2003/08/08 21:01:20  gpaulissen
REMARK  Release 4.2.1
REMARK
REMARK  Revision 1.4  1999/10/07 15:08:26  gpaulissen
REMARK  pm_sess_io is replaced by pm_sqlarea
REMARK
REMARK  Revision 1.3  1999/05/26 15:06:08  gpaulissen
REMARK  pmbrpt.sql and pmerpt.sql added.
REMARK
REMARK  Revision 1.2  1999/05/25 14:45:02  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.1  1999/05/01 07:34:17  gpaulissen
REMARK  Initial revision
REMARK
REMARK
REMARK

@@ pmbrpt.sql

define db = &&1
define start_time = &&2
define end_time	= &&3
define minimum = &&4

set linesize 132

VAR	minimum NUMBER;

BEGIN
	:date_format := '&&date_format';
	:db := UPPER('&&db');
	:start_time := '&&start_time';
	:end_time := '&&end_time';
	:minimum := to_number('&&minimum');
END;
/

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

@@ pm007q1.sql

/

undefine 1
undefine 2
undefine 3
undefine 4

undefine db
undefine start_time
undefine end_time
undefine minimum

@@ pmerpt.sql

