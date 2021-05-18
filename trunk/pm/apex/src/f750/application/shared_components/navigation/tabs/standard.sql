prompt --application/shared_components/navigation/tabs/standard
begin
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(29861611967231013)
,p_tab_set=>'TS1'
,p_tab_sequence=>20
,p_tab_name=>'T_TOP_IO_SQL'
,p_tab_text=>'Top I/O SQL'
,p_tab_step=>1
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(33890315288769031)
,p_tab_set=>'TS1'
,p_tab_sequence=>30
,p_tab_name=>'T_EXPLAINPLAN'
,p_tab_text=>'Explain plan'
,p_tab_step=>2
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(29888029484896146)
,p_tab_set=>'TS1'
,p_tab_sequence=>50
,p_tab_name=>'T_TOP_WAIT_EVENTS'
,p_tab_text=>'Top wait events'
,p_tab_step=>5
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(33784122397686298)
,p_tab_set=>'TS1'
,p_tab_sequence=>60
,p_tab_name=>'T_SQL ASSIGNMENTS'
,p_tab_text=>'Search for SQL statements'
,p_tab_step=>6
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(29979204125528934)
,p_tab_set=>'TS1'
,p_tab_sequence=>70
,p_tab_name=>'T_RESOURCE_USAGE_PER_USER'
,p_tab_text=>'Resource usage per user'
,p_tab_step=>7
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(29888305761907230)
,p_tab_set=>'TS1'
,p_tab_sequence=>80
,p_tab_name=>'T_SYSTEMSTATISTICS'
,p_tab_text=>'System statistics'
,p_tab_step=>8
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(30003507027410726)
,p_tab_set=>'TS1'
,p_tab_sequence=>100
,p_tab_name=>'T_SLOW SQL'
,p_tab_text=>'Slow SQL'
,p_tab_step=>10
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(33898516116495557)
,p_tab_set=>'TS1'
,p_tab_sequence=>110
,p_tab_name=>'T_SIMILAR_SQL'
,p_tab_text=>'Similar SQL'
,p_tab_step=>11
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(33018907746040955)
,p_tab_set=>'TS1'
,p_tab_sequence=>120
,p_tab_name=>'T_HIT RATIO'
,p_tab_text=>'Hit Ratio'
,p_tab_step=>12
);
wwv_flow_api.create_tab(
 p_id=>wwv_flow_api.id(33749403227895254)
,p_tab_set=>'TS1'
,p_tab_sequence=>130
,p_tab_name=>'T_SQL STATEMENTS'
,p_tab_text=>'Source info'
,p_tab_step=>13
);
end;
/
