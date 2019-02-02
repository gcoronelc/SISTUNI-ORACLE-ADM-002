
select * from v$tablespace;


create user demo identified by demo;

grant connect, resource to demo;


select tablespace_name, file_name
from dba_data_files;


select tablespace_name, file_name
from dba_temp_files;

grant sysdba to system;


select banner from x$version;

show user;

alter user scott
identified by tiger
account unlock;

select * from col$;



