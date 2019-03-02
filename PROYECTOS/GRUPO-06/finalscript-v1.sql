-CREANDO LOS TABLESPACE
CREATE TABLESPACE TBS_ADMIN
DATAFILE 'C:\app\LUCIA\oradata\orcl\DF_ADMIN.DBF'
SIZE 10M;

CREATE TABLESPACE TBS_CONSULTA
DATAFILE 'C:\app\LUCIA\oradata\orcl\DF_CONSULTA.DBF'
SIZE 10M;

CREATE TABLESPACE TBS_SISTEMA
DATAFILE 'C:\app\LUCIA\oradata\orcl\DF_SISTEMA.DBF'
SIZE 10M;

CREATE TABLESPACE TBS_AUDITORIA
DATAFILE 'C:\app\LUCIA\oradata\orcl\DF_AUDITORIA.DBF'
SIZE 10M;


--crea usuario
CREATE USER ES_ADMIN IDENTIFIED BY mecanica
DEFAULT TABLESPACE TBS_ADMIN
QUOTA UNLIMITED ON TBS_ADMIN;


CREATE USER ES_CONSULTA IDENTIFIED BY consulta
DEFAULT TABLESPACE TBS_CONSULTA
QUOTA UNLIMITED ON TBS_CONSULTA;

CREATE USER ES_SISTEMA IDENTIFIED BY sistema
DEFAULT TABLESPACE TBS_SISTEMA
QUOTA UNLIMITED ON TBS_SISTEMA;

CREATE USER ES_AUDITORIA IDENTIFIED BY auditoria
DEFAULT TABLESPACE TBS_AUDITORIA
QUOTA UNLIMITED ON TBS_AUDITORIA;



--dar permisos usuarios
GRANT CONNECT, RESOURCE, DBA to ES_ADMIN;
GRANT CREATE SESSION, SELECT ANY TABLE to ES_CONSULTA;
GRANT CREATE SESSION, SELECT ANY TABLE to ES_SISTEMA;
GRANT CONNECT, RESOURCE, DBA to ES_AUDITORIA;

--verificando que los usuarios esten creados
select username from dba_users where username in ('ES_ADMIN','ES_CONSULTA','ES_SISTEMA','ES_AUDITORIA') ;

CONN ES_CONSULTA/consulta;
GO;
show user;





CREATE TABLE ES_CONSULTA.CLIENTE
(
	ID_RUC_CLIENTE       CHAR(15) NOT NULL ,
	NOMBRE               VARCHAR2(50) NULL ,
	APELLIDO_PATERNO     VARCHAR2(50) NULL ,
	APELLIDO_MATERNO     VARCHAR2(50) NULL ,
	CUIDAD               VARCHAR2(50) NULL ,
	CORREO               VARCHAR2(50) NULL ,
	TELEFONO_FIJO        VARCHAR2(50) NULL ,
	TELEFONO_MOVIL       VARCHAR2(50) NULL 
);



ALTER TABLE ES_CONSULTA.CLIENTE
	ADD  PRIMARY KEY (ID_RUC_CLIENTE);



CREATE TABLE ES_ADMIN.INVENTARIO
(
	ID_PRODUCTO          CHAR(10) NOT NULL ,
	TIPO_PRODUCTO        VARCHAR2(50) NULL ,
	MARCA                VARCHAR2(50) NULL ,
	MODELO               VARCHAR2(50) NULL ,
	VALOR                VARCHAR2(50) NULL ,
	CANTIDAD             NUMBER(5) NULL ,
	ESTADO               VARCHAR2(10) NULL 
);



ALTER TABLE ES_ADMIN.INVENTARIO
	ADD  PRIMARY KEY (ID_PRODUCTO);



CREATE TABLE ES_ADMIN.MANO__DE_OBRA
(
	ID_MANO_DE_OBRA      CHAR(10) NOT NULL ,
	DETALLE              VARCHAR2(50) NULL ,
	TIEMPO               DATE NULL ,
	VALOR                NUMBER(5) NULL ,
	ID_RUC_MECANICO      CHAR(15) NULL ,
	ID_ORDEN_TRABAJO     CHAR(10) NULL 
);



ALTER TABLE ES_ADMIN.MANO__DE_OBRA
	ADD  PRIMARY KEY (ID_MANO_DE_OBRA);



