-- =========================================
-- 01: CREAR ESQUEMAS 
-- =========================================
    -- =========================================
    -- A: CREAR EL TABLESPACE
    -- =========================================

    CREATE TABLESPACE TBS_RECARGA
    DATAFILE 'G:\app\Alumno\oradata\orcl\proyect\DF_RECARGA.DBF'
    SIZE 10M;

    CREATE TABLESPACE TBS_PERSONAL
    DATAFILE 'G:\app\Alumno\oradata\orcl\proyect\DF_PERSONAL.DBF'
    SIZE 10M;

    CREATE TABLESPACE TBS_TRANSPORTES
    DATAFILE 'G:\app\Alumno\oradata\orcl\proyect\DF_TRANSPORTES.DBF'
    SIZE 10M;

    -- =========================================
    -- B: CREACION DEL USUARIO
    -- =========================================

    CREATE USER RECARGA 
    IDENTIFIED BY admin
    DEFAULT TABLESPACE TBS_RECARGA
    QUOTA UNLIMITED ON TBS_RECARGA;

    GRANT CONNECT TO RECARGA;

    CREATE USER PERSONAL
    IDENTIFIED BY admin
    DEFAULT TABLESPACE TBS_PERSONAL
    QUOTA UNLIMITED ON TBS_PERSONAL;

    GRANT CONNECT TO PERSONAL;

    CREATE USER TRANSPORTES
    IDENTIFIED BY admin
    DEFAULT TABLESPACE TBS_TRANSPORTES
    QUOTA UNLIMITED ON TBS_TRANSPORTES;

    GRANT CONNECT TO TRANSPORTES;
    

    -- =========================================
    -- C: ASIGNAR PRIVILEGIOS
    -- =========================================

    GRANT CREATE SESSION TO RECARGA;

    GRANT CREATE TABLE TO RECARGA;
    
     GRANT CREATE SEQUENCE TO RECARGA;

    GRANT CREATE SESSION TO PERSONAL;

    GRANT CREATE TABLE TO PERSONAL;
    
     GRANT CREATE SEQUENCE TO PERSONAL;

      
    GRANT CREATE SESSION TO TRANSPORTES;

    GRANT CREATE TABLE TO TRANSPORTES;
    
     GRANT CREATE SEQUENCE TO TRANSPORTES;

     -- =========================================
    -- D: TABLAS
    -- =========================================
    
         -- =========================================
        -- D1: TRANSPORTE
        -- =========================================

        CREATE TABLE TRANSPORTE.TIPOTRANSPORTE(
          idtipotransporte CHAR(1) NOT NULL,
          tipovehiculo VARCHAR2(45) NOT NULL,
          PRIMARY KEY (idtipotransporte));
          
          CREATE SEQUENCE SEQ_TPTRANSPORTE;

        CREATE TABLE TRANSPORTE.EMPRESA (
          idempresa NUMBER NOT NULL,
          nomempresa VARCHAR2(45) NOT NULL,
          PRIMARY KEY (idempresa));
          
          CREATE SEQUENCE SEQ_EMPRESA;
          
          CREATE TABLE TRANSPORTE.TIPOPASAJE(
          idtppasaje CHAR(1) NOT NULL,
          tipopasaje VARCHAR2(45) NOT NULL,
          PRIMARY KEY (idtppasaje));
          
          CREATE SEQUENCE SEQ_TPPASAJE;

        CREATE TABLE TRANSPORTE.SENTIDO (
          idsentido CHAR(1) NOT NULL,
          sentifo CHAR(10) NOT NULL,
          PRIMARY KEY (idsentido));
          
          CREATE SEQUENCE SEQ_SENTIDO;

        CREATE TABLE TRANSPORTE.LINEA (
          idlinea NUMBER NOT NULL,
          nomlinea VARCHAR2(45) NOT NULL,
          hrinicio DATE NOT NULL,
          hrfin DATE NOT NULL,
          idempresa NUMBER NOT NULL,
          PRIMARY KEY (idlinea),
          CONSTRAINT fk_linea_empresa
            FOREIGN KEY (idempresa)
            REFERENCES TRANSPORTE.EMPRESA(idempresa));
            
            CREATE SEQUENCE SEQ_LINEA;

        CREATE TABLE TRANSPORTE.TARIFA (
          idtarifa INT NOT NULL,
          tarifa DECIMAL(2) NOT NULL,
          idlinea INT NOT NULL,
          idtipopasaje CHAR(1) NOT NULL,
          PRIMARY KEY (idtarifa),
          CONSTRAINT fk_tarifa_linea
            FOREIGN KEY (idlinea)
            REFERENCES TRANSPORTE.LINEA(idlinea),
          CONSTRAINT fk_tarifa_tipopasaje
            FOREIGN KEY (idtipopasaje)
            REFERENCES TRANSPORTE.TIPOPASAJE(idtppasaje));
            
            CREATE SEQUENCE SEQ_TARIFA;

        CREATE TABLE TRANSPORTE.PARADERO (
          idparadero NUMBER NOT NULL,
          nomparadero VARCHAR(45) NOT NULL,
          latitud CHAR(191) NOT NULL,
          longitud CHAR(191) NOT NULL,
          PRIMARY KEY (idparadero));
          
          CREATE SEQUENCE SEQ_PARADERO;

        CREATE TABLE TRANSPORTE.LINEASPARADEROS (
          idlineasparaderos NUMBER NOT NULL,
          idsentido CHAR(1) NOT NULL,
          idlinea INT NOT NULL,
          idparadero INT NOT NULL,
          PRIMARY KEY (idlineasparaderos),
          CONSTRAINT fk_lineasparaderos_sentido
            FOREIGN KEY (idsentido)
            REFERENCES TRANSPORTE.SENTIDO(idsentido),
            CONSTRAINT fk_lineasparaderos_linea
            FOREIGN KEY (idlinea)
            REFERENCES transporte.linea (idlinea),
          CONSTRAINT fk_lineasparaderos_paradero
            FOREIGN KEY (idparadero)
            REFERENCES transporte.paradero(idparadero));
            
            CREATE SEQUENCE SEQ_LNPARADEROS;
     

        CREATE TABLE TRANSPORTE.VEHICULO (
          idvehiculo NUMBER NOT NULL,
          placa VARCHAR2(6) NOT NULL,
          capacidad VARCHAR2(45) NOT NULL,
          estado CHAR(1) NOT NULL,
          idtipovehiculo char(1) NOT NULL,
          idlinea NUMBER NOT NULL,
          PRIMARY KEY (idvehiculo),
          CONSTRAINT fk_vehiculo_linea
            FOREIGN KEY (idlinea)
            REFERENCES TRANSPORTE.LINEA (idlinea),
            CONSTRAINT fk_vehiculo_tipovehiculo
            FOREIGN KEY (idtipovehiculo)
            REFERENCES TRANSPORTE.TIPOTRANSPORTE(idtipotransporte));
            
            CREATE SEQUENCE SEQ_VEHICULO;


