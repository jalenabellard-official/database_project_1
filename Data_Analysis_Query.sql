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
-- WHERE industry != 'Other'
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
-- WHERE industry != 'Other'
-- GROUP BY YEAR(date), industry
-- ORDER BY industry, YEAR(date) ASC


--All of the industries and their shutdown numbers from 2020 through 2026
-- SELECT
-- industry,
-- COUNT( DISTINCT company) AS company_count,
-- YEAR(date) AS year
-- FROM layoffs_clean_test
-- WHERE percentage_laid_off > 0.99 AND industry != 'Other'
-- GROUP BY industry, YEAR(date)
-- ORDER BY industry

--All of the industry layoffs where more than five companies reported layoffs, excluding companies that shutdown 
-- WITH industry_year_breakdown AS (
-- SELECT 
-- industry,
-- COUNT(DISTINCT company) AS num_of_companies,
-- CAST(SUM(total_laid_off )AS INT) AS total_laid_off,
-- CAST(ROUND(AVG(percentage_laid_off)*100, 2) AS DECIMAL(10, 2)) AS avg_laid_off,
-- YEAR(date) AS Year
-- FROM layoffs_clean_test
-- WHERE percentage_laid_off < 0.99 AND industry != 'Other'
-- GROUP BY YEAR(date), industry
-- )

-- SELECT *
-- FROM industry_year_breakdown
-- WHERE num_of_companies > 5
-- ORDER BY industry, YEAR ASC

--------------------------------------------------------------------------------------------------------------------

--Query Group 3


--Total and percent of layoffs broken down per country from 2020 through 2026 excluding shutdowns and where the number of companies reporting is greater than 5
-- WITH country_layoffs AS (
-- SELECT
-- country,
-- COUNT(DISTINCT company) AS num_of_companies,
-- CAST(SUM(total_laid_off)AS INT) AS total_laid_off,
-- CAST(ROUND(AVG(percentage_laid_off)*100, 2) AS DECIMAL(10, 2)) AS avg_laid_off
-- FROM layoffs_clean_test
-- WHERE industry != 'Other' AND percentage_laid_off < 0.99
-- GROUP BY country
-- )

-- SELECT *
-- FROM country_layoffs
-- WHERE num_of_companies > 5
-- WHERE num_of_companies > 5 AND total_laid_off > 10000  --WHERE statment for Substantial Layoffs


--Number of shut down companies per country
-- SELECT
-- country,
-- COUNT(DISTINCT company) AS num_of_companies,
-- CAST(SUM(total_laid_off)AS INT) AS total_laid_off
-- FROM layoffs_clean_test
-- WHERE industry != 'Other' AND percentage_laid_off > 0.99
-- GROUP BY country


----------------------------------------------------------------------------------------------------------------------------------

