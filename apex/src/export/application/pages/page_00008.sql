prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(57939747380073169)
,p_name=>'System statistics'
,p_step_title=>'System statistics'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(30743052388382571)
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'GERT.JAN.PAULISSEN@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20210528105109'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(30967931041137917)
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
 p_id=>wwv_flow_api.id(58739350211541384)
,p_plug_name=>'System statistics'
,p_region_name=>'data'
,p_parent_plug_id=>wwv_flow_api.id(30967931041137917)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(30484878109923224)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH d AS',
'(select  /* $Header$ */',
'  decode (',
'   sysstat.class',
' , 1',
' , ''User''',
' , 2',
' , ''Redo''',
' , 4',
' , ''Enqueue''',
' , 8',
' , ''Cache''',
' , 16',
' , ''OS''',
' , 32',
' , ''Parallel Server''',
' , 64',
' , ''SQL''',
' , 128',
' , ''Debug''',
' , ''Unknown''',
' ) class',
' , SYSSTAT.name',
' , SYSSTAT.value',
' from  ( select  PM_SYSSTAT.name',
'        ,       PM_SYSSTAT.class',
'       , SUM(PM_SYSSTAT.value) value',
'       from  PM_OWNER.PM_SYSSTAT',
'       where PM_SYSSTAT.DB = :P8_DB',
'       and PM_SYSSTAT.RUN_ID between :P8_LWB and :P8_UPB',
'       group by PM_SYSSTAT.name',
'        ,        PM_SYSSTAT.class',
'     ) sysstat',
'order by ',
' class',
',  name ',
')',
'SELECT  rownum as nr',
',       D.*',
'from    D'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(58739560257541385)
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
,p_internal_uid=>29937629639276711
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58739661719541385)
,p_db_column_name=>'NR'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Nr'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_static_id=>'NR'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58739742541541385)
,p_db_column_name=>'CLASS'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Class'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'CLASS'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58739851725541387)
,p_db_column_name=>'NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
,p_static_id=>'NAME'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(58739949092541387)
,p_db_column_name=>'VALUE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_tz_dependent=>'N'
,p_static_id=>'VALUE'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(58740049459541387)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'299382'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'NR:CLASS:NAME:VALUE'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(58738556998541381)
,p_plug_name=>'Filter'
,p_region_name=>'filter'
,p_parent_plug_id=>wwv_flow_api.id(30967931041137917)
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
 p_id=>wwv_flow_api.id(30716953864242045)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(58738556998541381)
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
 p_id=>wwv_flow_api.id(58739159898541384)
,p_name=>'P8_UPB'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(58738556998541381)
,p_prompt=>'Until'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIME_UPB'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   PM_OWNER.pm_run',
'where  pm_run.db = :P_DB',
'order by 1 desc'))
,p_lov_cascade_parent_items=>'P8_DB'
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
 p_id=>wwv_flow_api.id(58738938193541384)
,p_name=>'P8_LWB'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(58738556998541381)
,p_prompt=>'From'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_TIME_LWB'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(pm_run.timestamp, ''yyyy-mm-dd hh24:mi:ss'') d, pm_run.run_id r',
'from   PM_OWNER.pm_run',
'where  pm_run.db = :P_DB',
'order by 1 asc'))
,p_lov_cascade_parent_items=>'P8_DB'
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
 p_id=>wwv_flow_api.id(58738733197541381)
,p_name=>'P8_DB'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(58738556998541381)
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(29050797417714841)
,p_name=>'P_DB'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_DB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(29051176403714841)
,p_event_id=>wwv_flow_api.id(29050797417714841)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P_DB := :P8_DB;'
,p_attribute_02=>'P8_DB'
,p_attribute_03=>'P_DB'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(31036910451646844)
,p_name=>'ApplyFilter'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(30716953864242045)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31037377173646844)
,p_event_id=>wwv_flow_api.id(31036910451646844)
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
