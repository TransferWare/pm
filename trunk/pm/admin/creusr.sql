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
PROMPT	$RCSfile$
REMARK 
REMARK	$Date$
REMARK
REMARK	$Author$
REMARK
REMARK  $Revision$
REMARK
REMARK  Description:	Create an Oracle account.
REMARK
REMARK  Notes:		1) Must use SYS to run this script.
REMARK			2) Password is the same as account name. This can be changed by a DBA.
REMARK			3) No quota on tablespace SYSTEM. Might be changed by a DBA.
PROMPT	Parameters:
PROMPT			1 - account to create
PROMPT			&&1
REMARK
PROMPT			2 - default tablespace 
PROMPT			&&2
REMARK
PROMPT			3 - temporary tablespace 
PROMPT			&&3
REMARK
REMARK  $Log$
REMARK  Revision 1.1  2003/08/28 14:44:48  gpaulissen
REMARK  Release 6.0.0
REMARK
REMARK  Revision 1.14  2002/05/24 14:22:39  gpaulissen
REMARK  New release 4.1.0
REMARK
REMARK  Revision 1.13  2002/01/17 10:57:00  gpaulissen
REMARK  - make install enhanced.
REMARK  - make depend added (makedepend_oracle.pl, makedepend.sql, makestate.sql).
REMARK  - reports user text field widened (from 10 to 30) due to report 4.5 bug.
REMARK  - removed in install scripts:
REMARK    whenever sqlerror exit failure
REMARK    whenever oserror exit failure
REMARK
REMARK  Revision 1.12  1999/11/29 17:17:16  gpaulissen
REMARK  Commentaar Tom Bouwman verwerkt.
REMARK
REMARK  Revision 1.11  1999/10/20 13:01:45  gpaulissen
REMARK  Added WHENEVER SQLERROR/OSERROR CONTINUE
REMARK
REMARK  Revision 1.10  1999/10/07 15:06:08  gpaulissen
REMARK  Removed error checking because it is inconvenient.
REMARK
REMARK  Revision 1.9  1999/10/07 13:17:57  gpaulissen
REMARK  PR-777 WHENEVER SQLERROR/OSERROR
REMARK
REMARK  Revision 1.8  1999/09/16 09:06:47  gpaulissen
REMARK  Added pm.grt
REMARK
REMARK  Revision 1.7  1999/09/14 09:44:11  gpaulissen
REMARK  Grants are moved to pm_remote.grt
REMARK
REMARK  Revision 1.6  1999/09/13 16:38:51  gpaulissen
REMARK  Select privileges to pm link account.
REMARK
REMARK  Revision 1.5  1999/07/01 13:38:52  gpaulissen
REMARK  PR-580 SERVICE TIME BEREKENEN
REMARK
REMARK  Revision 1.4  1999/05/25 14:45:05  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.3  1998/12/10 13:31:38  gpaulissen
REMARK  Added user parameter.
REMARK
REMARK  Revision 1.2  1998/11/26 13:33:45  gpaulissen
REMARK  Added standard header.
REMARK
PROMPT	
REMARK

define account = &&1
define default_tablespace = &&2
define temporary_tablespace = &&3

create user &&account 
identified by &&account
default tablespace &&default_tablespace
temporary tablespace &&temporary_tablespace
quota 0 on system
quota unlimited on &&default_tablespace
/

undefine 1
undefine account
undefine 2
undefine default_tablespace
undefine 3
undefine temporary_tablespace


