
-- modificando la contraseña

alter user operador
identified by secreto;


-- Funcion simple

create or replace function fn_valida_password(
    username varchar2,
    password varchar2,
    old_password varchar2
) return boolean
is
begin
  if old_password is null then
    raise_application_error( -20001, 'No tienes historia.' );
  end if;
  if password = old_password then
    raise_application_error( -20002, 'La misma clave no es valida.' );
  end if;
  return true;
end;


-- modificando el perfil PF_PASS

alter profile PF_PASS limit 
PASSWORD_VERIFY_FUNCTION fn_valida_password;

ALTER USER OPERADOR
PROFILE PF_PASS;

-- PROBANDO EL PERFIL

alter user operador
identified by secreto;


-- Extra

revoke SELECT_CATALOG_ROLE from operador;

