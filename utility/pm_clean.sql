PROMPT
PROMPT	$Id$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
REMARK  Description:	Cleanup pm tables.
REMARK			The pm tables will be cleaned by using a period of keeping things.
REMARK
PROMPT  Parameters:	
PROMPT 			1 - Database
PROMPT			&&1
PROMPT 			2 - Number of full days to keep. 
PROMPT			    1 means this day and the previous full day.
PROMPT			&&2
REMARK
REMARK  $Log$
REMARK  Revision 1.7  1999/05/25 14:45:04  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.6  1999/05/25 14:36:37  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.5  1999/05/25 14:34:55  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.4  1999/04/15 15:26:20  gpaulissen
REMARK  Calling stored procedures now.
REMARK
REMARK  Revision 1.3  1998/12/10 13:35:57  gpaulissen
REMARK  Removed alter table pm_sqlarea_tmp disable primary key,
REMARK  since primary key is removed.
REMARK
REMARK  Revision 1.2  1998/11/26 13:38:01  gpaulissen
REMARK  Added standard header.
REMARK
REMARK

set serveroutput on size 100000

execute pm.cleanup( upper('&&1'), &&2 );

