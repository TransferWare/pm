prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(29890326631958274)
,p_name=>'P_DB'
,p_protection_level=>'I'
);
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(33780117881597982)
,p_name=>'P_SQL_ID'
,p_protection_level=>'I'
);
end;
/
