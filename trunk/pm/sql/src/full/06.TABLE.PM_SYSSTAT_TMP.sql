CREATE GLOBAL TEMPORARY TABLE "PM_SYSSTAT_TMP" 
   (	"DB" VARCHAR2(40) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"RUN_ID" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(64) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"CLASS" NUMBER NOT NULL ENABLE, 
	"VALUE" NUMBER NOT NULL ENABLE, 
	"STAT_ID" NUMBER
   )  DEFAULT COLLATION "USING_NLS_COMP" ON COMMIT PRESERVE ROWS;

