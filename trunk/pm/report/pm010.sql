PROMPT
PROMPT	$RCSfile$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
PROMPT	Description:	This scripts list all of the SQL statements currently stored in
PROMPT			the shared pool that have an estimated response time, which
PROMPT			can be specified by the user.
REMARK
PROMPT	Parameters:	
PROMPT 			1 - Database
PROMPT			&&1
PROMPT 			2 - Start time inclusive (Oracle YYYYMMDDHH24MISS format)
PROMPT			&&2
PROMPT 			3 - End time exclusive (Oracle YYYYMMDDHH24MISS format)
PROMPT			&&3
PROMPT			4 - Minimum estimated time (default 4)
PROMPT			&&4
PROMPT
REMARK  $Log$
REMARK  Revision 1.6  2003/08/08 21:01:20  gpaulissen
REMARK  Release 4.2.1
REMARK
REMARK  Revision 1.5  1999/05/26 15:48:54  gpaulissen
REMARK  Added having clause.
REMARK
REMARK  Revision 1.4  1999/05/25 14:45:02  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.3  1999/05/06 14:58:15  gpaulissen
REMARK  *** empty log message ***
REMARK
REMARK
REMARK

@@ pmbrpt.sql

BEGIN
	:date_format := 'YYYYMMDDHH24MISS';
	:db := UPPER('&&1');
	:start_time := '&&2';
	:end_time := '&&3';
END;
/

REMARK Maximum response time in seconds
DEFINE max_response_time = &&4

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

set linesize 200

VAR max_response_time NUMBER
VAR max_disk_reads_per_second NUMBER
VAR max_buffer_gets_per_second NUMBER

BEGIN
	:max_response_time := &&max_response_time;
	:max_disk_reads_per_second := pm_cfg.get_disk_io_rate( :db );
	:max_buffer_gets_per_second := pm_cfg.get_memory_io_rate( :db );
END;
/

column disk_reads	heading 'Disk reads'	noprint
column buffer_gets	heading 'Buffer gets'	noprint
column avg_disk_reads	heading 'Disk reads|per execution' format 999,999,999
column avg_buffer_gets	heading 'Buffer gets|per execution' format 999,999,999
column "Response"	heading	'Estimated|time (sec)' format 999,999,999.99

@@ pm010q1.sql

/

undefine 1
undefine 2
undefine 3
undefine 4

undefine max_response_time

@@ pmerpt.sql
