prompt --application/pages/page_00010
begin
wwv_flow_api.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_api.id(29137816761808495)
,p_tab_set=>'TS1'
,p_name=>'Slow SQL'
,p_step_title=>'Slow SQL'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'GPA'
,p_last_upd_yyyymmddhh24miss=>'20170512125237'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30003702543410728)
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
 p_id=>wwv_flow_api.id(30004525945410732)
,p_plug_name=>'Slow SQL'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29130511710808445)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  /* $Header$ */',
'        /*+ ORDERED */',
'        null E',
',       null S',
',	sql_id.sql_id',
',	sqlarea.executions ',
',	(sqlarea.elapsed_time / 1000000) as elapsed_time',
',	(sqlarea.elapsed_time / 1000000 / sqlarea.executions) as avg_elapsed_time',
',	sqlarea.disk_reads ',
',	sqlarea.avg_disk_reads ',
',	sqlarea.buffer_gets',
',	sqlarea.avg_buffer_gets',
',	sql_id.sql_text',
'FROM	(',
'		SELECT	/*+ ORDERED */',
'			pm_sql.sql_id',
'		,	sum(pm_sqlarea.executions)		executions',
'		,	sum(pm_sqlarea.disk_reads)		disk_reads',
'		,	sum(pm_sqlarea.disk_reads)',
'			/ decode(sum(pm_sqlarea.executions), 0, 1, sum(pm_sqlarea.executions))',
'								avg_disk_reads',
'		,	sum(pm_sqlarea.buffer_gets)		buffer_gets',
'		,	sum(pm_sqlarea.buffer_gets)',
'			/ decode(sum(pm_sqlarea.executions), 0, 1, sum(pm_sqlarea.executions))',
'								avg_buffer_gets',
'		,	SUM(PM_SQLAREA.ELAPSED_TIME)		ELAPSED_TIME',
'		from	XXYSS_ADMIN.PM_SQLAREA',
'		,	XXYSS_ADMIN.PM_SQL',
'		WHERE	pm_sqlarea.db = :p_db',
'		AND	pm_sqlarea.db = pm_sql.db',
'		AND	pm_sqlarea.hash_value = pm_sql.hash_value',
'		and	PM_SQLAREA.ADDRESS = PM_SQL.ADDRESS',
'		AND	pm_sqlarea.run_id BETWEEN :p10_lwb AND :p10_upb',
'		GROUP BY',
'			pm_sql.sql_id',
'		HAVING	sum(pm_sqlarea.executions) > 0',
'	)		SQLAREA',
',	XXYSS_ADMIN.pm_sql_id 	sql_id',
'where	SQLAREA.SQL_ID = SQL_ID.SQL_ID',
'AND	(sqlarea.elapsed_time / 1000000 / sqlarea.executions) >= nvl(:p10_min_avg_elapsed_time, 0)',
'ORDER BY AVG_ELAPSED_TIME desc',
';'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(30004721476410732)
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
,p_internal_uid=>30004721476410732
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33896506470274482)
,p_db_column_name=>'E'
,p_display_order=>3
,p_column_identifier=>'L'
,p_column_label=>'Explain Plan'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::P2_SQL_ID,P2_DB:#SQL_ID#,:P10_DB'
,p_column_linktext=>'Click'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
,p_static_id=>'E'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33896600296274482)
,p_db_column_name=>'S'
,p_display_order=>4
,p_column_identifier=>'M'
,p_column_label=>'Source info'
,p_column_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::P13_SQL_ID,P13_DB:#SQL_ID#,:P10_DB'
,p_column_linktext=>'Click'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
,p_static_id=>'S'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(30006127920413333)
,p_db_column_name=>'SQL_ID'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Sql Id'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'SQL_ID'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(30005019013410734)
,p_db_column_name=>'DISK_READS'
,p_display_order=>6
,p_column_identifier=>'C'
,p_column_label=>'Disk Reads'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'DISK_READS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(30005116157410734)
,p_db_column_name=>'BUFFER_GETS'
,p_display_order=>7
,p_column_identifier=>'D'
,p_column_label=>'Buffer Gets'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'BUFFER_GETS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(30006231055413333)
,p_db_column_name=>'EXECUTIONS'
,p_display_order=>8
,p_column_identifier=>'F'
,p_column_label=>'Executions'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'EXECUTIONS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(30006311986413333)
,p_db_column_name=>'ELAPSED_TIME'
,p_display_order=>9
,p_column_identifier=>'G'
,p_column_label=>'Elapsed Time'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'ELAPSED_TIME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(30006405127413333)
,p_db_column_name=>'AVG_ELAPSED_TIME'
,p_display_order=>10
,p_column_identifier=>'H'
,p_column_label=>'Avg Elapsed Time'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'AVG_ELAPSED_TIME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(30006515600413333)
,p_db_column_name=>'AVG_DISK_READS'
,p_display_order=>11
,p_column_identifier=>'I'
,p_column_label=>'Avg Disk Reads'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'AVG_DISK_READS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(30006619511413334)
,p_db_column_name=>'AVG_BUFFER_GETS'
,p_display_order=>12
,p_column_identifier=>'J'
,p_column_label=>'Avg Buffer Gets'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'AVG_BUFFER_GETS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(30006731004413334)
,p_db_column_name=>'SQL_TEXT'
,p_display_order=>13
,p_column_identifier=>'K'
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
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(30005225653410735)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'300053'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'E:S:SQL_ID:DISK_READS:BUFFER_GETS:EXECUTIONS:ELAPSED_TIME:AVG_ELAPSED_TIME:AVG_DISK_READS:AVG_BUFFER_GETS:SQL_TEXT:'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(30003926778410729)
,p_name=>'P10_DB'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(30003702543410728)
,p_prompt=>'Database'
,p_source=>'select coalesce (:P10_DB , :P_DB)  from dual;'
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
 p_id=>wwv_flow_api.id(30004130411410731)
,p_name=>'P10_LWB'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(30003702543410728)
,p_prompt=>'From'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIME'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   XXYSS_ADMIN.pm_run',
'where  pm_run.db = :p_db',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P10_DB'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_api.id(30004327223410731)
,p_name=>'P10_UPB'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(30003702543410728)
,p_prompt=>'Until'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIME'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   XXYSS_ADMIN.pm_run',
'where  pm_run.db = :p_db',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P10_DB'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(29135704601808468)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(39085203304543627)
,p_name=>'P10_MIN_AVG_ELAPSED_TIME'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(30003702543410728)
,p_prompt=>'Minimum Average Elapsed Time'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(29135704601808468)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(30005530117410739)
,p_computation_sequence=>20
,p_computation_item=>'P_DB'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select coalesce (:P10_DB , :P_DB) from dual;'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30005615781410740)
,p_name=>'P_DB'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_DB'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30005923360410740)
,p_event_id=>wwv_flow_api.id(30005615781410740)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P_DB := :P10_DB;'
,p_attribute_02=>'P10_DB'
,p_attribute_03=>'P_DB'
,p_attribute_04=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(39085905585553968)
,p_name=>'DA_REFRESH'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_DB,P10_LWB,P10_UPB,P10_MIN_AVG_ELAPSED_TIME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(39086227488553969)
,p_event_id=>wwv_flow_api.id(39085905585553968)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
end;
/
