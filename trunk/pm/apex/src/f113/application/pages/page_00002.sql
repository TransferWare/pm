prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(29137816761808495)
,p_name=>'Explain plan'
,p_step_title=>'Explain plan'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1941121770117897)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20210519055607'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33876716621759035)
,p_plug_name=>'Explain plan'
,p_region_name=>'Sql Statements'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1682947491658550)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH SRC AS ',
'( SELECT  ROWNUM AS NR',
'  ,       PLAN_TABLE_OUTPUT',
'  FROM    table(dbms_xplan.display_cursor(:p2_sql_id,null,''basic''))',
')   ',
'SELECT  PLAN_TABLE_OUTPUT',
'FROM    SRC',
'ORDER BY',
'        NR',
';',
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
 p_id=>wwv_flow_api.id(33876915342759042)
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
,p_owner=>'PM'
,p_internal_uid=>33876915342759042
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33880230467865484)
,p_db_column_name=>'PLAN_TABLE_OUTPUT'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Plan Table Output'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'PLAN_TABLE_OUTPUT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(33877625248759046)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'338777'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'PLAN_TABLE_OUTPUT:'
,p_sort_column_1=>'PLAN_TABLE_OUTPUT'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(33877820161759051)
,p_plug_name=>'Filter'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1682947491658550)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY_3'
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
 p_id=>wwv_flow_api.id(1903697904931279)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(33877820161759051)
,p_button_name=>'ApplyFilter'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(1743685395658589)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Filter'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33878004341759051)
,p_name=>'P2_DB'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(33877820161759051)
,p_prompt=>'Database'
,p_source=>'select coalesce (:P2_DB , :P_DB)  from dual;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DB'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct db d, db r',
'from   PM_OWNER.pm_run',
'order by 1'))
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(1742571556658587)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(33878222624759057)
,p_name=>'P2_SQL_ID'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(33877820161759051)
,p_prompt=>'Sql Id'
,p_source=>'P_SQL_ID'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV SQL ID'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dbms_lob.substr(t.sql_text, 197, 1) || ',
'       case ',
'         when dbms_lob.getlength(t.sql_text) > 200 ',
'         then ''...''',
'         when dbms_lob.getlength(t.sql_text) > 197 ',
'         then dbms_lob.substr(t.sql_text, 3, 197+1)',
'       end d',
',      t.sql_id r',
'from   pm_owner.pm_sql_id t',
'order by ',
'       1'))
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1742571556658587)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(33878511156759059)
,p_computation_sequence=>20
,p_computation_item=>'P_DB'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select coalesce (:P2_DB , :P_DB) from dual;'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(33879210625759063)
,p_name=>'P_DB'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2_DB'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(33879512430759063)
,p_event_id=>wwv_flow_api.id(33879210625759063)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P_DB := :P2_DB;'
,p_attribute_02=>'P2_DB'
,p_attribute_03=>'P_DB'
,p_attribute_04=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1904118682934286)
,p_name=>'ApplyFilter'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(1903697904931279)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1904430922934312)
,p_event_id=>wwv_flow_api.id(1904118682934286)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.page.submit({showWait: false})'
);
end;
/
