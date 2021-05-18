/* perl generate_ddl.pl (version 939) --nodynamic-sql --force-view --noremove-output-directory --skip-install-sql */

-- JDBC url            : jdbc:oracle:thin:PRXY[XXYSS_ADMIN]@//52.59.224.131:1521/devseko1
-- source schema       : 
-- source database link: 
-- target schema       : XXYSS_ADMIN
-- target database link: 
-- object type         : 
-- object names include: 1
-- object names        : ,PM
,PM_CFG
,PM_CONFIG
,PM_DPI
,PM_MPI
,PM_RUN
,PM_RUN_SEQ
,PM_SESSION
,PM_SESSION_TMP
,PM_SQL
,PM_SQLAREA
,PM_SQLAREA_TMP
,PM_SQL_CURRENT
,PM_SQL_ID
,PM_SQL_SEQ
,PM_SYSSTAT
,PM_SYSSTAT_TMP
,PM_SYSTEM_EVENT
,PM_SYSTEM_EVENT_TMP
,PM_VW_SQLAREA
-- skip repeatables    : 0
-- interface           : pkg_ddl_util v4

-- pkg_ddl_util v4
call dbms_application_info.set_module('uninstall.sql', null);
/* SQL statement 1 (DROP;XXYSS_ADMIN;SEQUENCE;PM_SQL_SEQ;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 1');
DROP SEQUENCE XXYSS_ADMIN.PM_SQL_SEQ;

/* SQL statement 2 (DROP;XXYSS_ADMIN;PACKAGE_SPEC;PM_MPI;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 2');
DROP PACKAGE XXYSS_ADMIN.PM_MPI;

/* SQL statement 3 (DROP;XXYSS_ADMIN;PACKAGE_SPEC;PM_DPI;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 3');
DROP PACKAGE XXYSS_ADMIN.PM_DPI;

/* SQL statement 4 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SYS_CK2;XXYSS_ADMIN;TABLE;PM_SYSSTAT;;;;;2) */
call dbms_application_info.set_action('SQL statement 4');
ALTER TABLE "XXYSS_ADMIN"."PM_SYSSTAT" DROP CONSTRAINT PM_SYS_CK2;

/* SQL statement 5 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SYS_CK1;XXYSS_ADMIN;TABLE;PM_SYSSTAT;;;;;2) */
call dbms_application_info.set_action('SQL statement 5');
ALTER TABLE "XXYSS_ADMIN"."PM_SYSSTAT" DROP CONSTRAINT PM_SYS_CK1;

/* SQL statement 6 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SQL_CK1;XXYSS_ADMIN;TABLE;PM_SQL;;;;;2) */
call dbms_application_info.set_action('SQL statement 6');
ALTER TABLE "XXYSS_ADMIN"."PM_SQL" DROP CONSTRAINT PM_SQL_CK1;

/* SQL statement 7 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SEV_CK2;XXYSS_ADMIN;TABLE;PM_SYSTEM_EVENT;;;;;2) */
call dbms_application_info.set_action('SQL statement 7');
ALTER TABLE "XXYSS_ADMIN"."PM_SYSTEM_EVENT" DROP CONSTRAINT PM_SEV_CK2;

/* SQL statement 8 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SEV_CK1;XXYSS_ADMIN;TABLE;PM_SYSTEM_EVENT;;;;;2) */
call dbms_application_info.set_action('SQL statement 8');
ALTER TABLE "XXYSS_ADMIN"."PM_SYSTEM_EVENT" DROP CONSTRAINT PM_SEV_CK1;

/* SQL statement 9 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SES_CK2;XXYSS_ADMIN;TABLE;PM_SESSION;;;;;2) */
call dbms_application_info.set_action('SQL statement 9');
ALTER TABLE "XXYSS_ADMIN"."PM_SESSION" DROP CONSTRAINT PM_SES_CK2;

