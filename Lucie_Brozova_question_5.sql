/* Má výška HDP vliv na změny ve mzdách a cenách potravin? 
 Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin 
 či mzdách ve stejném nebo následujícím roce výraznějším růstem?
*/

--Ke zjištění, jestli existuje vztah mezi změnou HDP a změnou cen a mezd využiji vytvořené View z předchozích otázek a tabulku economies


SELECT *
FROM year_percentage_price_growth yppg ;

SELECT *
FROM year_percentage_wage_growth ypwg ;

SELECT *
FROM economies;

--Obě View a tabulku spojím a zjistím průměrný procentní přírustek HDP, cen a mezd v České republice za sledované období

SELECT
	yppg.YEAR,
	e.country,
	AVG(yppg.percentage_price_growth) AS avg_percentage_price_growth,
	AVG(ypwg.percentage_wage_growth) AS avg_percentage_wage_growth,
	100 * (e.gdp - LAG(e.gdp) OVER (PARTITION BY e.country ORDER BY yppg.year))/
	LAG(e.gdp) OVER (PARTITION BY e.country ORDER BY yppg.year) AS gdp_percentage_growth
FROM year_percentage_price_growth yppg
LEFT JOIN year_percentage_wage_growth ypwg
	ON yppg.year = ypwg.YEAR
JOIN economies e 
	ON yppg.YEAR = e.year
WHERE yppg.YEAR > 2005 AND yppg.YEAR < 2019 AND country = 'Czech Republic'
GROUP BY yppg.year, e.country, e.gdp
ORDER BY year ASC;

/* Z výsledného dotazu zjistím, že výrazná změna HDP neznamená vždy výrazný nárůst cen a mezd v daném nebo následujícím roce.
V některých letech došlo k růstu cen a mezd, pokud HDP vzrostlo, např. z roku 2006 na 2007 nebo z roku 2016 na 2017, ale 
naopak z roku 2014 na 2015 vzrostlo HDP podobným tempem, ale ceny se naopak snížily a mzdy vzrostly menším tempem než HDP.
*/