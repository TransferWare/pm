PROMPT
PROMPT  $Id$
REMARK 
REMARK  $Date$
REMARK
REMARK  $Author$
REMARK
REMARK  $Revision$
REMARK
PROMPT  Description:    Identify high load sql.
REMARK
REMARK  $Log$
REMARK  Revision 1.14  2004/12/03 14:57:29  gpaulissen
REMARK  empty define needs trimming in to_number()
REMARK
REMARK  Revision 1.13  2004/02/06 09:50:57  gpaulissen
REMARK  Release 6.4.0
REMARK
REMARK  Revision 1.12  2003/08/08 21:01:19  gpaulissen
REMARK  Release 4.2.1
REMARK
REMARK  Revision 1.11  1999/10/06 09:49:23  gpaulissen
REMARK  Output modified
REMARK
REMARK  Revision 1.10  1999/07/01 13:39:46  gpaulissen
REMARK  PR-580 SERVICE TIME BEREKENEN
REMARK
REMARK  Revision 1.9  1999/06/04 13:26:49  gpaulissen
REMARK  Release 3.0
REMARK
REMARK  Revision 1.8  1999/05/26 15:47:30  gpaulissen
REMARK  pmbrpt.sql and pmerpt.sql added.
REMARK
REMARK  Revision 1.7  1999/05/25 14:44:49  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.6  1999/05/19 19:41:03  gpaulissen
REMARK  Cost -> time
REMARK
REMARK  Revision 1.5  1999/04/29 10:16:56  gpaulissen
REMARK  termout on.
REMARK
REMARK  Revision 1.4  1999/04/29 10:11:10  gpaulissen
REMARK  Kolommen toegevoegd.
REMARK
REMARK  Revision 1.3  1999/04/16 11:56:22  gpaulissen
REMARK  Added columns loads, executions and rows_processed.
REMARK
REMARK  Revision 1.2  1999/04/16 09:23:57  jschotsman
REMARK  perc veranderd in percentage
REMARK
REMARK  Revision 1.1  1999/04/15 09:38:07  gpaulissen
REMARK  Initial revision
REMARK
REMARK
REMARK
PROMPT  Parameters:     
PROMPT                  1 - Database
PROMPT                  &&1
PROMPT                  2 - Start time inclusive (Oracle YYYYMMDDHH24MISS format)
PROMPT                  &&2
PROMPT                  3 - End time exclusive (Oracle YYYYMMDDHH24MISS format)
PROMPT                  &&3
PROMPT                  4 - Show SQL at least this percentage (max 100) of estimated time
PROMPT                  &&4
PROMPT

@@ pmbrpt.sql

define db = '&&1'
define start_time = '&&2'
define end_time = '&&3'
define perc = &&4

VAR     perc number;
VAR     cost_memory number;
VAR     cost_disk_io number;
VAR     tot_io number;

BEGIN
        :date_format := '&&date_format';
        :db := UPPER('&&db');
        :start_time := '&&start_time';
        :end_time := '&&end_time';
        :perc := greatest( least( &&perc, 100 ), 0 );
        :cost_memory := pm_cfg.get_memory_io_rate( :db );
        :cost_disk_io := pm_cfg.get_disk_io_rate( :db );
END;
/

BEGIN
        pm.get_run_range
        ( 
                :db
        ,       to_date( :start_time, :date_format )
        ,       to_date( :end_time, :date_format )
        ,       :lwb_run_id
        ,       :upb_run_id 
        );
END;
/

REM Save result in define tot_io
REM Ensure no data will result in an empty tot_io define
set null ''
set heading off

column  tot_io format 999999999999999999 new_value tot_io 

set termout off

@@ pm001q1.sql

/

set termout on

set heading on

BEGIN
        /* 
        || &&tot_io may be empty, hence a 
        || conversion with to_number will result in NULL
        || GJP &&tot_io may be white space to, hence ltrim it.
        */
        :tot_io := nvl(to_number(ltrim('&&tot_io')), 0);
END;
/

set termout on

set linesize 200

REM PR-580 Service time instead of estimated time

column  total           heading 'Service|time (sec)'    format 999,999,999,999
column  percentage      heading '%'             format 999.99

@@ pm001q2.sql

/

undefine 1
undefine 2
undefine 3
undefine 4

undefine db
undefine start_time
undefine end_time
undefine perc
undefine tot_io

@@ pmerpt.sql

