CREATE OR REPLACE VIEW "PM_VW_SQLAREA" ("DB", "RUN_ID", "SQL_ID", "SORTS", "EXECUTIONS", "LOADS", "PARSE_CALLS", "DISK_READS", "BUFFER_GETS", "ROWS_PROCESSED", "KEPT_VERSIONS") DEFAULT COLLATION "USING_NLS_COMP"  AS 
  SELECT
     	/* $Header$ */                                   
     	/*+ ordered index(are pm_are_1) use_nl(are) */   
     	are.db                                           
     ,	are.run_id                                      
     ,	sql.sql_id                                      
     ,	sum(are.sorts)		sorts                           
     ,	sum(are.executions)	executions                  
     ,	sum(are.loads)		loads                           
     ,	sum(are.parse_calls)	parse_calls                
     ,	sum(are.disk_reads)	disk_reads                  
     ,	sum(are.buffer_gets)	buffer_gets                
     ,	sum(are.rows_processed)	rows_processed          
     ,	sum(are.kept_versions)	kept_versions            
 from	pm_sql		sql
 ,	pm_sqlarea	are
 where	are.db = sql.db
 and	are.hash_value = sql.hash_value
 and	are.address = sql.address
 group by
 	are.db
 , 	are.run_id
 , 	sql.sql_id;

