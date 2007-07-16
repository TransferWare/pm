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
REMARK  $Name$
REMARK
REMARK  Description:    Create access to TPI software for database links
REMARK
PROMPT  Notes:          This must be run as the database link account
PROMPT
REMARK
REMARK

@@ pm_fixed.vw
@@ pm_remote.prc

set serveroutput on size 1000000

declare
  /* ORA-00955: name is already used by an existing object */
  e_object_already_exists exception;
  pragma exception_init(e_object_already_exists, -955);

  l_cursor integer;
begin
  l_cursor := dbms_sql.open_cursor;

  for r_create in
  (
    select  'create synonym pm_mpi for sys.pm_mpi' command
    from    dual
    union all
    select  'create synonym pm_dpi for sys.pm_dpi' command
    from    dual
  )
  loop
  begin
    dbms_sql.parse( l_cursor, r_create.command, dbms_sql.native );
    if dbms_sql.execute( l_cursor ) is null then null; end if;
    dbms_output.put_line( 'Command ' || r_create.command || ' succeeded.' );
  exception
    when e_object_already_exists
    then
      null;
    when others
    then
      dbms_output.put_line( 'Command ' || r_create.command || ' failed.' );
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
