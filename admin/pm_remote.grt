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
REMARK  Description:    Grant select on V$ views to an account.
REMARK                  These are needed for the Performance Monitor application
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
REMARK  Revision 1.13  2003/08/08 20:50:46  gpaulissen
REMARK  Dynamic SQL used.
REMARK
REMARK  Revision 1.12  2003/07/29 20:25:49  gpaulissen
REMARK  Modifications for Oracle 7 thru 9 (dbms_sql)
REMARK
REMARK  Revision 1.11  2003/07/15 21:17:49  gpaulissen
REMARK  Release 4.2.0
REMARK
REMARK  Revision 1.10  2002/05/24 14:22:44  gpaulissen
REMARK  New release 4.1.0
REMARK
REMARK  Revision 1.9  2002/01/17 10:57:04  gpaulissen
REMARK  - make install enhanced.
REMARK  - make depend added (makedepend_oracle.pl, makedepend.sql, makestate.sql).
REMARK  - reports user text field widened (from 10 to 30) due to report 4.5 bug.
REMARK  - removed in install scripts:
REMARK    whenever sqlerror exit failure
REMARK    whenever oserror exit failure
REMARK
REMARK  Revision 1.8  2000/07/07 09:58:10  gpaulissen
REMARK  Moved grant execute on TPI packages to below.
REMARK
REMARK  Revision 1.7  2000/03/07 15:56:05  gpaulissen
REMARK  TPI added
REMARK
REMARK  Revision 1.6  1999/10/20 13:01:49  gpaulissen
REMARK  Added WHENEVER SQLERROR/OSERROR CONTINUE
REMARK
REMARK  Revision 1.5  1999/10/07 13:17:59  gpaulissen
REMARK  PR-777 WHENEVER SQLERROR/OSERROR
REMARK
REMARK  Revision 1.4  1999/10/07 11:53:11  gpaulissen
REMARK  PR-777
REMARK
REMARK  Revision 1.3  1999/09/14 09:42:04  gpaulissen
REMARK  Grant all privileges to the interface account.
REMARK
REMARK  Revision 1.2  1999/09/13 16:38:51  gpaulissen
REMARK  Select privileges to pm link account.
REMARK
REMARK  Revision 1.1  1999/07/01 13:38:53  gpaulissen
REMARK  PR-580 SERVICE TIME BEREKENEN
REMARK
REMARK  Revision 1.2  1999/05/25 14:45:07  gpaulissen
REMARK  Released
REMARK
REMARK  Revision 1.1  1998/12/10 13:34:24  gpaulissen
REMARK  Initial revision
REMARK
REMARK

define account = &&1

undefine 1

grant create session to &&account
/
grant create procedure to &&account
/
grant create view to &&account
/
grant create synonym to &&account
/

set serveroutput on size 1000000

declare
  l_cursor integer;
begin
  l_cursor := dbms_sql.open_cursor;

  for r_grant in
  (
    select  'grant select on ' || view_name || ' to &&account' command
    from    user_views
    where   view_name in 
            ( 
              'V$INSTANCE',
              'V_$INSTANCE',
              'V$SYSTEM_EVENT', 
              'V_$SYSTEM_EVENT', 
              'V$SQLAREA', 
              'V_$SQLAREA', 
              'V$SESSION',
              'V_$SESSION',
              'V$SYSSTAT', 
              'V_$SYSSTAT', 
              'V$SQLTEXT_WITH_NEWLINES',
              'V_$SQLTEXT_WITH_NEWLINES'
            )
    union   /* pm_dpi / pm_mpi */
    select  'grant execute on ' || object_name || ' to &&account' command
    from    user_objects
    where   object_name like 'PM\_%' escape '\' /* this quote (') is needed by emacs */
    and     object_type in ( 'PACKAGE', 'FUNCTION', 'PROCEDURE' )
  )
  loop
  begin
    dbms_sql.parse( l_cursor, r_grant.command, dbms_sql.native );
    /*
       GJP 29-07-2003
       According to the documentation dbms_sql.execute may be necessary in
       the future. However Oracle 9i has no dbms_sql.execute anymore.
       So we stick with dbms_sql.parse alone as the portable method in Oracle 7, 8 and 9.
    */
    /*
       GJP 04-08-2003
       dbms_sql.execute seems to be in the database but not visible in TOAD
    */
    /*
       GJP 05-08-2003
       dbms_sql.execute is a function not a procedure!
    */
    if dbms_sql.execute( l_cursor ) is null then null; end if;
    dbms_output.put_line( 'Command ' || r_grant.command || ' succeeded.' );
  exception
    when others
    then
      dbms_output.put_line( 'Command ' || r_grant.command || ' failed.' );
      raise;
  end;
  end loop;

  dbms_sql.close_cursor( l_cursor );
exception
  when others
  then
    if dbms_sql.is_open( l_cursor )
    then
      dbms_sql.close_cursor( l_cursor );
    end if;
    raise;
end;
/

undefine account
