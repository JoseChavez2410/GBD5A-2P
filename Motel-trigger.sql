create or replace function sancionCliente() returns trigger
as
$sancionCliente$
	declare
		psancion int;
begin
	select count(*) into psancion from sancion where id_cliente=new.id_cliente;
	if(psancion>2) then
	raise exception 'El cliente ha sido sancionado más de 2 veces y no puede ingresar al motel';
	end if;
	return new;
end;
$sancionCliente$
language plpgsql;
create trigger sancionCliente before insert on hospedaje for each row
execute procedure sancionCliente();