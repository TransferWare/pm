SELECT	/* $Header$ */
        /*+ ORDERED */
	sqltext.sql_text
,	sqlarea.sql_id
,	sqlarea.value
FROM	(
		SELECT	/*+ ORDERED */
			pm_sql.sql_id
		,	sum(pm_sqlarea.executions)	value
		FROM	pm_sqlarea
		,	pm_sql
		WHERE	pm_sqlarea.db = :db
		AND	pm_sqlarea.db = pm_sql.db
		AND	pm_sqlarea.hash_value = pm_sql.hash_value
		AND	pm_sqlarea.address = pm_sql.address
		AND	pm_sqlarea.run_id BETWEEN :lwb_run_id AND :upb_run_id
		GROUP BY
			pm_sql.sql_id
		HAVING 	sum(pm_sqlarea.executions) >= :minimum
	)		sqlarea
,	pm_sql_id	sqltext
WHERE	sqlarea.sql_id = sqltext.sql_id
ORDER BY 
	sqlarea.value
,	sqlarea.sql_id

