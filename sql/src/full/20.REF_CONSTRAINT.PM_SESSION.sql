ALTER TABLE "PM_SESSION" ADD CONSTRAINT "PM_SES_RUN_FK1" FOREIGN KEY ("DB", "RUN_ID")
	  REFERENCES "PM_RUN" ("DB", "RUN_ID") ENABLE;

ALTER TABLE "PM_SESSION" ADD CONSTRAINT "PM_SES_SQL_FK1" FOREIGN KEY ("DB", "SQL_HASH_VALUE", "SQL_ADDRESS")
	  REFERENCES "PM_SQL" ("DB", "HASH_VALUE", "ADDRESS") ENABLE;

