alter database drop logfile group 1;
alter database drop logfile group 2;
alter database drop logfile group 3;


alter database
add logfile group 1
(
'C:\APP\ALUMNO\ORADATA\ORCL\REDO01X.LOG',
'C:\APP\ALUMNO\ORADATA\ORCL\REDO01Y.LOG'
)
size 100 M;

alter database
add logfile group 2
(
'C:\APP\ALUMNO\ORADATA\ORCL\REDO02X.LOG',
'C:\APP\ALUMNO\ORADATA\ORCL\REDO02Y.LOG'
)
size 100 M;

alter database
add logfile group 3
(
'C:\APP\ALUMNO\ORADATA\ORCL\REDO03X.LOG',
'C:\APP\ALUMNO\ORADATA\ORCL\REDO03Y.LOG'
)
size 100 M;

select group#, member from v$logfile
order by 1,2;