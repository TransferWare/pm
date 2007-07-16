PROMPT
PROMPT	$Id$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
PROMPT  Description:	Get session info and store them in the pm tables.
REMARK
PROMPT  Parameters:
PROMPT 			1 - Database link
PROMPT			&&1
REMARK
REMARK  $Log$
REMARK  Revision 1.9  1999/05/25 14:45:04  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.8  1999/05/25 14:36:37  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.7  1999/05/25 14:34:55  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.6  1999/04/15 15:26:20  gpaulissen
REMARK  Calling stored procedures now.
REMARK
REMARK  Revision 1.5  1999/02/21 16:48:58  dosuser
REMARK  .
REMARK
REMARK  Revision 1.4  1999/02/21 15:41:36  dosuser
REMARK  Completely revised due to errors in handling delta's of
REMARK  pm_sess_io, pm_system_event and pm_sysstat.
REMARK
REMARK  Revision 1.3  1998/12/10 13:35:57  gpaulissen
REMARK  1. Removed enabling/disabling of primary key of pm_sqlarea_tmp,
REMARK  since key is removed.
REMARK  2. Inserting into pm_sqlarea modified to ignore rows
REMARK  with same data except for column invalidations.
REMARK
REMARK  Revision 1.2  1998/11/26 13:38:01  gpaulissen
REMARK  Added standard header.
REMARK
REMARK

set serveroutput on size 1000000

execute pm.collect( upper('&&1') );