-------PERMISOS DE REFERENCIA 
GRANT REFERENCES ON TRANSPORTE.LINEASPARADEROS TO RECARGA;
GRANT REFERENCES ON TRANSPORTE.VEHICULO TO PERSONAL;
         -- =========================================
        -- D2: RECARGA
        -- =========================================
          CREATE TABLE RECARGA.TIPOTARJETA (
          idtptarjeta CHAR(1) NOT NULL,
          tipotarjeta VARCHAR2(20) NOT NULL,
          PRIMARY KEY (idtptarjeta));
          
          CREATE SEQUENCE SEQ_TPTARJETA;
          
          CREATE TABLE RECARGA.TARJETA (
            idtarjeta INT NOT NULL,
            montototal CHAR(3) NULL,
            idtptarjeta CHAR(1) NOT NULL,
            PRIMARY KEY (idtarjeta),
            CONSTRAINT fk_tarjeta_tptarjeta
              FOREIGN KEY (idtptarjeta)
              REFERENCES RECARGA.TIPOTARJETA(idtptarjeta));
              
              CREATE SEQUENCE SEQ_TARJETA;
        
         CREATE TABLE RECARGA.CLIENTE(
          idpasajero INT NOT NULL,
          userpsj VARCHAR2(20) NOT NULL,
          contraseña VARCHAR2(25) NOT NULL,
          nombres VARCHAR2(45) NOT NULL,
          appaterno VARCHAR2(45) NOT NULL,
          apmaterno VARCHAR2(45) NOT NULL,
          dni CHAR(8) NOT NULL,
          telefono CHAR(9) NOT NULL,
          idtarjeta INT NOT NULL,
          PRIMARY KEY (idpasajero),
          CONSTRAINT fk_cliente_tarjeta
            FOREIGN KEY (idtarjeta)
            REFERENCES RECARGA.TARJETA(idtarjeta));
            
            CREATE SEQUENCE SEQ_CLIENTE;
                    
              CREATE TABLE RECARGA.MOVIMIENTOSTARJETA(
              idmovimientos INT NOT NULL,
              monto CHAR(3) NOT NULL,
              fecha DATE NOT NULL,
              hora DATE NOT NULL,
              origen CHAR(8),
              idtarjeta INT NOT NULL,
              PRIMARY KEY (idmovimientos),
              CONSTRAINT fk_movimientostarjeta_tarjeta
                FOREIGN KEY (idtarjeta)
                REFERENCES RECARGA.TARJETA (idtarjeta));
                
                CREATE SEQUENCE SEQ_MOVTARJETA;
              
            CREATE TABLE RECARGA.HISTORIALVIAJES (
              idhistorialvjs INT NOT NULL,
              fecha DATE NOT NULL,
              hora DATE NOT NULL,
              idtarjeta INT NOT NULL,
              idlineasparaderos INT NOT NULL,
              PRIMARY KEY (idhistorialvjs),
              CONSTRAINT fk_historialviajes_tarjeta
                FOREIGN KEY (idtarjeta)
                REFERENCES RECARGA.TARJETA (idtarjeta),
              CONSTRAINT fk_hstrlvjs_lnsparadero
                FOREIGN KEY (idlineasparaderos)
                REFERENCES TRANSPORTE.LINEASPARADEROS(idlineasparaderos));
                
                CREATE SEQUENCE SEQ_HSTVIAJES;
            
         -- =========================================
        -- D3: PERSONAL
        -- =========================================
        
         CREATE TABLE PERSONAL.CONDUCTOR (
          idconductor INT NOT NULL,
          ussconductor VARCHAR2(20) NOT NULL,
          cntrconductor VARCHAR2(25) NOT NULL,
          nomconductor VARCHAR2(45) NOT NULL,
          appaternoconductor VARCHAR2(45) NOT NULL,
          apmaternoconductor VARCHAR2(45) NOT NULL,
          dni CHAR(8) NOT NULL,
          telefono CHAR(9) NOT NULL,
          sueldo CHAR(4) NOT NULL,
          PRIMARY KEY (idconductor));
          
          CREATE SEQUENCE SEQ_CONDUCTOR;
          
            CREATE TABLE PERSONAL.TIPOASISTENCIA (
          idtpasistencia CHAR(1) NOT NULL,
          tpasistencia VARCHAR2(20) NOT NULL,
          PRIMARY KEY (idtpasistencia));
          
          CREATE SEQUENCE SEQ_TPASISTENCIA;
          
          CREATE TABLE PERSONAL.ASISTENCIA (
          idasistencia INT NOT NULL,
          idtpasistencia CHAR(1) NOT NULL,
          idconductor INT NOT NULL,
          fecha DATE NOT NULL,
          PRIMARY KEY (idasistencia),
          CONSTRAINT fk_asistencia_tpasistencia
            FOREIGN KEY (idtpasistencia)
            REFERENCES PERSONAL.TIPOASISTENCIA(idtpasistencia),
            CONSTRAINT fk_asistencia_conductor
            FOREIGN KEY (idconductor)
            REFERENCES PERSONAL.CONDUCTOR(idconductor));
            
            CREATE SEQUENCE SEQ_ASISTENCIA;
        
          CREATE TABLE PERSONAL.TURNOS (
          idturnos INT NOT NULL,
          fecha DATE NOT NULL,
          hora CHAR(2) NOT NULL,
          idconductor INT NOT NULL,
          idvehiculo INT NOT NULL,
          PRIMARY KEY (idturnos),
          CONSTRAINT fk_turnos_conductor
            FOREIGN KEY (idconductor)
            REFERENCES PERSONAL.CONDUCTOR(idconductor),
          CONSTRAINT fk_turnos_vehiculo
            FOREIGN KEY (idvehiculo)
            REFERENCES TRANSPORTE.VEHICULO(idvehiculo));
            
            CREATE SEQUENCE SEQ_TURNOS;
          
          CREATE TABLE PERSONAL.ADMTURNOS (
          idadmturno INT NOT NULL,
          hrsalida DATE NOT NULL,
          hrregreso DATE NOT NULL,
          idturno INT NOT NULL,
          PRIMARY KEY (idadmturno),
          CONSTRAINT fk_ADMVEHVL_TURNO
            FOREIGN KEY (idturno)
            REFERENCES PERSONAL.TURNOS(idturnos));
            
            CREATE SEQUENCE SEQ_ADMTURNOS;
            

