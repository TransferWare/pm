prompt --application/shared_components/security/authorizations/contribution_rights
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(1940754997117896)
,p_name=>'Contribution Rights'
,p_scheme_type=>'NATIVE_IS_IN_GROUP'
,p_attribute_01=>'Administrator,Contributor'
,p_attribute_02=>'A'
,p_error_message=>'Insufficient privileges, user is not a Contributor'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
