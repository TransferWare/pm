/*
-- Script: pm-process.sql
-- Goal  : A SQL*Plus script to start the PATO process to install or export the Performance Monitor application
-- Input : 1) The repo owner (case sensitive)
--         2) The repo name (case sensitive)
--         3) The path of the starting pom.sql (defaults to empty)
--         4) The operation (list-projects/list-files/install) (defaults to install)
--         5) Stop on error? (1=true, 0=false) (defaults to 1)
--         6) Do we perform a dry run? (1=true, 0=false) (defaults to 1)
--         7) Verbose? (1=true, 0=false) (defaults to 0)
--         8) Skip unchanged repeatables? (1=true, 0=false) (defaults to 1)
-- Remark: Verify by https://github.com/&1/&2
*/

define repo_owner = 'TransferWare'
define repo_name = 'pm'
define branch_name = 'development'
define tag_name = ''
define commit_id = ''
define path = ''
define operation = 'install'
-- necessary to install PATO itself (null = ignore compilation errors only, 0 = always ignore errors, 1 = never ignore errors)
define stop_on_error = null
define dry_run = 0
define verbose = 0
define skip_unchanged_repeatables = 1

set serveroutput on size unlimited format trunc
set feedback off verify off

declare
  l_git_repo_index constant admin.pato_cloud_repo.git_repo_index_t := 
    admin.pato_cloud_repo.init_github_repo
    ( p_repo_name => '&repo_name'
    , p_repo_owner => '&repo_owner'
    , p_branch_name => '&branch_name'
    , p_tag_name => '&tag_name'
    , p_commit_id => '&commit_id'
    );
begin
  admin.pato_install_pkg.init
  ( p_git_repo_index => l_git_repo_index      
  , p_operation => '&operation'
  , p_stop_on_error => &stop_on_error
  , p_dry_run => nvl(to_number('&dry_run'), 0)
  , p_verbose => nvl(to_number('&verbose'), 0)
  , p_skip_unchanged_repeatables => nvl(to_number('&skip_unchanged_repeatables'), 1) != 0
  , p_owner_schema => 'PM_OWNER'
  );
  admin.pato_install_pkg.process_project_root
  ( p_path => '&path'
  );
end;
/
