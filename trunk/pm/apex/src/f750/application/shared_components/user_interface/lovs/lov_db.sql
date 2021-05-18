prompt --application/shared_components/user_interface/lovs/lov_db
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(29177607256924057)
,p_lov_name=>'LOV_DB'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct db d, db r',
'from   XXYSS_ADMIN.pm_run',
'order by 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
);
end;
/
