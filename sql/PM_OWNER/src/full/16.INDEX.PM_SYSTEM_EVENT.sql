CREATE UNIQUE INDEX "PM_SEV_PK" ON "PM_SYSTEM_EVENT" ("DB", "RUN_ID", "EVENT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS";

