-- table name: layoffs_clean_test
-- source: layoffs_clean.csv
-- cleaned: pandas
-- goal: data exploration and investigation

---------------------------------------------------------

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


--------------------------------------------------------

