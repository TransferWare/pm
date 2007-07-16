PROMPT
PROMPT	$Id$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
PROMPT	Description:	Identify system events 
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
REMARK  Revision 1.4  2004/02/06 09:50:57  gpaulissen
REMARK  Release 6.4.0
REMARK
REMARK  Revision 1.3  2003/08/08 21:01:20  gpaulissen
REMARK  Release 4.2.1
REMARK
REMARK  Revision 1.2  1999/10/01 14:06:23  gpaulissen
REMARK  PR-736 Added version info
REMARK
REMARK  Revision 1.1  1999/05/26 15:48:54  gpaulissen
REMARK  Initial revision
REMARK
REMARK  Revision 1.3  1998/12/22 16:27:58  gpauliss
REMARK  Performance enhancements.
REMARK
REMARK  Revision 1.2  1998/11/26 11:58:30  gpaulissen
REMARK  1. Added RCS keywords
REMARK  2. Use standard date format of YYYYMMDDHH24MISS.
REMARK
REMARK

@@ pmbrpt.sql

BEGIN
	:date_format := '&&date_format';
	:db := UPPER('&&1');
	:start_time := '&&2';
	:end_time := '&&3';
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

set pagesize 10000

@@ pm005q1.sql

/

undefine 1
undefine 2
undefine 3

@@ pmerpt.sql
