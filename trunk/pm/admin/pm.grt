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
PROMPT  $Id$
REMARK 
REMARK  $Date$
REMARK
REMARK  $Author$
REMARK
REMARK  $Revision$
REMARK
REMARK  Description:    Grants for Performance Monitor owner.
REMARK
PROMPT  Notes:          This must be run as SYS
PROMPT
PROMPT  Parameters:
PROMPT                  1 - account to grant to
PROMPT                  &&1
PROMPT
REMARK  $Log$
REMARK  Revision 1.1  2003/08/28 14:44:48  gpaulissen
REMARK  Release 6.0.0
REMARK
REMARK  Revision 1.6  2002/05/24 14:22:41  gpaulissen
REMARK  New release 4.1.0
REMARK
REMARK  Revision 1.5  2002/01/17 10:57:01  gpaulissen
REMARK  - make install enhanced.
REMARK  - make depend added (makedepend_oracle.pl, makedepend.sql, makestate.sql).
REMARK  - reports user text field widened (from 10 to 30) due to report 4.5 bug.
REMARK  - removed in install scripts:
REMARK    whenever sqlerror exit failure
REMARK    whenever oserror exit failure
REMARK
REMARK  Revision 1.4  1999/10/20 13:01:46  gpaulissen
REMARK  Added WHENEVER SQLERROR/OSERROR CONTINUE
REMARK
REMARK  Revision 1.3  1999/10/07 13:17:58  gpaulissen
REMARK  PR-777 WHENEVER SQLERROR/OSERROR
REMARK
REMARK  Revision 1.2  1999/10/01 15:15:28  gpaulissen
REMARK  PR-736 Version info added
REMARK
REMARK  Revision 1.1  1999/09/16 09:06:48  gpaulissen
REMARK  Added pm.grt
REMARK

define account = &&1

grant create session to &&account
/
grant create procedure to &&account
/
grant create table to &&account
/
grant create view to &&account
/
grant create sequence to &&account
/
grant create database link to &&account
/
grant select on v_$statname to &&account
/
grant alter session to &&account
/

undefine account
undefine 1