/* SQL statement 10 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SES_CK1;XXYSS_ADMIN;TABLE;PM_SESSION;;;;;2) */
call dbms_application_info.set_action('SQL statement 10');
ALTER TABLE "XXYSS_ADMIN"."PM_SESSION" DROP CONSTRAINT PM_SES_CK1;

/* SQL statement 11 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_RUN_CK1;XXYSS_ADMIN;TABLE;PM_RUN;;;;;2) */
call dbms_application_info.set_action('SQL statement 11');
ALTER TABLE "XXYSS_ADMIN"."PM_RUN" DROP CONSTRAINT PM_RUN_CK1;

/* SQL statement 12 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_CFG_CK1;XXYSS_ADMIN;TABLE;PM_CONFIG;;;;;2) */
call dbms_application_info.set_action('SQL statement 12');
ALTER TABLE "XXYSS_ADMIN"."PM_CONFIG" DROP CONSTRAINT PM_CFG_CK1;

/* SQL statement 13 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_ARE_CK3;XXYSS_ADMIN;TABLE;PM_SQLAREA;;;;;2) */
call dbms_application_info.set_action('SQL statement 13');
ALTER TABLE "XXYSS_ADMIN"."PM_SQLAREA" DROP CONSTRAINT PM_ARE_CK3;

/* SQL statement 14 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_ARE_CK2;XXYSS_ADMIN;TABLE;PM_SQLAREA;;;;;2) */
call dbms_application_info.set_action('SQL statement 14');
ALTER TABLE "XXYSS_ADMIN"."PM_SQLAREA" DROP CONSTRAINT PM_ARE_CK2;

/* SQL statement 15 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_ARE_CK1;XXYSS_ADMIN;TABLE;PM_SQLAREA;;;;;2) */
call dbms_application_info.set_action('SQL statement 15');
ALTER TABLE "XXYSS_ADMIN"."PM_SQLAREA" DROP CONSTRAINT PM_ARE_CK1;

/* SQL statement 16 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_ARE_PK;XXYSS_ADMIN;TABLE;PM_SQLAREA;;;;;2) */
call dbms_application_info.set_action('SQL statement 16');
ALTER TABLE "XXYSS_ADMIN"."PM_SQLAREA" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 17 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_CFG_PK;XXYSS_ADMIN;TABLE;PM_CONFIG;;;;;2) */
call dbms_application_info.set_action('SQL statement 17');
ALTER TABLE "XXYSS_ADMIN"."PM_CONFIG" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 18 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_CUR_PK;XXYSS_ADMIN;TABLE;PM_SQL_CURRENT;;;;;2) */
call dbms_application_info.set_action('SQL statement 18');
ALTER TABLE "XXYSS_ADMIN"."PM_SQL_CURRENT" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 19 (ALTER;XXYSS_ADMIN;REF_CONSTRAINT;PM_ARE_RUN_FK1;XXYSS_ADMIN;TABLE;PM_SQLAREA;;;;;2) */
call dbms_application_info.set_action('SQL statement 19');
ALTER TABLE "XXYSS_ADMIN"."PM_SQLAREA" DROP CONSTRAINT PM_ARE_RUN_FK1;

/* SQL statement 20 (ALTER;XXYSS_ADMIN;REF_CONSTRAINT;PM_SES_RUN_FK1;XXYSS_ADMIN;TABLE;PM_SESSION;;;;;2) */
call dbms_application_info.set_action('SQL statement 20');
ALTER TABLE "XXYSS_ADMIN"."PM_SESSION" DROP CONSTRAINT PM_SES_RUN_FK1;

/* SQL statement 21 (ALTER;XXYSS_ADMIN;REF_CONSTRAINT;PM_SEV_RUN_FK1;XXYSS_ADMIN;TABLE;PM_SYSTEM_EVENT;;;;;2) */
call dbms_application_info.set_action('SQL statement 21');
ALTER TABLE "XXYSS_ADMIN"."PM_SYSTEM_EVENT" DROP CONSTRAINT PM_SEV_RUN_FK1;

