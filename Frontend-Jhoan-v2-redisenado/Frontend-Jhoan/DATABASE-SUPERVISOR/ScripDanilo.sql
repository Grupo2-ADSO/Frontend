CREATE TABLE habitaciones (
  No_habitacion VARCHAR(4) PRIMARY KEY,
  piso INT NOT NULL,
  tipo_hab VARCHAR(4) NOT NULL
);

INSERT INTO habitaciones (No_habitacion, piso, tipo_hab) VALUES

('0601',6,'KDXN'),('0602',6,'KDXN'),('0603',6,'KDXN'),('0604',6,'KDXN'),
('0605',6,'KDXN'),('0606',6,'KDXN'),('0607',6,'KDXN'),
('0608',6,'TDXN'),('0609',6,'TDXN'),('0610',6,'TDXN'),
('0611',6,'KDXN'),
('0612',6,'TDXN'),('0613',6,'TDXN'),('0614',6,'TDXN'),('0615',6,'TDXN'),('0616',6,'TDXN'),


('0701',7,'KDXN'),('0702',7,'KDXN'),('0703',7,'KDXN'),('0704',7,'KDXN'),
('0705',7,'KDXN'),('0706',7,'KDXN'),('0707',7,'KDXN'),
('0708',7,'TDXN'),('0709',7,'TDXN'),('0710',7,'TDXN'),
('0711',7,'KDXN'),
('0712',7,'TDXN'),('0713',7,'TDXN'),('0714',7,'TDXN'),('0715',7,'TDXN'),('0716',7,'TDXN'),

('0801',8,'KDXN'),('0802',8,'KDXN'),('0803',8,'KDXN'),('0804',8,'KDXN'),
('0805',8,'KDXN'),('0806',8,'KDXN'),('0807',8,'KDXN'),
('0808',8,'TDXN'),('0809',8,'TDXN'),('0810',8,'TDXN'),
('0811',8,'KDXN'),
('0812',8,'TDXN'),('0813',8,'TDXN'),('0814',8,'TDXN'),('0815',8,'TDXN'),('0816',8,'TDXN'),


('0901',9,'KDXN'),('0902',9,'KDXN'),('0903',9,'KDXN'),('0904',9,'KDXN'),
('0905',9,'KDXN'),('0906',9,'KDXN'),('0907',9,'KDXN'),
('0908',9,'TDXN'),('0909',9,'TDXN'),('0910',9,'TDXN'),
('0911',9,'KDXN'),
('0912',9,'TDXN'),('0913',9,'TDXN'),('0914',9,'TDXN'),('0915',9,'TDXN'),('0916',9,'TDXN'),


('1001',10,'KDXN'),('1002',10,'KDXN'),('1003',10,'KDXN'),('1004',10,'KDXN'),
('1005',10,'KDXN'),('1006',10,'KDXN'),('1007',10,'KDXN'),
('1008',10,'TDXN'),('1009',10,'TDXN'),('1010',10,'TDXN'),
('1011',10,'KDXN'),
('1012',10,'TDXN'),('1013',10,'TDXN'),('1014',10,'TDXN'),('1015',10,'TDXN'),('1016',10,'TDXN'),


('1101',11,'KDXN'),('1102',11,'KDXN'),('1103',11,'KDXN'),('1104',11,'KDXN'),
('1105',11,'KDXN'),('1106',11,'KDXN'),('1107',11,'KDXN'),
('1108',11,'TDXN'),('1109',11,'TDXN'),('1110',11,'TDXN'),
('1111',11,'KDXN'),
('1112',11,'TDXN'),('1113',11,'TDXN'),('1114',11,'TDXN'),('1115',11,'TDXN'),('1116',11,'TDXN'),

('1201',12,'KDXN'),('1202',12,'KDXN'),('1203',12,'KDXN'),('1204',12,'KDXN'),
('1205',12,'KDXN'),('1206',12,'KDXN'),('1207',12,'KDXN'),
('1208',12,'TDXN'),('1209',12,'TDXN'),('1210',12,'TDXN'),
('1211',12,'KDXN'),
('1212',12,'TDXN'),('1213',12,'TDXN'),('1214',12,'TDXN'),('1215',12,'TDXN'),('1216',12,'TDXN'),


('1301',13,'KDXN'),('1302',13,'KDXN'),('1303',13,'KDXN'),('1304',13,'KDXN'),
('1305',13,'KDXN'),('1306',13,'KDXN'),('1307',13,'KDXN'),
('1308',13,'TDXN'),('1309',13,'TDXN'),('1310',13,'TDXN'),
('1311',13,'KDXN'),
('1312',13,'TDXN'),('1313',13,'TDXN'),('1314',13,'TDXN'),('1315',13,'TDXN'),('1316',13,'TDXN'),


('1401',14,'KDXN'),('1402',14,'KDXN'),('1403',14,'KDXN'),('1404',14,'KDXN'),
('1405',14,'KDXN'),('1406',14,'KDXN'),('1407',14,'KDXN'),
('1408',14,'TDXN'),('1409',14,'TDXN'),('1410',14,'TDXN'),
('1411',14,'KDXN'),
('1412',14,'TDXN'),('1413',14,'TDXN'),('1414',14,'TDXN'),('1415',14,'TDXN'),('1416',14,'TDXN'),


('1501',15,'KDXN'),('1502',15,'KDXN'),('1503',15,'KDXN'),('1504',15,'KDXN'),
('1505',15,'KDXN'),('1506',15,'KDXN'),('1507',15,'KDXN'),
('1508',15,'TDXN'),('1509',15,'TDXN'),('1510',15,'TDXN'),
('1511',15,'KDXN'),
('1512',15,'TDXN'),('1513',15,'TDXN'),('1514',15,'TDXN'),('1515',15,'TDXN'),('1516',15,'TDXN');


CREATE TABLE ambientes (
  id_ambiente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO ambientes (nombre) VALUES
('oficinas'),
('golden'),
('restaurante'),
('skybar'),
('cocina_16'),
('cocina_18'),
('salones'),
('pasillos'),
('zona_de_carga'),
('porcionamiento'),
('lavanderia'),
('baños_empleados_ss');

--------CONSULTAS
SELECT tipo_hab, COUNT(*) AS total
FROM habitaciones
GROUP BY tipo_hab;

SELECT piso, COUNT(*) AS total_habitaciones
FROM habitaciones
GROUP BY piso
ORDER BY piso ASC;

SELECT piso, COUNT(*) AS total
FROM habitaciones
GROUP BY piso
HAVING COUNT(*) > 15;

SELECT *
FROM habitaciones
WHERE tipo_hab = 'KDXN' AND piso >= 10;

SELECT piso, tipo_hab, COUNT(*) AS total
FROM habitaciones
GROUP BY piso, tipo_hab
ORDER BY piso;

SELECT *
FROM habitaciones
WHERE No_habitacion LIKE '10%';

SELECT COUNT(*) AS total_hotel
FROM habitaciones;  

SELECT *
FROM ambientes
ORDER BY nombre ASC;

SELECT *
FROM ambientes
WHERE nombre LIKE '%cocina%';

SELECT piso, COUNT(*) AS total
FROM habitaciones
GROUP BY piso
HAVING COUNT(*) > (
    SELECT AVG(total_piso)
    FROM (
        SELECT COUNT(*) AS total_piso
        FROM habitaciones
        GROUP BY piso
    ) AS sub
);

SELECT 
  tipo_hab,
  COUNT(*) AS cantidad,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM habitaciones), 2) AS porcentaje
FROM habitaciones
GROUP BY tipo_hab;