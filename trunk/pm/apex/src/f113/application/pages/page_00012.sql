prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(57939747380073169)
,p_name=>'Hit Ratio'
,p_step_title=>'Hit Ratio'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(30743052388382571)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'GERT.JAN.PAULISSEN@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20210528105839'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30968219549137920)
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
 p_id=>wwv_flow_api.id(61821858254305638)
,p_plug_name=>'Hit Ratio'
,p_region_name=>'data'
,p_parent_plug_id=>wwv_flow_api.id(30968219549137920)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30484878109923224)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with D as ',
' (select /*+ ORDERED */ ',
'         trunc( run.timestamp, :P12_FORMAT ) "Time" ',
'  ,      sum(sys."Logical Reads")            "Logical Reads" ',
'  ,      sum(sys."Physical Reads")           "Physical Reads" ',
'  ,      ( ( sum(sys."Logical Reads") ',
'           - sum(sys."Physical Reads") ) * 100.000 ) ',
'          / sum(sys."Logical Reads")         "Hit Ratio" ',
'  FROM PM_OWNER.pm_run run ',
'  , ( SELECT sys.db ',
'    , sys.run_id ',
'    , sum(decode(sys.NAME, ''consistent gets'', sys.VALUE, 0)) + sum(decode(sys.NAME',
'                         , ''db block gets'', sys.value, 0))      "Logical Reads"',
'   , sum(decode(sys.NAME, ''physical reads'', sys.VALUE, 0) )     "Physical Reads" ',
'   FROM PM_OWNER.pm_sysstat sys ',
'   WHERE sys.db = :p_db ',
'   GROUP BY sys.db , sys.run_id ) sys ',
' WHERE /* join conditions */',
'       sys.db     = run.db ',
' AND   sys.run_id = run.run_id ',
' AND   sys.RUN_ID BETWEEN :P12_LWB AND :P12_UPB /* non-join conditions */ ',
' GROUP BY trunc( run.TIMESTAMP, :P12_FORMAT) ',
' ORDER BY trunc( run.TIMESTAMP, :P12_FORMAT) ',
') ',
'SELECT ROWNUM nr ',
',      D.* ',
'FROM D',
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
 p_id=>wwv_flow_api.id(61822036103305640)
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
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_icon_view_columns_per_row=>1
,p_owner=>'PM'
,p_internal_uid=>33020105485040966
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61854849494608765)
,p_db_column_name=>'NR'
,p_display_order=>3
,p_column_identifier=>'F'
,p_column_label=>'Nr'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'NR'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61854941757608766)
,p_db_column_name=>'Time'
,p_display_order=>4
,p_column_identifier=>'G'
,p_column_label=>'Time'
,p_column_type=>'DATE'
,p_format_mask=>'dd-mm-yyyy HH24:MI:SS'
,p_tz_dependent=>'N'
,p_static_id=>'Time'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61847232318390728)
,p_db_column_name=>'Logical Reads'
,p_display_order=>5
,p_column_identifier=>'C'
,p_column_label=>'Logical Reads'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'Logical Reads'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61847350876390730)
,p_db_column_name=>'Physical Reads'
,p_display_order=>6
,p_column_identifier=>'D'
,p_column_label=>'Physical Reads'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'Physical Reads'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61847445104390730)
,p_db_column_name=>'Hit Ratio'
,p_display_order=>7
,p_column_identifier=>'E'
,p_column_label=>'Hit Ratio'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'Hit Ratio'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(61823157159305649)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'330213'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'Logical Reads:Physical Reads:Hit Ratio:NR:Time'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61821057042305631)
,p_plug_name=>'Filter'
,p_region_name=>'filter'
,p_parent_plug_id=>wwv_flow_api.id(30968219549137920)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30724600639263721)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(61821057042305631)
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
 p_id=>wwv_flow_api.id(61849049643426404)
,p_name=>'P12_FORMAT'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(61821057042305631)
,p_item_default=>'DDD'
,p_prompt=>'Hit ratio per'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:DAY;DDD,HOUR;HH24,MINUTE;MI'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30544502174923261)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attribute_01=>'3'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61821636123305638)
,p_name=>'P12_UPB'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(61821057042305631)
,p_prompt=>'Until'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIME_UPB'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   PM_OWNER.pm_run',
'where  pm_run.db = :P_DB',
'order by 1 desc'))
,p_lov_cascade_parent_items=>'P12_DB'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30544502174923261)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61821460232305638)
,p_name=>'P12_LWB'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(61821057042305631)
,p_prompt=>'From'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIME_LWB'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   PM_OWNER.pm_run',
'where  pm_run.db = :P_DB',
'order by 1 asc'))
,p_lov_cascade_parent_items=>'P12_DB'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30544502174923261)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61821243779305634)
,p_name=>'P12_DB'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(61821057042305631)
,p_prompt=>'Database'
,p_source=>'select coalesce (:P12_DB , :P_DB)  from dual;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DB'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct db d, db r',
'from   PM_OWNER.pm_run',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(30544502174923261)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'REDIRECT_SET_VALUE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(61823437601305654)
,p_computation_sequence=>20
,p_computation_item=>'P_DB'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>':P12_DB'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(29067403332829887)
,p_validation_name=>'LWB<=UPB'
,p_validation_sequence=>10
,p_validation=>':P12_LWB <= :P12_UPB'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'"From" must be before or equal to "Until"'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(61823555482305655)
,p_name=>'P_DB'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P12_DB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61823851716305657)
,p_event_id=>wwv_flow_api.id(61823555482305655)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P_DB := :P12_DB;'
,p_attribute_02=>'P12_DB'
,p_attribute_03=>'P_DB'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(31054245750738774)
,p_name=>'ApplyFilter'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(30724600639263721)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31054675562738775)
,p_event_id=>wwv_flow_api.id(31054245750738774)
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
