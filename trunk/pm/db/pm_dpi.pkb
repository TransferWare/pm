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
REMARK  Description:	Package body for Memory Performance Index.
REMARK
REMARK  $Log$
REMARK  Revision 1.1  2003/08/28 14:44:48  gpaulissen
REMARK  Release 6.0.0
REMARK
REMARK  Revision 1.4  2002/05/24 14:22:42  gpaulissen
REMARK  New release 4.1.0
REMARK
REMARK  Revision 1.3  2002/01/17 10:57:03  gpaulissen
REMARK  - make install enhanced.
REMARK  - make depend added (makedepend_oracle.pl, makedepend.sql, makestate.sql).
REMARK  - reports user text field widened (from 10 to 30) due to report 4.5 bug.
REMARK  - removed in install scripts:
REMARK    whenever sqlerror exit failure
REMARK    whenever oserror exit failure
REMARK
REMARK  Revision 1.2  2000/03/16 15:35:19  gpaulissen
REMARK  Percentage tussen 0 en 1
REMARK
REMARK  Revision 1.1  2000/03/07 16:26:39  gpaulissen
REMARK  TPI toegevoegd
REMARK
REMARK  Revision 1.1  2000/03/07 15:56:04  gpaulissen
REMARK  TPI added
REMARK
REMARK

REM
PROMPT 
PROMPT Creating Package Body pm_dpi
CREATE OR REPLACE PACKAGE BODY pm_dpi IS

function get_top10_disk_abuse
return number
is
	v_value number;
	v_total10 number;
	v_total number;

	cursor	c1
	is
		select	disk_reads
		from	v$sqlarea
		order by
			disk_reads desc;

	cursor	c2
	is
		select	sum(disk_reads)
		from	v$sqlarea;
begin
	v_value := 0;
	v_total10 := 0;
	open c1;
	for nr in 1..10
	loop
		fetch c1
		into v_value;
		if c1%notfound
		then
			exit;
		end if;
		v_total10 := v_total10 + v_value;
	end loop;
	close c1;

	open c2;
	fetch c2 into v_total;
	if c2%notfound
	then
		v_total := 0;
		close c2;
	else
		close c2;
	end if;
	
	if ( v_total = 0 )
	then
		return NULL;
	else
		return v_total10 / v_total;
	end if;
/*
exception
	when	others
	then
		if c1%isopen
		then
			close c1;
		end if;
		return NULL;
*/
end get_top10_disk_abuse;

function get_rollback_segment_balance
return number
is
	v_value number;

	cursor c1 is
		select	count(distinct substr(ltrim(translate(file_name, '/\:[]', '     ')),
                                              1,
                                              instr(ltrim(translate(file_name, '/\:[]', '     ')), ' ')))
		from	dba_data_files
		,	dba_rollback_segs
		where	dba_data_files.file_id = dba_rollback_segs.file_id;
begin
	open c1;
	fetch c1
	into v_value;
	if c1%found
	then
		close c1;
	else
		close c1;
		v_value := NULL;
	end if;
	return v_value;
exception
	when	others
	then
		if c1%isopen
		then
			close c1;
		end if;
		return NULL;
end get_rollback_segment_balance;

function get_temporary_segment_balance
return number
is
	v_value number;

	cursor c1
  	is
		select	count(distinct substr(ltrim(translate(file_name, '/\:[]', '     ')),
                                              1,
                                              instr(ltrim(translate(file_name, '/\:[]', '     ')), ' ')))
		from	dba_data_files
		,	dba_users
		where	dba_data_files.tablespace_name = dba_users.temporary_tablespace
		and	dba_data_files.tablespace_name <> 'SYSTEM';
begin
	open c1;
	fetch c1
	into v_value;
	if c1%found
	then
		close c1;
	else
		close c1;
		v_value := NULL;
	end if;

	return v_value;
exception
	when	others
	then
		if c1%isopen
		then
			close c1;
		end if;
		return NULL;
end get_temporary_segment_balance;

function get_minor_table_fragmentation
return number
is
	v_value number;

	cursor c1 is
		select 	count(*)
		from	dba_segments
		where	segment_type = 'TABLE'
		and	extents > 5;
begin
	open c1;
	fetch c1
	into v_value;
	if c1%found
	then
		close c1;
	else
		close c1;
		v_value := NULL;
	end if;
	return v_value;
exception
	when	others
	then
		if c1%isopen
		then
			close c1;
		end if;
		return NULL;
end get_minor_table_fragmentation;

function get_major_table_fragmentation
return number
is
	v_value number;

	cursor c1 is
		select 	count(*)
		from	dba_segments
		where	segment_type = 'TABLE'
		and	extents > 30;
begin
	open c1;
	fetch c1
	into v_value;
	if c1%found
	then
		close c1;
	else
		close c1;
		v_value := NULL;
	end if;
	return v_value;
exception
	when	others
	then
		if c1%isopen
		then
			close c1;
		end if;
		return NULL;
end get_major_table_fragmentation;

function get_value( i_item in integer )
return number
is
begin
  if i_item = c_top10_disk_abuse
  then
    return get_top10_disk_abuse;
  elsif i_item = c_rollback_segment_balance
  then
    return get_rollback_segment_balance;
  elsif i_item = c_temporary_segment_balance
  then
    return get_temporary_segment_balance;
  elsif i_item = c_minor_table_fragmentation
  then
    return get_minor_table_fragmentation;
  elsif i_item = c_major_table_fragmentation
  then
    return get_major_table_fragmentation;
  else
    return null;
  end if;
end;

/* return either the (value of) keyword Name or Revision */
function version 
return varchar2
is
	v_keyword varchar2(100) := NULL;
	v_string v_keyword%type := NULL;
	v_result v_keyword%type := NULL;
begin
	for nr in 1..2
	loop
		if	nr = 1
		then
			v_keyword := 'Name';
			v_string := '$Name$';
		else
			v_keyword := 'Revision';
			v_string := '$Revision$';
		end if;

		v_result := replace( v_string, v_keyword, NULL ); /* remove keyword */
		/* remove ' ', '$' and ':' */
		v_result := rtrim( ltrim( v_result, ' $:' ), ' $' ); 

		if nr = 2 or length(v_result) > 0
		then
			exit;
		end if;
	end loop;

	return	v_result;
exception
	when	others
	then
		return	NULL;
end;

BEGIN
        NULL;
END;
/

