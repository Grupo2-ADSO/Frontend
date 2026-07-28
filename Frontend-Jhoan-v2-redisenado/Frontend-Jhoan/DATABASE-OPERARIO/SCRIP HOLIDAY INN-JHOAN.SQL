
CREATE TABLE ordenes_de_trabajo ( idOrden int primary key auto_increment, descripcion  varchar(200) not null, prioridad enum('alta', 'media', 'baja') not null, Ambiente enum('zonas comunes', 'Habitaciones') not null, fecha_creacion date not null, id_usuario int, id_habitaciones int, foreign key (id_usuario) references usuario(IdUsuario), foreign key (id_habitaciones) references habitaciones(No_habitacion));
 
CREATE TABLE historial ( idhistorial int primary key auto_increment, id_orden int not null, estado enum('terminado') not null, fecha date not null, tecnico_responsable int not null, observaciones varchar(300) not null, foreign key (id_orden) references ordenes_de_trabajo(idOrden), foreign key (tecnico_responsable) references tecnicos(IdTecnico));
 
CREATE TABLE evidencia (idEvidencia INT AUTO_INCREMENT PRIMARY KEY, tipo VARCHAR(100), fecha_envio DATETIME, ruta_archivo VARCHAR(512), observaciones VARCHAR(200),evaluacion_idEvaluacion INT,CONSTRAINT fk_evidencia_evaluacion FOREIGN KEY (evaluacion_idEvaluacion) REFERENCES evaluacion(idEvaluacion));
 
CREATE TABLE evaluacion ( idEvaluacion INT AUTO_INCREMENT PRIMARY KEY, comentario VARCHAR(150),calificacion DECIMAL(5,2),fecha_evaluacion DATETIME);

INSERT INTO ordenes_de_trabajo (descripcion, prioridad, Ambiente, fecha_creacion, id_habitaciones, id_usuario)VALUES
('Falla en aire acondicionado', 'alta', 'Habitaciones', '2026-03-20', 601, 1),
('Revisión de fuga en baño', 'alta', 'Habitaciones', '2026-03-20', 602, 2),
('Mantenimiento preventivo TV', 'media', 'Habitaciones', '2026-03-21', 603, 3),
('Cambio de bombillo', 'baja', 'Habitaciones', '2026-03-21', 604, 1),
('Problema con cerradura', 'alta', 'Habitaciones', '2026-03-22', 605, 2),
('Ruido en ventilación', 'media', 'Habitaciones', '2026-03-22', 606, 3),
('Falla en ducha', 'alta', 'Habitaciones', '2026-03-23', 607, 1),
('Revisión minibar', 'baja', 'Habitaciones', '2026-03-23', 608, 2),
('Control remoto dañado', 'baja', 'Habitaciones', '2026-03-24', 609, 3),
('Problema eléctrico enchufe', 'alta', 'Habitaciones', '2026-03-24', 610, 1),
('Falla aire acondicionado', 'alta', 'Habitaciones', '2026-03-25', 701, 2),
('Fuga en lavamanos', 'alta', 'Habitaciones', '2026-03-25', 702, 3),
('TV sin señal', 'media', 'Habitaciones', '2026-03-26', 703, 1),
('Cambio de lámpara', 'baja', 'Habitaciones', '2026-03-26', 704, 2),
('Problema con puerta', 'alta', 'Habitaciones', '2026-03-27', 705, 3),
('Mantenimiento aire', 'media', 'Habitaciones', '2026-03-27', 706, 1),
('Revisión general habitación', 'baja', 'Habitaciones', '2026-03-28', 707, 2);


INSERT INTO historial (idhistorial, id_orden, estado, fecha, tecnico_responsable, observaciones) VALUES
(1, 1, 'terminado', '2026-02-13', 2, 'Excelente trabajo'),
(2, 2, 'terminado', '2026-02-12', 3, 'Buen trabajo, pero completar la asignacion en menor tiempo'),
(3, 3, 'terminado', '2026-02-11', 1, 'Busca una mejor solucion al problema'),
(4, 1, 'terminado', '2026-02-10', 4, 'Trabajo completado sin fallos'),
(5, 2, 'terminado', '2026-02-09', 5, 'Se recomienda revision futura');

INSERT INTO evaluacion (idEvaluacion, comentario, calificacion, fecha_evaluacion) VALUES
(1, 'Arreglo finalizado con satisfaccion', 'Aprobado', '2026-03-13 10:30:00'),
(2, 'Buen trabajo general', 'No Aprobado', '2026-03-12 14:20:00'),
(3, 'Aceptable pero mejorable', 'Aprobado', '2026-03-11 09:15:00'),
(4, 'Trabajo rapido y eficiente', 'No Aprobado', '2026-03-10 16:40:00'),
(5, 'Demora en la solucion', 'Aprobado', '2026-03-09 11:10:00');

------CONSULTAS

SELECT * 
FROM ordenes_de_trabajo
ORDER BY fecha_creacion DESC;

SELECT idOrden, descripcion, fecha_creacion
FROM ordenes_de_trabajo
WHERE prioridad = 'alta';

SELECT prioridad, COUNT(*) AS total
FROM ordenes_de_trabajo
GROUP BY prioridad;

