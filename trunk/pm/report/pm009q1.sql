select	/* $Header$ */
        sqlarea.sql_id
,	sqlarea.executions
,	sqlarea.rows_processed
,	sqltext.sql_text
from	(
		select	pm_vw_sqlarea.sql_id
		,	sum(pm_vw_sqlarea.executions)		executions
		,	sum(pm_vw_sqlarea.rows_processed)	rows_processed
		from	pm_vw_sqlarea
		where	pm_vw_sqlarea.db = :db
		and	pm_vw_sqlarea.run_id between :lwb_run_id and :upb_run_id
		group by
			pm_vw_sqlarea.sql_id
		having 	sum(pm_vw_sqlarea.executions) >= 
			greatest(:minimum, sum(pm_vw_sqlarea.rows_processed))
	)	sqlarea
,	pm_sql_id	sqltext
where	sqltext.sql_id = sqlarea.sql_id
order by 
	sqlarea.executions
,	sqlarea.sql_id
