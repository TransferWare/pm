PROMPT
PROMPT	$RCSfile$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
PROMPT  Description:	Create execution plan of a SQL statement identified 
PROMPT			by database and sql id.
REMARK
PROMPT  Parameters:	
PROMPT 			1 - Database
PROMPT			&&1
PROMPT			2 - SQL id
PROMPT			&&2
REMARK
REMARK  Output:		pm002.lis
REMARK
REMARK  Precondition:	SQL statements must be in pm_sql_id.
REMARK
REMARK  $Log$
REMARK  Revision 1.5  2004/02/06 09:50:57  gpaulissen
REMARK  Release 6.4.0
REMARK
REMARK  Revision 1.4  2003/08/08 21:01:19  gpaulissen
REMARK  Release 4.2.1
REMARK
REMARK  Revision 1.3  1999/05/31 15:19:43  gpaulissen
REMARK  *** empty log message ***
REMARK
REMARK  Revision 1.2  1999/05/25 14:44:56  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.1  1999/05/06 15:07:07  gpaulissen
REMARK  Initial revision
REMARK
REMARK
REMARK

define db = &&1
define sql_id = &&2

set arraysize 1
set trimspool on
set serveroutput on size 100000
set timing off
set feedback off
set verify off
set heading off
set linesize 132
set termout off
set escape \

column sql_text format a1000 wrapped
set linesize 1000

define output_file = pm002.lis

spool &output_file

select	'set serveroutput on size 100000'
from	dual
union all
select	'define statement_id = ' || pm.get_statement_id( &sql_id )
from	dual
union all
select	'delete from plan_table where statement_id = ''\&statement_id'';'
from	dual
union all
select	'EXPLAIN PLAN SET STATEMENT_ID = ''\&statement_id'' FOR '
from	dual
union all
select	pm.get_statement( &sql_id )
from	dual
union all
select	'/'
from	dual
/

prompt prompt Execution plan of statement_id \&statement_id completed. 
prompt prompt Do not forget to commit if you want the results to be stored.
prompt prompt

spool off

set termout on
set feedback on
set heading on
set verify on
set escape off

prompt
prompt Execution plan script spooled to &output_file.
prompt

undefine 1
undefine 2
undefine 3

undefine db
undefine sql_id
