/* perl generate_ddl.pl (version 939) --nodynamic-sql --force-view --noremove-output-directory --skip-install-sql */

-- JDBC url            : jdbc:oracle:thin:PRXY[XXYSS_ADMIN]@//ora2-ystar.mycaliber.global:1521/tseko
-- source schema       : XXYSS_ADMIN
-- source database link: XXYSS_ADMIN@devseko1
-- target schema       : XXYSS_ADMIN
-- target database link: 
-- object type         : 
-- object names include: 1
/* object names        : ,PM
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
,PM_VW_SQLAREA*/
-- skip repeatables    : 1
-- interface           : pkg_ddl_util v4

-- pkg_ddl_util v4
/* SQL statement 1 (CREATE;XXYSS_ADMIN;TABLE;PM_SYSTEM_EVENT_TMP;;;;;;;;2) */
begin
  execute immediate '
CREATE GLOBAL TEMPORARY TABLE "XXYSS_ADMIN"."PM_SYSTEM_EVENT_TMP" 
   (	"DB" VARCHAR2(40) NOT NULL ENABLE, 
	"RUN_ID" NUMBER NOT NULL ENABLE, 
	"EVENT" VARCHAR2(64) NOT NULL ENABLE, 
	"TOTAL_WAITS" NUMBER, 
	"TOTAL_TIMEOUTS" NUMBER, 
	"TIME_WAITED" NUMBER, 
	"AVERAGE_WAIT" NUMBER, 
	"TIME_WAITED_MICRO" NUMBER, 
	"EVENT_ID" NUMBER, 
	"WAIT_CLASS_ID" NUMBER, 
	"WAIT_CLASS#" NUMBER, 
	"WAIT_CLASS" VARCHAR2(64)
   ) ON COMMIT PRESERVE ROWS';
end;
/

