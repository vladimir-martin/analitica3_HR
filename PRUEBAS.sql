select EnvironmentSatisfaction, count(*) as "qty"
                            from employee_survey 
            group by EnvironmentSatisfaction;


select * from retirement t2

select * from manager t1

select t1.fecha , t1.cantidad as qty_carros,t2.cantidad as qty_personas from resumen_hurto_carro t1
left join resumen_hurto_persona t2 on t1.fecha=t2.fecha

--creacion de variable Attrition
DROP TABLE IF EXISTS Attrition;
CREATE TABLE Attrition AS
select t1.EmployeeID, IFNULL(t2.Attrition, "No") AS "Attrition"  FROM manager t1
left join retirement t2 on t1.EmployeeID=t2.EmployeeID


-- crear nueva uniendo dos tablas o consultas
DROP TABLE IF EXISTS tabla_test;
CREATE TABLE tabla_test AS
WITH tabla1 as (
select * from manager),
tabla2 as (
select t1.EmployeeID, IFNULL(t2.Attrition, "No") AS "Attrition"  FROM manager t1
left join retirement t2 on t1.EmployeeID=t2.EmployeeID)
select t1.*, t2.Attrition  from tabla1 t1
left join tabla2 t2 on t1.EmployeeID=t2.EmployeeID;

--eliminar columnas de tabla
ALTER TABLE estudiante DROP COLUMN sexo;