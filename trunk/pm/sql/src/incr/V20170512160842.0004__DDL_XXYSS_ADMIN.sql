/* SQL statement 4 (CREATE;XXYSS_ADMIN;TABLE;PM_SYSSTAT;;;;;;;;2) */
CREATE TABLE "XXYSS_ADMIN"."PM_SYSSTAT" 
   (	"DB" VARCHAR2(40) NOT NULL ENABLE, 
	"RUN_ID" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(64) NOT NULL ENABLE, 
	"CLASS" NUMBER NOT NULL ENABLE, 
	"VALUE" NUMBER NOT NULL ENABLE, 
	"STAT_ID" NUMBER
   )  
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "YSSDATA";

