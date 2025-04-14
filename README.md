# Shrnutí projektu

Datové podklady jsem vytvořila za období od roku **2006 do roku 2018**. Pro toto období jsem měla dostupná data ve všech potřebných podkladech pro **mzdy**, **ceny** i **DPH**. Toto období bylo zároveň výchozí pro zodpovězení požadovaných otázek.

Vycházela jsem z vytvořené tabulky `t_lucie_brozova_projekt_sql_primary_final`.

Druhá vytvořená tabulka `t_lucie_brozova_projekt_sql_secondary_final` obsahuje požadovaná data (population, GINI, HDP) za ostatní evropské státy za shodné období 2006–2018. U některých zemí nebyl dostupný údaj o HDP a GINI koeficientu.

## 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

Mzdy za sledované období ve všech odvětvích nerostou. V některých letech a odvětvích klesají, konkrétní roky a odvětví jsou uvedené ve výsledném dotazu otázky č. 1.

## 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

Kolik je možné koupit si litrů mléka a kilogramů chleba v prvním a posledním srovnatelném období závisí na **průměrné mzdě v konkrétním odvětví**.

- Například v roce **2006** si nejméně chleba (706,58 kg za průměrnou mzdu) mohou koupit v odvětví **Ubytování, stravování a pohostinství**, nejvíce pak v odvětví **Informační a komunikační činnosti** (2 462,17 kg).
- V roce **2018** si nejméně litrů mléka mohou dovolit opět v **Ubytování, stravování a pohostinství** (788,78 litrů) a nejvíce v **Informační a komunikační činnosti** (2 830,54 litrů).

## 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

- Pokud uvažujeme **jen potraviny, u kterých cena roste**, tak za sledované období nejpomaleji zdražují **banány žluté**.
- Pokud uvažujeme **všechny potraviny**, včetně těch, které zlevňují, pak nejvíce **zlevňuje cukr krystalový**, který má největší záporný přírůstek.

## 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

V žádném ze sledovaných roků **nedošlo** k výrazně vyššímu růstu cen potravin než růstu mezd, a to více než o 10 %.

## 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

Z výsledného dotazu jsem zjistila, že výrazná změna HDP **neznamená vždy** výrazný nárůst cen a mezd v daném nebo následujícím roce.

- Například **z roku 2006 na 2007** nebo **z roku 2016 na 2017** došlo k růstu cen a mezd spolu s HDP.
- Ale **z roku 2014 na 2015** vzrostlo HDP podobným tempem, ceny se však snížily a mzdy vzrostly menším tempem než HDP.
