select	/* $Header$ */
        are.parsing_user_name	username
,	sum(are.disk_reads)	disk_reads
,	sum(are.buffer_gets)	buffer_gets
from	pm_sqlarea are
where	are.db = :db
and	are.run_id between :lwb_run_id and :upb_run_id
group by
	are.parsing_user_name
having 	sum(are.disk_reads) + sum(are.buffer_gets) >= :minimum
order by 
	sum(are.disk_reads) desc
,	sum(are.buffer_gets) desc
