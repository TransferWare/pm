prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(29139130601808510)
,p_name=>' Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(1977650024118034)
,p_short_name=>'Administration'
,p_link=>'f?p=&APP_ID.:10000:&SESSION.'
,p_page_id=>10000
);
end;
/