-- =========================================
-- 02: CREAR TABLESPACES
-- =========================================

CREATE TABLESPACE TBS_JESUS
DATAFILE 'G:\app\Alumno\oradata\orcl\proyect\TBS_JESUS_DF1.DAT'
SIZE 10M AUTOEXTEND ON;

CREATE TABLESPACE TBS_MICHELLE
DATAFILE 'G:\app\Alumno\oradata\orcl\proyect\TBS_MICHELLE_DF1.DAT'
SIZE 10M AUTOEXTEND ON;

CREATE TABLESPACE TBS_EDIT
DATAFILE 'G:\app\Alumno\oradata\orcl\proyect\TBS_EDIT_DF1.DAT'
SIZE 10M AUTOEXTEND ON;


-- =========================================
-- 03: ROLES DE USUARIO
-- =========================================
CREATE ROLE USSERS;

CONN personal/admin;

begin
    for t in (select * from user_tables) 
    loop   
        execute immediate 'GRANT SELECT ON ' || t.table_name || ' to ussers';    
    end loop;
end;

CONN recarga/admin;

begin
    for t in (select * from user_tables) 
    loop   
        execute immediate 'GRANT SELECT ON ' || t.table_name || ' to ussers';    
    end loop;
end;

CONN transporte/admin;

