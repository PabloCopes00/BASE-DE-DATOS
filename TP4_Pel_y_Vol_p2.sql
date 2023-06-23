/* Ejercicio 1
Consultas con anidamiento (usando IN, NOT IN, EXISTS, NOT EXISTS):

1.1. Listar todas las películas que poseen entregas de películas de idioma inglés durante
el año 2006. (P)*/
-- version join
SELECT count(DISTINCT r.codigo_pelicula)
FROM unc_esq_peliculas.renglon_entrega r
         JOIN unc_esq_peliculas.entrega e ON (r.nro_entrega = e.nro_entrega)
         JOIN unc_esq_peliculas.pelicula p on (r.codigo_pelicula = p.codigo_pelicula)
WHERE EXTRACT(YEAR FROM fecha_entrega) = 2006
  AND p.idioma = 'Inglés';

-- version IN
SELECT count(DISTINCT p.codigo_pelicula)
FROM unc_esq_peliculas.pelicula p
WHERE p.idioma = 'Inglés'
  AND p.codigo_pelicula IN
      (SELECT r.codigo_pelicula
       FROM unc_esq_peliculas.renglon_entrega r
       WHERE r.nro_entrega in
             (SELECT e.nro_entrega
              FROM unc_esq_peliculas.entrega e
              where EXTRACT(YEAR FROM e.fecha_entrega) = 2006));


/*1.2. Indicar la cantidad de películas que han sido entregadas en 2006 por un distribuidor
nacional.(P) */
SELECT count(DISTINCT r.codigo_pelicula)
FROM unc_esq_peliculas.renglon_entrega r
         INNER JOIN unc_esq_peliculas.entrega e ON (r.nro_entrega = e.nro_entrega)
         INNER JOIN unc_esq_peliculas.distribuidor d on (e.id_distribuidor = d.id_distribuidor)
where EXTRACT(YEAR FROM e.fecha_entrega) = 2006
  AND d.tipo = 'N';

-- version IN
SELECT count(DISTINCT r.codigo_pelicula)
FROM unc_esq_peliculas.renglon_entrega r
WHERE r.nro_entrega IN (SELECT e.nro_entrega
                        FROM unc_esq_peliculas.entrega e
                        WHERE EXTRACT(YEAR FROM e.fecha_entrega) = 2006
                          AND e.id_distribuidor IN (SELECT id_distribuidor
                                                    from unc_esq_peliculas.distribuidor
                                                    where tipo = 'N'));

/* 1.3. Indicar los departamentos que no posean empleados cuya diferencia de sueldo
máximo y mínimo (asociado a la tarea que realiza) no supere el 40% del sueldo máximo.
(P) (Probar con 10% para que retorne valores) */


-- 1.4. Liste las películas que nunca han sido entregadas por un distribuidor nacional.(P)
SELECT DISTINCT p.titulo
FROM unc_esq_peliculas.pelicula p
         INNER JOIN unc_esq_peliculas.renglon_entrega r ON (p.codigo_pelicula = r.codigo_pelicula)
         INNER JOIN unc_esq_peliculas.entrega e ON (r.nro_entrega = e.nro_entrega)
         JOIN unc_esq_peliculas.distribuidor d ON (e.id_distribuidor = d.id_distribuidor)
WHERE d.tipo = 'I';

-- version NOT IN
SELECT DISTINCT p.titulo
FROM unc_esq_peliculas.pelicula p
WHERE p.codigo_pelicula NOT IN
      (SELECT r.codigo_pelicula
       FROM unc_esq_peliculas.renglon_entrega r
       WHERE r.nro_entrega NOT IN
             (SELECT e.nro_entrega
              FROM unc_esq_peliculas.entrega e
              WHERE e.id_distribuidor IS NOT NULL
                AND e.id_distribuidor NOT IN
                    (SELECT d.id_distribuidor
                     FROM unc_esq_peliculas.distribuidor d
                     WHERE d.tipo = 'N')));
--chequear si esto esta bien! =S

/* 1.5. Determinar los jefes que poseen personal a cargo y cuyos departamentos (los del
jefe) se encuentren en la Argentina. */


/* 1.6. Liste el apellido y nombre de los empleados que pertenecen a aquellos
departamentos de Argentina y donde el jefe de departamento posee una comisión de más
del 10% de la que posee su empleado a cargo. */


