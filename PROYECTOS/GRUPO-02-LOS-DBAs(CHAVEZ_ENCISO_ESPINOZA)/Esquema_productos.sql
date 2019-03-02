
CREATE TABLESPACE TBS_PRODUCTOS
DATAFILE 'C:\app\Alumno\oradata\orcl\DF_PRODUCTOS.DBF'
SIZE 10M;


CREATE USER PRODUCTOS
IDENTIFIED BY productos123
DEFAULT TABLESPACE TBS_PRODUCTOS
QUOTA UNLIMITED ON TBS_PRODUCTOS;


SELECT 
    USERNAME, default_tablespace, temporary_tablespace
FROM DBA_USERS
WHERE USERNAME LIKE 'PRODUCTOS%';


GRANT CREATE SESSION TO PRODUCTOS;
GRANT CREATE TABLE TO PRODUCTOS;



GRANT REFERENCES ON CLIPRO.PROVEEDORES TO PRODUCTOS;
GRANT REFERENCES ON ADMI.CATEGORIAS TO PRODUCTOS;

CREATE TABLE PRODUCTOS.PRODUCTOS(
  PRD_Codigo NUMBER(10, 0) NOT NULL,
  PRD_Name VARCHAR2(40 CHAR) NOT NULL,
  PRV_Codigo1 NUMBER(10, 0),
  CAT_Codigo1 NUMBER(10, 0),  
  PRD_QuantityPerUnit VARCHAR2(20 CHAR),
  PRD_UnitPrice NUMBER(38, 2),
  PRD_UnitsInStock VARCHAR2(100),
  PRD_UnitsOnOrder VARCHAR2(100),
  PRD_ReorderLevel VARCHAR2(100),
  PRD_Discontinued VARCHAR2(100),
  CONSTRAINT PK_Productos PRIMARY KEY(PRD_Codigo),
  CONSTRAINT FK_PRODUCTOS_PROVEEDORES FOREIGN KEY(PRV_Codigo1)REFERENCES CLIPRO.PROVEEDORES(PRV_Codigo),
  CONSTRAINT FK_PRODUCTOS_CATEGORIAS FOREIGN KEY(CAT_Codigo1)REFERENCES ADMI.CATEGORIAS(CAT_Codigo)
);

Insert into PRODUCTOS.PRODUCTOS values (1,'Chai',1,1,'10 boxes x 20 bags',18.0000,39,0,10,'false');
Insert into PRODUCTOS.PRODUCTOS values (2,'Chang',1,1,'24 - 12 oz bottles',19.0000,'17','40','25','false');
Insert into PRODUCTOS.PRODUCTOS values (3,'Aniseed Syrup',1,2,'12 - 550 ml bottles',10.0000,'13','70','25','false');
Insert into PRODUCTOS.PRODUCTOS values (4,'Chef Anton''s Cajun Seasoning',2,2,'48 - 6 oz jars',22.0000,'53','0','0','false');
Insert into PRODUCTOS.PRODUCTOS values (5,'Chef Anton''s Gumbo Mix',2,2,'36 boxes',21.3500,'0','0','0','true');
Insert into PRODUCTOS.PRODUCTOS values (6,'Grandma''s Boysenberry Spread',3,2,'12 - 8 oz jars',25.0000,'120','0','25','false');
Insert into PRODUCTOS.PRODUCTOS values (7,'Uncle Bob''s Organic Dried Pears',3,7,'12 - 1 lb pkgs.',30.0000,'15','0','10','false');
Insert into PRODUCTOS.PRODUCTOS values (8,'Northwoods Cranberry Sauce',3,2,'12 - 12 oz jars',40.0000,'6','0','0','false');
Insert into PRODUCTOS.PRODUCTOS values (9,'quesito',4,6,'18 - 500 g pkgs.',97.0000,'29','0','0','true');
Insert into PRODUCTOS.PRODUCTOS values (10,'Ikura',4,8,'12 - 200 ml jars',31.0000,'31','0','0','false');
Insert into PRODUCTOS.PRODUCTOS values (11,'Queso Cabrales',5,4,'1 kg pkg.',21.0000,'22','30','30','false');
COMMIT;
SELECT *FROM PRODUCTOS.PRODUCTOS


