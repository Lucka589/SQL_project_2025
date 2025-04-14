--Tabulka mezd a cen potravin za Českou republiku sjednocených na totožné porovnatelné období – společné roky


CREATE TABLE t_lucie_brozova_projekt_SQL_primary_final AS
SELECT 
 	cp.payroll_year AS year,
	cp2.category_code,
	cpc.name AS product_name,
	round(AVG(cp2.value):: NUMERIC,2) AS average_price_year,
	cp.industry_branch_code,
	cpib.name AS industry_name,
	round(AVG(cp.value),2) AS average_year_wage
FROM czechia_price cp2
LEFT JOIN czechia_payroll cp
ON date_part('year', cp2.date_from) = cp.payroll_year
JOIN czechia_price_category AS cpc
    ON cp2.category_code = cpc.code
JOIN czechia_payroll_industry_branch AS cpib 
	ON cp.industry_branch_code = cpib.code
WHERE cp.value_type_code = 5958
GROUP BY cp.payroll_year, cp.industry_branch_code, cp2.category_code, cpc.name, cpib.name
ORDER BY cp.payroll_year ASC, cpc.name, cpib.name;

