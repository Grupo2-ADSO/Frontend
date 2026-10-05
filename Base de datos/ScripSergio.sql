----Sergio----

----Tablas----

--Rol--

create table rol (idrol int auto_increment primary key, nombre varchar(50) not null );

insert into rol (nombre) values ('administrador'), ('operario'), ('tecnico');

--Usuario--

create table usuario (idusuario int auto_increment primary key, nombre varchar(50) not null, apellidos varchar(50) not null, correo varchar(100) not null, contrasena varchar(200) not null, estado enum('activo','inactivo') not null, cedula varchar(20) not null, telefono varchar(20) not null, rol_idrol int not null, constraint fk_usuario_rol foreign key (rol_idrol) references rol(idrol) );

insert into usuario (nombre, apellidos, correo, contrasena, estado, cedula, telefono, rol_idrol) values ('ana','lopez','ana@hotel.com','123456','activo','1000123456','3001234567',1), ('juan','perez','juan@hotel.com','123456','activo','1000456789','3009876543',2), ('maria','gomez','maria@hotel.com','123456','activo','1000789456','3014567890',3), ('pedro','castillo','pedro@hotel.com','123456','inactivo','1000234567','3025678901',2), ('laura','diaz','laura@hotel.com','123456','activo','1000567891','3036789012',3);

--Reportes--

create table reportes ( idreporte int auto_increment primary key, tipo varchar(50) not null, id_usuario int not null, id_habitaciones int null, id_orden int not null, fecha_registro datetime not null, constraint fk_reportes_usuario foreign key (id_usuario) references usuario(idusuario) );

insert into reportes (tipo, id_usuario, id_habitaciones, id_orden, fecha_registro) values ('mantenimiento',2,601,1,'2026-03-10 15:00:00'), ('reparacion',3,null,2,'2026-03-11 11:30:00'), ('inspeccion',1,601,3,'2026-03-12 09:45:00'), ('revision general',2,602,1,'2026-03-13 13:20:00'), ('seguimiento',3,603,3,'2026-03-14 17:10:00');

----Consultas---

--1. Ver todos los usuarios con su rol--
select u.nombre, u.apellidos, r.nombre as rol from usuario u join rol r on u.rol_idrol = r.idrol;

--2. Ver solo los usuarios activos--
select * from usuario where estado = 'activo';

--3. Buscar un usuario por alguna cédula--
select * from usuario where cedula = '1000456789';

--4. Buscar un usuario por teléfono--
select * from usuario where telefono = '3009876543';

--5. Ver todos los técnicos--
select u.nombre, u.apellidos from usuario u join rol r on u.rol_idrol = r.idrol where r.nombre = 'tecnico';

--6. Ver todos los operarios--
select u.nombre, u.apellidos from usuario u join rol r on u.rol_idrol = r.idrol where r.nombre = 'operario';

--7. Contar cuántos usuarios hay por rol--
select r.nombre, count(*) as total from usuario u join rol r on u.rol_idrol = r.idrol group by r.nombre;

--8. Ver usuarios inactivos--
select * from usuario where estado = 'inactivo';

--9. Ver los últimos usuarios registrados--
select * from usuario order by idusuario desc limit 5;

--10. Buscar usuarios cuyo correo sea del hotel--
select * from usuario where correo like '%@hotel.com';

--11. Ver reportes recientes--
select * from reportes order by fecha_registro desc limit 5;

--12. Ver reportes de mantenimiento--
select * from reportes where tipo = 'mantenimiento';

--13. Ver reportes de reparación--
select * from reportes where tipo = 'reparacion';

--14. Ver reportes hechos por un usuario específico.--
select * from reportes where id_usuario = 2;

--15. Ver reportes de una habitación específica--
select * from reportes where id_habitaciones = 601;

--16. Ver reportes que no tienen habitación asignada--
select * from reportes where id_habitaciones is null;

--17. Ver reportes de hoy--
select * from reportes where date(fecha_registro) = curdate();

--18. Ver reportes entre dos fechas--
select * from reportes where fecha_registro between '2026-03-10' and '2026-03-13';

--19. Contar reportes por tipo--
select tipo, count(*) as total from reportes group by tipo;

--20. Ver quién hizo cada reporte--
select r.tipo, u.nombre, u.apellidos from reportes r join usuario u on r.id_usuario = u.idusuario;

--21. Ver reportes ordenados del más antiguo al más nuevo--
select * from reportes order by fecha_registro asc;

--22. Ver los últimos 3 reportes--
select * from reportes order by fecha_registro desc limit 3;

--23. Ver mis reportes recientes--
select * from reportes where id_usuario = 3 order by fecha_registro desc;

--24. Ver reportes de una fecha específica--
select * from reportes where date(fecha_registro) = '2026-03-11';

--25. Ver reportes de tipo seguimiento--
select * from reportes where tipo = 'seguimiento';

--26. Ver reportes de una orden específica--
select * from reportes where id_orden = 1;

--27. Contar cuántos reportes ha hecho un usuario--
select count(*) as total from reportes where id_usuario = 3;

--28. Ver qué tipos de reporte ha hecho un usuario--
select tipo, count(*) as total from reportes where id_usuario = 3 group by tipo;

--29. Ver reportes con datos del usuario que los registró--
select r.idreporte, r.tipo, r.fecha_registro, u.nombre, u.apellidos from reportes r
join usuario u on r.id_usuario = u.idusuario;
