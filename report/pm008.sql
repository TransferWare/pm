PROMPT
PROMPT	$Id$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
PROMPT	Description:	Identify system statistics
REMARK
PROMPT	Parameters:	
PROMPT 			1 - Database
PROMPT			&&1
PROMPT 			2 - Start time inclusive (Oracle YYYYMMDDHH24MISS format)
PROMPT			&&2
PROMPT 			3 - End time exclusive (Oracle YYYYMMDDHH24MISS format)
PROMPT			&&3
REMARK
REMARK  $Log$
REMARK  Revision 1.6  2004/02/06 09:50:57  gpaulissen
REMARK  Release 6.4.0
REMARK
REMARK  Revision 1.5  2003/08/08 21:01:20  gpaulissen
REMARK  Release 4.2.1
REMARK
REMARK  Revision 1.4  1999/05/26 15:52:17  gpaulissen
REMARK  *** empty log message ***
REMARK
REMARK  Revision 1.3  1999/05/26 15:18:08  gpaulissen
REMARK  Added: pmbrpt.sql and pmerpt.sql
REMARK
REMARK  Break on class
REMARK
REMARK  Revision 1.2  1999/05/25 14:45:01  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.1  1999/04/29 10:00:31  gpaulissen
REMARK  Initial revision
REMARK
REMARK
REMARK

@@ pmbrpt.sql

define db = &1
define start_time = &2
define end_time	= &3

set linesize 132

BEGIN
	:date_format := '&&date_format';
	:db := UPPER('&&db');
	:start_time := '&&start_time';
	:end_time := '&&end_time';
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

break on class

@@ pm008q1.sql

/

undefine 1
undefine 2
undefine 3

undefine db
undefine start_time
undefine end_time

@@ pmerpt.sql

