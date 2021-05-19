prompt --application/shared_components/user_interface/templates/button/button
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(29136110274808470)
,p_template_name=>'Button'
,p_internal_name=>'BUTTON'
,p_template=>'<a href="#LINK#" class="uButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
,p_hot_template=>'<a href="#LINK#" class="uButton uHotButton #BUTTON_CSS_CLASSES#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES# role="button"><span>#LABEL#</span></a> '
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>26
);
end;
/