/* SQL statement 22 (ALTER;XXYSS_ADMIN;REF_CONSTRAINT;PM_SYS_RUN_FK1;XXYSS_ADMIN;TABLE;PM_SYSSTAT;;;;;2) */
call dbms_application_info.set_action('SQL statement 22');
ALTER TABLE "XXYSS_ADMIN"."PM_SYSSTAT" DROP CONSTRAINT PM_SYS_RUN_FK1;

/* SQL statement 23 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_RUN_PK;XXYSS_ADMIN;TABLE;PM_RUN;;;;;2) */
call dbms_application_info.set_action('SQL statement 23');
ALTER TABLE "XXYSS_ADMIN"."PM_RUN" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 24 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SES_PK;XXYSS_ADMIN;TABLE;PM_SESSION;;;;;2) */
call dbms_application_info.set_action('SQL statement 24');
ALTER TABLE "XXYSS_ADMIN"."PM_SESSION" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 25 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SET_PK;XXYSS_ADMIN;TABLE;PM_SYSTEM_EVENT_TMP;;;;;2) */
call dbms_application_info.set_action('SQL statement 25');
ALTER TABLE "XXYSS_ADMIN"."PM_SYSTEM_EVENT_TMP" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 26 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SEV_PK;XXYSS_ADMIN;TABLE;PM_SYSTEM_EVENT;;;;;2) */
call dbms_application_info.set_action('SQL statement 26');
ALTER TABLE "XXYSS_ADMIN"."PM_SYSTEM_EVENT" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 27 (ALTER;XXYSS_ADMIN;REF_CONSTRAINT;PM_SQL_SID_FK1;XXYSS_ADMIN;TABLE;PM_SQL;;;;;2) */
call dbms_application_info.set_action('SQL statement 27');
ALTER TABLE "XXYSS_ADMIN"."PM_SQL" DROP CONSTRAINT PM_SQL_SID_FK1;

/* SQL statement 28 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SID_PK;XXYSS_ADMIN;TABLE;PM_SQL_ID;;;;;2) */
call dbms_application_info.set_action('SQL statement 28');
ALTER TABLE "XXYSS_ADMIN"."PM_SQL_ID" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 29 (ALTER;XXYSS_ADMIN;REF_CONSTRAINT;PM_ARE_SQL_FK1;XXYSS_ADMIN;TABLE;PM_SQLAREA;;;;;2) */
call dbms_application_info.set_action('SQL statement 29');
ALTER TABLE "XXYSS_ADMIN"."PM_SQLAREA" DROP CONSTRAINT PM_ARE_SQL_FK1;

/* SQL statement 30 (ALTER;XXYSS_ADMIN;REF_CONSTRAINT;PM_SES_SQL_FK1;XXYSS_ADMIN;TABLE;PM_SESSION;;;;;2) */
call dbms_application_info.set_action('SQL statement 30');
ALTER TABLE "XXYSS_ADMIN"."PM_SESSION" DROP CONSTRAINT PM_SES_SQL_FK1;

/* SQL statement 31 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SQL_PK;XXYSS_ADMIN;TABLE;PM_SQL;;;;;2) */
call dbms_application_info.set_action('SQL statement 31');
ALTER TABLE "XXYSS_ADMIN"."PM_SQL" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 32 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_STP_PK;XXYSS_ADMIN;TABLE;PM_SESSION_TMP;;;;;2) */
call dbms_application_info.set_action('SQL statement 32');
ALTER TABLE "XXYSS_ADMIN"."PM_SESSION_TMP" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 33 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SYS_PK;XXYSS_ADMIN;TABLE;PM_SYSSTAT;;;;;2) */
call dbms_application_info.set_action('SQL statement 33');
ALTER TABLE "XXYSS_ADMIN"."PM_SYSSTAT" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 34 (ALTER;XXYSS_ADMIN;CONSTRAINT;PM_SYT_PK;XXYSS_ADMIN;TABLE;PM_SYSSTAT_TMP;;;;;2) */
call dbms_application_info.set_action('SQL statement 34');
ALTER TABLE "XXYSS_ADMIN"."PM_SYSSTAT_TMP" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 35 (DROP;XXYSS_ADMIN;INDEX;PM_ARE_PK;XXYSS_ADMIN;TABLE;PM_SQLAREA;;;;;2) */
call dbms_application_info.set_action('SQL statement 35');
DROP INDEX XXYSS_ADMIN.PM_ARE_PK;

