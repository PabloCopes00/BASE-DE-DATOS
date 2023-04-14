/*Seleccione el identificador y nombre de todas las instituciones que son Fundaciones.(V) */
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

/* Muestre los datos de los distribuidores internacionales que no tienen registrado teléfono.
(P) */

SELECT *
FROM unc_esq_peliculas.distribuidor
WHERE tipo = 'I' || telefono IS NULL;

/* Muestre los apellidos, nombres y mails de los empleados con cuentas de gmail y cuyo
sueldo sea superior a $ 1000. (P) */

SELECT apellido, nombre, e_mail
FROM unc_esq_peliculas.empleado
WHERE sueldo > 1000 AND e_mail LIKE '%gmail.com';

/* Seleccione los diferentes identificadores de tareas que se utilizan en la tabla empleado. (P) */

SELECT DISTINCT id_tarea -- esto esta bien?
FROM unc_esq_peliculas.empleado

/* Muestre el apellido, nombre y mail de todos los voluntarios cuyo teléfono comienza con
+51. Coloque el encabezado de las columnas de los títulos &#39;Apellido y Nombre&#39; y &#39;Dirección
de mail&#39;. (V)

Hacer un listado de los cumpleaños de todos los empleados donde se muestre el nombre y
el apellido (concatenados y separados por una coma) y su fecha de cumpleaños (solo el
día y el mes), ordenado de acuerdo al mes y día de cumpleaños en forma ascendente. (P)

Recupere la cantidad mínima, máxima y promedio de horas aportadas por los voluntarios
nacidos desde 1990. (V)

Listar la cantidad de películas que hay por cada idioma. (P)

Calcular la cantidad de empleados por departamento. (P)

Mostrar los códigos de películas que han recibido entre 3 y 5 entregas. (veces entregadas,
NO cantidad de películas entregadas).

¿Cuántos cumpleaños de voluntarios hay cada mes?

¿Cuáles son las 2 instituciones que más voluntarios tienen?

¿Cuáles son los id de ciudades que tienen más de un departamento?
*/
