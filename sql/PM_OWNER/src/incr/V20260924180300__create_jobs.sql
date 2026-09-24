begin
  dbms_scheduler.create_job
  ( job_name => 'PM_CLEANUP'
  , job_type => 'PLSQL_BLOCK'
  , job_action => 'begin pm.cleanup(null, 14); end;'
  , repeat_interval => 'FREQ=DAILY;BYHOUR=1;BYMINUTE=30;'
  , enabled => true
  , auto_drop => false
  );
end;
/

begin
  dbms_scheduler.create_job
  ( job_name => 'PM_COLLECT'
  , job_type => 'PLSQL_BLOCK'
  , job_action => 'begin pm.collect(null); end;'
  , repeat_interval => 'FREQ=HOURLY;BYMINUTE=0;BYSECOND=0;'
  , enabled => true
  , auto_drop => false
  );
end;
/
