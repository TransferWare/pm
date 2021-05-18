/* SQL statement 24 (CREATE;XXYSS_ADMIN;INDEX;PM_SES_PK;XXYSS_ADMIN;TABLE;PM_SESSION;;;;;2) */
CREATE UNIQUE INDEX "XXYSS_ADMIN"."PM_SES_PK" ON "XXYSS_ADMIN"."PM_SESSION" ("DB", "RUN_ID", "SID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "YSSDATA";

