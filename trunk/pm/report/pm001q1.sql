SELECT	/* $Header$ */
	( sum(pm_sqlarea.buffer_gets) / :cost_memory
	  + sum(pm_sqlarea.disk_reads) / :cost_disk_io )	tot_io
FROM	pm_sqlarea
WHERE	pm_sqlarea.db = :db
AND	pm_sqlarea.run_id BETWEEN :lwb_run_id AND :upb_run_id

