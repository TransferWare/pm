select  /*+ ORDERED */
        trunc( run.timestamp, :p_display_time_format ) "Time"
,       sum(sys."Logical Reads") "Logical Reads"
,       sum(sys."Physical Reads") "Physical Reads"
,       ( ( sum(sys."Logical Reads") - sum(sys."Physical Reads") ) * 100.000 ) / sum(sys."Logical Reads") "Hit Ratio" 
from    pm_run          run
,       (
                select  sys.db
                ,       sys.run_id
                ,       sum(decode(sys.statistic#, :p_consistent_gets, sys.value, 0)) 
                        + sum(decode(sys.statistic#, :p_db_block_gets, sys.value, 0))  "Logical Reads"
                ,       sum(decode(sys.statistic#, :p_physical_reads, sys.value, 0))  "Physical Reads"
                from    pm_sysstat sys
                where   sys.db = :p_db
                group by
                        sys.db
                ,       sys.run_id
        )       sys
where   /* join conditions */
        sys.db = run.db
and     sys.run_id = run.run_id
        /* non-join conditions */
and     run.timestamp >= to_date( :p_start_time, :p_date_format ) 
and     run.timestamp <  to_date( :p_end_time, :p_date_format )
group by
        trunc( run.timestamp, :p_display_time_format )
order by
        trunc( run.timestamp, :p_display_time_format )

