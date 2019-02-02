
select instance_name from v$instance; 

SHOW PARAMETER NAME;

select * from v$instance;

SHOW PARAMETER DOMAIN;

select TO_CHAR(startup_time,'DD/MM/RR HH24:MI' ) startup_time
from v$instance; 





