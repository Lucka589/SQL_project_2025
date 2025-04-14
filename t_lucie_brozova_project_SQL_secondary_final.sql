/*Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, 
 jako primární přehled pro ČR.
*/

SELECT *
FROM economies;

SELECT *
FROM countries;

CREATE TABLE t_lucie_brozova_project_SQL_secondary_final_2 AS
SELECT 
	DISTINCT c.country,
	e.year,
	e.gdp,
	e.gini,
	e.population
FROM countries c
LEFT JOIN economies e
ON c.country = e.country
WHERE e.YEAR BETWEEN 2006 AND 2018 AND c.continent = 'Europe'
ORDER BY e.YEAR;