/* SQL statement 36 (DROP;XXYSS_ADMIN;INDEX;PM_ART_1;XXYSS_ADMIN;TABLE;PM_SQLAREA_TMP;;;;;2) */
call dbms_application_info.set_action('SQL statement 36');
DROP INDEX XXYSS_ADMIN.PM_ART_1;

/* SQL statement 37 (DROP;XXYSS_ADMIN;INDEX;PM_CFG_PK;XXYSS_ADMIN;TABLE;PM_CONFIG;;;;;2) */
call dbms_application_info.set_action('SQL statement 37');
DROP INDEX XXYSS_ADMIN.PM_CFG_PK;

/* SQL statement 38 (DROP;XXYSS_ADMIN;INDEX;PM_CUR_PK;XXYSS_ADMIN;TABLE;PM_SQL_CURRENT;;;;;2) */
call dbms_application_info.set_action('SQL statement 38');
DROP INDEX XXYSS_ADMIN.PM_CUR_PK;

/* SQL statement 39 (DROP;XXYSS_ADMIN;INDEX;PM_RUN_1;XXYSS_ADMIN;TABLE;PM_RUN;;;;;2) */
call dbms_application_info.set_action('SQL statement 39');
DROP INDEX XXYSS_ADMIN.PM_RUN_1;

/* SQL statement 40 (DROP;XXYSS_ADMIN;INDEX;PM_RUN_PK;XXYSS_ADMIN;TABLE;PM_RUN;;;;;2) */
call dbms_application_info.set_action('SQL statement 40');
DROP INDEX XXYSS_ADMIN.PM_RUN_PK;

/* SQL statement 41 (DROP;XXYSS_ADMIN;INDEX;PM_SES_PK;XXYSS_ADMIN;TABLE;PM_SESSION;;;;;2) */
call dbms_application_info.set_action('SQL statement 41');
DROP INDEX XXYSS_ADMIN.PM_SES_PK;

/* SQL statement 42 (DROP;XXYSS_ADMIN;INDEX;PM_SES_SQL_FK1_FRGN;XXYSS_ADMIN;TABLE;PM_SESSION;;;;;2) */
call dbms_application_info.set_action('SQL statement 42');
DROP INDEX XXYSS_ADMIN.PM_SES_SQL_FK1_FRGN;

/* SQL statement 43 (DROP;XXYSS_ADMIN;INDEX;PM_SET_PK;XXYSS_ADMIN;TABLE;PM_SYSTEM_EVENT_TMP;;;;;2) */
call dbms_application_info.set_action('SQL statement 43');
DROP INDEX XXYSS_ADMIN.PM_SET_PK;

/* SQL statement 44 (DROP;XXYSS_ADMIN;INDEX;PM_SEV_PK;XXYSS_ADMIN;TABLE;PM_SYSTEM_EVENT;;;;;2) */
call dbms_application_info.set_action('SQL statement 44');
DROP INDEX XXYSS_ADMIN.PM_SEV_PK;

/* SQL statement 45 (DROP;XXYSS_ADMIN;INDEX;PM_SID_PK;XXYSS_ADMIN;TABLE;PM_SQL_ID;;;;;2) */
call dbms_application_info.set_action('SQL statement 45');
DROP INDEX XXYSS_ADMIN.PM_SID_PK;

/* SQL statement 46 (DROP;XXYSS_ADMIN;INDEX;PM_SQL_PK;XXYSS_ADMIN;TABLE;PM_SQL;;;;;2) */
call dbms_application_info.set_action('SQL statement 46');
DROP INDEX XXYSS_ADMIN.PM_SQL_PK;

