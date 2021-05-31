set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>1483465405721982
,p_default_application_id=>113
,p_default_id_offset=>63618795994360424
,p_default_owner=>'PM_OWNER'
);
end;
/
 
prompt APPLICATION 113 - Performance Monitor
--
-- Application Export:
--   Application:     113
--   Name:            Performance Monitor
--   Date and Time:   08:12 Friday May 28, 2021
--   Exported By:     PM_OWNER
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     18
--       Items:                   41
--       Computations:             7
--       Validations:              4
--       Processes:               12
--       Regions:                 51
--       Buttons:                 26
--       Dynamic Actions:         25
--     Shared Components:
--       Logic:
--         Items:                  2
--         App Settings:           1
--         Build Options:          2
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
--         LOVs:                   7
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--   Version:         20.2.0.00.20
--   Instance ID:     250161874321153
--

