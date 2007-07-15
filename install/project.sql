prompt &&pm_home/install/project.sql

DEFINE prj = 'PM'

@ &&tw_home/common/install/project.sql

@ &&common_sql_dir.set_version.sql &&pm_home&&dirsep.VERSION pm

UNDEFINE prj
