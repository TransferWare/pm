prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'PM_OWNER')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Performance Monitor')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'F_113')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'53B16F2A605AD2965DE426A37ED205A90CED9B2E739837136F58405B3907FB71'
,p_bookmark_checksum_function=>'MD5'
,p_compatibility_mode=>'19.2'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(29138031775808496)
,p_populate_roles=>'A'
,p_application_tab_set=>0
,p_logo_type=>'T'
,p_logo_text=>'Performance Monitor'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Version 2021-05-19 12:02:00'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_deep_linking=>'Y'
,p_runtime_api_usage=>'T'
,p_security_scheme=>wwv_flow_api.id(1941121770117897)
,p_rejoin_existing_sessions=>'P'
,p_csv_encoding=>'Y'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20210519055648'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_ui_type_name => null
);
end;
/
