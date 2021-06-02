/* perl generate_ddl.pl (version 1099) --nodynamic-sql --force-view --noremove-output-directory --skip-install-sql */

/*
-- JDBC url            : jdbc:oracle:thin:PM_OWNER@//localhost:1521/orcl
-- source schema       : 
-- source database link: 
-- target schema       : PM_OWNER
-- target database link: 
-- object type         : 
-- object names include: 1
-- object names        : PM
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
-- owner               : ORACLE_TOOLS
*/
-- pkg_ddl_util v4
call dbms_application_info.set_module('uninstall.sql', null);
/* SQL statement 1 (DROP;PM_OWNER;SEQUENCE;PM_SQL_SEQ;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 1');
DROP SEQUENCE PM_OWNER.PM_SQL_SEQ;

/* SQL statement 2 (DROP;PM_OWNER;PACKAGE_SPEC;PM_MPI;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 2');
DROP PACKAGE PM_OWNER.PM_MPI;

/* SQL statement 3 (DROP;PM_OWNER;PACKAGE_SPEC;PM_DPI;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 3');
DROP PACKAGE PM_OWNER.PM_DPI;

/* SQL statement 4 (ALTER;PM_OWNER;CONSTRAINT;PM_SYS_CK2;PM_OWNER;TABLE;PM_SYSSTAT;;;;;2) */
call dbms_application_info.set_action('SQL statement 4');
ALTER TABLE "PM_OWNER"."PM_SYSSTAT" DROP CONSTRAINT PM_SYS_CK2;

/* SQL statement 5 (ALTER;PM_OWNER;CONSTRAINT;PM_SYS_CK1;PM_OWNER;TABLE;PM_SYSSTAT;;;;;2) */
call dbms_application_info.set_action('SQL statement 5');
ALTER TABLE "PM_OWNER"."PM_SYSSTAT" DROP CONSTRAINT PM_SYS_CK1;

/* SQL statement 6 (ALTER;PM_OWNER;CONSTRAINT;PM_SQL_CK1;PM_OWNER;TABLE;PM_SQL;;;;;2) */
call dbms_application_info.set_action('SQL statement 6');
ALTER TABLE "PM_OWNER"."PM_SQL" DROP CONSTRAINT PM_SQL_CK1;

/* SQL statement 7 (ALTER;PM_OWNER;CONSTRAINT;PM_SEV_CK2;PM_OWNER;TABLE;PM_SYSTEM_EVENT;;;;;2) */
call dbms_application_info.set_action('SQL statement 7');
ALTER TABLE "PM_OWNER"."PM_SYSTEM_EVENT" DROP CONSTRAINT PM_SEV_CK2;

/* SQL statement 8 (ALTER;PM_OWNER;CONSTRAINT;PM_SEV_CK1;PM_OWNER;TABLE;PM_SYSTEM_EVENT;;;;;2) */
call dbms_application_info.set_action('SQL statement 8');
ALTER TABLE "PM_OWNER"."PM_SYSTEM_EVENT" DROP CONSTRAINT PM_SEV_CK1;

/* SQL statement 9 (ALTER;PM_OWNER;CONSTRAINT;PM_SES_CK2;PM_OWNER;TABLE;PM_SESSION;;;;;2) */
call dbms_application_info.set_action('SQL statement 9');
ALTER TABLE "PM_OWNER"."PM_SESSION" DROP CONSTRAINT PM_SES_CK2;

/* SQL statement 10 (ALTER;PM_OWNER;CONSTRAINT;PM_SES_CK1;PM_OWNER;TABLE;PM_SESSION;;;;;2) */
call dbms_application_info.set_action('SQL statement 10');
ALTER TABLE "PM_OWNER"."PM_SESSION" DROP CONSTRAINT PM_SES_CK1;

/* SQL statement 11 (ALTER;PM_OWNER;CONSTRAINT;PM_RUN_CK1;PM_OWNER;TABLE;PM_RUN;;;;;2) */
call dbms_application_info.set_action('SQL statement 11');
ALTER TABLE "PM_OWNER"."PM_RUN" DROP CONSTRAINT PM_RUN_CK1;

/* SQL statement 12 (ALTER;PM_OWNER;CONSTRAINT;PM_ARE_CK3;PM_OWNER;TABLE;PM_SQLAREA;;;;;2) */
call dbms_application_info.set_action('SQL statement 12');
ALTER TABLE "PM_OWNER"."PM_SQLAREA" DROP CONSTRAINT PM_ARE_CK3;

/* SQL statement 13 (ALTER;PM_OWNER;CONSTRAINT;PM_ARE_CK2;PM_OWNER;TABLE;PM_SQLAREA;;;;;2) */
call dbms_application_info.set_action('SQL statement 13');
ALTER TABLE "PM_OWNER"."PM_SQLAREA" DROP CONSTRAINT PM_ARE_CK2;

