-- table name: layoffs_clean_test
-- source: layoffs_clean.csv
-- cleaned: pandas
-- goal: data exploration and investigation

-------------------------------------------------------------------------------------------------------------

--Query 1 Exploration

--Noticed that Hardware had the 3rd most layoffs at 106k despite only having 38 companies
--Results: A query and found Dell and HP made up 60% with 43k and 23k respectively 

-- SELECT
-- company,
-- CAST(SUM(total_laid_off)AS INT) AS total_laid_off,
-- CAST(ROUND(AVG(percentage_laid_off)*100, 2) AS DECIMAL(10, 2)) AS avg_laid_off
-- FROM layoffs_clean_test
-- WHERE industry = 'Hardware'
-- GROUP BY company
-- ORDER BY SUM(total_laid_off) DESC


-------------------------------------------------------------------------------------

--Query 2 Exploration

-- Noticed: That when layoff percentages where averaged, some years of industries had a 100 percent 
-- Results: Over the 6 years of the avalibale data, 349 companies had a 100 percent layoff percentage, which almost certianly iducated 349 shutdown comapnies

-- SELECT 
-- DISTINCT company,
-- percentage_laid_off,
-- industry
-- FROM layoffs_clean_test
-- WHERE percentage_laid_off > 0.99



--A check to see how many companies shut down per year, 2023 is the clear winner at 105 with the second closet being 2024 at 85
-- SELECT
-- YEAR(date),
-- COUNT(DISTINCT company) AS total_layoffs
-- FROM layoffs_clean_test
-- WHERE percentage_laid_off > 0.99
-- GROUP BY YEAR(date)
-- ORDER BY YEAR(date)


--A check to see how the number of shutdown companies per industry per year 
SELECT
industry,
COUNT( DISTINCT company) AS company_count,
YEAR(date) AS year
FROM layoffs_clean_test
WHERE percentage_laid_off > 0.99
GROUP BY industry, YEAR(date)
ORDER BY industry

