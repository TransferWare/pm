SELECT	/* $Header$ */
        pm_system_event.event
,	sum(pm_system_event.total_waits)		total_waits
,	sum(pm_system_event.total_timeouts)		total_timeouts
,	sum(pm_system_event.time_waited) / 100		time_waited
,	decode
	( 
		sum(pm_system_event.total_waits)
	,	0
	,	-1
	,	sum(pm_system_event.time_waited) / 
		( 100 * sum(pm_system_event.total_waits) ) 
	)						average_wait
FROM	pm_system_event
WHERE	pm_system_event.db = :db
AND	pm_system_event.run_id BETWEEN :lwb_run_id AND :upb_run_id
GROUP BY
	pm_system_event.event
ORDER BY total_waits DESC
