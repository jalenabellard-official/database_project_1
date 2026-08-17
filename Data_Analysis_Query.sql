-- table name: layoffs_clean_test
-- source: layoffs_clean.csv
-- cleaned: pandas
-- goal: analyze layoffs by industry over time



-- Start of data analysis--



-- Order industries by most layoffs--
SELECT
industry,
COUNT(DISTINCT company) AS num_of_companies,
CAST(SUM(total_laid_off)AS INT) AS total_laid_off,
CAST(ROUND(AVG(percentage_laid_off)*100, 2) AS DECIMAL(10, 2)) AS avg_laid_off
FROM layoffs_clean_test
GROUP BY industry
ORDER BY total_laid_off DESC