SELECT h.idhistorial, h.id_orden, h.fecha, h.tecnico_responsable, h.observaciones
FROM historial h;

SELECT o.idOrden, o.descripcion, h.estado, h.fecha
FROM ordenes_de_trabajo o
INNER JOIN historial h ON o.idOrden = h.id_orden;

SELECT * 
FROM evaluacion
WHERE calificacion = 'Aprobado';

SELECT calificacion, COUNT(*) AS total
FROM evaluacion
GROUP BY calificacion;

SELECT comentario, calificacion, fecha_evaluacion
FROM evaluacion
ORDER BY fecha_evaluacion DESC;

SELECT *
FROM ordenes_de_trabajo
WHERE fecha_creacion BETWEEN '2026-03-23' AND '2026-03-26';

SELECT tecnico_responsable, COUNT(*) AS trabajos_realizados
FROM historial
GROUP BY tecnico_responsable
ORDER BY trabajos_realizados DESC;

SELECT *
FROM ordenes_de_trabajo
WHERE idOrden NOT IN (
SELECT id_orden FROM historial
);

SELECT o.descripcion, h.observaciones
FROM ordenes_de_trabajo o
INNER JOIN historial h ON o.idOrden = h.id_orden
WHERE o.idOrden = 1;

SELECT fecha_creacion, COUNT(*) AS total_ordenes
FROM ordenes_de_trabajo
GROUP BY fecha_creacion;

SELECT *
FROM ordenes_de_trabajo
WHERE id_usuario = 1;

SELECT *
FROM ordenes_de_trabajo
WHERE descripcion LIKE '%aire%';


SELECT o.idOrden, o.descripcion,
IF(h.id_orden IS NULL, 'Pendiente', 'Terminada') AS estado
FROM ordenes_de_trabajo o
LEFT JOIN historial h ON o.idOrden = h.id_orden;

SELECT 
IF(h.id_orden IS NULL, 'Pendiente', 'Terminada') AS estado,
COUNT(*) AS total
FROM ordenes_de_trabajo o
LEFT JOIN historial h ON o.idOrden = h.id_orden
GROUP BY estado;

SELECT id_orden, COUNT(*) AS veces_registrada
FROM historial
GROUP BY id_orden
HAVING COUNT(*) > 1;

SELECT h.id_orden, MAX(h.fecha) AS ultima_fecha
FROM historial h
GROUP BY h.id_orden;

SELECT h.*
FROM historial h
INNER JOIN (
SELECT id_orden, MAX(fecha) AS ultima_fecha
FROM historial
GROUP BY id_orden
) ult ON h.id_orden = ult.id_orden AND h.fecha = ult.ultima_fecha;

SELECT tecnico_responsable, COUNT(DISTINCT id_orden) AS total_ordenes
FROM historial
GROUP BY tecnico_responsable
HAVING COUNT(DISTINCT id_orden) > 1;

SELECT AVG(total) AS promedio_trabajos
FROM (
SELECT tecnico_responsable, COUNT(*) AS total
FROM historial
GROUP BY tecnico_responsable
) AS subconsulta;

SELECT *
FROM ordenes_de_trabajo o
LEFT JOIN historial h ON o.idOrden = h.id_orden
WHERE h.id_orden IS NULL;

SELECT DISTINCT o.idOrden, o.descripcion
FROM ordenes_de_trabajo o
INNER JOIN historial h ON o.idOrden = h.id_orden
WHERE o.prioridad = 'alta';

SELECT Ambiente, COUNT(*) AS total
FROM ordenes_de_trabajo
GROUP BY Ambiente;

SELECT fecha_creacion, COUNT(*) AS total
FROM ordenes_de_trabajo
GROUP BY fecha_creacion
ORDER BY total DESC
LIMIT 1;

SELECT descripcion, COUNT(*) AS veces
FROM ordenes_de_trabajo
GROUP BY descripcion
HAVING COUNT(*) > 1;

SELECT *
FROM evaluacion
WHERE fecha_evaluacion = (
SELECT MAX(fecha_evaluacion) FROM evaluacion
);

SELECT DATE(fecha_evaluacion) AS fecha, COUNT(*) AS total
FROM evaluacion
GROUP BY DATE(fecha_evaluacion);

SELECT comentario, fecha_evaluacion
FROM evaluacion
WHERE calificacion = 'No Aprobado';

SELECT 
(SUM(calificacion = 'Aprobado') / COUNT(*)) * 100 AS porcentaje_aprobados
FROM evaluacion;

SELECT *
FROM ordenes_de_trabajo
WHERE prioridad = 'alta'
ORDER BY fecha_creacion DESC

SELECT tecnico_responsable, COUNT(*) AS total_observaciones
FROM historial
GROUP BY tecnico_responsable
ORDER BY total_observaciones DESC
LIMIT 1;

SELECT id_orden
FROM historial
GROUP BY id_orden
HAVING COUNT(DISTINCT tecnico_responsable) > 1;

SELECT o.idOrden, o.descripcion, COUNT(h.idhistorial) AS veces_atendida
FROM ordenes_de_trabajo o
LEFT JOIN historial h ON o.idOrden = h.id_orden
GROUP BY o.idOrden;
