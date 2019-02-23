-- CREACION DEL PERFIL

CREATE PROFILE PF_DEMO LIMIT
SESSIONS_PER_USER 1;

-- Modificar el usuario operador

alter user operador
account unlock
profile PF_DEMO;

alter system
set resource_limit = true;


