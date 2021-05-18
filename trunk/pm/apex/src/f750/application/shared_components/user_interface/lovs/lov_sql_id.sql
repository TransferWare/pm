prompt --application/shared_components/user_interface/lovs/lov_sql_id
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(39081008449313321)
,p_lov_name=>'LOV SQL ID'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dbms_lob.substr(t.sql_text, 97, 1) || ',
'       case ',
'         when dbms_lob.getlength(t.sql_text) > 100 ',
'         then ''...''',
'         when dbms_lob.getlength(t.sql_text) > 97 ',
'         then dbms_lob.substr(t.sql_text, 3, 97+1)',
'       end d',
',      t.sql_id r',
'from   xxyss_admin.pm_sql_id t',
'order by ',
'       1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
);
end;
/
