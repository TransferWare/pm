SELECT	/* $Header$ */ 
        /*+ ORDERED */
	sqlarea.executions 
,       sqlarea.loads
,       sqlarea.rows_processed
,	sqlarea.buffer_gets
,	sqlarea.disk_reads
,	sqlarea.sql_io	total
,	( 100 * sqlarea.sql_io ) / sqlarea.total_io percentage
,       sqltext.sql_id
,	sqltext.sql_text
FROM	(	SELECT	/*+ ORDERED */
			( sum(pm_sqlarea.buffer_gets) / :cost_memory 
			  + sum(pm_sqlarea.disk_reads) / :cost_disk_io ) 	sql_io
		,	:tot_io							total_io
		,	pm_sql.sql_id
		,	sum(pm_sqlarea.buffer_gets)				buffer_gets
		,	sum(pm_sqlarea.disk_reads)				disk_reads
                ,       sum(pm_sqlarea.executions)                              executions 
                ,       sum(pm_sqlarea.loads)                                   loads
                ,       sum(pm_sqlarea.rows_processed)                          rows_processed     
		FROM	pm_sqlarea
		,	pm_sql
		WHERE	pm_sqlarea.db = :db
		AND	pm_sqlarea.db = pm_sql.db
		AND	pm_sqlarea.hash_value = pm_sql.hash_value
		AND	pm_sqlarea.address = pm_sql.address
		AND	pm_sqlarea.run_id BETWEEN :lwb_run_id AND :upb_run_id
		GROUP BY
			pm_sql.sql_id
	)		sqlarea
,	pm_sql_id	sqltext
WHERE	sqlarea.sql_id = sqltext.sql_id
AND	( 100 * sqlarea.sql_io ) / sqlarea.total_io >= :perc
ORDER BY 
	sqlarea.sql_io desc /* PR-579 */
,	sqltext.sql_id

