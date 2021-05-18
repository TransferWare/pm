prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(29137816761808495)
,p_tab_set=>'TS1'
,p_name=>'Source info'
,p_step_title=>'Source info'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'GPA'
,p_last_upd_yyyymmddhh24miss=>'20170512130952'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33749613233895254)
,p_plug_name=>'Filter'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29131407652808446)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY_3'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33750611661895274)
,p_plug_name=>'Source info'
,p_region_name=>'Sql Statements'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29130511710808445)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with D as ',
' (select  /* $Header$ */',
'        distinct',
'        pm_sql.sql_id',
' ,	pm_sqlarea.module',
' ,	pm_sqlarea.action',
' ,	pm_sqlarea.parsing_user_name',
' ,	pm_sqlarea.parsing_schema_name',
' FROM	XXYSS_ADMIN.pm_sql',
' ,	    XXYSS_ADMIN.pm_sqlarea',
' WHERE	pm_sql.db = :p_db',
' and	pm_sqlarea.db = pm_sql.db',
' and	pm_sqlarea.hash_value = pm_sql.hash_value',
' AND	pm_sqlarea.address = pm_sql.address',
' and	(pm_sql.sql_id = :P13_SQL_ID',
'        or :P13_SQL_ID is null)',
') ',
'SELECT ROWNUM nr ',
',      D.* ',
'FROM D',
''))
,p_plug_source_type=>'NATIVE_IR'
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
 p_id=>wwv_flow_api.id(33750809612895276)
,p_name=>'Top SQL'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_LEFT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'N'
,p_show_pivot=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'PM'
,p_internal_uid=>33750809612895276
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33751206909895284)
,p_db_column_name=>'NR'
,p_display_order=>3
,p_column_identifier=>'F'
,p_column_label=>'Nr'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'NR'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33754409355948600)
,p_db_column_name=>'MODULE'
,p_display_order=>4
,p_column_identifier=>'G'
,p_column_label=>'Module'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
,p_static_id=>'MODULE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33754511460948602)
,p_db_column_name=>'ACTION'
,p_display_order=>5
,p_column_identifier=>'H'
,p_column_label=>'Action'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
,p_static_id=>'ACTION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33754629444948602)
,p_db_column_name=>'PARSING_USER_NAME'
,p_display_order=>6
,p_column_identifier=>'I'
,p_column_label=>'Parsing User Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
,p_static_id=>'PARSING_USER_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33754712311948602)
,p_db_column_name=>'PARSING_SCHEMA_NAME'
,p_display_order=>7
,p_column_identifier=>'J'
,p_column_label=>'Parsing Schema Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
,p_static_id=>'PARSING_SCHEMA_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33782323020641157)
,p_db_column_name=>'SQL_ID'
,p_display_order=>8
,p_column_identifier=>'K'
,p_column_label=>'Sql Id'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_static_id=>'SQL_ID'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(33751432417895284)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'337515'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'NR:SQL_ID:MODULE:ACTION:PARSING_USER_NAME:PARSING_SCHEMA_NAME:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33749829317895255)
,p_name=>'P13_DB'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(33749613233895254)
,p_prompt=>'Database'
,p_source=>'select coalesce (:P13_DB , :P_DB)  from dual;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DB'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct db d, db r',
'from   XXYSS_ADMIN.pm_run',
'order by 1'))
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(29135704601808468)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33799118742129314)
,p_name=>'P13_SQL_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(33749613233895254)
,p_prompt=>'Sql Id'
,p_source=>'P_SQL_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(29135704601808468)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(33751702171895288)
,p_computation_sequence=>20
,p_computation_item=>'P_DB'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select coalesce (:P13_DB , :P_DB) from dual;'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33751830796895293)
,p_name=>'P_DB'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P13_DB'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33752112513895296)
,p_event_id=>wwv_flow_api.id(33751830796895293)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P_DB := :P13_DB;'
,p_attribute_02=>'P13_DB'
,p_attribute_03=>'P_DB'
,p_attribute_04=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33799516643193973)
,p_name=>'P_SQL_ID'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P13_SQL_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33812606682909894)
,p_event_id=>wwv_flow_api.id(33799516643193973)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33803330584412537)
,p_event_id=>wwv_flow_api.id(33799516643193973)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P_SQL_ID := :P13_SQl_ID;'
,p_attribute_02=>'P13_SQL_ID'
,p_attribute_03=>'P_SQL_ID'
,p_attribute_04=>'N'
,p_wait_for_result=>'Y'
);
end;
/
