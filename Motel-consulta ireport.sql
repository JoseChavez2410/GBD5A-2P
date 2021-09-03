select
tipo_habitacion.descripcion_habitacion as tipo_habitacion,
count(distinct cliente.id_cliente) as cantidad_clientes
from reserva
inner join habitacion on reserva.id_habitacion=habitacion.id_habitacion
inner join tipo_habitacion on habitacion.id_tipo_habitacion=tipo_habitacion.id_tipo_habitacion
inner join cliente on reserva.id_cliente=cliente.id_cliente
where reserva.estado_reserva_asist=true
group by tipo_habitacion