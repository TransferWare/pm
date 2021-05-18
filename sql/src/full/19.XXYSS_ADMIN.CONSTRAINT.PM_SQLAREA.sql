ALTER TABLE "XXYSS_ADMIN"."PM_SQLAREA" ADD CONSTRAINT "PM_ARE_CK1" CHECK (
      db = upper(db) and
      run_id >= 1
      ) ENABLE;

ALTER TABLE "XXYSS_ADMIN"."PM_SQLAREA" ADD CONSTRAINT "PM_ARE_CK2" CHECK (
      executions >= 0 and
      buffer_gets >= 0 and
      disk_reads >= 0 and
      parse_calls >= 0 and
      sorts >= 0 and
      kept_versions >= 0 and
      loads >= 0 and
      rows_processed >= 0 and
      invalidations >= 0 and
      direct_writes >= 0 and
      application_wait_time >= 0 and
      concurrency_wait_time >= 0 and
      cluster_wait_time >= 0 and
      user_io_wait_time >= 0 and
      plsql_exec_time >= 0 and
      java_exec_time >= 0 and
      cpu_time >= 0 and
      elapsed_time >= 0
      ) ENABLE;

ALTER TABLE "XXYSS_ADMIN"."PM_SQLAREA" ADD CONSTRAINT "PM_ARE_CK3" CHECK (
      /* at least one must be > 0 */
      executions +
      buffer_gets +
      disk_reads +
      parse_calls +
      sorts +
      kept_versions +
      loads +
      rows_processed +
      invalidations +
      direct_writes +
      application_wait_time +
      concurrency_wait_time +
      cluster_wait_time +
      user_io_wait_time +
      plsql_exec_time +
      java_exec_time +
      cpu_time +
      elapsed_time > 0
      ) ENABLE;

ALTER TABLE "XXYSS_ADMIN"."PM_SQLAREA" ADD CONSTRAINT "PM_ARE_PK" PRIMARY KEY ("DB", "HASH_VALUE", "ADDRESS", "FIRST_LOAD_TIME", "PARSING_USER_NAME", "PARSING_SCHEMA_NAME", "RUN_ID") ENABLE;

