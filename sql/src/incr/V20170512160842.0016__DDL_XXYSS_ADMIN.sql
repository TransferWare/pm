/* SQL statement 16 (CREATE;XXYSS_ADMIN;INDEX;PM_SYS_PK;XXYSS_ADMIN;TABLE;PM_SYSSTAT;;;;;2) */
CREATE UNIQUE INDEX "XXYSS_ADMIN"."PM_SYS_PK" ON "XXYSS_ADMIN"."PM_SYSSTAT" ("DB", "RUN_ID", "NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "YSSDATA";
