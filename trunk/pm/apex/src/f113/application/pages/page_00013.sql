prompt --application/pages/page_00013
begin
wwv_flow_api.create_page(
 p_id=>13
,p_user_interface_id=>wwv_flow_api.id(57939747380073169)
,p_name=>'Source info'
,p_step_title=>'Source info'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(30743052388382571)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'GERT.JAN.PAULISSEN@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20210528110034'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30968360287137921)
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
 p_id=>wwv_flow_api.id(61454057178346430)
,p_plug_name=>'Filter'
,p_region_name=>'filter'
,p_parent_plug_id=>wwv_flow_api.id(30968360287137921)
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
 p_id=>wwv_flow_api.id(61453058750346410)
,p_plug_name=>'Source info'
,p_region_name=>'data'
,p_parent_plug_id=>wwv_flow_api.id(30968360287137921)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30484878109923224)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with D as ',
'( select  distinct',
'          pm_sql.sql_id',
'  ,       pm_sqlarea.module',
'  ,       pm_sqlarea.action',
'  ,       pm_sqlarea.parsing_user_name',
'  ,       pm_sqlarea.parsing_schema_name',
'  FROM    PM_OWNER.pm_sql',
'  ,       PM_OWNER.pm_sqlarea',
'  WHERE   pm_sql.db = :p13_db',
'  and     pm_sqlarea.db = pm_sql.db',
'  and     pm_sqlarea.hash_value = pm_sql.hash_value',
'  AND     pm_sqlarea.address = pm_sql.address',
'  and     ( pm_sql.sql_id = :P13_SQL_ID or :P13_SQL_ID is null )',
') ',
'SELECT  ROWNUM nr ',
',       D.* ',
'FROM    D',
'ORDER BY',
'        nr'))
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
 p_id=>wwv_flow_api.id(61452860799346408)
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
,p_internal_uid=>33750809612895276
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61452463502346400)
,p_db_column_name=>'NR'
,p_display_order=>3
,p_column_identifier=>'F'
,p_column_label=>'Nr'
,p_column_type=>'NUMBER'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'NR'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61421347391600527)
,p_db_column_name=>'SQL_ID'
,p_display_order=>13
,p_column_identifier=>'K'
,p_column_label=>'Sql Id'
,p_column_type=>'STRING'
,p_static_id=>'SQL_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61449261056293084)
,p_db_column_name=>'MODULE'
,p_display_order=>23
,p_column_identifier=>'G'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_static_id=>'MODULE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61449158951293082)
,p_db_column_name=>'ACTION'
,p_display_order=>33
,p_column_identifier=>'H'
,p_column_label=>'Action'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_static_id=>'ACTION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61449040967293082)
,p_db_column_name=>'PARSING_USER_NAME'
,p_display_order=>43
,p_column_identifier=>'I'
,p_column_label=>'Parsing User Name'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_static_id=>'PARSING_USER_NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61448958100293082)
,p_db_column_name=>'PARSING_SCHEMA_NAME'
,p_display_order=>53
,p_column_identifier=>'J'
,p_column_label=>'Parsing Schema Name'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_static_id=>'PARSING_SCHEMA_NAME'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(61452237994346400)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'337515'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'NR:SQL_ID:MODULE:ACTION:PARSING_USER_NAME:PARSING_SCHEMA_NAME:'
,p_sort_column_1=>'NR'
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30727515768267934)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(61454057178346430)
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
 p_id=>wwv_flow_api.id(61404551670112370)
,p_name=>'P13_SQL_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(61454057178346430)
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
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- all --'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30544502174923261)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29074323539891096)
,p_name=>'P13_DB'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(61454057178346430)
,p_prompt=>'Database'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DB'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct db d, db r',
'from   PM_OWNER.pm_run',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(30544502174923261)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'REDIRECT_SET_VALUE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(29074530559894688)
,p_computation_sequence=>20
,p_computation_item=>'P_DB'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>':P13_DB'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(61451839615346391)
,p_name=>'P_DB'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P13_DB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61451557898346388)
,p_event_id=>wwv_flow_api.id(61451839615346391)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P_DB := :P13_DB;'
,p_attribute_02=>'P13_DB'
,p_attribute_03=>'P_DB'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(61404153769047711)
,p_name=>'P_SQL_ID'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P13_SQL_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61400339827829147)
,p_event_id=>wwv_flow_api.id(61404153769047711)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P_SQL_ID := :P13_SQl_ID;'
,p_attribute_02=>'P13_SQL_ID'
,p_attribute_03=>'P_SQL_ID'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(31055088881739762)
,p_name=>'ApplyFilter'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(30727515768267934)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31055471000739762)
,p_event_id=>wwv_flow_api.id(31055088881739762)
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
