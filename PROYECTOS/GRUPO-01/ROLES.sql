

conn / as sysdba

--rol1
create role rl_administrador

grant connect to rl_administrador;

grant resource to rl_administrador;


--usuarios_rol_administrador
create user administrador1
identified by admin1

default tablespace minimarket temporary tablespace minimarket_temp;

create user administrador2

identified by admin2
default tablespace minimarket temporary tablespace minimarket_temp;



--rol2
create role rl_supervisor

grant session to rl_supervisor;

grant select any table to rl_supervisor;

grant update any table to rl_supervisor;

grant insert any table to rl_supervisor;


--usuarios_rol_supervisor
create user supervisor1

identified by super1
default tablespace minimarket temporary tablespace minimarket_temp


create user supervisor2

identified by super2
default tablespace minimarket temporary tablespace minimarket_temp;

--rol3
create role rl_usuario

grant session to rl_usuario;

grant select any table to rl_usuario;

--usuarios_rol_usuario
create user usuario1

identified by usuario1
default tablespace minimarket temporary tablespace minimarket_temp;
create user usuario2

identified by usuario2
default tablespace minimarket temporary tablespace minimarket_temp;



