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
REMARK  Description:    Create Total Performance Index packages.
REMARK                  These are needed for the Performance Monitor application
REMARK
PROMPT  Notes:          This must be run as SYS
PROMPT
PROMPT  Parameters:     None
PROMPT
REMARK  $Log$
REMARK  Revision 1.1  2003/08/28 14:44:48  gpaulissen
REMARK  Release 6.0.0
REMARK
REMARK  Revision 1.3  2002/05/24 14:22:51  gpaulissen
REMARK  New release 4.1.0
REMARK
REMARK  Revision 1.2  2002/01/17 10:57:11  gpaulissen
REMARK  - make install enhanced.
REMARK  - make depend added (makedepend_oracle.pl, makedepend.sql, makestate.sql).
REMARK  - reports user text field widened (from 10 to 30) due to report 4.5 bug.
REMARK  - removed in install scripts:
REMARK    whenever sqlerror exit failure
REMARK    whenever oserror exit failure
REMARK
REMARK  Revision 1.1  2000/07/07 10:31:52  gpaulissen
REMARK  Release 3.3.0
REMARK
REMARK
REMARK

@@ ../db/pm_mpi.pks
@@ ../db/pm_mpi.pkb
@@ ../db/pm_dpi.pks
@@ ../db/pm_dpi.pkb


