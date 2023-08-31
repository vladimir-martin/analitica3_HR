--creacion de tabla con variable Attrition
DROP TABLE IF EXISTS Attrition;
CREATE TABLE Attrition AS
select t1.EmployeeID, IFNULL(t2.Attrition, "No") AS "Attrition"  FROM manager t1
left join retirement t2 on t1.EmployeeID=t2.EmployeeID;
select * from Attrition;


--Se reorganizan las tablas y eliminan de las tablas las variables que no aportan, segun analisis de categorias

--tabla employe_survey(no es necesario eliminar variables, quedan para codificar)
SELECT * FROM employee_survey;
--  se crea tabla employee_survey_2 con variables reorganizadas
DROP TABLE IF EXISTS employee_survey_2;
CREATE TABLE employee_survey_2 AS
SELECT EmployeeID,EnvironmentSatisfaction,JobSatisfaction,WorkLifeBalance FROM employee_survey;
SELECT * FROM employee_survey_2;

--tabla general
select * from general;
--variable EmployeeCount tiene solo un valor, se elimina
--variable Over18 se elimina, solo tiene un valor
--variable StandardHours se elimina, solo tiene un valor

--se crea tabla general_2 sin las variables eliminadas y con variables reorganizadas
DROP TABLE IF EXISTS general_2;
CREATE TABLE general_2 AS
SELECT EmployeeID,Age,BusinessTravel,Department,DistanceFromHome, Education,EducationField,Gender,JobLevel,JobRole,MaritalStatus,MonthlyIncome,NumCompaniesWorked,PercentSalaryHike,StockOptionLevel,TotalWorkingYears,TrainingTimesLastYear,YearsAtCompany,YearsSinceLastPromotion,YearsWithCurrManager FROM general;
SELECT * FROM general_2;

--tabla manager(no se elimina nada)
select * from manager;
--Se crea tabla manager_2 con variables reorganizadas
DROP TABLE IF EXISTS manager_2;
CREATE TABLE manager_2 AS
SELECT EmployeeID,JobInvolvement,PerformanceRating FROM manager;
SELECT * FROM manager_2;

--tabla retirement (se uno para crear la tabla de Atrittion, no se usan las otras variables
select * from retirement;
--Se crea tabla retirement_2 con variables reorganizadas
DROP TABLE IF EXISTS retirement_2;
CREATE TABLE retirement_2 AS
SELECT EmployeeID,Attrition,retirementDate,retirementType,resignationReason FROM retirement;
SELECT * FROM retirement_2;


--union de bases de datos 

DROP TABLE IF EXISTS base_full;
CREATE TABLE base_full AS 
SELECT t1.*, t2.Attrition, t3.JobInvolvement,t3.PerformanceRating, t4.EnvironmentSatisfaction,t4.JobSatisfaction,t4.WorkLifeBalance 
FROM general_2 t1
INNER JOIN Attrition t2 ON t1.EmployeeID=t2.EmployeeID
INNER JOIN manager_2 t3 ON t1.EmployeeID=t3.EmployeeID
INNER JOIN employee_survey_2 t4 ON T1.EmployeeID=T4.EmployeeID;

SELECT * FROM base_full;

--verificar que tenga el numero de registros correctos
select count(*) from base_full;





