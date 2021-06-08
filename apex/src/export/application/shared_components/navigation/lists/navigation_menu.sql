prompt --application/shared_components/navigation/lists/navigation_menu
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(30567784443933307)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(30567895305933310)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Top I/O SQL'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_api.id(30743052388382571)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1,'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(30567974345933312)
,p_list_item_display_sequence=>2
,p_list_item_link_text=>'Explain plan'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_api.id(30743052388382571)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2,'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(30568119869933312)
,p_list_item_display_sequence=>3
,p_list_item_link_text=>'Top wait events'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_api.id(30743052388382571)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5,'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(30568167778933313)
,p_list_item_display_sequence=>4
,p_list_item_link_text=>'Search for SQL statements'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_api.id(30743052388382571)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'6,'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(30568293189933313)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'Resource usage per user'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_api.id(30743052388382571)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'7,'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(30568386195933313)
,p_list_item_display_sequence=>6
,p_list_item_link_text=>'System statistics'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_api.id(30743052388382571)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'8,'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(30568490732933313)
,p_list_item_display_sequence=>7
,p_list_item_link_text=>'Slow SQL'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_api.id(30743052388382571)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'10,'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(30568584242933313)
,p_list_item_display_sequence=>8
,p_list_item_link_text=>'Similar SQL'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_api.id(30743052388382571)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'11,'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(30568679660933313)
,p_list_item_display_sequence=>9
,p_list_item_link_text=>'Hit Ratio'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_api.id(30743052388382571)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'12,'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(30568763130933313)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Source info'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_api.id(30743052388382571)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'13,'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(30778704000382704)
,p_list_item_display_sequence=>10000
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=&APP_ID.:10000:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user-wrench'
,p_security_scheme=>wwv_flow_api.id(30742385447382569)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'10000'
);
end;
/
