-- TABLE SPACE --
---- Se va crear 3 tablespaces: TBS_MECANICA_DATA (TAMAÑO INICIAL: 15M y autoextendible), TBS_MECANICA_INDEX, TS_MECANICA_TEMP  ---

-- VERIFICA SI EXISTE EL TABLESPACE 
DECLARE
	N INT;
	COMMAND VARCHAR2(200);
BEGIN
	COMMAND := 'DROP TABLESPACE TBS_MECANICA_DATA';
	SELECT COUNT(*) INTO N
	FROM V$TABLESPACE WHERE NAME='TBS_MECANICA_DATA';		
	IF ( N = 1 ) THEN
		EXECUTE IMMEDIATE COMMAND;
	END IF;
END;
/

-- VERIFICA SI EXISTE EL TABLESPACE 
DECLARE
	N INT;
	COMMAND VARCHAR2(200);
BEGIN
	COMMAND := 'DROP TABLESPACE TBS_MECANICA_INDEX';
	SELECT COUNT(*) INTO N
	FROM V$TABLESPACE WHERE NAME='TBS_MECANICA_INDEX';		
	IF ( N = 1 ) THEN
		EXECUTE IMMEDIATE COMMAND;
	END IF;
END;
/


CREATE TABLESPACE TBS_MECANICA_DATA
DATAFILE 'C:\app\Alumno\oradata\orcl\TBS_MECANICA_DATA.DBF'
SIZE 15M
EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;

CREATE TABLESPACE TBS_MECANICA_INDEX
DATAFILE 'C:\app\Alumno\oradata\orcl\TBS_MECANICA_INDEX.DBF'
SIZE 15M;

CREATE TEMPORARY TABLESPACE TBS_MECANICA_TEMP_01
TEMPFILE 'C:\app\Alumno\oradata\orcl\TBS_MECANICA_TEMP_01.DBF'
SIZE 100M;

-- FIN TABLESAPCE --

-- VERIFICA SI EXISTE EL ROL ADMINISTRADOR_DB
DECLARE
	N INT;
	COMMAND VARCHAR2(200);
BEGIN
	COMMAND := 'DROP ROLE ADMINISTRADOR_DB';
	SELECT COUNT(*) INTO N
	FROM DBA_ROLES WHERE ROLE='ADMINISTRADOR_DB';	
	IF ( N = 1 ) THEN
		EXECUTE IMMEDIATE COMMAND;
	END IF;
END;
/

-- VERIFICA SI EXISTE EL ROL AUDITORIA_DB
DECLARE
	N INT;
	COMMAND VARCHAR2(200);
BEGIN
	COMMAND := 'DROP ROLE AUDITORIA_DB';
	SELECT COUNT(*) INTO N
	FROM DBA_ROLES WHERE ROLE='AUDITORIA_DB';	
	IF ( N = 1 ) THEN
		EXECUTE IMMEDIATE COMMAND;
	END IF;
END;
/

-- VERIFICA SI EXISTE EL ROL CONSULTA_DB
DECLARE
	N INT;
	COMMAND VARCHAR2(200);
BEGIN
	COMMAND := 'DROP ROLE CONSULTA_DB';
	SELECT COUNT(*) INTO N
	FROM DBA_ROLES WHERE ROLE='CONSULTA_DB';	
	IF ( N = 1 ) THEN
		EXECUTE IMMEDIATE COMMAND;
	END IF;
END;
/


--CREANDO ROLES---
CREATE ROLE ADMINISTRADOR_DB;
CREATE ROLE AUDITORIA_DB;
CREATE ROLE CONSULTA_DB;

-- Asignando permisos al rol ADMINISTRADOR_DB
GRANT CONNECT, RESOURCE TO ADMINISTRADOR_DB;
GRANT CREATE SESSION TO ADMINISTRADOR_DB;
GRANT CREATE ANY TABLE TO ADMINISTRADOR_DB;
GRANT CREATE ROLE TO ADMINISTRADOR_DB;
GRANT CREATE USER TO ADMINISTRADOR_DB;
GRANT CREATE VIEW TO ADMINISTRADOR_DB;
GRANT CREATE ANY INDEX TO ADMINISTRADOR_DB;
GRANT CREATE TRIGGER TO ADMINISTRADOR_DB;
GRANT CREATE PROCEDURE TO ADMINISTRADOR_DB;
GRANT CREATE SEQUENCE TO ADMINISTRADOR_DB;


-- Asignando permisos al rol AUDITORIA_DB
-- GRANT CONNECT, RESOURCE TO ADMINISTRADOR_DB;
-- GRANT CREATE ROLE SESSION TO ADMINISTRADOR_DB;
-- GRANT CREATE ANY TABLE TO ADMINISTRADOR_DB;
-- GRANT CREATE ROLE TO ADMINISTRADOR_DB;
-- GRANT CREATE USER TO ADMINISTRADOR_DB;
-- GRANT CREATE VIEW TO ADMINISTRADOR_DB;
-- GRANT CREATE ANY INDEX TO ADMINISTRADOR_DB;
-- GRANT CREATE TRIGGER TO ADMINISTRADOR_DB;
-- GRANT CREATE PROCEDURE TO ADMINISTRADOR_DB;
-- GRANT CREATE SEQUECE TO ADMINISTRADOR_DB;

-- -- Asignando permisos al rol CONSULTA_DB
-- GRANT CONNECT, RESOURCE TO CONSULTA_DB;
-- GRANT CREATE VIEW TO CONSULTA_DB;
-- BEGIN
--     FOR R IN (SELECT TABLE_NAME FROM ALL_TABLES WHERE OWNER = 'SYS_MECANICA') 
--     LOOP   
--         EXECUTE IMMEDIATE 'GRANT SELECT ON SYS_MECANICA.' || R.TABLE_NAME || ' TO SISCE WITH GRANT OPTION';    
--     END LOOP;
-- END;
-- /
-- GRANT CREATE ANY INDEX TO CONSULTA_DB;
-- GRANT SELECT ANY TABLES TO CONSULTA_DB

-- 
-- FIN ROL Y PERMISOS --

-- CREAR USUARIO --
-- Verifica si un existe el usuario SYS_MECANICA
DECLARE
	N INT;
	COMMAND VARCHAR2(200);
BEGIN
	COMMAND := 'DROP USER SYS_MECANICA CASCADE';
	SELECT COUNT(*) INTO N
	FROM DBA_USERS
	WHERE USERNAME = 'SYS_MECANICA';
	IF ( N = 1 ) THEN
		EXECUTE IMMEDIATE COMMAND;
	END IF;
END;
/

--Crea el usuario mecanica 
CREATE USER SYS_MECANICA IDENTIFIED BY MECANICA 
DEFAULT TABLESPACE TBS_MECANICA_DATA
TEMPORARY TABLESPACE TBS_MECANICA_TEMP_01;

GRANT UNLIMITED TABLESPACE TO SYS_MECANICA;
-- Asignar el rol administrador_bd al usuario SYS_MECANICA
GRANT ADMINISTRADOR_DB TO SYS_MECANICA; 