CREATE TABLE ES_ADMIN.MECANICO
(
	ID_RUC_MECANICO      CHAR(15) NOT NULL ,
	NOMBRE               VARCHAR2(50) NULL ,
	APELLIDO_PATERNO     VARCHAR2(50) NULL ,
	APELLIDO_MATERNO     VARCHAR2(50) NULL ,
	TELEFONO             VARCHAR2(50) NULL ,
	DIRECCION            VARCHAR2(50) NULL ,
	CORREO               VARCHAR2(50) NULL ,
	ESPECIALIDAD         VARCHAR2(50) NULL ,
	ESTADO               CHAR(10) NULL 
);



ALTER TABLE ES_ADMIN.MECANICO
	ADD  PRIMARY KEY (ID_RUC_MECANICO);



CREATE TABLE ES_ADMIN.ORDEN_DE_TRABAJO
(
	ID_ORDEN_TRABAJO     CHAR(10) NOT NULL ,
	FECHA                DATE NULL ,
	NIVELCOMBISTIBLE     VARCHAR2(50) NULL ,
	CANTIDADTAPARUEDA    NUMBER(5) NULL ,
	RUEDAREPUESTO        NUMBER(5) NULL ,
	KILOMETRAJE          NUMBER(5) NULL ,
	FORMA_PAGO           VARCHAR2(50) NULL ,
	PLAZA                VARCHAR2(50) NULL ,
	TIPOTARJETACREDITO   VARCHAR2(50) NULL ,
	NUMEROCUOTAS         NUMBER(5) NULL ,
	FECHAPAGO            DATE NULL ,
	ID_placa_vehiculo    CHAR(10) NULL ,
	ID_USUARIO           CHAR(10) NULL 
);



ALTER TABLE ES_ADMIN.ORDEN_DE_TRABAJO
	ADD  PRIMARY KEY (ID_ORDEN_TRABAJO);



CREATE TABLE ES_ADMIN.REPUESTO_ORDEN_TRABAJO
(
	ID_REPUESTO_ORDEN    CHAR(10) NOT NULL ,
	VALOR_UNITARIO       NUMBER(5) NULL ,
	CANTIDAD             NUMBER(5) NULL ,
	ID_ORDEN_TRABAJO     CHAR(10) NULL ,
	ID_PRODUCTO          CHAR(10) NULL 
);



ALTER TABLE ES_ADMIN.REPUESTO_ORDEN_TRABAJO
	ADD  PRIMARY KEY (ID_REPUESTO_ORDEN);



CREATE TABLE ES_SISTEMA.USUARIO
(
	ID_USUARIO           CHAR(10) NOT NULL ,
	NOMBRE               VARCHAR2(50) NULL ,
	APELLIDO_PATERNO     VARCHAR2(50) NULL ,
	APELLIDO_MATERNO     VARCHAR2(50) NULL ,
	TELEFONO             VARCHAR2(50) NULL ,
	PASSWORD             VARCHAR2(50) NULL ,
	CORREO               VARCHAR2(50) NULL ,
	DIRRECCION           VARCHAR2(50) NULL ,
	TIPO_DE_USUARIO      CHAR(10) NULL 
);



ALTER TABLE ES_SISTEMA.USUARIO
	ADD  PRIMARY KEY (ID_USUARIO);



CREATE TABLE ES_CONSULTA.VEHICULO
(
	ID_placa_vehiculo    CHAR(10) NOT NULL ,
	Marca                VARCHAR2(50) NULL ,
	Modelo               VARCHAR2(50) NULL ,
	Año                  NUMBER(5) NULL ,
	Color                VARCHAR2(50) NULL ,
	Kilometraje          VARCHAR2(50) NULL 
);



ALTER TABLE ES_CONSULTA.VEHICULO
	ADD  PRIMARY KEY (ID_placa_vehiculo);



CREATE TABLE ES_CONSULTA.VEHICULO_CLIENTE
(
	ID_placa_vehiculo    CHAR(10) NOT NULL ,
	ID_RUC_CLIENTE       CHAR(15) NOT NULL 
);





ALTER TABLE ES_ADMIN.MANO__DE_OBRA
	ADD (FOREIGN KEY (ID_RUC_MECANICO) REFERENCES ES_ADMIN.MECANICO 
(ID_RUC_MECANICO) ON DELETE SET NULL);



ALTER TABLE ES_ADMIN.MANO__DE_OBRA
	ADD (FOREIGN KEY (ID_ORDEN_TRABAJO) REFERENCES 
ES_ADMIN.ORDEN_DE_TRABAJO (ID_ORDEN_TRABAJO) ON DELETE SET NULL);



