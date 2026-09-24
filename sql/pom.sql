begin
  pato_install_pkg.process_project_db
  ( p_path => 'sql/ORACLE_TOOLS'
  , p_schema => 'ORACLE_TOOLS' -- overrides the default
  );
  pato_install_pkg.process_project_db
  ( p_path => 'sql/PM_OWNER'
  );
end;
/
