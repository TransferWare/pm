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
,p_default_application_id=>113
,p_default_id_offset=>33200869896988505
,p_default_owner=>'PM_OWNER'
);
end;
/
 
prompt APPLICATION 113 - Performance Monitor
--
-- Application Export:
--   Application:     113
--   Name:            Performance Monitor
--   Date and Time:   05:08 Saturday May 22, 2021
--   Exported By:     PM_OWNER
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     18
--       Items:                   42
--       Computations:             9
--       Processes:               12
--       Regions:                 41
--       Buttons:                 26
--       Dynamic Actions:         26
--     Shared Components:
--       Logic:
--         Items:                  2
--         App Settings:           1
--         Build Options:          1
--       Navigation:
--         Lists:                  2
--         Breadcrumbs:            1
--           Entries:              1
--         NavBar Entries:         1
--       Security:
--         Authentication:         1
--         Authorization:          3
--         ACL Roles:              3
--       User Interface:
--         Themes:                 2
--         Templates:
--           Page:                28
--           Region:              52
--           Label:               13
--           List:                31
--           Popup LOV:            2
--           Calendar:             4
--           Breadcrumb:           3
--           Button:              13
--           Report:              22
--         LOVs:                   6
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--   Version:         19.2.0.00.18
--   Instance ID:     250161874321153
--

