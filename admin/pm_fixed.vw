/*
    The Performance Monitor monitors your Oracle databases.
    Copyright (C) 2002  G.J. Paulissen, Transfer Solutions b.v., Leerdam, Netherlands

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/
PROMPT
PROMPT  $RCSfile$
REMARK 
REMARK  $Date$
REMARK
REMARK  $Author$
REMARK
REMARK  $Revision$
REMARK
REMARK  Description:    Create PM views on v$tables.
REMARK
REMARK  $Log$
REMARK  Revision 1.1  2003/08/28 14:44:48  gpaulissen
REMARK  Release 6.0.0
REMARK
REMARK  Revision 1.10  2003/07/15 21:17:49  gpaulissen
REMARK  Release 4.2.0
REMARK
REMARK  Revision 1.9  2002/05/24 14:22:42  gpaulissen
REMARK  New release 4.1.0
REMARK
REMARK  Revision 1.8  2002/03/08 11:47:35  gpaulissen
REMARK  PM 4.0.0
REMARK
REMARK  Revision 1.7  2002/01/17 10:57:03  gpaulissen
REMARK  - make install enhanced.
REMARK  - make depend added (makedepend_oracle.pl, makedepend.sql, makestate.sql).
REMARK  - reports user text field widened (from 10 to 30) due to report 4.5 bug.
REMARK  - removed in install scripts:
REMARK    whenever sqlerror exit failure
REMARK    whenever oserror exit failure
REMARK
REMARK  Revision 1.6  2000/08/25 08:54:34  gpaulissen
REMARK  Version for Oracle different in 8i
REMARK
REMARK  Revision 1.5  1999/10/20 13:01:48  gpaulissen
REMARK  Added WHENEVER SQLERROR/OSERROR CONTINUE
REMARK
REMARK  Revision 1.4  1999/10/07 13:17:58  gpaulissen
REMARK  PR-777 WHENEVER SQLERROR/OSERROR
REMARK
REMARK  Revision 1.3  1999/05/25 14:45:07  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.2  1999/04/15 13:49:46  gpaulissen
REMARK  Get Oracle version to run the appropiate script.
REMARK
REMARK  Revision 1.1  1998/12/10 13:34:24  gpaulissen
REMARK  Initial revision
REMARK
REMARK

REM Create views for accessing the following fixed tables/views:
REM     v$instance
REM     v$system_event
REM     v$sqlarea
REM     v$session
REM     v$sess_io
REM     v$sesstat
REM     v$sysstat
REM     v$sqltext_with_newlines


REM --------------------------------------------------------
REM Get version (major, minor) info in &&version ( e.g. 7_1)
REM --------------------------------------------------------

column version new_value version

set pagesize 0 termout off

set document off

document

select * from v$version shows:

BANNER
----------------------------------------------------------------
Oracle8i Personal Edition Release 8.1.6.0.0 - Production
PL/SQL Release 8.1.6.0.0 - Production
CORE    8.1.6.0.0       Production
TNS for 32-bit Windows: Version 8.1.6.0.0 - Production
NLSRTL Version 3.4.1.0.0 - Production

In order to get the version (only major and minor, e.g. 8.1) 
search for Oracle% or PL/SQL% entries and determine the (space
before the) first point and the second point. Subtract that part and
replace the point by an underscore.

#

select  replace(
          substr( 
            banner
          , instr(banner, ' ', -(length(banner)-instr(banner, '.')))+1 /* first space */
          , instr( banner, '.', instr(banner, '.') + 1 ) /* second point */ -
                  (instr(banner, ' ', -(length(banner)-instr(banner, '.')))+1) )
        ,       '.'
        ,       '_') version
from    v$version 
where   banner like 'Oracle%' 
or      banner like 'PL/SQL%'
order by 
        banner desc /* Oracle first */
/

rem No changes above 8.1, hence use 8.1 as the last version

select  '8_1' version
from    dual
where   /* < 10_ */
        ( '&&version' like '_\_%' escape '\' /* this quote (') is needed by emacs */
        and '&&version' > '8_1'
        )
        /* >= 10_ */
or      '&&version' like '__\_%' escape '\' /* this quote (') is needed by emacs */
/

column version clear

set termout on

PROMPT Installing pm$ views for Oracle &&version

@@ pm_fixed_&&version..vw

