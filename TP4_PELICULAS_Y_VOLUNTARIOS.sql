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