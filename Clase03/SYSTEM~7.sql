

grant all on maestros.producto to operador;

revoke all on maestros.producto from operador;


create role rol_maestros;


grant all on maestros.producto to rol_maestros;


grant rol_maestros to operador;

revoke select on maestros.producto from operador;


SELECT * FROM EUREKA.MOVIMIENTO 
WHERE CHR_CUENCODIGO = '00100001';



