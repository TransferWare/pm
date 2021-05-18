whenever oserror exit failure

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql sequence pm_owner.pm_run_seq "" "" ""
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql sequence pm_owner.pm_run_seq "" "" ""
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql sequence pm_owner.pm_sql_seq "" "" ""
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql sequence pm_owner.pm_sql_seq "" "" ""
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_run 'cascade' "constraints" "purge"
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_run 'cascade' "constraints" "purge"
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_session 'cascade' "constraints" "purge"
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_session 'cascade' "constraints" "purge"
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_session_tmp 'cascade' "constraints" "purge"
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_session_tmp 'cascade' "constraints" "purge"
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_sql 'cascade' "constraints" "purge"
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_sql 'cascade' "constraints" "purge"
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_sql_current 'cascade' "constraints" "purge"
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_sql_current 'cascade' "constraints" "purge"
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_sql_id 'cascade' "constraints" "purge"
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_sql_id 'cascade' "constraints" "purge"
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_sqlarea 'cascade' "constraints" "purge"
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_sqlarea 'cascade' "constraints" "purge"
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_sqlarea_tmp 'cascade' "constraints" "purge"
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_sqlarea_tmp 'cascade' "constraints" "purge"
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_sysstat 'cascade' "constraints" "purge"
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_sysstat 'cascade' "constraints" "purge"
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_sysstat_tmp 'cascade' "constraints" "purge"
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_sysstat_tmp 'cascade' "constraints" "purge"
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_system_event 'cascade' "constraints" "purge"
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_system_event 'cascade' "constraints" "purge"
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_system_event_tmp 'cascade' "constraints" "purge"
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql table pm_owner.pm_system_event_tmp 'cascade' "constraints" "purge"
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql package pm_owner.pm "" "" ""
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql package pm_owner.pm "" "" ""
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql package pm_owner.pm_dpi "" "" ""
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql package pm_owner.pm_dpi "" "" ""
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql package pm_owner.pm_mpi "" "" ""
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql package pm_owner.pm_mpi "" "" ""
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql package_body pm_owner.pm "" "" ""
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql package_body pm_owner.pm "" "" ""
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql view pm_owner.pm_vw_sqlarea "" "" ""
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql view pm_owner.pm_vw_sqlarea "" "" ""
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql index pm_owner.pm_art_1 "" "" ""
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql index pm_owner.pm_art_1 "" "" ""
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql index pm_owner.pm_run_1 "" "" ""
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql index pm_owner.pm_run_1 "" "" ""
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql index pm_owner.pm_ses_sql_fk1_frgn "" "" ""
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql index pm_owner.pm_ses_sql_fk1_frgn "" "" ""
SET DEFINE '&'

SET VERIFY OFF DEFINE OFF
PROMPT Command: START &&tw_home/common/src/sql/drop_object.sql index pm_owner.pm_sql_sid_fk1_frgn "" "" ""
SET VERIFY ON DEFINE ON
START &&tw_home/common/src/sql/drop_object.sql index pm_owner.pm_sql_sid_fk1_frgn "" "" ""
SET DEFINE '&'

