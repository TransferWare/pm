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
REMARK  Description:    Create database link for monitoring. Also ask
REMARK                  for I/O rates for instance being monitored.
REMARK
PROMPT  Parameters:     
PROMPT                  1 - name of database link
PROMPT                  &&1
PROMPT                  2 - connect to
PROMPT                  &&2
PROMPT                  3 - password
PROMPT                  &&3
PROMPT                  4 - tns service name
PROMPT                  &&4
REMARK
REMARK  $Log$
REMARK  Revision 1.1  2003/08/28 14:44:48  gpaulissen
REMARK  Release 6.0.0
REMARK
REMARK  Revision 1.13  2003/07/15 21:17:49  gpaulissen
REMARK  Release 4.2.0
REMARK
REMARK  Revision 1.12  2002/05/24 15:12:52  gpaulissen
REMARK  *** empty log message ***
REMARK
REMARK  Revision 1.10  1999/10/20 13:01:45  gpaulissen
REMARK  Added WHENEVER SQLERROR/OSERROR CONTINUE
REMARK
REMARK  Revision 1.9  1999/10/07 15:07:22  gpaulissen
REMARK  Changed error checking for convenience
REMARK
REMARK  Revision 1.8  1999/10/07 13:17:57  gpaulissen
REMARK  PR-777 WHENEVER SQLERROR/OSERROR
REMARK
REMARK  Revision 1.7  1999/07/01 13:38:52  gpaulissen
REMARK  PR-580 SERVICE TIME BEREKENEN
REMARK
REMARK  Revision 1.6  1999/05/25 14:45:05  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.5  1999/05/06 14:12:30  gpaulissen
REMARK  global_names fals
REMARK
REMARK  Revision 1.4  1999/05/06 10:17:36  gpaulissen
REMARK  Toegevoegd: vraag om I/Os per seconde.
REMARK
REMARK  Revision 1.3  1998/12/10 13:31:38  gpaulissen
REMARK  Debugged.
REMARK
REMARK  Revision 1.2  1998/11/26 13:33:45  gpaulissen
REMARK  Added standard header.
REMARK
REMARK

define db = &&1

WHENEVER SQLERROR CONTINUE

drop database link &&db
/

WHENEVER SQLERROR EXIT FAILURE
WHENEVER OSERROR EXIT FAILURE

alter session set global_names = false
/

create database link &&db connect to &&2 identified by &&3 using '&&4'
/

var disk_io_rate number
var memory_io_rate number

begin
                /* do it twice to ignore startup problems */
        for v_nr in 1..2
        loop
                pm$get_rate@&&db( :disk_io_rate, :memory_io_rate );
        end loop;
exception
        when others
        then
          null; /* pm$get_rate need not be there */
end;
/

begin
        pm_cfg.set_disk_io_rate( upper('&&db'), :disk_io_rate );
        pm_cfg.set_memory_io_rate( upper('&&db'), :memory_io_rate );
exception
        when others
        then
          null; /* pm_cfg need not be there */
end;
/

commit;

undefine 1
undefine 2
undefine 3
undefine 4
WHENEVER SQLERROR CONTINUE
WHENEVER OSERROR CONTINUE
