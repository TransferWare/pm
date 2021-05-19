prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(29137816761808495)
,p_name=>'Top I/O SQL'
,p_step_title=>'Top I/O SQL'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1941121770117897)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20210519053449'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29861820036231014)
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29862624311231017)
,p_plug_name=>'Top SQL io'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1682947491658550)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY_3'
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
',       null DT_2',
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
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(29862805046231019)
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
,p_internal_uid=>29862805046231019
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33882724458096194)
,p_db_column_name=>'DT'
,p_display_order=>4
,p_column_identifier=>'K'
,p_column_label=>'Explain Plan'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::P2_SQL_ID,P2_DB:#SQL_ID#,:P1_DB'
,p_column_linktext=>'Click'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
,p_static_id=>'DT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33889732375700302)
,p_db_column_name=>'DT_2'
,p_display_order=>5
,p_column_identifier=>'M'
,p_column_label=>'Source info'
,p_column_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::P13_SQL_ID,P13_DB:#SQL_ID#,:P1_DB'
,p_column_linktext=>'Click'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_tz_dependent=>'N'
,p_static_id=>'DT_2'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29863124534231031)
,p_db_column_name=>'EXECUTIONS'
,p_display_order=>6
,p_column_identifier=>'C'
,p_column_label=>'Executions'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'EXECUTIONS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29863213941231031)
,p_db_column_name=>'ROWS_PROCESSED'
,p_display_order=>7
,p_column_identifier=>'D'
,p_column_label=>'Rows Processed'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'ROWS_PROCESSED'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29863310968231033)
,p_db_column_name=>'LOADS'
,p_display_order=>8
,p_column_identifier=>'E'
,p_column_label=>'Loads'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'LOADS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29863414731231033)
,p_db_column_name=>'BUFFER_GETS'
,p_display_order=>9
,p_column_identifier=>'F'
,p_column_label=>'Buffer Gets'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'BUFFER_GETS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29863524194231033)
,p_db_column_name=>'DISK_READS'
,p_display_order=>10
,p_column_identifier=>'G'
,p_column_label=>'Disk Reads'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'DISK_READS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29863609033231033)
,p_db_column_name=>'ELAPSED_TIME'
,p_display_order=>11
,p_column_identifier=>'H'
,p_column_label=>'Elapsed Time'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'ELAPSED_TIME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29863729003231034)
,p_db_column_name=>'PERCENTAGE'
,p_display_order=>12
,p_column_identifier=>'I'
,p_column_label=>'Percentage'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'PERCENTAGE'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29863817658231034)
,p_db_column_name=>'SQL_TEXT'
,p_display_order=>13
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
,p_tz_dependent=>'N'
,p_static_id=>'SQL_TEXT'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(33883302184182534)
,p_db_column_name=>'SQL_ID'
,p_display_order=>14
,p_column_identifier=>'L'
,p_column_label=>'Sql Id'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'SQL_ID'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(29863922184231034)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'298640'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'DT:DT_2:SQL_ID:EXECUTIONS:ROWS_PROCESSED:LOADS:BUFFER_GETS:DISK_READS:ELAPSED_TIME:PERCENTAGE:SQL_TEXT:'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10895632910477857)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(29861820036231014)
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
 p_id=>wwv_flow_api.id(29862008145231016)
,p_name=>'P1_DB'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(29861820036231014)
,p_prompt=>'Database'
,p_source=>'select coalesce (:P1_DB , :P_DB)  from dual;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DB'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct db d, db r',
'from   PM_OWNER.pm_run',
'order by 1'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(1742571556658587)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29862211414231016)
,p_name=>'P1_LWB'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(29861820036231014)
,p_prompt=>'From'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIME'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   PM_OWNER.pm_run',
'where  pm_run.db = :p_db',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P1_DB'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1742571556658587)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29862429518231017)
,p_name=>'P1_UPB'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(29861820036231014)
,p_prompt=>'Until'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIME'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   PM_OWNER.pm_run',
'where  pm_run.db = :p_db',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P1_DB'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1742571556658587)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'I'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(29925023803824051)
,p_computation_sequence=>20
,p_computation_item=>'P_DB'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select coalesce (:P1_DB , :P_DB) from dual;'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29901918103235679)
,p_name=>'P_DB'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_DB'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29902214828235679)
,p_event_id=>wwv_flow_api.id(29901918103235679)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P_DB := :P1_DB;'
,p_attribute_02=>'P1_DB'
,p_attribute_03=>'P_DB'
,p_attribute_04=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10895565278477856)
,p_name=>'ApplyFilter'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10895632910477857)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10895423459477855)
,p_event_id=>wwv_flow_api.id(10895565278477856)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.page.submit({showWait: false})'
);
end;
/
