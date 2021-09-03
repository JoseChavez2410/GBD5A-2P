create or replace function obtener_datos(
in cargoEmpleado varchar,
out cargo varchar,
out cantidadEmpleados int
)
as $body$
begin
	select cargo.nombre_cargo as cargo,
	count (distinct empleado.id_empleado) as cantidad_empleados
	into cargo, cantidadEmpleados
	from cargo
	inner join empleado on cargo.id_cargo=empleado.id_cargo
	where cargo.nombre_cargo=cargoEmpleado
	group by cargo;
end
$body$
language plpgsql;