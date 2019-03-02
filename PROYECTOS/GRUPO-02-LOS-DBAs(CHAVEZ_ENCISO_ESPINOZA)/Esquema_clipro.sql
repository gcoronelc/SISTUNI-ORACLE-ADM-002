

CREATE TABLESPACE TBS_CLIPRO
DATAFILE 'C:\app\Alumno\oradata\orcl\DF_CLIPRO.DBF'
SIZE 10M;


CREATE USER CLIPRO
IDENTIFIED BY clipro123
DEFAULT TABLESPACE TBS_CLIPRO
QUOTA UNLIMITED ON TBS_CLIPRO;


SELECT 
    USERNAME, default_tablespace, temporary_tablespace
FROM DBA_USERS
WHERE USERNAME LIKE 'CLIPROS%';


GRANT CREATE SESSION TO CLIPRO;
GRANT CREATE TABLE TO CLIPRO;


CREATE TABLE CLIPRO.CLIENTES(
  CLI_Codigo CHAR(5 CHAR) NOT NULL,
  CLI_ComanyName VARCHAR2(100) NOT NULL,
  CLI_ContactName VARCHAR2(100) NOT NULL,
  CLI_ContactTitle VARCHAR2(100) NOT NULL,
  CLI_Address VARCHAR2(100) NOT NULL,
  CLI_City VARCHAR2(100) NOT NULL,
  CLI_Region VARCHAR2(100),
  CLI_PostalCode VARCHAR2(20),
  CLI_Country VARCHAR2(100),
  CLI_Phone VARCHAR2(20),
  CLI_Fax VARCHAR2(20),
  CONSTRAINT PK_Cliente PRIMARY KEY(CLI_Codigo)
);

Insert into CLIPRO.CLIENTES  values ('ALFKI','Alfreds Futterkiste','Maria Anders','Sales Representative','Obere Str. 57','Berlin',null,'12209','Germany','030-0074321','030-0076545');
Insert into CLIPRO.CLIENTES  values ('ANATR','Ana Trujillo Emparedados y helados','Ana Trujillo','Owner','Avda. de la Constitución 2222','México D.F.',null,'05021','Mexico','(5) 555-4729','(5) 555-3745');
Insert into CLIPRO.CLIENTES  values ('AROUT','Around the Horn','Thomas Hardy','Sales Representative','120 Hanover Sq.','London',null,'WA1 1DP','UK','(171) 555-7788','(171) 555-6750');
Insert into CLIPRO.CLIENTES  values ('BERGS','Berglunds snabbköp','Christina Berglund','Order Administrator','Berguvsvägen  8','Luleå',null,'S-958 22','Sweden','0921-12 34 65','0921-12 34 67');
Insert into CLIPRO.CLIENTES  values ('BLAUS','Blauer See Delikatessen','Hanna Moos','Sales Representative','Forsterstr. 57','Mannheim',null,'68306','Germany','0621-08460','0621-08924');
Insert into CLIPRO.CLIENTES  values ('BLONP','Blondesddsl père et fils','Frédérique Citeaux','Marketing Manager','24, place Kléber','Strasbourg',null,'67000','France','88.60.15.31','88.60.15.32');
Insert into CLIPRO.CLIENTES  values ('BOLID','Bólido Comidas preparadas','Martín Sommer','Owner','C/ Araquil, 67','Madrid',null,'28023','Spain','(91) 555 22 82','(91) 555 91 99');
COMMIT;
select *from CLIPRO.CLIENTES;



CREATE TABLE CLIPRO.PROVEEDORES(
  PRV_Codigo NUMBER(10, 0) NOT NULL,
  PRV_CompanyName VARCHAR2(40 CHAR) NOT NULL,
  PRV_ContactName VARCHAR2(30 CHAR),
  PRV_ContactTittle VARCHAR2(30 CHAR),
  PRV_Address VARCHAR2(60 CHAR),
  PRV_City VARCHAR2(15 CHAR),
  PRV_Region VARCHAR2(15 CHAR),
  PRV_CostalCode VARCHAR2(10 CHAR),
  PRV_Country VARCHAR2(15 CHAR),
  PRV_Phone VARCHAR2(24 CHAR),
  PRV_Fax VARCHAR2(24 CHAR),
  CONSTRAINT PK_pROVEEDORES PRIMARY KEY(PRV_Codigo)
);

Insert into CLIPRO.PROVEEDORES values (1,'Exotic Liquids','Charlotte Cooper','Purchasing Manager','49 Gilbert St.','London',null,'EC1 4SD','UK','(171) 555-2222',null);
Insert into CLIPRO.PROVEEDORES values (2,'New Orleans Cajun Delights','Shelley Burke','Order Administrator','P.O. Box 78934','New Orleans','LA','70117','USA','(100) 555-4822',null);
Insert into CLIPRO.PROVEEDORES values (3,'Grandma Kelly''s Homestead','Regina Murphy','Sales Representative','707 Oxford Rd.','Ann Arbor','MI','48104','USA','(313) 555-5735','(313) 555-3349');
Insert into CLIPRO.PROVEEDORES values (4,'Tokyo Traders','Yoshi Nagase','Marketing Manager','9-8 Sekimai Musashino-shi','Tokyo',null,'100','Japan','(03) 3555-5011',null);
Insert into CLIPRO.PROVEEDORES values (5,'Cooperativa de Quesos ''Las Cabras''','Antonio del Valle Saavedra','Export Administrator','Calle del Rosal 4','Oviedo','Asturias','33007','Spain','(98) 598 76 54',null);
Insert into CLIPRO.PROVEEDORES values (6,'Mayumi''s','Mayumi Ohno','Marketing Representative','92 Setsuko Chuo-ku','Osaka',null,'545','Japan','(06) 431-7877',null);
Insert into CLIPRO.PROVEEDORES values (7,'Pavlova, Ltd.','Ian Devling','Marketing Manager','74 Rose St. Moonie Ponds','Melbourne','Victoria','3058','Australia','(03) 444-2343','(03) 444-6588');
Insert into CLIPRO.PROVEEDORES values (8,'Specialty Biscuits, Ltd.','Peter Wilson','Sales Representative','29 King''s Way','Manchester',null,'M14 GSD','UK','(161) 555-4448',null);
COMMIT;
SELECT *FROM CLIPRO.PROVEEDORES



