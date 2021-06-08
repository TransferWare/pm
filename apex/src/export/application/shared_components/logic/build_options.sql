prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(30741537258382512)
,p_build_option_name=>'Feature: Access Control'
,p_build_option_status=>'EXCLUDE'
,p_feature_identifier=>'APPLICATION_ACCESS_CONTROL'
,p_build_option_comment=>'Incorporate role based user authentication within your application and manage username mappings to application roles.'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(28958056233082681)
,p_build_option_name=>'USE_APEX_GROUPS'
,p_build_option_status=>'INCLUDE'
,p_build_option_comment=>'Do we use standard Apex users and groups for authorization?'
);
end;
/