/* SQL statement 47 (DROP;XXYSS_ADMIN;INDEX;PM_SQL_SID_FK1_FRGN;XXYSS_ADMIN;TABLE;PM_SQL;;;;;2) */
call dbms_application_info.set_action('SQL statement 47');
DROP INDEX XXYSS_ADMIN.PM_SQL_SID_FK1_FRGN;

/* SQL statement 48 (DROP;XXYSS_ADMIN;INDEX;PM_STP_PK;XXYSS_ADMIN;TABLE;PM_SESSION_TMP;;;;;2) */
call dbms_application_info.set_action('SQL statement 48');
DROP INDEX XXYSS_ADMIN.PM_STP_PK;

/* SQL statement 49 (DROP;XXYSS_ADMIN;INDEX;PM_SYS_PK;XXYSS_ADMIN;TABLE;PM_SYSSTAT;;;;;2) */
call dbms_application_info.set_action('SQL statement 49');
DROP INDEX XXYSS_ADMIN.PM_SYS_PK;

/* SQL statement 50 (DROP;XXYSS_ADMIN;INDEX;PM_SYT_PK;XXYSS_ADMIN;TABLE;PM_SYSSTAT_TMP;;;;;2) */
call dbms_application_info.set_action('SQL statement 50');
DROP INDEX XXYSS_ADMIN.PM_SYT_PK;

/* SQL statement 51 (REVOKE;;OBJECT_GRANT;;XXYSS_ADMIN;TABLE;PM_CONFIG;;WR_XXYSS_ADMIN;UPDATE;NO;2) */
call dbms_application_info.set_action('SQL statement 51');
call xxyss_deploy.pkg_ddl_util.execute_ddl(p_id => ':OBJECT_GRANT::XXYSS_ADMIN::PM_CONFIG::WR_XXYSS_ADMIN:UPDATE:NO', p_text => 'REVOKE UPDATE ON "XXYSS_ADMIN"."PM_CONFIG" FROM "WR_XXYSS_ADMIN"');

/* SQL statement 52 (REVOKE;;OBJECT_GRANT;;XXYSS_ADMIN;TABLE;PM_CONFIG;;WR_XXYSS_ADMIN;INSERT;NO;2) */
call dbms_application_info.set_action('SQL statement 52');
call xxyss_deploy.pkg_ddl_util.execute_ddl(p_id => ':OBJECT_GRANT::XXYSS_ADMIN::PM_CONFIG::WR_XXYSS_ADMIN:INSERT:NO', p_text => 'REVOKE INSERT ON "XXYSS_ADMIN"."PM_CONFIG" FROM "WR_XXYSS_ADMIN"');

/* SQL statement 53 (REVOKE;;OBJECT_GRANT;;XXYSS_ADMIN;TABLE;PM_CONFIG;;WR_XXYSS_ADMIN;DELETE;NO;2) */
call dbms_application_info.set_action('SQL statement 53');
call xxyss_deploy.pkg_ddl_util.execute_ddl(p_id => ':OBJECT_GRANT::XXYSS_ADMIN::PM_CONFIG::WR_XXYSS_ADMIN:DELETE:NO', p_text => 'REVOKE DELETE ON "XXYSS_ADMIN"."PM_CONFIG" FROM "WR_XXYSS_ADMIN"');

/* SQL statement 54 (REVOKE;;OBJECT_GRANT;;XXYSS_ADMIN;TABLE;PM_CONFIG;;WR_XXYSS_ADMIN;DEBUG;NO;2) */
call dbms_application_info.set_action('SQL statement 54');
call xxyss_deploy.pkg_ddl_util.execute_ddl(p_id => ':OBJECT_GRANT::XXYSS_ADMIN::PM_CONFIG::WR_XXYSS_ADMIN:DEBUG:NO', p_text => 'REVOKE DEBUG ON "XXYSS_ADMIN"."PM_CONFIG" FROM "WR_XXYSS_ADMIN"');

