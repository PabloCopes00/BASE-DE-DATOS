/* Ejercicio 1
Consultas con anidamiento (usando IN, NOT IN, EXISTS, NOT EXISTS):

1.1. Listar todas las películas que poseen entregas de películas de idioma inglés durante
el año 2006. (P)*/



/*1.2. Indicar la cantidad de películas que han sido entregadas en 2006 por un distribuidor
nacional. Trate de resolverlo utilizando ensambles.(P) */



/* 1.3. Indicar los departamentos que no posean empleados cuya diferencia de sueldo
máximo y mínimo (asociado a la tarea que realiza) no supere el 40% del sueldo máximo.
(P) (Probar con 10% para que retorne valores) */



-- 1.4. Liste las películas que nunca han sido entregadas por un distribuidor nacional.(P)



/* 1.5. Determinar los jefes que poseen personal a cargo y cuyos departamentos (los del
jefe) se encuentren en la Argentina. */



/* 1.6. Liste el apellido y nombre de los empleados que pertenecen a aquellos
departamentos de Argentina y donde el jefe de departamento posee una comisión de más
del 10% de la que posee su empleado a cargo. */



/*Consultas que involucran agrupamiento:
1.7. Indicar la cantidad de películas entregadas a partir del 2010, por género. */



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

CREATE TABLE DistribuidorNac
(
id_distribuidor numeric(5,0) NOT NULL,
nombre character varying(80) NOT NULL,
direccion character varying(120) NOT NULL,
telefono character varying(20),
nro_inscripcion numeric(8,0) NOT NULL,
encargado character varying(60) NOT NULL,
id_distrib_mayorista numeric(5,0),
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