begin
    for t in (select * from user_tables) 
    loop   
        execute immediate 'GRANT SELECT ON ' || t.table_name || ' to ussers';    
    end loop;
end;

-------------------------------------------------------------------------------------------------------------------------------------

CREATE ROLE OPERADOR_RECARGA;

CONN recarga/admin;

begin
    for t in (select * from user_tables) 
    loop   
        execute immediate 'GRANT SELECT,INSERT,UPDATE ON ' || t.table_name || ' to operador_recarga';    
    end loop;
end;

-------------------------------------------------------------------------------------------------------------------------------------

CREATE ROLE OPERADOR_TRANSPORTE;

CONN transporte/admin;

begin
    for t in (select * from user_tables) 
    loop   
        execute immediate 'GRANT SELECT,INSERT,UPDATE ON ' || t.table_name || ' to operador_transporte';    
    end loop;
end;

-------------------------------------------------------------------------------------------------------------------------------------

CREATE ROLE OPERADOR_PERSONAL;

CONN personal/admin;

begin
    for t in (select * from user_tables) 
    loop   
        execute immediate 'GRANT SELECT,INSERT,UPDATE ON ' || t.table_name || ' to operador_personal';    
    end loop;
end;

-------------------------------------------------------------------------------------------------------------------------------------

CREATE ROLE ADMINISTRADOR;

