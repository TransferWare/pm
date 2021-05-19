prompt --application/shared_components/user_interface/lovs/lov_sql_id
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(39081008449313321)
,p_lov_name=>'LOV SQL ID'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dbms_lob.substr(t.sql_text, 197, 1) || ',
'       case ',
'         when dbms_lob.getlength(t.sql_text) > 200 ',
'         then ''...''',
'         when dbms_lob.getlength(t.sql_text) > 197 ',
'         then dbms_lob.substr(t.sql_text, 3, 197+1)',
'       end d',
',      t.sql_id r',
'from   pm_owner.pm_sql_id t',
'order by ',
'       1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
);
wwv_flow_api.create_list_of_values_cols(
 p_id=>wwv_flow_api.id(1934114071055776)
,p_query_column_name=>'R'
,p_heading=>'Sql Id'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_api.create_list_of_values_cols(
 p_id=>wwv_flow_api.id(1934483127055787)
,p_query_column_name=>'D'
,p_heading=>'Statement'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
end;
/
