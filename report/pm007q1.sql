select	/* $Header$ */
        pm_session.username
,	sum(pm_sess_io.block_gets)	block_gets
,	sum(pm_sess_io.block_changes)	block_changes
from	pm_sess_io
,	pm_session
where	pm_sess_io.db = :db
and	pm_sess_io.run_id between :lwb_run_id and :upb_run_id
and	pm_session.db = pm_sess_io.db
and	pm_session.run_id = pm_sess_io.run_id
and	pm_session.sid = pm_sess_io.sid
group by
	pm_session.username
having 	sum(pm_sess_io.block_gets) + sum(pm_sess_io.block_changes) >= :minimum
order by 
	sum(pm_sess_io.block_gets) desc
,	sum(pm_sess_io.block_changes) desc