GRANT DBA TO ADMINISTRADOR WITH ADMIN OPTION;

-- =========================================
-- 04: USUARIOS
-- =========================================
CREATE USER USR_JESUS
IDENTIFIED BY Jesus123
DEFAULT TABLESPACE TBS_JESUS;

GRANT CREATE SESSION TO USR_JESUS;
GRANT CONNECT TO USR_JESUS;
GRANT USSERS TO USR_JESUS;

CREATE USER USR_MICHELLE
IDENTIFIED BY Michelle123
DEFAULT TABLESPACE TBS_MICHELLE;

GRANT CREATE SESSION TO USR_MICHELLE;
GRANT CONNECT TO USR_MICHELLE;
GRANT OPERADOR_RECARGA TO USR_MICHELLE;

CREATE USER USR_EDIT
IDENTIFIED BY Edit123
DEFAULT TABLESPACE TBS_EDIT;

GRANT CREATE SESSION TO USR_EDIT;
GRANT CONNECT TO USR_EDIT;
GRANT ADMINISTRADOR TO USR_EDIT;

CREATE USER USR_JESUS2
IDENTIFIED BY Jesus1234
DEFAULT TABLESPACE TBS_JESUS;

GRANT CREATE SESSION TO USR_JESUS2;
GRANT CONNECT TO USR_JESUS2;
GRANT USSERS TO USR_JESUS2;

CREATE USER USR_MICHELLE2
IDENTIFIED BY Michelle1234
DEFAULT TABLESPACE TBS_MICHELLE;

GRANT CREATE SESSION TO USR_MICHELLE2;
GRANT CONNECT TO USR_MICHELLE2;
GRANT OPERADOR_PERSONAL TO USR_MICHELLE2;

CREATE USER USR_EDIT2
IDENTIFIED BY Edit1234
DEFAULT TABLESPACE TBS_EDIT;

GRANT CREATE SESSION TO USR_EDIT2;
GRANT CONNECT TO USR_EDIT2;
GRANT ADMINISTRADOR TO USR_EDIT2;

-- =========================================
-- 05: INSERTAR DATOS
-- =========================================

 -- =========================================
        -- D1: TRANSPORTE
        -- =========================================


------------------------------------------------------------
---TRANSPORTE.EMPRESA-------


Insert Into TRANSPORTES.EMPRESA  Values( 10001, 'Transporte Chinito' ); 
Insert Into TRANSPORTES.EMPRESA Values( 10002, 'Transporte Reyna'); 
Insert Into TRANSPORTES.EMPRESA Values( 10003, 'Transporte Ronco Perú' ); 
Insert Into TRANSPORTES.EMPRESA Values( 10004, 'Transporte San Martín de Porres'); 
Insert Into TRANSPORTES.EMPRESA Values( 10005, 'Transporte Rino Cargo SAC' ); 
Insert Into TRANSPORTES.EMPRESA Values( 10006, 'Transportes Flores MKT'); 
Insert Into TRANSPORTES.EMPRESA Values( 10007, 'Transporte Sol de America E.I.R.L'); 
Insert Into TRANSPORTES.EMPRESA Values( 10008, 'Transporte Rubial Sac'); 
Insert Into TRANSPORTES.EMPRESA Values( 10009, 'Transporte Pay Pay' ); 
Insert Into TRANSPORTES.EMPRESA Values( 10010, 'Transporte Pickman' ); 
Insert Into TRANSPORTES.EMPRESA Values( 10011, 'Transporte Metropolitano de Lima' ); 
SELECT * FROM TRANSPORTES.EMPRESA;