ALTER TABLE ES_ADMIN.ORDEN_DE_TRABAJO
	ADD (FOREIGN KEY (ID_placa_vehiculo) REFERENCES ES_CONSULTA.VEHICULO 
(ID_placa_vehiculo) ON DELETE SET NULL);



ALTER TABLE ES_ADMIN.ORDEN_DE_TRABAJO
	ADD (FOREIGN KEY (ID_USUARIO) REFERENCES ES_SISTEMA.USUARIO 
(ID_USUARIO) ON DELETE SET NULL);



ALTER TABLE ES_ADMIN.REPUESTO_ORDEN_TRABAJO
	ADD (FOREIGN KEY (ID_ORDEN_TRABAJO) REFERENCES 
ES_ADMIN.ORDEN_DE_TRABAJO (ID_ORDEN_TRABAJO) ON DELETE SET NULL);



ALTER TABLE ES_ADMIN.REPUESTO_ORDEN_TRABAJO
	ADD (FOREIGN KEY (ID_PRODUCTO) REFERENCES ES_ADMIN.INVENTARIO 
(ID_PRODUCTO) ON DELETE SET NULL);



ALTER TABLE ES_CONSULTA.VEHICULO_CLIENTE
	ADD (FOREIGN KEY (ID_placa_vehiculo) REFERENCES ES_CONSULTA.VEHICULO 
(ID_placa_vehiculo));



ALTER TABLE ES_CONSULTA.VEHICULO_CLIENTE
	ADD (FOREIGN KEY (ID_RUC_CLIENTE) REFERENCES ES_CONSULTA.CLIENTE 
(ID_RUC_CLIENTE));
   
        
/*
ALTER TABLE ES_CONSULTA.VEHICULO_CLIENTE
	ADD  PRIMARY KEY (ID_placa_vehiculo,ID_RUC_CLIENTE);
*/


/***- Definir la auditoria al sistema*/
--VERIFICAR SI LA AUDITORIA ESTA ACTIVADA EN LA BASE DE DATOS:
select name, value 
from v$parameter 
where name like 'audit_trail'


--Para auditar sólo los intentos fallidos utilizaremos el comando
audit session whenever not successful;



--Para auditar sólo las conexiones correctas utilizaremos el comando:
audit session whenever successful;


--Este comando activará la auditoría de las acciones: create role, 
alter role, drop role y set role.
audit role;


--De esta forma se activará la auditoría para el usuario 
--"nombre_usuario" sólo cuando ejecute el comando "update" para cualquier tabla.
audit update table by ES_CONSULTA.VEHICULO;


--Para auditar los "insert" realizados sobre la tabla "facturacion" por acceso, el comando será:
audit insert on ES_CONSULTA.VEHICULO by access;

/*
Nota: al indicar "by access" hay que tener cuidado pues registrará 
un suceso de auditoría por cada insert, esto puede afectar al 
rendimiento. De ser así siempre será mejor optar por "by session" 
que sólo registrará un suceso de auditoría por sesión, aunque es 
menos exaustivo.
*/


--Para auditar todas las acciones realizadas en la tabla "contabilidad" por sesión utilizaremos el siguiente comando:

audit all on ES_CONSULTA.VEHICULO by session;

/*El comando anterior auditará todas las acciones realizadas sobre 
la tabla CONTABILIDAD (select, insert, update, delete), pero sólo 
un registro de auditoría por cada sesión.*/


--Para auditar las eliminaciones de registros de la tabla "nóminas":

audit delete ES_CONSULTA.VEHICULO by access;


select * from v$session where username='ES_CONSULTA';





 /*INSERTA DATA EN TABLE CLIENTE  6 REGISTROS*/
