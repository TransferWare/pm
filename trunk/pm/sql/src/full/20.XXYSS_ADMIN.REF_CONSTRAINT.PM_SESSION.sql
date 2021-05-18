ALTER TABLE "XXYSS_ADMIN"."PM_SESSION" ADD CONSTRAINT "PM_SES_RUN_FK1" FOREIGN KEY ("DB", "RUN_ID")
	  REFERENCES "XXYSS_ADMIN"."PM_RUN" ("DB", "RUN_ID") ENABLE;

ALTER TABLE "XXYSS_ADMIN"."PM_SESSION" ADD CONSTRAINT "PM_SES_SQL_FK1" FOREIGN KEY ("DB", "SQL_HASH_VALUE", "SQL_ADDRESS")
	  REFERENCES "XXYSS_ADMIN"."PM_SQL" ("DB", "HASH_VALUE", "ADDRESS") ENABLE;

