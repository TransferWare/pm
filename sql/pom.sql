begin
  pato_install_pkg.process_project_db
  ( p_path => 'ORACLE_TOOLS'
  , p_schema => 'ORACLE_TOOLS' -- overrides the default
  );
  pato_install_pkg.process_project_db
  ( p_path => 'PM_OWNER'
  );
end;
/
