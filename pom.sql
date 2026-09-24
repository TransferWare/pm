begin
  admin.pato_cloud_repo.install_file
  ( p_file_path => 'admin/creusr-no-sqlplus.sql'
  , p_stop_on_error => true
  , p_schema => 'ADMIN'
  );
end;
/

begin
  admin.pato_cloud_repo.install_file
  ( p_file_path => 'admin/pm-no-sqlplus.grt'
  , p_stop_on_error => true
  , p_schema => 'ADMIN'
  );
end;
/

begin
  admin.pato_install_pkg.process_project
  ( p_path => 'sql'
  );
end;
/

begin
  admin.pato_install_pkg.process_project
  ( p_path => 'apex'
  );
end;
/
