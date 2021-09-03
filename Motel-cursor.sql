do $$
declare
	tabla record;
	clientes cursor for select (cliente.nombre_cliente || ' ' || cliente.apellido_cliente) as cliente,
	reserva.fecha_reserva as fecha_asistencia,
	tipo_habitacion.descripcion_habitacion as tipo_habitacion
	from cliente
	inner join reserva on reserva.id_cliente=cliente.id_cliente
	inner join habitacion on reserva.id_habitacion=habitacion.id_habitacion
	inner join tipo_habitacion on habitacion.id_tipo_habitacion=tipo_habitacion.id_tipo_habitacion
	where reserva.estado_reserva_asist=true;
begin
open clientes;
fetch clientes into tabla;
while(found) loop
raise notice 'Cliente: %, Fecha de asistencia: %, Tipo de habitacion: %',
			tabla.cliente, tabla.fecha_asistencia, tabla.tipo_habitacion;	
fetch clientes into tabla;
end loop;
end $$
language 'plpgsql';