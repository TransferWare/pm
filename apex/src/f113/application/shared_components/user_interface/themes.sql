prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(1746483669658600)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(1649337369658530)
,p_default_dialog_template=>wwv_flow_api.id(1632874743658518)
,p_error_template=>wwv_flow_api.id(1634392400658520)
,p_printer_friendly_template=>wwv_flow_api.id(1649337369658530)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(1634392400658520)
,p_default_button_template=>wwv_flow_api.id(1743685395658589)
,p_default_region_template=>wwv_flow_api.id(1682947491658550)
,p_default_chart_template=>wwv_flow_api.id(1682947491658550)
,p_default_form_template=>wwv_flow_api.id(1682947491658550)
,p_default_reportr_template=>wwv_flow_api.id(1682947491658550)
,p_default_tabform_template=>wwv_flow_api.id(1682947491658550)
,p_default_wizard_template=>wwv_flow_api.id(1682947491658550)
,p_default_menur_template=>wwv_flow_api.id(1692394089658555)
,p_default_listr_template=>wwv_flow_api.id(1682947491658550)
,p_default_irr_template=>wwv_flow_api.id(1681037144658549)
,p_default_report_template=>wwv_flow_api.id(1709288405658567)
,p_default_label_template=>wwv_flow_api.id(1742571556658587)
,p_default_menu_template=>wwv_flow_api.id(1745065333658590)
,p_default_calendar_template=>wwv_flow_api.id(1745213344658592)
,p_default_list_template=>wwv_flow_api.id(1740690818658584)
,p_default_nav_list_template=>wwv_flow_api.id(1731518139658579)
,p_default_top_nav_list_temp=>wwv_flow_api.id(1731518139658579)
,p_default_side_nav_list_temp=>wwv_flow_api.id(1729887599658578)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(1666127035658544)
,p_default_dialogr_template=>wwv_flow_api.id(1655532047658538)
,p_default_option_label=>wwv_flow_api.id(1742571556658587)
,p_default_required_label=>wwv_flow_api.id(1742846354658587)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(1732690650658580)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.4/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(29137723354808488)
,p_theme_id=>26
,p_theme_name=>'Productivity Applications'
,p_theme_internal_name=>'PRODUCTIVITY_APPLICATIONS'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'T'
,p_nav_bar_type=>'NAVBAR'
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(29127925234808431)
,p_error_template=>wwv_flow_api.id(29127414735808428)
,p_printer_friendly_template=>wwv_flow_api.id(29128417539808432)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(29127026214808421)
,p_default_button_template=>wwv_flow_api.id(29136110274808470)
,p_default_region_template=>wwv_flow_api.id(29131407652808446)
,p_default_chart_template=>wwv_flow_api.id(29129814807808443)
,p_default_form_template=>wwv_flow_api.id(29130126378808443)
,p_default_reportr_template=>wwv_flow_api.id(29131407652808446)
,p_default_tabform_template=>wwv_flow_api.id(29131407652808446)
,p_default_wizard_template=>wwv_flow_api.id(29132224341808448)
,p_default_menur_template=>wwv_flow_api.id(29129413492808442)
,p_default_listr_template=>wwv_flow_api.id(29129711829808442)
,p_default_irr_template=>wwv_flow_api.id(29130511710808445)
,p_default_report_template=>wwv_flow_api.id(29133112367808456)
,p_default_label_template=>wwv_flow_api.id(29135704601808468)
,p_default_menu_template=>wwv_flow_api.id(29137124563808473)
,p_default_calendar_template=>wwv_flow_api.id(29137325103808476)
,p_default_list_template=>wwv_flow_api.id(29135230332808465)
,p_default_option_label=>wwv_flow_api.id(29135802139808468)
,p_default_required_label=>wwv_flow_api.id(29136007321808468)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(26),'')
,p_css_file_urls=>'#IMAGE_PREFIX#legacy_ui/css/5.0#MIN#.css?v=#APEX_VERSION#'
);
end;
/