begin
  admin.pato_cloud_repo.check_current_schema('ADMIN');
end;
/

declare
  l_git_repo_index admin.pato_cloud_repo.git_repo_index_t;
begin
  -- first call must be to paulissoft/oracle-tools branch development
  l_git_repo_index := 
    admin.pato_cloud_repo.init_github_repo
    ( p_repo_owner => 'paulissoft'
    , p_repo_name => 'oracle-tools'
    , p_branch_name => 'development'
    );
  -- Start of installing TransferWare/pm
  l_git_repo_index := 
    admin.pato_cloud_repo.init_github_repo
    ( p_repo_owner => 'TransferWare'
    , p_repo_name => 'pm'
    , p_branch_name => 'master'
    );
  admin.pato_cloud_repo.install_file
  ( p_git_repo_index => l_git_repo_index
  , p_file_path => 'admin/creusr-no-sqlplus.sql'
  , p_stop_on_error => true
  , p_schema => 'ADMIN'
  );
  admin.pato_cloud_repo.install_file
  ( p_git_repo_index => l_git_repo_index
  , p_file_path => 'admin/pm-no-sqlplus.sql'
  , p_stop_on_error => true
  , p_schema => 'ADMIN'
  );
  -- End of installing TransferWare/pm
end;
/
