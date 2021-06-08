prompt --application/pages/page_00006
begin
wwv_flow_api.create_page(
 p_id=>6
,p_user_interface_id=>wwv_flow_api.id(57939747380073169)
,p_name=>'Search for SQL statements'
,p_step_title=>'Search for SQL statements'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(30743052388382571)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'GERT.JAN.PAULISSEN@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20210528110254'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30967755558137915)
,p_plug_name=>'Region Display'
,p_region_name=>'region_display'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(30491670402923228)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY_3'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61419356399555386)
,p_plug_name=>'Filter'
,p_region_name=>'filter'
,p_parent_plug_id=>wwv_flow_api.id(30967755558137915)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30484878109923224)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61418342495555385)
,p_plug_name=>'Search for SQL statements'
,p_region_name=>'data'
,p_parent_plug_id=>wwv_flow_api.id(30967755558137915)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30484878109923224)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''E''',
',       ''S''',
',  pm_sql_id.sql_id',
',  pm_sql_id.sql_text',
'FROM pm_owner.pm_sql_id',
',  pm_owner.pm_sql',
'WHERE   pm_sql.db = :p6_db',
'AND  pm_sql.sql_id = pm_sql_id.sql_id',
'AND  INSTR',
' ( ',
'   replace(:p6_type,'':'')',
' , DECODE',
'   ( ',
'     pm_sql_id.command_type',
'   , 2 /* Insert */',
'   , ''I''',
'   , 3 /* Select */',
'   , ''S''',
'   , 6 /* Update */',
'   , ''U''',
'   , 7 /* Delete */',
'   , ''D''',
'   , ''X''   ',
'   )',
' ) > 0',
'ORDER BY ',
'        pm_sql_id.sql_id',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_output_show_link=>'Y'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(61418158821555385)
,p_name=>'Top SQL'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'PM'
,p_internal_uid=>33785511590686299
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61414659666351732)
,p_db_column_name=>'SQL_ID'
,p_display_order=>4
,p_column_identifier=>'G'
,p_column_label=>'Sql Id'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'SQL_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61414570040351732)
,p_db_column_name=>'SQL_TEXT'
,p_display_order=>5
,p_column_identifier=>'H'
,p_column_label=>'Sql Text'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_tz_dependent=>'N'
,p_static_id=>'SQL_TEXT'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61307837798040070)
,p_db_column_name=>'''E'''
,p_display_order=>6
,p_column_identifier=>'I'
,p_column_label=>'Explain Plan'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::P2_SQL_ID:#SQL_ID#'
,p_column_linktext=>'Click'
,p_column_type=>'STRING'
,p_static_id=>'''E'''
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61307751276040070)
,p_db_column_name=>'''S'''
,p_display_order=>7
,p_column_identifier=>'J'
,p_column_label=>'Source info'
,p_column_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::P13_SQL_ID,P13_DB:#SQL_ID#,:P6_DB'
,p_column_linktext=>'Click'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
,p_static_id=>'''S'''
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(61417544405555385)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'337862'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'''E'':''S'':SQL_ID:SQL_TEXT:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30711595770221763)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(61419356399555386)
,p_button_name=>'ApplyFilter'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(30545616013923263)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Filter'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61419158234555386)
,p_name=>'P6_DB'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(61419356399555386)
,p_prompt=>'Database'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DB'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct db d, db r',
'from   PM_OWNER.pm_run',
'order by 1'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(30544502174923261)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'REDIRECT_SET_VALUE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61418566007555385)
,p_name=>'P6_TYPE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(61419356399555386)
,p_item_default=>'S'
,p_prompt=>'Command type'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:INSERT;I,SELECT;S,UPDATE;U,DELETE;D'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30544502174923261)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(28997060499918219)
,p_computation_sequence=>10
,p_computation_item=>'P_DB'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>':P6_DB'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(56134258818102312)
,p_name=>'P_DB'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P6_DB'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(56133957236102312)
,p_event_id=>wwv_flow_api.id(56134258818102312)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P_DB := :P6_DB;'
,p_attribute_02=>'P6_DB'
,p_attribute_03=>'P_DB'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(31027370733599086)
,p_name=>'ApplyFilter'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(30711595770221763)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31027718614599086)
,p_event_id=>wwv_flow_api.id(31027370733599086)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'oracleTools.setActiveTab(''region_display'', ''data'')',
'// the submit will switch to the new region due to the cached region',
'apex.page.submit({showWait: false})'))
);
end;
/
