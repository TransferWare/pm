select	/* $Header$ */
        pm_sess_io.username
,	sum(pm_sess_io.block_gets)	block_gets
,	sum(pm_sess_io.block_changes)	block_changes
from	pm_sess_io
where	pm_sess_io.db = :db
and	pm_sess_io.run_id between :lwb_run_id and :upb_run_id
group by
	pm_sess_io.username
having 	sum(pm_sess_io.block_gets) + sum(pm_sess_io.block_changes) >= :minimum
order by 
	sum(pm_sess_io.block_gets) desc
,	sum(pm_sess_io.block_changes) desc