/* SQL statement 14 (ALTER;PM_OWNER;CONSTRAINT;PM_ARE_CK1;PM_OWNER;TABLE;PM_SQLAREA;;;;;2) */
call dbms_application_info.set_action('SQL statement 14');
ALTER TABLE "PM_OWNER"."PM_SQLAREA" DROP CONSTRAINT PM_ARE_CK1;

/* SQL statement 15 (ALTER;PM_OWNER;CONSTRAINT;PM_ARE_PK;PM_OWNER;TABLE;PM_SQLAREA;;;;;2) */
call dbms_application_info.set_action('SQL statement 15');
ALTER TABLE "PM_OWNER"."PM_SQLAREA" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 16 (ALTER;PM_OWNER;CONSTRAINT;PM_CUR_PK;PM_OWNER;TABLE;PM_SQL_CURRENT;;;;;2) */
call dbms_application_info.set_action('SQL statement 16');
ALTER TABLE "PM_OWNER"."PM_SQL_CURRENT" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 17 (ALTER;PM_OWNER;REF_CONSTRAINT;PM_ARE_RUN_FK1;PM_OWNER;TABLE;PM_SQLAREA;;;;;2) */
call dbms_application_info.set_action('SQL statement 17');
ALTER TABLE "PM_OWNER"."PM_SQLAREA" DROP CONSTRAINT PM_ARE_RUN_FK1;

/* SQL statement 18 (ALTER;PM_OWNER;REF_CONSTRAINT;PM_SES_RUN_FK1;PM_OWNER;TABLE;PM_SESSION;;;;;2) */
call dbms_application_info.set_action('SQL statement 18');
ALTER TABLE "PM_OWNER"."PM_SESSION" DROP CONSTRAINT PM_SES_RUN_FK1;

/* SQL statement 19 (ALTER;PM_OWNER;REF_CONSTRAINT;PM_SEV_RUN_FK1;PM_OWNER;TABLE;PM_SYSTEM_EVENT;;;;;2) */
call dbms_application_info.set_action('SQL statement 19');
ALTER TABLE "PM_OWNER"."PM_SYSTEM_EVENT" DROP CONSTRAINT PM_SEV_RUN_FK1;

/* SQL statement 20 (ALTER;PM_OWNER;REF_CONSTRAINT;PM_SYS_RUN_FK1;PM_OWNER;TABLE;PM_SYSSTAT;;;;;2) */
call dbms_application_info.set_action('SQL statement 20');
ALTER TABLE "PM_OWNER"."PM_SYSSTAT" DROP CONSTRAINT PM_SYS_RUN_FK1;

/* SQL statement 21 (ALTER;PM_OWNER;CONSTRAINT;PM_RUN_PK;PM_OWNER;TABLE;PM_RUN;;;;;2) */
call dbms_application_info.set_action('SQL statement 21');
ALTER TABLE "PM_OWNER"."PM_RUN" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 22 (ALTER;PM_OWNER;CONSTRAINT;PM_SES_PK;PM_OWNER;TABLE;PM_SESSION;;;;;2) */
call dbms_application_info.set_action('SQL statement 22');
ALTER TABLE "PM_OWNER"."PM_SESSION" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 23 (ALTER;PM_OWNER;CONSTRAINT;PM_SET_PK;PM_OWNER;TABLE;PM_SYSTEM_EVENT_TMP;;;;;2) */
call dbms_application_info.set_action('SQL statement 23');
ALTER TABLE "PM_OWNER"."PM_SYSTEM_EVENT_TMP" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 24 (ALTER;PM_OWNER;CONSTRAINT;PM_SEV_PK;PM_OWNER;TABLE;PM_SYSTEM_EVENT;;;;;2) */
call dbms_application_info.set_action('SQL statement 24');
ALTER TABLE "PM_OWNER"."PM_SYSTEM_EVENT" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 25 (ALTER;PM_OWNER;REF_CONSTRAINT;PM_SQL_SID_FK1;PM_OWNER;TABLE;PM_SQL;;;;;2) */
call dbms_application_info.set_action('SQL statement 25');
ALTER TABLE "PM_OWNER"."PM_SQL" DROP CONSTRAINT PM_SQL_SID_FK1;

/* SQL statement 26 (ALTER;PM_OWNER;CONSTRAINT;PM_SID_PK;PM_OWNER;TABLE;PM_SQL_ID;;;;;2) */
call dbms_application_info.set_action('SQL statement 26');
ALTER TABLE "PM_OWNER"."PM_SQL_ID" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 27 (ALTER;PM_OWNER;REF_CONSTRAINT;PM_ARE_SQL_FK1;PM_OWNER;TABLE;PM_SQLAREA;;;;;2) */
call dbms_application_info.set_action('SQL statement 27');
ALTER TABLE "PM_OWNER"."PM_SQLAREA" DROP CONSTRAINT PM_ARE_SQL_FK1;

