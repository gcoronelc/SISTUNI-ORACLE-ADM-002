ARQUITECTURA DE ORACLE BSG

PREGUNTA 1:

S: select name from v$database;
R: ORCL


PREGUNTA 2:

S: select instance_name from v$instance;
R: orcl


PREGUNTA 3:

S: show parameter domain;
R:db_domain


PREGUNTA 4:

S: show parameter service;
R:service_names


PREGUNTA 5:
conn system/oracle@172.17.1.197:1521/orcl

A)
 S: select name from v$database;
R: ORCL

B)
S: select instance_name from v$instance;
R: orcl

C)
S: show parameter domain;
R:db_domain

D)
S: show parameter service;
R:service_names

6)
share_pool_size 	pool compartido		
R:260046848

db_cahe_size	cache de buffers		
R:780140544

share_pool_size	pool grande		
R:8388608

java_pool_size	pool de java		
R:16777216

sga_max_size	tamaño máximo del SGA	
R:1071333376 bytes

sga_target	tamaño del SGA		
S:1071333376 bytes	

Consultas a ejecuar:
-show sga;
-select * from v$sgainfo;


7)
S: select name from v$controlfile;
R:
C:\APP\ALUMNO\ORADATA\ORCL\CONTROL01.CTL
C:\APP\ALUMNO\ORADATA\ORCL\CONTROL02.CTL
C:\APP\ALUMNO\ORADATA\ORCL\CONTROL03.CTL

8)
S: select name from v$datafile;
R:
C:\APP\ALUMNO\ORADATA\ORCL\SYSTEM01.DBF
C:\APP\ALUMNO\ORADATA\ORCL\SYSAUX01.DBF

9)
S:select group#, member from v$logfile order by 1;
R:
         1
C:\APP\ALUMNO\ORADATA\ORCL\REDO01.LOG

         2
C:\APP\ALUMNO\ORADATA\ORCL\REDO02.LOG

         3
C:\APP\ALUMNO\ORADATA\ORCL\REDO03.LOG
C:\APP\ALUMNO\ORADATA\ORCL\UNDOTBS01.DBF
C:\APP\ALUMNO\ORADATA\ORCL\USERS01.DBF

10)
S: select group#, members from v$log;
R:
    GROUP#    MEMBERS
           ---------- ----------
                1          1
                2          1
                3          1










