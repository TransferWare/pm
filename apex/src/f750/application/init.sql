set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.10.04'
,p_release=>'19.2.0.00.18'
,p_default_workspace_id=>1483465405721982
,p_default_application_id=>750
,p_default_id_offset=>0
,p_default_owner=>'XXYSS_ADMIN'
);
end;
/
 
prompt APPLICATION 750 - Star Performance Monitor
--
-- Application Export:
--   Application:     750
--   Name:            Star Performance Monitor
--   Date and Time:   13:22 Tuesday May 18, 2021
--   Exported By:     PM_OWNER
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     12
--       Items:                   30
--       Computations:            10
--       Processes:                4
--       Regions:                 22
--       Buttons:                  1
--       Dynamic Actions:         16
--     Shared Components:
--       Logic:
--         Items:                  2
--       Navigation:
--         Tab Sets:               1
--           Tabs:                10
--         Breadcrumbs:            1
--         NavBar Entries:         1
--       Security:
--         Authentication:         1
--       User Interface:
--         Themes:                 1
--         Templates:
--           Page:                19
--           Region:              36
--           Label:                6
--           List:                19
--           Popup LOV:            1
--           Calendar:             3
--           Breadcrumb:           2
--           Button:              10
--           Report:              11
--         LOVs:                   3
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--   Version:         19.2.0.00.18
--   Instance ID:     250161874321153
--

