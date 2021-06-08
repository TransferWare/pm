prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(57939747380073169)
,p_name=>'Top I/O SQL'
,p_step_title=>'Top I/O SQL'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(30743052388382571)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'GERT.JAN.PAULISSEN@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20210528102520'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30967263370137910)
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
 p_id=>wwv_flow_api.id(58664554929495691)
,p_plug_name=>'Top SQL io'
,p_region_name=>'data'
,p_parent_plug_id=>wwv_flow_api.id(30967263370137910)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30484878109923224)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH d AS',
'( SELECT  /*+ ORDERED */',
'          sqltext.sql_id',
'  ,       sqlarea.executions ',
'  ,       sqlarea.rows_processed',
'  ,       sqlarea.loads',
'  ,       sqlarea.buffer_gets',
'  ,       sqlarea.disk_reads',
'  ,       sqlarea.elapsed_time',
'  ,       sum(sqlarea.elapsed_time) over () as tot_elapsed_time',
'  ,       sqltext.sql_text',
'  FROM    (       SELECT  /*+ ORDERED */',
'                          pm_sql.sql_id',
'                  ,       sum(pm_sqlarea.executions) as executions   ',
'                  ,       sum(pm_sqlarea.rows_processed) as rows_processed        ',
'                  ,       sum(pm_sqlarea.loads) as loads                               ',
'                  ,       sum(pm_sqlarea.buffer_gets) as buffer_gets                            ',
'                  ,       sum(pm_sqlarea.disk_reads) as disk_reads                          ',
'                  ,       sum(pm_sqlarea.elapsed_time) as elapsed_time                          ',
'                  FROM    pm_sqlarea',
'                  ,       pm_sql',
'                  WHERE   pm_sqlarea.db = :p1_db',
'                  AND     pm_sqlarea.db = pm_sql.db',
'                  AND     pm_sqlarea.hash_value = pm_sql.hash_value',
'                  AND     pm_sqlarea.address = pm_sql.address',
'                  AND     pm_sqlarea.run_id BETWEEN :p1_lwb AND :p1_upb',
'                  GROUP BY',
'                          pm_sql.sql_id',
'          ) sqlarea',
'          INNER JOIN pm_sql_id sqltext',
'          ON sqltext.sql_id = sqlarea.sql_id',
'  ORDER BY ',
'          elapsed_time desc',
'  ,       sqltext.sql_id',
')',
'SELECT  null DT',
',       d.sql_id',
',       d.executions ',
',       d.rows_processed',
',       d.loads',
',       d.buffer_gets',
',       d.disk_reads',
',       d.elapsed_time / 1000000 as elapsed_time',
',       case when d.tot_elapsed_time > 0 then ( 100 * d.elapsed_time ) / d.tot_elapsed_time end as percentage',
',       d.sql_text',
'FROM    d'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(58664735664495693)
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
,p_internal_uid=>29862805046231019
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61320368228059150)
,p_db_column_name=>'SQL_ID'
,p_display_order=>10
,p_column_identifier=>'L'
,p_column_label=>'Sql Id'
,p_column_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:13:P13_DB,P13_SQL_ID:&P1_DB.,#SQL_ID#'
,p_column_linktext=>'#SQL_ID#'
,p_column_type=>'STRING'
,p_static_id=>'SQL_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(61320945954145490)
,p_db_column_name=>'DT'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Explain Plan'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:2:P2_SQL_ID:#SQL_ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-view.png" class="apex-edit-view" alt="">'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_static_id=>'DT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58665055152495705)
,p_db_column_name=>'EXECUTIONS'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Executions'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_static_id=>'EXECUTIONS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58665144559495705)
,p_db_column_name=>'ROWS_PROCESSED'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Rows Processed'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_static_id=>'ROWS_PROCESSED'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58665241586495707)
,p_db_column_name=>'LOADS'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Loads'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_static_id=>'LOADS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58665345349495707)
,p_db_column_name=>'BUFFER_GETS'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Buffer Gets'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_static_id=>'BUFFER_GETS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58665454812495707)
,p_db_column_name=>'DISK_READS'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Disk Reads'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_static_id=>'DISK_READS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58665539651495707)
,p_db_column_name=>'ELAPSED_TIME'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Elapsed Time'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_static_id=>'ELAPSED_TIME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58665659621495708)
,p_db_column_name=>'PERCENTAGE'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Percentage'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_static_id=>'PERCENTAGE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58665748276495708)
,p_db_column_name=>'SQL_TEXT'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Sql Text'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_static_id=>'SQL_TEXT'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(58665852802495708)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'298640'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'SQL_ID:DT:EXECUTIONS:ROWS_PROCESSED:LOADS:BUFFER_GETS:DISK_READS:ELAPSED_TIME:PERCENTAGE:SQL_TEXT:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(58663750654495688)
,p_plug_name=>'Filter'
,p_region_name=>'filter'
,p_parent_plug_id=>wwv_flow_api.id(30967263370137910)
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
 p_id=>wwv_flow_api.id(29017418418247468)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(58663750654495688)
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
 p_id=>wwv_flow_api.id(58664360136495691)
,p_name=>'P1_UPB'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(58663750654495688)
,p_prompt=>'Until'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIME_UPB'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   PM_OWNER.pm_run',
'where  pm_run.db = :P_DB',
'order by 1 desc'))
,p_lov_cascade_parent_items=>'P1_DB'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(30544502174923261)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_protection_level=>'I'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(58664142032495690)
,p_name=>'P1_LWB'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(58663750654495688)
,p_prompt=>'From'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIME_LWB'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   PM_OWNER.pm_run',
'where  pm_run.db = :P_DB',
'order by 1 asc'))
,p_lov_cascade_parent_items=>'P1_DB'
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
 p_id=>wwv_flow_api.id(58663938763495690)
,p_name=>'P1_DB'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(58663750654495688)
,p_prompt=>'Database'
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
 p_id=>wwv_flow_api.id(28995540180918204)
,p_computation_sequence=>10
,p_computation_item=>'P_DB'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>':P1_DB'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(28996776988918216)
,p_validation_name=>'LWB<=UPB'
,p_validation_sequence=>10
,p_validation=>':P12_LWB <= :P12_UPB'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'"From" must be before or equal to "Until"'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(28995395986918202)
,p_name=>'P_DB'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_DB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(28995406356918203)
,p_event_id=>wwv_flow_api.id(28995395986918202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P_DB := :P1_DB;'
,p_attribute_02=>'P1_DB'
,p_attribute_03=>'P_DB'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30967036611137908)
,p_name=>'ApplyFilter'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(29017418418247468)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30967174906137909)
,p_event_id=>wwv_flow_api.id(30967036611137908)
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
