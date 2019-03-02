
CREATE TABLESPACE TBS_ADMI
DATAFILE 'C:\app\Alumno\oradata\orcl\DF_ADMI.DBF'
SIZE 10M;

CREATE USER ADMI
IDENTIFIED BY admi1000
DEFAULT TABLESPACE TBS_ADMI
QUOTA UNLIMITED ON TBS_ADMI;

SELECT 
USERNAME, default_tablespace, temporary_tablespace
FROM DBA_USERS
WHERE USERNAME LIKE 'ADMI%';

GRANT CONNECT TO ADMI;
GRANT CREATE TABLE TO ADMI;
GRANT RESOURCE TO ADMI;


CREATE TABLE ADMI.EMPLEADOS(
  EMP_Codigo NUMBER(10, 0) NOT NULL,
  EMP_LastName VARCHAR2(100) NOT NULL,
  EMP_FirstName VARCHAR2(100) NOT NULL,
  EMP_Title VARCHAR2(100),
  EMP_TitleOfCortesy VARCHAR2(100),
  EMP_BirthDate DATE,
  EMP_HireDate DATE,
  EMP_Address VARCHAR2(100),
  EMP_City VARCHAR2(100),
  EMP_Region VARCHAR2(20),
  EMP_PostalCode VARCHAR2(20),
  EMP_Country VARCHAR2(20),
  EMP_HomePhone VARCHAR2(20),
  EMP_Extension VARCHAR2(10),
  EMP_ReportsTo NUMBER,
  EMP_PhotoPath VARCHAR2(200),
  CONSTRAINT PK_Empleados PRIMARY KEY(EMP_codigo)
);

Insert into ADMI.EMPLEADOS values (1,'Davolio','Nancy','Sales Representative','Ms.','1948-12-08','1992-05-01','507 - 20th Ave. E.Apt. 2A','Seattle','WA','98122','USA','(206) 555-9857','5467',2,'http://accweb/emmployees/davolio.bmp');
Insert into ADMI.EMPLEADOS values (2,'Flores','Keith','Vice President, Sales','Dr.','1952-02-19','1992-08-14','908 W. Capital Way','Tacoma','WA','98401','USA','(206) 555-9482','3457',null,'http://accweb/emmployees/fuller.bmp');
Insert into ADMI.EMPLEADOS values (3,'Leverling','Janet','Sales Representative','Ms.','1963-08-30','1992-04-01','722 Moss Bay Blvd.','Kirkland','WA','98033','USA','(206) 555-3412','3355',2,'http://accweb/emmployees/leverling.bmp');
Insert into ADMI.EMPLEADOS values (4,'Peacock','Margaret','Sales Representative','Mrs.','1937-09-19','1993-05-03','4110 Old Redmond Rd.','Redmond','WA','98052','USA','(206) 555-8122','5176',2,'http://accweb/emmployees/peacock.bmp');
Insert into ADMI.EMPLEADOS values (5,'Flores','Fredy','Sales Manager','Mr.','1955-03-04','1993-10-17','14 Garrett Hill','London',null,'SW1 8JR','UK','(71) 555-4848','3453',2,'http://accweb/emmployees/buchanan.bmp');
Insert into ADMI.EMPLEADOS values (6,'Suyama','Michael','Sales Representative','Mr.','1963-07-02','1993-10-17','Coventry HouseMiner Rd.','London',null,'EC2 7JR','UK','(71) 555-7773','428',5,'http://accweb/emmployees/davolio.bmp');
Insert into ADMI.EMPLEADOS values (7,'King','Robert','Sales Representative','Mr.','1960-05-29','1994-01-02','Edgeham Hollow Winchester Way','London',null,'RG1 9SP','UK','(71) 555-5598','465',5,'http://accweb/emmployees/davolio.bmp');
Insert into ADMI.EMPLEADOS values (8,'Callahan','Laura','Inside Sales Coordinator','Ms.','1958-01-09','1994-03-05','4726 - 11th Ave. N.E.','Seattle','WA','98105','USA','(206) 555-1189','2344',2,'http://accweb/emmployees/davolio.bmp');
Insert into ADMI.EMPLEADOS values (9,'Dodsworth','Anne','Sales Representative','Ms.','1966-01-27','1994-11-15','7 Houndstooth Rd.','London',null,'WG2 7LT','UK','(71) 555-4444','452',5,'http://accweb/emmployees/davolio.bmp');
COMMIT;
SELECT *FROM ADMI.EMPLEADOS;


CREATE TABLE ADMI.CATEGORIAS(
  CAT_Codigo NUMBER(10, 0) NOT NULL,
  CAT_Name VARCHAR2(15 CHAR),
  CAT_Descripcion CLOB,
  CONSTRAINT PK_Categorias PRIMARY KEY(CAT_Codigo)
);

Insert into ADMI.CATEGORIAS values (1,'Bebidas','Soft drinks, coffees, teas, beers, and ales');
Insert into ADMI.CATEGORIAS values (2,'Condimentos','Sweet and savory sauces, relishes, spreads, and seasonings');
Insert into ADMI.CATEGORIAS values  (3,'Confecciones','Desserts, candies, and sweet breads');
Insert into ADMI.CATEGORIAS values  (5,'Granos/Cereales','Breads, crackers, pasta, and cereal');
Insert into ADMI.CATEGORIAS values  (6,'Carne/Ave','Prepared meats');
Insert into ADMI.CATEGORIAS values  (7,'Produce','Frutos/Secos/Queso');
Insert into ADMI.CATEGORIAS values  (8,'Mariscos','Seaweed and fish');
commit;
SELECT *FROM ADMI.CATEGORIAS;

