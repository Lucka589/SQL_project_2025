
--Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?


-- 1. Vytvořím view year_percentage_wage_growth s meziročním růstem mezd

CREATE VIEW year_percentage_wage_growth AS
SELECT 
	year,
	industry_name,
	average_year_wage,
	LAG(average_year_wage) OVER (PARTITION BY industry_name ORDER BY year) AS previous_year_wage,
	100 * (average_year_wage - LAG(average_year_wage) OVER (PARTITION BY industry_name ORDER BY year))
	/LAG(average_year_wage,1) OVER (PARTITION BY industry_name ORDER BY year) AS percentage_wage_growth
FROM t_lucie_brozova_projekt_sql_primary_final
GROUP BY year, industry_name, average_year_wage;

-- 2. Vytvořím view year_percentage_price_growth s meziročním růstem cen

CREATE VIEW year_percentage_price_growth AS
SELECT 
	year,
	category_code,
	product_name,
	average_price_year,
	LAG(average_price_year) OVER (PARTITION BY product_name ORDER BY year) AS previous_year_price,
	100 * (average_price_year - LAG(average_price_year) OVER (PARTITION BY product_name ORDER BY year))
	/LAG(average_price_year,1) OVER (PARTITION BY product_name ORDER BY year) AS percentage_price_growth
FROM t_lucie_brozova_projekt_sql_primary_final
GROUP BY year, category_code, product_name, average_price_year;

/* Pomoci JOIN obe view spojim, vypočítám průměrnou mzdu za všechna odvětví a průměrnou cenu za všechny produkty 
 	v konkrétním roce a vyfiltruju jen ty, kde průměrný přírustek ceny je vyšší než průměrný přírustek mezd o 10%.
 	Z toho vyšlo, že v žádném roce nebyl průměrný přírustek cen o 10% vyšší než průměrný přírustek cen
 */


SELECT
	yppg.YEAR,
	AVG(yppg.percentage_price_growth) AS avg_price_growth,
	AVG(ypwg.percentage_wage_growth) AS avg_wage_growth
FROM year_percentage_price_growth yppg
LEFT JOIN year_percentage_wage_growth ypwg
	ON yppg.year = ypwg.year	
WHERE yppg.YEAR > 2005
GROUP BY yppg.YEAR
HAVING AVG(yppg.percentage_price_growth) - AVG(ypwg.percentage_wage_growth) > 10
ORDER BY yppg.year;



