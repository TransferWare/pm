prompt --application/shared_components/user_interface/lovs/lov_db
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(57979537875188731)
,p_lov_name=>'LOV_DB'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct db d, db r',
'from   PM_OWNER.pm_run',
'order by 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
);
end;
/
