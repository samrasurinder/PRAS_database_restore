set line 120
select a.name,a.open_mode,b.host_name from v$database a,v$instance b where a.name=b.instance_name;
col comp_id format a10
col comp_name format a50
col version format a15
col status format a14
select substr(comp_id,1,15) comp_id,substr(comp_name,1,30) comp_name,substr(version,1,10) version,status from dba_registry;
