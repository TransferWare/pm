PROMPT
PROMPT  $Id$
REMARK 
REMARK  $Date$
REMARK
REMARK  $Author$
REMARK
REMARK  $Revision$
REMARK
PROMPT  Description:    Show hit ratio's
REMARK
PROMPT  Parameters:     
PROMPT                  1 - Database
PROMPT                  &&1
PROMPT                  2 - Start time inclusive (Oracle YYYYMMDDHH24MISS format)
PROMPT                  &&2
PROMPT                  3 - End time exclusive (Oracle YYYYMMDDHH24MISS format)
PROMPT                  &&3
PROMPT                  4 - Display time format (One of (D)ays, (H)ours, (M)inutes)
PROMPT                  &&4
PROMPT

define date_format = 'YYYYMMDDHH24MISS'

define db = '&&1'
define start_time = '&&2'
define end_time = '&&3'
define display_time_format = '&&4'

set feedback off termout on pagesize 10000 verify off

VAR     p_date_format varchar2(25);
REMARK	p_display_date_format: one of DD (days), HH24 (hours), MI (minutes)
VAR     p_display_time_format varchar2(4);
VAR     p_start_time varchar2(25);
VAR     p_end_time varchar2(25);
VAR     p_db varchar2(20);

BEGIN
	:p_date_format := '&&date_format';
	:p_start_time := '&&start_time';
	:p_end_time := '&&end_time';
	:p_db := UPPER('&&db');
	IF	UPPER('&&display_time_format') = 'D'
	THEN
		:p_display_time_format := 'DD';
	ELSIF	UPPER('&&display_time_format') = 'H'
	THEN
		:p_display_time_format := 'HH24';
	ELSIF	UPPER('&&display_time_format') = 'M'
	THEN
		:p_display_time_format := 'MI';
	ELSE
		:p_display_time_format := 'MI';
	END IF;
END;
/

VAR p_consistent_gets NUMBER;
VAR p_db_block_gets NUMBER;
VAR p_physical_reads NUMBER;

BEGIN
	:p_consistent_gets := pm_cfg.get_statistic#( 'consistent gets' );
	:p_db_block_gets := pm_cfg.get_statistic#( 'db block gets' );
	:p_physical_reads := pm_cfg.get_statistic#( 'physical reads' );
END;
/

set termout on

alter session set nls_date_format = 'DD-MON-YYYY HH24:MI:SS';

set linesize 132

column "Time" heading "Date/time"
column "Physical Reads" format 999,999,999,999
column "Logical Reads" format 999,999,999,999
column "Hit Ratio" format 999.99

@@ pm012q1.sql

/

undefine date_format
undefine display_time_format
undefine db
undefine start_time
undefine end_time

undefine 1
undefine 2
undefine 3
undefine 4