-----------------TIPO DE TRANSPORTE.TIPOTRANSPORTE-------
Insert Into TRANSPORTES.TIPOTRANSPORTE  Values( 'B', 'Bus' ); 
Insert Into TRANSPORTES.TIPOTRANSPORTE  Values( 'C', 'Combi'); 
Insert Into TRANSPORTES.TIPOTRANSPORTE Values( 'CS', 'Custer' ); 

SELECT * FROM TRANSPORTES.TIPOTRANSPORTE



-----------------------SENTIDO---------------


  Insert Into TRANSPORTES.SENTIDO Values( 'I', 'IDA');
  Insert Into TRANSPORTES.SENTIDO Values( 'R', 'RETORNO');

-----------------TRANSPORTE.LINEA---------

  SELECT * FROM TRANSPORTES.LINEA;
 Insert Into LINEA Values( 2001, 'LINEA A','05:00:01','22:30:01', 10011); 
 Insert Into LINEA Values( 2002, 'LINEA A','05:00:02','22:15:02', 10011);
 Insert Into LINEA Values( 2003, 'LINEA A','05:15:06','21:55:08', 10011);
 Insert Into LINEA Values( 2004, 'LINEA C','05:00:06','22:05:10', 10011);
 Insert Into LINEA Values( 2005, 'LINEA C','05:15:09','22:05:16', 10011);
 Insert Into LINEA Values( 2006, 'LINEA C','05:30:01','22:00:19', 10011);
 Insert Into LINEA Values( 2007, 'LINEA B','09:00:03','23:00:01',10011);
 Insert Into LINEA Values( 2008, 'LINEA B','05:00:19','23:00:09', 10011);
 Insert Into LINEA Values( 2009, 'LINEA B','05:00:19','22:00:11',10011);
 Insert Into LINEA Values( 2010, 'LINEA D','05:00:10','09:00:03', 10011);



  ---------------TRANSPORTE.TARIFA----------
  SELECT * FROM TRANSPORTES.TARIFA
     
	 Insert Into TRANSPORTES.TARIFA Values( 4000, 1.2, 2001 ,'E');
	 Insert Into TRANSPORTES.TARIFA Values( 4001, 2.5,2001  ,'G');
	 Insert Into TRANSPORTES.TARIFA Values( 4002, 2.5,2001,'P');
	 Insert Into TRANSPORTES.TARIFA Values( 4003,1.2, 2001 ,'U');
	  Insert Into TRANSPORTES.TARIFA Values( 4004, 1.2, 2002 ,'E');
	 Insert Into TRANSPORTES.TARIFA Values( 4005, 2.5,2002  ,'G');
	 Insert Into TRANSPORTES.TARIFA Values( 4006, 2.5,2002,'P');
	 Insert Into TRANSPORTES.TARIFA Values( 4007,1.2, 2002 ,'U');
	  Insert Into TRANSPORTES.TARIFA Values( 4008, 1.2, 2003 ,'E');
	 Insert Into TRANSPORTES.TARIFA Values( 4009, 2.5,2003  ,'G');
	 Insert Into TRANSPORTES.TARIFA Values( 4010, 2.5,2003,'P');
	 Insert Into TRANSPORTES.TARIFA Values( 4011,1.2, 2003 ,'U');
        
        

 ------------TIPODEPASAJE------------
 select * from TRANSPORTES.TIPOPASAJE;
   Insert Into TRANSPORTES.TIPOPASAJE Values( 'G', 'General');
   Insert Into TRANSPORTES.TIPOPASAJE Values( 'E', 'Escolar');
   Insert Into TRANSPORTES.TIPOPASAJE Values( 'U', 'Universitario');
   Insert Into TRANSPORTES.TIPOPASAJE Values( 'D', 'Discapacitado');

  -----------------------PARADERO------------

