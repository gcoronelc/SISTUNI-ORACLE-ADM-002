-- AGREGAR UN NUEVO ARCHIVO AL UN GRUPO

-- CONDICION
-- EL GRUPO DEBE ESTAR INACTIVO

SELECT * FROM V$LOG;

ALTER SYSTEM SWITCH LOGFILE;


ALTER DATABASE 
ADD LOGFILE MEMBER 'C:\app\Alumno\oradata\orcl\REDO01B.LOG'
TO GROUP 1;



