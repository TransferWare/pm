CREATE TABLE "XXYSS_ADMIN"."PM_SQL_ID" 
   (	"SQL_ID" VARCHAR2(13) NOT NULL ENABLE, 
	"COMMAND_TYPE" NUMBER NOT NULL ENABLE, 
	"CREATED_BY" VARCHAR2(30) NOT NULL ENABLE, 
	"CREATION_DATE" DATE NOT NULL ENABLE, 
	"MODIFIED_BY" VARCHAR2(30), 
	"MODIFICATION_DATE" DATE, 
	"SQL_TEXT" CLOB NOT NULL ENABLE
   )  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "YSSDATA" 
 LOB ("SQL_TEXT") STORE AS SECUREFILE (
  TABLESPACE "YSSDATA" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES );

