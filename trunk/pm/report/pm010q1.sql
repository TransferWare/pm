SELECT  /* $Header$ */
        /*+ ORDERED */
	sql_id.sql_id
,	sqlarea.executions 
,	sqlarea.disk_reads 
,	sqlarea.avg_disk_reads 
,	sqlarea.buffer_gets
,	sqlarea.avg_buffer_gets
,	sqlarea.avg_disk_reads / sqlarea.max_disk_reads_per_second
	+ sqlarea.avg_buffer_gets / sqlarea.max_buffer_gets_per_second
	"Response"
,	sql_id.sql_text
FROM	(
		SELECT	/*+ ORDERED */
			pm_sql.sql_id
		,	sum(pm_sqlarea.executions)		executions
		,	sum(pm_sqlarea.disk_reads)		disk_reads
		,	sum(pm_sqlarea.disk_reads)
			/ decode(sum(pm_sqlarea.executions), 0, 1, sum(pm_sqlarea.executions))
								avg_disk_reads
		,	:max_disk_reads_per_second		max_disk_reads_per_second
		,	sum(pm_sqlarea.buffer_gets)		buffer_gets
		,	sum(pm_sqlarea.buffer_gets)
			/ decode(sum(pm_sqlarea.executions), 0, 1, sum(pm_sqlarea.executions))
								avg_buffer_gets
		,	:max_buffer_gets_per_second		max_buffer_gets_per_second
		FROM	pm_sqlarea
		,	pm_sql
		WHERE	pm_sqlarea.db = :db
		AND	pm_sqlarea.db = pm_sql.db
		AND	pm_sqlarea.hash_value = pm_sql.hash_value
		AND	pm_sqlarea.address = pm_sql.address
		AND	pm_sqlarea.run_id BETWEEN :lwb_run_id AND :upb_run_id
		GROUP BY
			pm_sql.sql_id
		HAVING	sum(pm_sqlarea.executions) > 0
	)		sqlarea
,	pm_sql_id 	sql_id
WHERE	sqlarea.sql_id = sql_id.sql_id
AND	sqlarea.avg_disk_reads / sqlarea.max_disk_reads_per_second 
	+ sqlarea.avg_buffer_gets / sqlarea.max_buffer_gets_per_second
	>= :max_response_time
ORDER BY
	(
		sqlarea.avg_disk_reads / sqlarea.max_disk_reads_per_second 
		+ sqlarea.avg_buffer_gets / sqlarea.max_buffer_gets_per_second
	) desc
