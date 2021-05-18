prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(29137816761808495)
,p_tab_set=>'TS1'
,p_name=>'System statistics'
,p_step_title=>'System statistics'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'GPA'
,p_last_upd_yyyymmddhh24miss=>'20170512123453'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(29936626380276707)
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
 p_id=>wwv_flow_api.id(29937419593276710)
,p_plug_name=>'System statistics'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29130511710808445)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY_3'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH d AS',
'(select	/* $Header$ */',
'  decode (',
'		sysstat.class',
'	,	1',
'	,	''User''',
'	,	2',
'	,	''Redo''',
'	,	4',
'	,	''Enqueue''',
'	,	8',
'	,	''Cache''',
'	,	16',
'	,	''OS''',
'	,	32',
'	,	''Parallel Server''',
'	,	64',
'	,	''SQL''',
'	,	128',
'	,	''Debug''',
'	,	''Unknown''',
'	)	class',
' ,	SYSSTAT.name',
' ,	SYSSTAT.value',
' from	(	select	PM_SYSSTAT.name',
'        ,       PM_SYSSTAT.class',
'		    ,	SUM(PM_SYSSTAT.value)	value',
'		    from	XXYSS_ADMIN.PM_SYSSTAT',
'		    where	PM_SYSSTAT.DB = :P8_DB',
'		    and	PM_SYSSTAT.RUN_ID between :P8_LWB and :P8_UPB',
'		    group by PM_SYSSTAT.name',
'        ,        PM_SYSSTAT.class',
'    	)	sysstat',
'order by ',
'	class',
',	name ',
')',
'SELECT  rownum as nr',
',       D.*',
'from    D'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(29937629639276711)
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
,p_internal_uid=>29937629639276711
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29937731101276711)
,p_db_column_name=>'NR'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Nr'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'NR'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29937811923276711)
,p_db_column_name=>'CLASS'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Class'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'CLASS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29937921107276713)
,p_db_column_name=>'NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Name'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(29938018474276713)
,p_db_column_name=>'VALUE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Value'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'VALUE'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(29938118841276713)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'299382'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'NR:CLASS:NAME:VALUE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29936802579276707)
,p_name=>'P8_DB'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(29936626380276707)
,p_prompt=>'Database'
,p_source=>'select coalesce (:P8_DB , :P_DB)  from dual;'
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
 p_id=>wwv_flow_api.id(29937007575276710)
,p_name=>'P8_LWB'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(29936626380276707)
,p_prompt=>'From'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIME'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   XXYSS_ADMIN.pm_run',
'where  pm_run.db = :p_db',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P8_DB'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(29135704601808468)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'SUBMIT'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(29937229280276710)
,p_name=>'P8_UPB'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(29936626380276707)
,p_prompt=>'Until'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIME'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   XXYSS_ADMIN.pm_run',
'where  pm_run.db = :p_db',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P8_DB'
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
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(29938428247276713)
,p_computation_sequence=>10
,p_computation_item=>'P_DB'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select coalesce (:P8_DB , :P_DB) from dual;'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29938521634276715)
,p_name=>'P_DB'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_DB'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusout'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29938813189276715)
,p_event_id=>wwv_flow_api.id(29938521634276715)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P_DB := :P8_DB;'
,p_attribute_02=>'P8_DB'
,p_attribute_03=>'P_DB'
,p_attribute_04=>'N'
,p_wait_for_result=>'Y'
);
end;
/
