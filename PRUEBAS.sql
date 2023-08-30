select EnvironmentSatisfaction, count(*) as "qty"
                            from employee_survey 
            group by EnvironmentSatisfaction;


select * from retirement t2

select * from manager t1

select t1.fecha , t1.cantidad as qty_carros,t2.cantidad as qty_personas from resumen_hurto_carro t1
left join resumen_hurto_persona t2 on t1.fecha=t2.fecha

--creacion de variable Attrition
select t1.EmployeeID, t2.Attrition FROM manager t1
left join retirement t2 on t1.EmployeeID=t2.EmployeeID