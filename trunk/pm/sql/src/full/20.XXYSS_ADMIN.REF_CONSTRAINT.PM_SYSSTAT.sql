ALTER TABLE "XXYSS_ADMIN"."PM_SYSSTAT" ADD CONSTRAINT "PM_SYS_RUN_FK1" FOREIGN KEY ("DB", "RUN_ID")
	  REFERENCES "XXYSS_ADMIN"."PM_RUN" ("DB", "RUN_ID") ENABLE;

