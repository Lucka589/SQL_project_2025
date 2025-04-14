--Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

SELECT *
FROM t_lucie_brozova_projekt_sql_primary_final tlbpspf ;

SELECT 
 	year,
 	product_name,
 	industry_name,
	ROUND(average_year_wage/average_price_year,2) AS product_affordability
FROM t_lucie_brozova_projekt_sql_primary_final tlbpspf 
WHERE year IN ('2006','2018')
	AND category_code IN ('114201','111301')
ORDER BY product_name, year, product_affordability ;

/* K zjištění dotazu využiji vytvořenou tabulku t_lucie_brozova_projekt_sql_primary_final.
Kolik je možné koupit si litrů mléka a kilogramů chleba v prvním a posledním srovnatelném období je zachycené ve sloupci
product_affordability a závisí na průměrné mzdě v konkrétním odvětví. V roce 2006 si nejméně chleba, 
a to 706.58 kg za průměrnou mzdu můžou koupit v odvětví Ubytování, stravování a pohostinství, 
nejvíce kg chleba si naopak mohou dovolit v odvětví Informační a komunikační činnosti , a to 2 462.17 kg za průměrnou mzdu.
V posledním srovnatelném období v roce 2018 si nejméně litrů mléka mohou dovolit také v Ubytování, stravování a pohostinství,
a to 788.78 litrů za průměrnou mzdu a stejně tak nejvíce v odvětví Informační a komunikační činnosti, a to 2 830.54 litrů mléka
*/