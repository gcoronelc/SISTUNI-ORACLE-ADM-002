--AUDITORIA --
/***- Definir la auditoria al sistema*/
--VERIFICAR SI LA AUDITORIA ESTA ACTIVADA EN LA BASE DE DATOS:
select name, value 
from v$parameter 
where name like 'audit_trail'


--Para auditar sólo los intentos fallidos utilizaremos el comando
audit session whenever not successful;



--Para auditar sólo las conexiones correctas utilizaremos el comando:
audit session whenever successful;

select * from dba_audit_session;

--Este comando activará la auditoría de las acciones: create role, 
alter role, drop role y set role.
audit role;


--De esta forma se activará la auditoría para el usuario 
--"nombre_usuario" sólo cuando ejecute el comando "update" para cualquier tabla.
audit update table by SYS_MECANICA.VEHICULO;


--Para auditar los "insert" realizados sobre la tabla "facturacion" por acceso, el comando será:
audit insert on SYS_MECANICA.VEHICULO by access;

/*
Nota: al indicar "by access" hay que tener cuidado pues registrará 
un suceso de auditoría por cada insert, esto puede afectar al 
rendimiento. De ser así siempre será mejor optar por "by session" 
que sólo registrará un suceso de auditoría por sesión, aunque es 
menos exaustivo.
*/


--Para auditar todas las acciones realizadas en la tabla "contabilidad" por sesión utilizaremos el siguiente comando:

audit all on SYS_MECANICA.VEHICULO by session;

/*El comando anterior auditará todas las acciones realizadas sobre 
la tabla CONTABILIDAD (select, insert, update, delete), pero sólo 
un registro de auditoría por cada sesión.*/


--Para auditar las eliminaciones de registros de la tabla "nóminas":

audit delete SYS_MECANICA.VEHICULO by access;


select * from v$session where username='ES_AUDITORIA';