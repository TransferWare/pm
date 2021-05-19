prompt --application/shared_components/user_interface/lovs/lov_time
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(29181421452963087)
,p_lov_name=>'LOV_TIME'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   PM_OWNER.pm_run',
'where  pm_run.db = :p_db',
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