SELECT * FROM  TRANSPORTES.PARADERO
Insert Into TRANSPORTES.PARADERO Values(1,'Pacifico','06','10');
Insert Into TRANSPORTES.PARADERO Values(2,'Independencia','06','10');
Insert Into TRANSPORTES.PARADERO Values(3,'Tomas Valle','06','10');
Insert Into TRANSPORTES.PARADERO Values(4,'El milagro','06','10');
Insert Into TRANSPORTES.PARADERO Values(5,'Honorio  Delgado','06','10');
Insert Into TRANSPORTES.PARADERO Values(6,'UNI','06','10');
Insert Into TRANSPORTES.PARADERO Values(7,'Parque del trabajo','06','10');
Insert Into TRANSPORTES.PARADERO Values(8,'Caqueta','06','10');
Insert Into TRANSPORTES.PARADERO Values(9,'2 de Mayo','06','10');

--------------------- TRANSPORTE.LINEASPARADEROS (
         
Insert Into TRANSPORTES.LINEASPARADEROS Values (9001,'I',2001,1);
Insert Into TRANSPORTES.LINEASPARADEROS Values (9002,'I',2001,1);
Insert Into TRANSPORTES.LINEASPARADEROS Values (9003,'I',2001,1);
Insert Into TRANSPORTES.LINEASPARADEROS Values (9004,'I',2001,1);
Insert Into TRANSPORTES.LINEASPARADEROS Values (9005,'I',2001,1);
Insert Into TRANSPORTES.LINEASPARADEROS Values (9006,'I',2001,1);
Insert Into TRANSPORTES.LINEASPARADEROS Values (9007,'I',2001,1);
Insert Into TRANSPORTES.LINEASPARADEROS Values (9008,'I',2001,1);
Insert Into TRANSPORTES.LINEASPARADEROS Values (9009,'I',2001,1);
Insert Into TRANSPORTES.LINEASPARADEROS Values (9010,'I',2001,1);
	
---------------------------------------------------
--------------------------transporte.VEHICULO--------


Insert Into TRANSPORTES.VEHICULO Values(500,'MET001','60','B',1 ,2001);
Insert Into TRANSPORTES.VEHICULO Values(501,'MET002','50','B',1,2002);
Insert Into TRANSPORTES.VEHICULO Values(502,'MET003','55','B',1,2003);
Insert Into TRANSPORTES.VEHICULO Values(503,'MET004','57','B',1,2004);
Insert Into TRANSPORTES.VEHICULO Values(504,'MET005','60','B',1,2004);

 -- =========================================
        -- D2: RECARGA
        -- =========================================


-------------RECARGA.TIPOTARJETA----------------

   Insert Into RECARGA.TIPOTARJETA Values( 'G', 'General');
   Insert Into RECARGA.TIPOTARJETA Values( 'P', 'Personalizada');
   Insert Into RECARGA.TIPOTARJETA Values( 'E', 'Escolar');
   Insert Into RECARGA.TIPOTARJETA Values( 'U', 'Universitario');
   Insert Into RECARGA.TIPOTARJETA Values( 'D', 'Discapacitado');


------------------------RECARGA.TARJETA--------------

 
  	Insert Into RECARGA.TARJETA  Values(60001,'10','G');
	Insert Into RECARGA.TARJETA  Values(60002,'20','U');
        Insert Into RECARGA.TARJETA Values(60003,'5','E');
	Insert Into RECARGA.TARJETA  Values(60004,'1','G');
	Insert Into RECARGA.TARJETA  Values(60005,'10','E');
	Insert Into RECARGA.TARJETA  Values(60006,'13','E');
	Insert Into RECARGA.TARJETA  Values(60007,'17','G');
	Insert Into RECARGA.TARJETA  Values(60008,'13','G');
	Insert Into RECARGA.TARJETA  Values(60009,'16','G');
	Insert Into RECARGA.TARJETA  Values(60010,'09','G');
	Insert Into RECARGA.TARJETA  Values(60011,'15','G');
	Insert Into RECARGA.TARJETA  Values(60012,'20','G');
	Insert Into RECARGA.TARJETA  Values(60013,'30','G');
	Insert Into RECARGA.TARJETA  Values(60014,'24','G');


---------------------RECARGA.CLIENTE--------------


Insert Into RECARGA.CLIENTE Value (001,'Marco','M214','Marco','Huaman','Sanchez','73019214','995555420',60001);
Insert Into RECARGA.CLIENTE Values(002,'Ulises','U789','Ulises','Blasco',' Fernandez','72784789','995644120',60002);
Insert Into RECARGA.CLIENTE Values(003,'Renzo','R456','Renzo','Palacios',' Quesada','71389456','995624111',60003);
Insert Into RECARGA.CLIENTE Values(004,'Beatriz','B216','Beatriz','Castillo','Flores','75689216','998562314',60004);
Insert Into RECARGA.CLIENTE Values(005,'Ana','A457','Ana','Bellido',' Guadalupe','73216457','998752411',60005);

         
-----------------------------RECARGA.HISTORIALVIAJES----------------
  

Insert Into  RECARGA.HISTORIALVIAJES Values(600,'Ana','A457','Ana','Bellido');

 -- =========================================
        -- D3: PERSONAL
        -- =========================================


-------------------------PERSONAL.CONDUCTOR--------------

Insert Into PERSONAL.CONDUCTOR Values(006,'Ana Paola','A458','Ana Paola','Lallico',' Guadalupe','73216457','998752411','1000');
Insert Into PERSONAL.CONDUCTOR Values(007,'maria','A459','maria','Bellido',' Alderete','73216788','998752881','1000');
Insert Into PERSONAL.CONDUCTOR Values(008,'paolo','A460','paolo','Mendez',' Guadalupe','73216742','998752671','1000');
Insert Into PERSONAL.CONDUCTOR Values(009,'diego','A461','diego','Bellido',' Guadalupe','73216757','998752001','1000');
Insert Into PERSONAL.CONDUCTOR Values(010,'edit','A462','edit','Perez',' Guadalupe','73216424','998752041','1000');
Insert Into PERSONAL.CONDUCTOR Values(011,'mishelle','A463','mishelle','Tapia',' Perez','73216777','998752051','1000');


-----------------PERSONAL.TIPOASISTENCIA-------------
        SELECT * FROM PERSONAL.TIPOASISTENCIA;
Insert Into PERSONAL.TIPOASISTENCIA  Values('F','FALTA');
Insert Into PERSONAL.TIPOASISTENCIA  Values('T','TARDANZA');
Insert Into PERSONAL.TIPOASISTENCIA  Values('A','ASISTENCIA');
 

----------------------------PERSONAL.ASISTENCIA------------------------
Insert Into PERSONAL.ASISTENCIA Values(301,'F',006,'20180203');
Insert Into PERSONAL.ASISTENCIA Values(302,'F',006,'20190226');
Insert Into PERSONAL.ASISTENCIA Values(303,'A',007,'20190302');
Insert Into PERSONAL.ASISTENCIA Values(304,'A',007,'20190223');
Insert Into PERSONAL.ASISTENCIA Values(305,'A',008,'20190218');
Insert Into PERSONAL.ASISTENCIA Values(306,'A',009,'20190219');
Insert Into PERSONAL.ASISTENCIA Values(307,'A',009,'20190219');
Insert Into PERSONAL.ASISTENCIA Values(308,'A',010,'20190301');


-----------------PERSONAL.TURNOS-----------------------
SELECT * FROM PERSONAL.TURNOS;
  Insert Into PERSONAL.TURNOS Values(1,'20190105','05',8,500);
  Insert Into PERSONAL.TURNOS Values(2,'20190108','08',8,501);
  Insert Into PERSONAL.TURNOS Values(3,'20190102','06',8,502);
  Insert Into PERSONAL.TURNOS Values(4,'20190205','05',9,500);
  Insert Into PERSONAL.TURNOS Values(5,'20190201','08',9,501);
  Insert Into PERSONAL.TURNOS Values(6,'20190301','08',9,502);
  Insert Into PERSONAL.TURNOS Values(7,'20190210','05',9,503);
  Insert Into PERSONAL.TURNOS Values(8,'20190211','06',8,504);

