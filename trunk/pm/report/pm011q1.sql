select	/* $Header$ */
        txt.substr_text
,	count(*)	substr_count
from	(
		select	substr( sql.sql_text, 1, :substr_length ) substr_text
		from	pm_sql_id sql
	)	txt
group by
	txt.substr_text
having	count(*) >= :substr_count
order by
	count(*)
