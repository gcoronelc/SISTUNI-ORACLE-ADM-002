
-- Creaci�n de un usuario

create user operador
identified by secreto;

select * from dba_users;


-- Privilegio para que pueda iniciar sesi�n

grant connect to operador;


-- Bloquear una cuenta
alter user operador
account lock;


-- Desbloquear la cuenta

alter user operador
account unlock;


-- Opci�n PASSWORD EXPIRE

alter user operador
password expire;











