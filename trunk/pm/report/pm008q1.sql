select	/* $Header$ */
        decode
	(
		v$statname.class
	,	1
	,	'User'
	,	2
	,	'Redo'
	,	4
	,	'Enqueue'
	,	8
	,	'Cache'
	,	16
	,	'OS'
	,	32
	,	'Parallel Server'
	,	64
	,	'SQL'
	,	128
	,	'Debug'
	,	'Unknown'
	)	class
,	v$statname.name
,	sysstat.value
from	(
		select	pm_sysstat.statistic#
		,	sum(pm_sysstat.value)	value
		from	pm_sysstat
		where	pm_sysstat.db = :db
		and	pm_sysstat.run_id between :lwb_run_id and :upb_run_id
		group by 
			pm_sysstat.statistic#
	)	sysstat
,	v$statname
where	v$statname.statistic# = sysstat.statistic#
order by 
	v$statname.class
,	v$statname.name
