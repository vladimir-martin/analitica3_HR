--creacion de tabla con variable Attrition
DROP TABLE IF EXISTS Attrition;
CREATE TABLE Attrition AS
select t1.EmployeeID, IFNULL(t2.Attrition, "No") AS "Attrition"  FROM manager t1
left join retirement t2 on t1.EmployeeID=t2.EmployeeID;
select * from Attrition;


--Se eliminan de las tablas las variables que no aportan, segun analisis de categorias

--tabla employe_survey
select * from employee_survey