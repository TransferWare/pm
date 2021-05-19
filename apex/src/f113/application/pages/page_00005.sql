prompt --application/pages/page_00005
begin
wwv_flow_api.create_page(
 p_id=>5
,p_user_interface_id=>wwv_flow_api.id(29137816761808495)
,p_name=>'Top wait events'
,p_step_title=>'Top SQL wait events'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(1941121770117897)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20210519053513'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29804306882286589)
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
 p_id=>wwv_flow_api.id(29805126583286614)
,p_plug_name=>'Top SQL wait events'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(1682947491658550)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH d AS',
'(select  /* $Header$ */',
'             pm_system_event.event',
',   sum(pm_system_event.total_waits)   total_waits',
',   sum(pm_system_event.total_timeouts)    total_timeouts',
',   sum(pm_system_event.time_waited) / 100   time_waited',
',   decode',
'  ( ',
'   sum(pm_system_event.total_waits)',
'  ,  0',
'  ,  -1 ',
'  ,  sum(pm_system_event.time_waited) / ',
'     ( 100 * sum(pm_system_event.total_waits) ) ',
'  )            AVERAGE_WAIT',
'from  pm_owner.PM_SYSTEM_EVENT',
'where   pm_system_event.db = :p5_db',
'AND   PM_SYSTEM_EVENT.RUN_ID between :p5_lwb AND :p5_upb',
'GROUP BY pm_system_event.event',
'ORDER BY total_waits DESC',
')',
'SELECT  rownum as nr',
',       d.*',
'FROM    d'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(29805306068286617)
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
,p_internal_uid=>29805306068286617
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29805418870286628)
,p_db_column_name=>'NR'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Nr'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'NR'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29812020760776024)
,p_db_column_name=>'EVENT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Event'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'EVENT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29812102707776027)
,p_db_column_name=>'TOTAL_WAITS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Total Waits'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'TOTAL_WAITS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29812217835776027)
,p_db_column_name=>'TOTAL_TIMEOUTS'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Total Timeouts'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'TOTAL_TIMEOUTS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29812315672776027)
,p_db_column_name=>'TIME_WAITED'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Time Waited'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'TIME_WAITED'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29812404811776028)
,p_db_column_name=>'AVERAGE_WAIT'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Average Wait'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'AVERAGE_WAIT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(29806431285286656)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'298065'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'NR:EVENT:TOTAL_WAITS:TOTAL_TIMEOUTS:TIME_WAITED:AVERAGE_WAIT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(1906503154946938)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(29804306882286589)
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
 p_id=>wwv_flow_api.id(29804506748286602)
,p_name=>'P5_DB'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(29804306882286589)
,p_prompt=>'Database'
,p_source=>'select coalesce (:P5_DB , :P_DB)  from dual;'
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
 p_id=>wwv_flow_api.id(29804727904286609)
,p_name=>'P5_LWB'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(29804306882286589)
,p_prompt=>'From'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIME'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   PM_OWNER.pm_run',
'where  pm_run.db = :p_db',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P5_DB'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1742571556658587)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29804932187286613)
,p_name=>'P5_UPB'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(29804306882286589)
,p_prompt=>'Until'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIME'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   PM_OWNER.pm_run',
'where  pm_run.db = :p_db',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P5_DB'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(1742571556658587)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(29924719301822708)
,p_computation_sequence=>20
,p_computation_item=>'P_DB'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select coalesce (:P5_DB , :P_DB) from dual;'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29913132461476408)
,p_name=>'P_DB'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_DB'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29913427704476412)
,p_event_id=>wwv_flow_api.id(29913132461476408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P_DB := :P5_DB;'
,p_attribute_02=>'P5_DB'
,p_attribute_03=>'P_DB'
,p_attribute_04=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(1906679068947986)
,p_name=>'ApplyFilter'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(1906503154946938)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(1907114284947987)
,p_event_id=>wwv_flow_api.id(1906679068947986)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.page.submit({showWait: false})'
);
end;
/
