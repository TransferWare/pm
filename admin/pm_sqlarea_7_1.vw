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
REM $Header$

create or replace view pm$sqlarea
(
        first_load_time
,       hash_value
,       address
,       parsing_user_name
,       parsing_schema_name
,       executions
,       buffer_gets
,       disk_reads
,       parse_calls
,       sorts
,       kept_versions
,       loads
,       rows_processed
,       invalidations
,       module
,       action
,       sql_text
,       command_type
)
as
        select  /*+ RULE */
                to_date
                (
                        sql.first_load_time
                ,       'YYYY-MM-DD/HH24:MI:SS'
                )               first_load_time
        ,       sql.hash_value
        ,       rawtohex(sql.address)
        ,       usr.username
        ,       sch.username
        ,       sql.executions
        ,       sql.buffer_gets
        ,       sql.disk_reads
        ,       sql.parse_calls
        ,       sql.sorts
        ,       sql.kept_versions
        ,       sql.loads
        ,       0
        ,       sql.invalidations
        ,       to_char(NULL)
        ,       to_char(NULL)
        ,       sql.sql_text
        ,       sql.command_type
        from    v$sqlarea sql
        ,       all_users usr
        ,       all_users sch
        where   usr.user_id = sql.parsing_user_id
        and     sch.user_id = sql.parsing_schema_id
/

