--Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

-- Vytvořila jsem View s meziročním přírustkem cen

CREATE VIEW t_lucie_brozova_percentage_growth AS
	SELECT 
	year,
	product_name,
	average_price_year,
	LAG(average_price_year) OVER (PARTITION BY product_name ORDER BY year) AS previous_year_price,
	100 * (average_price_year - LAG(average_price_year) OVER (PARTITION BY product_name ORDER BY year))
	/LAG(average_price_year,1) OVER (PARTITION BY product_name ORDER BY year) AS percentage_growth
FROM t_lucie_brozova_projekt_sql_primary_final
GROUP BY year, product_name, average_price_year;

SELECT *
FROM t_lucie_brozova_percentage_growth tlbpg ;

/* Z vytvořeného View jsem udělala průměrný přírustek za celé sledované období pro všechny potraviny, ze kterého jsem zjistila,
   která potravina zdražuje nejméně. Z toho mi vyšlo, že Cukr krystalový má záporný přírustek, takže cena za sledované období klesla
 */

SELECT 
	product_name,
	AVG(percentage_growth) AS average_percentage_growth
FROM t_lucie_brozova_percentage_growth
GROUP BY product_name
ORDER BY average_percentage_growth ASC 
LIMIT 1;

/* Abych ale zjistila, která potravina zdražuje nejpomaleji, tak jsem vyfiltrovala jen přírustky vetší než 0 
   a z toho mi vyšlo, že nejpomaleji zdražují banány žluté.
 */

SELECT 
	product_name,
	AVG(percentage_growth) AS average_percentage_growth
FROM t_lucie_brozova_percentage_growth
GROUP BY product_name
HAVING AVG(percentage_growth) > 0
ORDER BY average_percentage_growth ASC 
LIMIT 1;

