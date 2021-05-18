prompt --application/shared_components/user_interface/templates/region/interactive_report_region
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(29130511710808445)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<section class="uIRRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">',
'  <h1 class="visuallyhidden">#TITLE#</h1>',
'  #BODY#',
'</section>'))
,p_page_plug_template_name=>'Interactive Report Region'
,p_internal_name=>'INTERACTIVE_REPORT_REGION'
,p_theme_id=>26
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
