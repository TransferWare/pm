select  /* $Header$ */
        distinct
	pm_sqlarea.module
,	pm_sqlarea.action
,	pm_sqlarea.parsing_user_name
,	pm_sqlarea.parsing_schema_name
from	pm_sql
,	pm_sqlarea
where	pm_sql.db = :db
and	pm_sqlarea.db = pm_sql.db
and	pm_sqlarea.hash_value = pm_sql.hash_value
and	pm_sqlarea.address = pm_sql.address
and	pm_sql.sql_id = :sql_id
