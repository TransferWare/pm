PROMPT
PROMPT	$RCSfile$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
PROMPT	Description:	This scripts lists similar SQL statements found in pm_sqlarea.
REMARK
PROMPT	Parameters:	
PROMPT 			1 - Substring length
PROMPT			&&1
PROMPT			2 - Minimal number of same occurrences of strings
PROMPT			    with the same subtring length
PROMPT			&&2
PROMPT
REMARK  $Log$
REMARK  Revision 1.4  2003/08/08 21:01:20  gpaulissen
REMARK  Release 4.2.1
REMARK
REMARK  Revision 1.3  1999/05/26 15:57:01  gpaulissen
REMARK  Added pmbrpt.sql and pmerpt.sql
REMARK
REMARK  Revision 1.2  1999/05/25 14:45:02  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.1  1999/05/06 09:51:49  gpaulissen
REMARK  Initial revision
REMARK
REMARK  Revision 1.2  1998/11/26 11:58:30  gpaulissen
REMARK  1. Added RCS keywords
REMARK  2. Use standard date format of YYYYMMDDHH24MISS.
REMARK
REMARK

@@ pmbrpt.sql

define substr_length = &&1
define substr_count = &&2

var substr_length number
var substr_count number

set linesize 200

column	substr_text	heading	"SQL substring" format a64 word_wrap
column	substr_count	heading "Count"	

begin
	:substr_length := &&substr_length;
	:substr_count := &&substr_count;
end;
/

@@ pm011q1.sql

/

undefine substr_length
undefine substr_count

undefine 1
undefine 2

@@ pmerpt.sql