/* SQL statement 28 (ALTER;PM_OWNER;REF_CONSTRAINT;PM_SES_SQL_FK1;PM_OWNER;TABLE;PM_SESSION;;;;;2) */
call dbms_application_info.set_action('SQL statement 28');
ALTER TABLE "PM_OWNER"."PM_SESSION" DROP CONSTRAINT PM_SES_SQL_FK1;

/* SQL statement 29 (ALTER;PM_OWNER;CONSTRAINT;PM_SQL_PK;PM_OWNER;TABLE;PM_SQL;;;;;2) */
call dbms_application_info.set_action('SQL statement 29');
ALTER TABLE "PM_OWNER"."PM_SQL" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 30 (ALTER;PM_OWNER;CONSTRAINT;PM_STP_PK;PM_OWNER;TABLE;PM_SESSION_TMP;;;;;2) */
call dbms_application_info.set_action('SQL statement 30');
ALTER TABLE "PM_OWNER"."PM_SESSION_TMP" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 31 (ALTER;PM_OWNER;CONSTRAINT;PM_SYS_PK;PM_OWNER;TABLE;PM_SYSSTAT;;;;;2) */
call dbms_application_info.set_action('SQL statement 31');
ALTER TABLE "PM_OWNER"."PM_SYSSTAT" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 32 (ALTER;PM_OWNER;CONSTRAINT;PM_SYT_PK;PM_OWNER;TABLE;PM_SYSSTAT_TMP;;;;;2) */
call dbms_application_info.set_action('SQL statement 32');
ALTER TABLE "PM_OWNER"."PM_SYSSTAT_TMP" DROP PRIMARY KEY KEEP INDEX;

/* SQL statement 33 (DROP;PM_OWNER;INDEX;PM_ARE_PK;PM_OWNER;TABLE;PM_SQLAREA;;;;;2) */
call dbms_application_info.set_action('SQL statement 33');
DROP INDEX PM_OWNER.PM_ARE_PK;

/* SQL statement 34 (DROP;PM_OWNER;INDEX;PM_ART_1;PM_OWNER;TABLE;PM_SQLAREA_TMP;;;;;2) */
call dbms_application_info.set_action('SQL statement 34');
DROP INDEX PM_OWNER.PM_ART_1;

/* SQL statement 35 (DROP;PM_OWNER;INDEX;PM_CUR_PK;PM_OWNER;TABLE;PM_SQL_CURRENT;;;;;2) */
call dbms_application_info.set_action('SQL statement 35');
DROP INDEX PM_OWNER.PM_CUR_PK;

/* SQL statement 36 (DROP;PM_OWNER;INDEX;PM_RUN_1;PM_OWNER;TABLE;PM_RUN;;;;;2) */
call dbms_application_info.set_action('SQL statement 36');
DROP INDEX PM_OWNER.PM_RUN_1;

/* SQL statement 37 (DROP;PM_OWNER;INDEX;PM_RUN_PK;PM_OWNER;TABLE;PM_RUN;;;;;2) */
call dbms_application_info.set_action('SQL statement 37');
DROP INDEX PM_OWNER.PM_RUN_PK;

/* SQL statement 38 (DROP;PM_OWNER;INDEX;PM_SES_PK;PM_OWNER;TABLE;PM_SESSION;;;;;2) */
call dbms_application_info.set_action('SQL statement 38');
DROP INDEX PM_OWNER.PM_SES_PK;

/* SQL statement 39 (DROP;PM_OWNER;INDEX;PM_SES_SQL_FK1_FRGN;PM_OWNER;TABLE;PM_SESSION;;;;;2) */
call dbms_application_info.set_action('SQL statement 39');
DROP INDEX PM_OWNER.PM_SES_SQL_FK1_FRGN;

/* SQL statement 40 (DROP;PM_OWNER;INDEX;PM_SET_PK;PM_OWNER;TABLE;PM_SYSTEM_EVENT_TMP;;;;;2) */
call dbms_application_info.set_action('SQL statement 40');
DROP INDEX PM_OWNER.PM_SET_PK;

/* SQL statement 41 (DROP;PM_OWNER;INDEX;PM_SEV_PK;PM_OWNER;TABLE;PM_SYSTEM_EVENT;;;;;2) */
call dbms_application_info.set_action('SQL statement 41');
DROP INDEX PM_OWNER.PM_SEV_PK;

