PROMPT
PROMPT	$RCSfile$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
PROMPT	Description:	Show execution plan of a SQL statement identified 
PROMPT			by statement id
REMARK
PROMPT	Parameters:	
PROMPT 			1 - Statement id
PROMPT			&&1
REMARK
REMARK  $Log$
REMARK  Revision 1.6  2004/02/06 09:50:57  gpaulissen
REMARK  Release 6.4.0
REMARK
REMARK  Revision 1.5  2003/08/08 21:01:19  gpaulissen
REMARK  Release 4.2.1
REMARK
REMARK  Revision 1.4  1999/05/31 15:19:47  gpaulissen
REMARK  *** empty log message ***
REMARK
REMARK  Revision 1.3  1999/05/26 13:50:58  gpaulissen
REMARK  trimspool on added
REMARK
REMARK  Revision 1.2  1999/05/25 14:44:57  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.1  1999/05/06 15:08:11  gpaulissen
REMARK  Initial revision
REMARK
REMARK
REMARK

VAR statement_id VARCHAR2(100);

exec :statement_id := '&&1';

set arraysize 1
set linesize 132
set verify off trimspool on

column operation	heading 'Operation'	format a20 word_wrapped
column options		heading 'Options'	format a10 word_wrapped
column object_name	heading 'Object'	format a30 word_wrapped
column id		heading 'Id'		
column parent_id	heading 'Parent id'		
column position		heading 'Cost'		

SELECT	lpad( ' ', 2*(level-1) ) || operation operation
,	options
,	object_name
,	id
,	parent_id
,	position
FROM	plan_table
START WITH 
	id = 0 
AND 	statement_id = :statement_id
CONNECT BY 
	prior id = parent_id
AND	statement_id = :statement_id
/

set verify on

undefine 1

undefine statement_id


