begin
  admin.pato_cloud_repo.check_current_schema('ADMIN');
end;
/

begin
  admin.pato_cloud_repo.install_file
  ( p_file_path => 'admin/creusr-no-sqlplus.sql'
  , p_stop_on_error => true
  , p_schema => 'ADMIN'
  );
  admin.pato_cloud_repo.install_file
  ( p_file_path => 'admin/pm-no-sqlplus.sql'
  , p_stop_on_error => true
  , p_schema => 'ADMIN'
  );
  -- End of installing TransferWare/pm
end;
/