/*Consultas que involucran agrupamiento:
1.7. Indicar la cantidad de películas entregadas a partir del 2010, por género. */
SELECT COUNT(r.nro_entrega), p.genero
FROM unc_esq_peliculas.renglon_entrega r
         INNER JOIN unc_esq_peliculas.entrega e ON (r.nro_entrega = e.nro_entrega)
         INNER JOIN unc_esq_peliculas.pelicula p ON (r.codigo_pelicula = p.codigo_pelicula)
WHERE EXTRACT(YEAR FROM e.fecha_entrega) = 2010
GROUP BY genero;

/* 1.8. Realizar un resumen de entregas por día, indicando el video club al cual se le
realizó la entrega y la cantidad entregada. Ordenar el resultado por fecha. */


/* 1.9. Listar, para cada ciudad, el nombre de la ciudad y la cantidad de empleados
mayores de edad que desempeñan tareas en departamentos de la misma y que posean al
menos 30 empleados. */


/* Ejercicio 2
Considere la base de Voluntarios del Práctico 3 y resuelva las siguientes consultas (pueden
Involucrar anidamiento y/o agrupamiento).
2.1. Muestre, para cada institución, su nombre y la cantidad de voluntarios que realizan
aportes. Ordene el resultado por nombre de institución. */


/* 2.2. Determine la cantidad de coordinadores en cada país, agrupados por nombre de
país y nombre de continente. Etiquete la primer columna como 'Número de coordinadores' */


/* 2.3. Escriba una consulta para mostrar el apellido, nombre y fecha de nacimiento de
cualquier voluntario que trabaje en la misma institución que el Sr. de apellido Zlotkey.
Excluya del resultado a Zlotkey. */


/* 2.4. Cree una consulta para mostrar los números de voluntarios y los apellidos de todos
los voluntarios cuya cantidad de horas aportadas sea mayor que la media de las horas
aportadas. Ordene los resultados por horas aportadas en orden ascendente
para mostrar el apellido, nombre y fecha de nacimiento de */

/* Ejercicio 3
Dada la siguiente tabla y basándose en el esquema de películas, */

CREATE
    TABLE DistribuidorNac
(
    id_distribuidor      numeric(5
                             , 0)               NOT NULL,
    nombre               character varying(80)  NOT NULL,
    direccion            character varying(120) NOT NULL,
    telefono             character varying(20),
    nro_inscripcion      numeric(8
                             , 0)               NOT NULL,
    encargado            character varying(60)  NOT NULL,
    id_distrib_mayorista numeric(5
                             , 0),
    CONSTRAINT pk_distribuidorNac PRIMARY KEY (id_distribuidor)
);

/* 3.1 Se solicita llenarla con la información correspondiente a los datos completos de
todos los distribuidores nacionales. */


/* 3.2 Agregar a la definición de la tabla DistribuidorNac, el campo &quot;codigo_pais&quot; que
indica el código de país del distribuidor mayorista que atiende a cada distribuidor
nacional.(codigo_pais character varying(5) NULL) */


/* 3.3. Para todos los registros de la tabla DistribuidorNac, llenar el nuevo campo
'codigo_pais' con el valor correspondiente existente en la tabla 'Internacional'. */


/* 3.4. Eliminar de la tabla DistribuidorNac los registros que no tienen asociado un
distribuidor mayorista. */

-- pruebas para el parcial

-- 3 tareas con sueldos entre lo solicitado
SELECT t.nombre_tarea, (t.sueldo_maximo - t.sueldo_minimo) AS diferencia
FROM unc_esq_peliculas.tarea t
WHERE t.sueldo_maximo <= 11000
ORDER BY 2
LIMIT 3;

-- Cant. empleados x depto
SELECT e.id_departamento, count(id_empleado) cantidad_empleados
FROM unc_esq_peliculas.empleado e
GROUP BY e.id_departamento;


--Cant Ciudades agrupado x paises que terminan en IA
SELECT p.id_pais, count(c.id_ciudad)
FROM unc_esq_peliculas.pais p
         INNER JOIN unc_esq_peliculas.ciudad c on (p.id_pais = c.id_pais)
WHERE p.nombre_pais like '%IA'
GROUP BY p.id_pais;