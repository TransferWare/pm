begin
  pato_install_pkg.process_project
  ( p_path => 'admin'
  );
  pato_install_pkg.process_project
  ( p_path => 'sql'
  );
  pato_install_pkg.process_project
  ( p_path => 'apex'
  );
end;
/
