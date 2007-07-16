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
REMARK  Description:    Creates a procedure pm$get_rate which tries to determine
REMARK                  the disk and memory I/O rate (per second) for a site.
REMARK                  Defaults will be 50 for disk I/O rate and 500 for memory I/O rate.
REMARK
REMARK  Notes:          1) Must use SYS to run this script or have select privileges on v$sqlarea.
REMARK
REMARK

create or replace procedure pm$get_rate
( o_disk_io_rate out number, o_memory_io_rate out number )
is
        v_tot_dr        number;
        v_tot_mr        number;
        v_dr            number;
        v_mr            number;
        c_nr_tests      constant number := 1;

        procedure
        test( o_dr in out number, o_mr in out number )
        is
                v_tm1   number;
                v_bg1   number;
                v_dr1   number;
                v_tm2   number;
                v_bg2   number;
                v_dr2   number;
        
                cursor  c_sqlarea( i_sql_text in varchar2 )
                is
                        select  sqa.buffer_gets/sqa.executions
                        ,       sqa.disk_reads/sqa.executions
                        from    v$sqlarea sqa
                        where   upper(sqa.sql_text) like replace( upper(i_sql_text), ' ', '%' );
        
        
                        /* get a unique number */
                c_date  constant number := to_number(to_char( sysdate, 'HH24MISS' ));
        
                c_all_objects           varchar2(100) := 
                        'select count(*) from all_objects where ' || c_date || ' = ' || c_date;
        
                c_all_constraints       varchar2(100) := 
                        'select count(*) from all_constraints where ' || c_date || ' = ' || c_date;
        
                procedure       
                execute( i_sql_text in varchar2, o_time out number )
                is
                        v_cursor                number;
                        v_start                 number;
                        v_end                   number;
                        v_count                 number;
                        v_rows_processed        number;
                begin
                        -- prepare a cursor to select from 
                        v_cursor := dbms_sql.open_cursor;
                        dbms_sql.parse( v_cursor, i_sql_text, dbms_sql.native );
                        dbms_sql.define_column( v_cursor, 1, v_count );
        
                        v_start := dbms_utility.get_time;
        
                        v_rows_processed := dbms_sql.execute_and_fetch( v_cursor );
        
                        if v_rows_processed > 0 
                        then
                            -- get column values of the row
                            dbms_sql.column_value( v_cursor, 1, v_count );
                        end if;
        
                        v_end := dbms_utility.get_time;
                        o_time := v_end - v_start;
        
                        dbms_sql.close_cursor( v_cursor );
        
                exception
                        when    others 
                        then
                                if dbms_sql.is_open( v_cursor )
                                then
                                        dbms_sql.close_cursor( v_cursor );
                                end if;
                                raise;
                end;
        begin
                execute( c_all_objects, v_tm1 );
        
                open    c_sqlarea( c_all_objects );
                fetch   c_sqlarea
                into    v_bg1
                ,       v_dr1;
                close   c_sqlarea;
        
                execute( c_all_constraints, v_tm2 );
        
                open    c_sqlarea( c_all_constraints );
                fetch   c_sqlarea
                into    v_bg2
                ,       v_dr2;
                close   c_sqlarea;
        
                /*
                        DR = disk I/O ratio = seconds per disk read
                        MR = memory I/O ratio = seconds per buffer get
        
                        DR * v_dr1 + MR * v_bg1 = v_tm1 / 100
                        DR * v_dr2 + MR * v_bg2 = v_tm2 / 100
        
                        or ( buffer gets will not be zero )
        
                        MR = ( v_tm1 / 100 - DR * v_dr1 ) / v_bg1
                        MR = ( v_tm2 / 100 - DR * v_dr2 ) / v_bg2
        
                        or
        
                        ( v_tm1 / 100 - DR * v_dr1 ) = v_bg1 * ( v_tm2 / 100 - DR * v_dr2 ) / v_bg2
        
                        or
        
        
                        DR * v_dr1 = v_tm1 / 100 - v_bg1 * ( v_tm2 / 100 - DR * v_dr2 ) / v_bg2
        
                        or
        
                        DR * v_dr1 - v_bg1 * DR * v_dr2 / v_bg2 = v_tm1 / 100 - v_bg1 * ( v_tm2 / 100 ) / v_bg2
        
                        or
        
                        DR * ( v_dr1 - v_bg1 * v_dr2 / v_bg2 ) = v_tm1 / 100 - v_bg1 * ( v_tm2 / 100 ) / v_bg2
        
                        or
        
                        DR = ( v_tm1 / 100 - v_bg1 * ( v_tm2 / 100 ) / v_bg2 ) / ( v_dr1 - v_bg1 * v_dr2 / v_bg2 )
        
                */
        
                o_dr := ( v_tm1 / 100 - v_bg1 * ( v_tm2 / 100 ) / v_bg2 ) / ( v_dr1 - v_bg1 * v_dr2 / v_bg2 );
        
                o_mr := ( v_tm1 / 100 - o_dr * v_dr1 ) / v_bg1;

        end     test;
begin
        v_tot_dr := 0;
        v_tot_mr := 0;
        for     v_nr in 1..c_nr_tests
        loop
                test( v_dr, v_mr );

                        /* v_dr is in second per number, hence 1/v_dr is number per second */
                v_tot_dr := v_tot_dr + 1/v_dr; 
                v_tot_mr := v_tot_mr + 1/v_mr;
        end loop;

        v_tot_dr := round(v_tot_dr/c_nr_tests);
        v_tot_mr := round(v_tot_mr/c_nr_tests);

        if      v_tot_dr <= 0 
        or      v_tot_mr <= 0
        then
                o_disk_io_rate := 50;
                o_memory_io_rate := 500;
        else
                o_disk_io_rate := v_tot_dr;
                o_memory_io_rate := v_tot_mr;
        end if;
exception
        when    others
        then
                o_disk_io_rate := 50;
                o_memory_io_rate := 500;
end     pm$get_rate;
/


