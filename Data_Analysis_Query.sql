-- table name: layoffs_clean_test
-- source: layoffs_clean.csv
-- cleaned: pandas
-- goal: analyze layoffs by industry over time



-----------------------------------------Start of data analysis------------------------------------------------------

--Query 1

-- Order of industries by most layoffs from 2020 through 2026--
-- SELECT
-- industry,
-- COUNT(DISTINCT company) AS num_of_companies,
-- CAST(SUM(total_laid_off)AS INT) AS total_laid_off,
-- CAST(ROUND(AVG(percentage_laid_off)*100, 2) AS DECIMAL(10, 2)) AS avg_laid_off
-- FROM layoffs_clean_test
-- GROUP BY industry
-- ORDER BY total_laid_off DESC


-----------------------------------------------------------------------------------------


--Order of industries and layoffs from 2020 through 2026 per year
SELECT 
industry,
COUNT(DISTINCT company) AS num_of_companies,
CAST(SUM(total_laid_off)AS INT) AS total_laid_off,
CAST(ROUND(AVG(percentage_laid_off)*100, 2) AS DECIMAL(10, 2)) AS avg_laid_off,
YEAR(date) AS Year
FROM layoffs_clean_test
GROUP BY YEAR(date), industry
ORDER BY industry, YEAR(date) ASC