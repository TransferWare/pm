ALTER TABLE "PM_SQLAREA" ADD CONSTRAINT "PM_ARE_RUN_FK1" FOREIGN KEY ("DB", "RUN_ID")
	  REFERENCES "PM_RUN" ("DB", "RUN_ID") ENABLE;

ALTER TABLE "PM_SQLAREA" ADD CONSTRAINT "PM_ARE_SQL_FK1" FOREIGN KEY ("DB", "HASH_VALUE", "ADDRESS")
	  REFERENCES "PM_SQL" ("DB", "HASH_VALUE", "ADDRESS") ENABLE;

