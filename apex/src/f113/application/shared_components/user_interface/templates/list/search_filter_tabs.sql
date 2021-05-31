prompt --application/shared_components/user_interface/templates/list/search_filter_tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(57936541324073138)
,p_list_template_current=>'<li class="active"><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li><a href="#LINK#">#TEXT#</a></li>'
,p_list_template_name=>'Search Filter Tabs'
,p_internal_name=>'SEARCH_FILTER_TABS'
,p_theme_id=>26
,p_theme_class_id=>19
,p_list_template_before_rows=>'<ul class="ebaViewTabs">'
,p_list_template_after_rows=>'</ul>'
);
end;
/