/* SQL statement 55 (DROP;XXYSS_ADMIN;PACKAGE_BODY;PM;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 55');
DROP PACKAGE BODY XXYSS_ADMIN.PM;

/* SQL statement 56 (DROP;XXYSS_ADMIN;PACKAGE_BODY;PM_CFG;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 56');
DROP PACKAGE BODY XXYSS_ADMIN.PM_CFG;

/* SQL statement 57 (DROP;XXYSS_ADMIN;PACKAGE_SPEC;PM;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 57');
DROP PACKAGE XXYSS_ADMIN.PM;

/* SQL statement 58 (DROP;XXYSS_ADMIN;PACKAGE_SPEC;PM_CFG;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 58');
DROP PACKAGE XXYSS_ADMIN.PM_CFG;

/* SQL statement 59 (DROP;XXYSS_ADMIN;SEQUENCE;PM_RUN_SEQ;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 59');
DROP SEQUENCE XXYSS_ADMIN.PM_RUN_SEQ;

/* SQL statement 60 (DROP;XXYSS_ADMIN;TABLE;PM_CONFIG;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 60');
DROP TABLE XXYSS_ADMIN.PM_CONFIG PURGE;

/* SQL statement 61 (DROP;XXYSS_ADMIN;TABLE;PM_RUN;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 61');
DROP TABLE XXYSS_ADMIN.PM_RUN PURGE;

/* SQL statement 62 (DROP;XXYSS_ADMIN;TABLE;PM_SESSION;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 62');
DROP TABLE XXYSS_ADMIN.PM_SESSION PURGE;

/* SQL statement 63 (DROP;XXYSS_ADMIN;TABLE;PM_SESSION_TMP;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 63');
DROP TABLE XXYSS_ADMIN.PM_SESSION_TMP PURGE;

/* SQL statement 64 (DROP;XXYSS_ADMIN;VIEW;PM_VW_SQLAREA;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 64');
DROP VIEW XXYSS_ADMIN.PM_VW_SQLAREA;

/* SQL statement 65 (DROP;XXYSS_ADMIN;TABLE;PM_SQL;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 65');
DROP TABLE XXYSS_ADMIN.PM_SQL PURGE;

/* SQL statement 66 (DROP;XXYSS_ADMIN;TABLE;PM_SQLAREA;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 66');
DROP TABLE XXYSS_ADMIN.PM_SQLAREA PURGE;

/* SQL statement 67 (DROP;XXYSS_ADMIN;TABLE;PM_SQLAREA_TMP;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 67');
DROP TABLE XXYSS_ADMIN.PM_SQLAREA_TMP PURGE;

/* SQL statement 68 (DROP;XXYSS_ADMIN;TABLE;PM_SQL_CURRENT;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 68');
DROP TABLE XXYSS_ADMIN.PM_SQL_CURRENT PURGE;

/* SQL statement 69 (DROP;XXYSS_ADMIN;TABLE;PM_SQL_ID;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 69');
DROP TABLE XXYSS_ADMIN.PM_SQL_ID PURGE;

/* SQL statement 70 (DROP;XXYSS_ADMIN;TABLE;PM_SYSSTAT;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 70');
DROP TABLE XXYSS_ADMIN.PM_SYSSTAT PURGE;

/* SQL statement 71 (DROP;XXYSS_ADMIN;TABLE;PM_SYSSTAT_TMP;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 71');
DROP TABLE XXYSS_ADMIN.PM_SYSSTAT_TMP PURGE;

/* SQL statement 72 (DROP;XXYSS_ADMIN;TABLE;PM_SYSTEM_EVENT;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 72');
DROP TABLE XXYSS_ADMIN.PM_SYSTEM_EVENT PURGE;

/* SQL statement 73 (DROP;XXYSS_ADMIN;TABLE;PM_SYSTEM_EVENT_TMP;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 73');
DROP TABLE XXYSS_ADMIN.PM_SYSTEM_EVENT_TMP PURGE;

