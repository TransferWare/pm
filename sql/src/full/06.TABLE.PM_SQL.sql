CREATE TABLE "PM_SQL" 
   (	"DB" VARCHAR2(40) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"HASH_VALUE" NUMBER NOT NULL ENABLE, 
	"ADDRESS" VARCHAR2(32) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"SQL_ID" VARCHAR2(13) COLLATE "USING_NLS_COMP" NOT NULL ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS";

