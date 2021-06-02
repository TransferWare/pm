CREATE INDEX "PM_RUN_1" ON "PM_RUN" ("DB", "TIMESTAMP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS";

CREATE UNIQUE INDEX "PM_RUN_PK" ON "PM_RUN" ("DB", "RUN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS";

