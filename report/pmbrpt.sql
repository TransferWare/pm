REMARK
REMARK	$Id$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
REMARK	Description:	end of report
REMARK

define date_format = 'YYYYMMDDHH24MISS'

set feedback off termout on verify off trimspool on heading on pagesize 66

VAR	date_format varchar2(25);
VAR	start_time varchar2(25);
VAR	end_time varchar2(25);
VAR	db varchar2(20);
VAR	lwb_run_id NUMBER;
VAR	upb_run_id NUMBER;

REMARK  pm_sqlarea columns

column	executions	heading 'Executions'	format 999,999,999,999
column	loads		heading 'Loads'		format 999,999,999
column	rows_processed	heading 'No. of rows'	format 999,999,999,999
column	buffer_gets	heading 'Buffer gets'	format 999,999,999,999
column	disk_reads	heading 'Disk reads'	like buffer_gets

REMARK pm_sql_id columns

column	sql_id		heading 'SQL id'	
column	sql_text	heading 'Text'		format a64 word_wrapped

REMARK pm_system_event columns

column	event			heading 'Event'	format a30
column	total_waits		heading 'Total waits'
column	total_timeouts		heading 'Total timeouts'
column	time_waited		heading 'Time waited|(sec)      '	format 999,999,999
column	average_wait		heading 'Avg wait|(sec)     '	format 999,999.99

REMARK pm_session and pm_sess_io columns

column	username	heading 'Username'
column	block_gets	heading 'Block gets' format 999,999,999,999
column	block_changes	heading 'Block changes' format 999,999,999,999

REMARK v$statname and pm_sysstat

column	class		heading 'Statistic class'	format a15
column	name		heading 'Statistic name'	format a60	word_wrap
column	value		heading 'Value'			format 999,999,999,999,999

