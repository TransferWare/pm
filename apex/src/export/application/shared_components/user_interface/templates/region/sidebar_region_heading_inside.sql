prompt --application/shared_components/user_interface/templates/region/sidebar_region_heading_inside
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(57933942557073122)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<section class="uRegion uWhiteRegion #REGION_CSS_CLASSES# clearfix" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="uRegionHeading">',
'    <h1>#TITLE#</h1>',
'    <span class="uButtonContainer">',
'      #CLOSE##PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#',
'    </span>',
'  </div>',
'  <div class="uRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'Sidebar Region - Heading Inside'
,p_internal_name=>'SIDEBAR_REGION_HEADING_INSIDE'
,p_plug_table_bgcolor=>'#f7f7e7'
,p_theme_id=>26
,p_theme_class_id=>3
,p_plug_heading_bgcolor=>'#f7f7e7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
end;
/
