prompt --application/shared_components/user_interface/lovs/lov_time_lwb
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(29003586823953678)
,p_lov_name=>'LOV_TIME_LWB'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   PM_OWNER.pm_run',
'where  pm_run.db = :P_DB',
'order by 1 asc'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
);
end;
/
