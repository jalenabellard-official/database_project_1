-- table name: layoffs_clean_test
-- source: layoffs_clean.csv
-- cleaned: pandas
-- goal: analyze layoffs



-----------------------------------------Start of data analysis------------------------------------------------------

--Query Group 1

-- Order of industries by most layoffs from 2020 through 2026--
-- SELECT
-- industry,
-- COUNT(DISTINCT company) AS num_of_companies,
-- CAST(SUM(total_laid_off)AS INT) AS total_laid_off,
-- CAST(ROUND(AVG(percentage_laid_off)*100, 2) AS DECIMAL(10, 2)) AS avg_laid_off
-- FROM layoffs_clean_test
-- GROUP BY industry
-- ORDER BY total_laid_off DESC


------------------------------------------------------------------------------------------------------------------------

--Query Group 2

--Order of industries and layoffs from 2020 through 2026 per year, including companies that shutdown (had a 100 percent layoff)
-- SELECT 
-- industry,
-- COUNT(DISTINCT company) AS num_of_companies,
-- CAST(SUM(total_laid_off)AS INT) AS total_laid_off,
-- CAST(ROUND(AVG(percentage_laid_off)*100, 2) AS DECIMAL(10, 2)) AS avg_laid_off,
-- YEAR(date) AS Year
-- FROM layoffs_clean_test
-- GROUP BY YEAR(date), industry
-- ORDER BY industry, YEAR(date) ASC


--All of the industries and their shutdown numbers from 2020 through 2026
-- SELECT
-- industry,
-- COUNT( DISTINCT company) AS company_count,
-- YEAR(date) AS year
-- FROM layoffs_clean_test
-- WHERE percentage_laid_off > 0.99
-- GROUP BY industry, YEAR(date)
-- ORDER BY industry

--All of the company layoffs minus companies that shutdown
-- SELECT 
-- industry,
-- COUNT(DISTINCT company) AS num_of_companies,
-- CAST(SUM(CASE WHEN total_laid_off IS NOT NULL THEN total_laid_off ELSE 0 END)AS INT) AS total_laid_off,
-- CAST(ROUND(AVG(CASE WHEN percentage_laid_off IS NOT NULL THEN percentage_laid_off ELSE 0 END)*100, 2) AS DECIMAL(10, 2)) AS avg_laid_off,
-- YEAR(date) AS Year
-- FROM layoffs_clean_test
-- WHERE percentage_laid_off < 0.99
-- GROUP BY YEAR(date), industry
-- ORDER BY industry, YEAR(date) ASC


--------------------------------------------------------------------------------------------------------------------

--Query Group 3


--Total and percent of layoffs broken down per country from 2020 through 2026
-- SELECT
-- country,
-- COUNT(DISTINCT company) AS num_of_companies,
-- CAST(SUM(total_laid_off)AS INT) AS total_laid_off,
-- CAST(ROUND(AVG(percentage_laid_off)*100, 2) AS DECIMAL(10, 2)) AS avg_laid_off
-- FROM layoffs_clean_test
-- GROUP BY country



----------------------------------------------------------------------------------------------------------------------------------