INSERT INTO ES_CONSULTA.cliente VALUES ('10454736848', 'jorge','barrios','sarmiento','lima','caiserpbs@gmail.com','3946003','982198794');
INSERT INTO ES_CONSULTA.cliente VALUES ('10454736847', 'manuel','ramos','torres','ica','mramosica@gmail.com','2546898','989456123');
INSERT INTO ES_CONSULTA.cliente VALUES ('10454736849', 'juan','villegas','cano','arequipa','jvillegasare@gmail.com','2548963','989456124');
INSERT INTO ES_CONSULTA.cliente VALUES ('10455075549', 'carlos','perez','huaman','iquitos','cpererzh@gmail.com','3654879','941256388');
INSERT INTO ES_CONSULTA.cliente VALUES ('10454736848', 'jorge','barrios','sarmiento','lima','caiserpbs@gmail.com','3946003','982198794');
INSERT INTO ES_CONSULTA.cliente VALUES ('10455810228', 'miguel','barrientos','toro','chiclayo','mbarrichi@gmail.com','4589745','923156891');
INSERT INTO ES_CONSULTA.cliente VALUES ('10447525128', 'jose','chavez','rodriguez','puno','jchavezr@gmail.com','4895612','945879623');

SELECT * FROM ES_CONSULTA.cliente;


/*INSERTAR DATA EN TABLE VEHICULO 6 REGISTROS*/ 
INSERT INTO ES_CONSULTA.vehiculo VALUES ('AQD772','DAEWOO','RACER ETI',1997,'VERDE',130000);
INSERT INTO ES_CONSULTA.vehiculo VALUES ('AZD666','NISSAN','SENTRA',1991,'BLANCO',150000);
INSERT INTO ES_CONSULTA.vehiculo VALUES ('BJB777','KIA','RIO',2006,'NEGR0',120000);
INSERT INTO ES_CONSULTA.vehiculo VALUES ('ABC848','JEEP','CHEROKEE',2016,'PLATEADO',125000);
INSERT INTO ES_CONSULTA.vehiculo VALUES ('JCC444','DAEWOO','CIELO',2000,'AZUL',140000);
INSERT INTO ES_CONSULTA.vehiculo VALUES ('MCC842','TOYOTA','COROLLA',2010,'GRIS',100000);
COMMIT;

SELECT * FROM ES_CONSULTA.VEHICULO;


INSERT INTO ES_ADMIN.MECANICO VALUES('10474825858', 'angel','barrientos','funes','3946003','Jr. Alfosno ugarte','angelbarri@outlook.com','electronico','disponible');
INSERT INTO ES_ADMIN.MECANICO VALUES('10787515598', 'paco','hernandez','torres','3475102','Jr. jose olaya','pacohernandezt@outlook.com','planchador','disponible');
INSERT INTO ES_ADMIN.MECANICO VALUES('10474852298', 'hugo','diaz','torres','3845206','Jr. San pedro','hdiazt@outlook.com','pintura','disponible');
INSERT INTO ES_ADMIN.MECANICO VALUES('10451236848', 'luis','fernandez','torres','3485221','Av. El sol','lfernandezt@outlook.com','planchador','disponible');
INSERT INTO ES_ADMIN.MECANICO VALUES('10485269878', 'marcelo','cano','barrios','3578412','Av. Santa Anita','mcanobarrio@outlook.com','electronico','disponible');
commit;

SELECT * FROM ES_ADMIN.MECANICO;



INSERT INTO ES_SISTEMA.USUARIO VALUES ('USER001','manuel','alves','villegas','3946003','R2n32cp2r5','malves@gmail.com','Jr. lima','admin');
INSERT INTO ES_SISTEMA.USUARIO VALUES ('USER002','oscar','flores','flores','3946003','R#n32cpr5','oflores@gmail.com','Jr. puno','CONSULTOR');
INSERT INTO ES_SISTEMA.USUARIO VALUES ('USER003','luis','rios','leom','3946003','System32XX','lrios@gmail.com','Jr. miroquesada','SYSTEM');
INSERT INTO ES_SISTEMA.USUARIO VALUES ('USER004','jorge','campos','vela','3946003','ReCnC200','jvela@gmail.com','Jr. ucayali','AUDITOR');
commit;

select * from ES_SISTEMA.USUARIO;


INSERT INTO ES_ADMIN.inventario VALUES ('PRO001','ACEITE','MOBIL','SUPER 200',23,11,'EN STOCK');     
INSERT INTO ES_ADMIN.inventario VALUES ('PRO002','FILTRO','MAM FILTER','H1',40,50,'EN STOCK');  
INSERT INTO ES_ADMIN.inventario VALUES ('PRO003','ACEITE','CASTROL','GX',30,40,'EN STOCK'); 
INSERT INTO ES_ADMIN.inventario VALUES ('PRO004','BATERIA','ETNA','PLUS POWER',60,15,'EN STOCK'); 
commit;

select * from ES_ADMIN.inventario