select
    SID, SERIAL#,
    SID || ',' || SERIAL# ID,
    status, blocking_session, MACHINE
from v$session
where username = 'SCOTT';

ALTER SYSTEM KILL SESSION '170,7' IMMEDIATE;

