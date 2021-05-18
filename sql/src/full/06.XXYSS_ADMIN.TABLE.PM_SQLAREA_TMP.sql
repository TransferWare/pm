CREATE GLOBAL TEMPORARY TABLE "XXYSS_ADMIN"."PM_SQLAREA_TMP" 
   (	"DB" VARCHAR2(40) NOT NULL ENABLE, 
	"FIRST_LOAD_TIME" DATE NOT NULL ENABLE, 
	"HASH_VALUE" NUMBER NOT NULL ENABLE, 
	"ADDRESS" VARCHAR2(32) NOT NULL ENABLE, 
	"PARSING_USER_NAME" VARCHAR2(30) NOT NULL ENABLE, 
	"PARSING_SCHEMA_NAME" VARCHAR2(30) NOT NULL ENABLE, 
	"RUN_ID" NUMBER NOT NULL ENABLE, 
	"EXECUTIONS" NUMBER, 
	"BUFFER_GETS" NUMBER, 
	"DISK_READS" NUMBER, 
	"PARSE_CALLS" NUMBER, 
	"SORTS" NUMBER, 
	"KEPT_VERSIONS" NUMBER, 
	"LOADS" NUMBER, 
	"ROWS_PROCESSED" NUMBER, 
	"INVALIDATIONS" NUMBER, 
	"MODULE" VARCHAR2(48), 
	"ACTION" VARCHAR2(32), 
	"SQL_TEXT" CLOB, 
	"COMMAND_TYPE" NUMBER, 
	"SQL_ID" VARCHAR2(13) NOT NULL ENABLE, 
	"DIRECT_WRITES" NUMBER, 
	"APPLICATION_WAIT_TIME" NUMBER, 
	"CONCURRENCY_WAIT_TIME" NUMBER, 
	"CLUSTER_WAIT_TIME" NUMBER, 
	"USER_IO_WAIT_TIME" NUMBER, 
	"PLSQL_EXEC_TIME" NUMBER, 
	"JAVA_EXEC_TIME" NUMBER, 
	"CPU_TIME" NUMBER, 
	"ELAPSED_TIME" NUMBER, 
	"SQL_PROFILE" VARCHAR2(64), 
	"PROGRAM_NAME" VARCHAR2(128), 
	"PROGRAM_LINE#" NUMBER
   ) ON COMMIT PRESERVE ROWS;

