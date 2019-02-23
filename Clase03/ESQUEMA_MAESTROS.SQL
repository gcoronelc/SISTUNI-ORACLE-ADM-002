-- CASO: CREAR ESQUEMA MAESTROS

-- =========================================
-- 01: CREAR EL TABLESPACE
-- =========================================

CREATE TABLESPACE TBS_MAESTROS
DATAFILE 'C:\app\Alumno\oradata\orcl\DF_MAESTROS.DBF'
SIZE 10M;



-- =========================================
-- 02: CREACION DEL USUARIO
-- =========================================

CREATE USER MAESTROS 
IDENTIFIED BY admin
DEFAULT TABLESPACE TBS_MAESTROS
QUOTA UNLIMITED ON TBS_MAESTROS;


SELECT 
    USERNAME, default_tablespace, temporary_tablespace
FROM DBA_USERS
WHERE USERNAME LIKE 'MAESTROS%';


-- =========================================
-- 03: ASIGNAR PRIVILEGIOS
-- =========================================

GRANT CREATE SESSION TO MAESTROS;

GRANT CREATE TABLE TO MAESTROS;



-- =========================================
-- 04: CREAR TABLAS
-- =========================================

CREATE TABLE MAESTROS.PRODUCTO(
  PRO_ID NUMBER(8) NOT NULL,
  PRO_NOMBRE VARCHAR2(100) NOT NULL,
  PRO_PRECIO NUMBER(8,2) NOT NULL,
  PRO_STOCK NUMBER(5) NOT NULL,
  CONSTRAINT PK_PRODUCTO PRIMARY KEY(PRO_ID)
);


CREATE SEQUENCE SEQ_PRODUCTO;


-- =========================================
-- 05: CREAR TABLAS
-- =========================================

insert into MAESTROS.PRODUCTO
values(SEQ_PRODUCTO.NEXTVAL, 'PRODUCTO 1', 345.67, 234);

insert into MAESTROS.PRODUCTO
values(SEQ_PRODUCTO.NEXTVAL, 'PRODUCTO 2', 765.78, 123);

insert into MAESTROS.PRODUCTO
values(SEQ_PRODUCTO.NEXTVAL, 'PRODUCTO 3', 435.67, 800);

insert into MAESTROS.PRODUCTO
values(SEQ_PRODUCTO.NEXTVAL, 'PRODUCTO 4', 768.23, 550);

insert into MAESTROS.PRODUCTO
values(SEQ_PRODUCTO.NEXTVAL, 'PRODUCTO 5', 789.34, 700);


COMMIT;


SELECT * FROM MAESTROS.PRODUCTO;





