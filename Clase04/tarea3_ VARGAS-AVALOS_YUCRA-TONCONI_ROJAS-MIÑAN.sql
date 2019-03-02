SELECT * FROM V$LOG;

ALTER DATABASE DROP LOGFILE GROUP 1;

ALTER DATABASE 
ADD LOGFILE GROUP 1
(
'G:\app\Alumno\oradata\orcl\REDO01A.LOG',
'G:\app\Alumno\oradata\orcl\REDO01B.LOG'
)
SIZE 100 M;
--------------------------------------------
ALTER DATABASE DROP LOGFILE GROUP 3;

SELECT * FROM V$LOG;

ALTER DATABASE 
ADD LOGFILE GROUP 3
(
'G:\app\Alumno\oradata\orcl\REDO03A.LOG',
'G:\app\Alumno\oradata\orcl\REDO03B.LOG'
)
SIZE 100 M;
--------------------------------------------
ALTER SYSTEM SWITCH LOGFILE;

SELECT * FROM V$LOG;

ALTER DATABASE DROP LOGFILE GROUP 2;

ALTER DATABASE 
ADD LOGFILE GROUP 2
(
'G:\app\Alumno\oradata\orcl\REDO02A.LOG',
'G:\app\Alumno\oradata\orcl\REDO02B.LOG'
)
SIZE 100 M;


