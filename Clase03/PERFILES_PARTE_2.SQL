-- CREAR EL PERFIL
CREATE PROFILE PF_PASS LIMIT
FAILED_LOGIN_ATTEMPTS 3
PASSWORD_LOCK_TIME 3/1440;


-- Asignar Perfil a usuario OPERADOR
ALTER USER OPERADOR
PROFILE PF_PASS;


