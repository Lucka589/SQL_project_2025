--Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?



SELECT *
FROM t_lucie_brozova_projekt_sql_primary_final tlbpspf ;


WITH difference AS (
SELECT 
	DISTINCT industry_name,
	average_year_wage,
	LAG(average_year_wage) OVER (PARTITION BY industry_name ORDER BY year) AS previous_year_wage,
	YEAR
FROM t_lucie_brozova_projekt_sql_primary_final tlbpspf
ORDER BY industry_name,year ASC
)
SELECT *
FROM difference 
WHERE average_year_wage - previous_year_wage < 0;


/* Z vytvořené tabulky t_lucie_brozova_projekt_sql_primary_final jsem si pomocí operátoru WITH vytvořila přehled všech odvětví,
   jejich průměrných ročních mezd a průměrných ročních mezd za předchozí období.
   Z toho jsem si poté vyselektovala rozdíl současného a předchozího roku, který je menší než 0 a vyšel mi přehled odvětví,
   kde v roce uvedeném v posledním sloupci mzdy poklesly. Závěr je, že ve všech odvětvích mzdy v průběhu let nerostou, 
   v některých letech a odvětvích mzdy klesají viz výsledky dotazu.
*/