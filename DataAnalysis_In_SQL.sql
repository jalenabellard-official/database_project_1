CREATE TABLE layoffs (
    id INT IDENTITY(1,1) PRIMARY KEY,
    company VARCHAR(255),
    location VARCHAR(255),
    total_laid_off INT,
    date DATE,
    percentage_laid_off DECIMAL(5, 2),
    industry VARCHAR(255),
    country VARCHAR(255)
)