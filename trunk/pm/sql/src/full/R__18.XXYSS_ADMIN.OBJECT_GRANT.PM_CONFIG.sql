call dbms_application_info.set_module('R__18.XXYSS_ADMIN.OBJECT_GRANT.PM_CONFIG.sql', null);
call dbms_application_info.set_action('SQL statement 1');
call xxyss_deploy.pkg_ddl_util.execute_ddl(p_id => ':OBJECT_GRANT::XXYSS_ADMIN::PM_CONFIG::WR_XXYSS_ADMIN:DEBUG:NO', p_text => 'GRANT DEBUG ON "XXYSS_ADMIN"."PM_CONFIG" TO "WR_XXYSS_ADMIN"');

call dbms_application_info.set_action('SQL statement 2');
call xxyss_deploy.pkg_ddl_util.execute_ddl(p_id => ':OBJECT_GRANT::XXYSS_ADMIN::PM_CONFIG::WR_XXYSS_ADMIN:DELETE:NO', p_text => 'GRANT DELETE ON "XXYSS_ADMIN"."PM_CONFIG" TO "WR_XXYSS_ADMIN"');

call dbms_application_info.set_action('SQL statement 3');
call xxyss_deploy.pkg_ddl_util.execute_ddl(p_id => ':OBJECT_GRANT::XXYSS_ADMIN::PM_CONFIG::WR_XXYSS_ADMIN:INSERT:NO', p_text => 'GRANT INSERT ON "XXYSS_ADMIN"."PM_CONFIG" TO "WR_XXYSS_ADMIN"');

call dbms_application_info.set_action('SQL statement 4');
call xxyss_deploy.pkg_ddl_util.execute_ddl(p_id => ':OBJECT_GRANT::XXYSS_ADMIN::PM_CONFIG::WR_XXYSS_ADMIN:UPDATE:NO', p_text => 'GRANT UPDATE ON "XXYSS_ADMIN"."PM_CONFIG" TO "WR_XXYSS_ADMIN"');

