-- Seleccione el identificador y nombre de todas las instituciones que son Fundaciones.(V)
SELECT id_institucion, nombre_institucion
FROM unc_esq_voluntario.institucion
WHERE nombre_institucion LIKE 'FUNDACION%';

/* Seleccione el identificador de distribuidor, identificador de departamento y nombre de todos
los departamentos.(P) */

SELECT id_distribuidor, id_departamento, nombre
FROM unc_esq_peliculas.departamento;

/* Muestre el nombre, apellido y el teléfono de todos los empleados cuyo id_tarea sea 7231,
ordenados por apellido y nombre.(P) */

SELECT nombre, apellido, telefono
FROM unc_esq_peliculas.empleado
WHERE id_tarea = '7231'
ORDER BY empleado.apellido, empleado.nombre;

/* Muestre el apellido e identificador de todos los empleados que no cobran porcentaje de
comisión.(P) */

SELECT id_empleado, apellido
FROM unc_esq_peliculas.empleado
WHERE porc_comision IS NULL;

/* Muestre el apellido y el identificador de la tarea de todos los voluntarios que no tienen
coordinador.(V) */

SELECT apellido, id_tarea
FROM unc_esq_voluntario.voluntario
WHERE id_coordinador IS NULL;

-- Muestre los datos de los distribuidores internacionales que no tienen registrado teléfono. (P)

SELECT *
FROM unc_esq_peliculas.distribuidor
WHERE tipo = 'I' || telefono IS NULL;

/* Muestre los apellidos, nombres y mails de los empleados con cuentas de gmail y cuyo
sueldo sea superior a $ 1000. (P) */

SELECT apellido, nombre, e_mail
FROM unc_esq_peliculas.empleado
WHERE sueldo > 1000 AND e_mail LIKE '%gmail.com';

-- Seleccione los diferentes identificadores de tareas que se utilizan en la tabla empleado. (P)

SELECT DISTINCT id_tarea
FROM unc_esq_peliculas.empleado;

/* Muestre el apellido, nombre y mail de todos los voluntarios cuyo teléfono comienza con
+51. Coloque el encabezado de las columnas de los títulos 'Apellido y Nombre' y 'Dirección
de mail'. (V) */

SELECT apellido || ',' || nombre AS "Apellido , nombre", e_mail AS "Direccion de mail"
FROM unc_esq_voluntario.voluntario
WHERE telefono like '+51%';

/* Hacer un listado de los cumpleaños de todos los empleados donde se muestre el nombre y
el apellido (concatenados y separados por una coma) y su fecha de cumpleaños (solo el
día y el mes), ordenado de acuerdo al mes y día de cumpleaños en forma ascendente. (P) */

SELECT nombre ||','|| apellido AS "Nombre,Apellido",
       extract(DAY FROM fecha_nacimiento) ||' / '||extract(MONTH FROM fecha_nacimiento) AS "Dia/mes"
FROM unc_esq_peliculas.empleado
ORDER BY extract(MONTH FROM fecha_nacimiento), extract(DAY FROM fecha_nacimiento);

/*Recupere la cantidad mínima, máxima y promedio de horas aportadas por los voluntarios
nacidos desde 1990. (V) */

SELECT MIN(horas_aportadas) AS Minimo, MAX(horas_aportadas) AS Maximo, AVG(horas_aportadas) AS Promedio, count(horas_aportadas)
FROM unc_esq_voluntario.voluntario
WHERE fecha_nacimiento >= '1990-01-01';

-- Listar la cantidad de películas que hay por cada idioma. (P)

SELECT idioma, count(idioma)
FROM unc_esq_peliculas.pelicula
GROUP BY idioma HAVING count(idioma)>0;

-- innecesario poner el HAVING pero esta bueno por si necesitamos contar por ej idiomas con mas o menos peliculas.

-- Calcular la cantidad de empleados por departamento. (P)

SELECT id_departamento, count(id_empleado)
FROM unc_esq_peliculas.empleado
GROUP BY id_departamento
ORDER BY id_departamento; -- esto esta de mas, pero esta bueno verlos ordenados.

/* Mostrar los códigos de películas que han recibido entre 3 y 5 entregas. (veces entregadas,
NO cantidad de películas entregadas). (P) */

SELECT codigo_pelicula
FROM unc_esq_peliculas.renglon_entrega
WHERE nro_entrega BETWEEN 3 and 5;

-- ¿Cuántos cumpleaños de voluntarios hay cada mes? (V)

SELECT extract(MONTH FROM fecha_nacimiento) AS Mes, count(fecha_nacimiento) AS Cantidad_Cumpleaños
FROM unc_esq_voluntario.voluntario
GROUP BY extract(MONTH FROM fecha_nacimiento)
ORDER BY extract(MONTH FROM fecha_nacimiento);

-- ¿Cuáles son las 2 instituciones que más voluntarios tienen? (V)



-- ¿Cuáles son los id de ciudades que tienen más de un departamento? (P)
