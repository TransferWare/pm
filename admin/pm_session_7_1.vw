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
CREATE OR REPLACE VIEW pm$session
( 
        sid
,       username
,       program
,       sql_hash_value
,       sql_address
)
AS 
        SELECT  s.sid
        ,       decode( s.username, NULL, 'ORACLE', s.username )
        ,       s.program
        ,       decode( s.sql_hash_value, 0, NULL, s.sql_hash_value )
        ,       decode( rawtohex(s.sql_address), '00', NULL, rawtohex(s.sql_address) )
        FROM    v$session s
/

