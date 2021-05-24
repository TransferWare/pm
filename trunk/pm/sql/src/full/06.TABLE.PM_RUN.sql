CREATE TABLE "PM_RUN" 
   (	"DB" VARCHAR2(40) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"RUN_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"TIMESTAMP" DATE NOT NULL ENABLE, 
	"DB_STARTUP_TIME" DATE NOT NULL ENABLE, 
	"ERROR_MSG" VARCHAR2(4000) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP"  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS";