/* SQL statement 42 (DROP;PM_OWNER;INDEX;PM_SID_PK;PM_OWNER;TABLE;PM_SQL_ID;;;;;2) */
call dbms_application_info.set_action('SQL statement 42');
DROP INDEX PM_OWNER.PM_SID_PK;

/* SQL statement 43 (DROP;PM_OWNER;INDEX;PM_SQL_PK;PM_OWNER;TABLE;PM_SQL;;;;;2) */
call dbms_application_info.set_action('SQL statement 43');
DROP INDEX PM_OWNER.PM_SQL_PK;

/* SQL statement 44 (DROP;PM_OWNER;INDEX;PM_SQL_SID_FK1_FRGN;PM_OWNER;TABLE;PM_SQL;;;;;2) */
call dbms_application_info.set_action('SQL statement 44');
DROP INDEX PM_OWNER.PM_SQL_SID_FK1_FRGN;

/* SQL statement 45 (DROP;PM_OWNER;INDEX;PM_STP_PK;PM_OWNER;TABLE;PM_SESSION_TMP;;;;;2) */
call dbms_application_info.set_action('SQL statement 45');
DROP INDEX PM_OWNER.PM_STP_PK;

/* SQL statement 46 (DROP;PM_OWNER;INDEX;PM_SYS_PK;PM_OWNER;TABLE;PM_SYSSTAT;;;;;2) */
call dbms_application_info.set_action('SQL statement 46');
DROP INDEX PM_OWNER.PM_SYS_PK;

/* SQL statement 47 (DROP;PM_OWNER;INDEX;PM_SYT_PK;PM_OWNER;TABLE;PM_SYSSTAT_TMP;;;;;2) */
call dbms_application_info.set_action('SQL statement 47');
DROP INDEX PM_OWNER.PM_SYT_PK;

/* SQL statement 48 (DROP;PM_OWNER;PACKAGE_BODY;PM;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 48');
DROP PACKAGE BODY PM_OWNER.PM;

/* SQL statement 49 (DROP;PM_OWNER;PACKAGE_SPEC;PM;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 49');
DROP PACKAGE PM_OWNER.PM;

/* SQL statement 50 (DROP;PM_OWNER;SEQUENCE;PM_RUN_SEQ;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 50');
DROP SEQUENCE PM_OWNER.PM_RUN_SEQ;

/* SQL statement 51 (DROP;PM_OWNER;TABLE;PM_RUN;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 51');
DROP TABLE PM_OWNER.PM_RUN PURGE;

/* SQL statement 52 (DROP;PM_OWNER;TABLE;PM_SESSION;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 52');
DROP TABLE PM_OWNER.PM_SESSION PURGE;

/* SQL statement 53 (DROP;PM_OWNER;TABLE;PM_SESSION_TMP;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 53');
DROP TABLE PM_OWNER.PM_SESSION_TMP PURGE;

/* SQL statement 54 (DROP;PM_OWNER;VIEW;PM_VW_SQLAREA;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 54');
DROP VIEW PM_OWNER.PM_VW_SQLAREA;

/* SQL statement 55 (DROP;PM_OWNER;TABLE;PM_SQL;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 55');
DROP TABLE PM_OWNER.PM_SQL PURGE;

/* SQL statement 56 (DROP;PM_OWNER;TABLE;PM_SQLAREA;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 56');
DROP TABLE PM_OWNER.PM_SQLAREA PURGE;

/* SQL statement 57 (DROP;PM_OWNER;TABLE;PM_SQLAREA_TMP;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 57');
DROP TABLE PM_OWNER.PM_SQLAREA_TMP PURGE;

/* SQL statement 58 (DROP;PM_OWNER;TABLE;PM_SQL_CURRENT;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 58');
DROP TABLE PM_OWNER.PM_SQL_CURRENT PURGE;

/* SQL statement 59 (DROP;PM_OWNER;TABLE;PM_SQL_ID;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 59');
DROP TABLE PM_OWNER.PM_SQL_ID PURGE;

/* SQL statement 60 (DROP;PM_OWNER;TABLE;PM_SYSSTAT;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 60');
DROP TABLE PM_OWNER.PM_SYSSTAT PURGE;

/* SQL statement 61 (DROP;PM_OWNER;TABLE;PM_SYSSTAT_TMP;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 61');
DROP TABLE PM_OWNER.PM_SYSSTAT_TMP PURGE;

/* SQL statement 62 (DROP;PM_OWNER;TABLE;PM_SYSTEM_EVENT;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 62');
DROP TABLE PM_OWNER.PM_SYSTEM_EVENT PURGE;

/* SQL statement 63 (DROP;PM_OWNER;TABLE;PM_SYSTEM_EVENT_TMP;;;;;;;;2) */
call dbms_application_info.set_action('SQL statement 63');
DROP TABLE PM_OWNER.PM_SYSTEM_EVENT_TMP PURGE;

