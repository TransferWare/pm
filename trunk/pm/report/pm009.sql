PROMPT
PROMPT	$Id$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
PROMPT	Description:	Show statements likely to be used within a loop (i.e. open and 1 fetch)
REMARK
PROMPT	Parameters:	
PROMPT 			1 - Database
PROMPT			&&1
PROMPT 			2 - Start time inclusive (Oracle YYYYMMDDHH24MISS format)
PROMPT			&&2
PROMPT 			3 - End time exclusive (Oracle YYYYMMDDHH24MISS format)
PROMPT			&&3
PROMPT 			4 - Minimum number of executions
PROMPT			&&4
PROMPT
REMARK
REMARK  $Log$
REMARK  Revision 1.5  2004/02/06 09:50:57  gpaulissen
REMARK  Release 6.4.0
REMARK
REMARK  Revision 1.4  2003/08/08 21:01:20  gpaulissen
REMARK  Release 4.2.1
REMARK
REMARK  Revision 1.3  1999/05/26 15:23:55  gpaulissen
REMARK  Added: pmbrpt.sql and pmerpt.sql
REMARK
REMARK  Revision 1.2  1999/05/25 14:45:01  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.1  1999/04/29 09:59:58  gpaulissen
REMARK  Initial revision
REMARK
REMARK
REMARK

@@ pmbrpt.sql

define db = &&1
define start_time = &&2
define end_time	= &&3
define minimum = &4

VAR	minimum number;

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

@@ pm009q1.sql

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

