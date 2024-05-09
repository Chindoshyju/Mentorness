-- Q1. Write a code to check NULL values
SELECT *
FROM corana_table
WHERE column_name IS NULL;

-- Q2. If NULL values are present, update them with zeros for all columns.
UPDATE corana_table
SET column_name = 0
WHERE column_name IS NULL;

-- Q3. Check total number of rows
SELECT COUNT(*)
FROM corana_table;

-- Q4. Check what is start_date and end_date
SELECT MIN(start_date) AS start_date, MAX(end_date) AS end_date
FROM corana_table;

-- Q5. Number of months present in dataset
SELECT DISTINCT EXTRACT(YEAR FROM Date) AS year, EXTRACT(MONTH FROM Date) AS month
FROM corana_table;

-- Q6. Find monthly average for confirmed, deaths, recovered
SELECT EXTRACT(YEAR FROM Date) AS year, EXTRACT(MONTH FROM Date) AS month,
       AVG(confirmed) AS avg_confirmed, AVG(Deaths) AS avg_deaths, AVG(Recovered) AS avg_recovered
FROM corana_table
GROUP BY year, month;

-- Q7. Find most frequent value for confirmed, deaths, recovered each month
SELECT EXTRACT(YEAR FROM Date) AS year, EXTRACT(MONTH FROM Date) AS month,
       MODE() WITHIN GROUP (ORDER BY confirmed) AS most_frequent_confirmed,
       MODE() WITHIN GROUP (ORDER BY deaths) AS most_frequent_deaths,
       MODE() WITHIN GROUP (ORDER BY recovered) AS most_frequent_recovered
FROM corana_table
GROUP BY year, month;

-- Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT EXTRACT(YEAR FROM Date) AS year,
       MIN(confirmed) AS min_confirmed, MIN(deaths) AS min_deaths, MIN(recovered) AS min_recovered
FROM corana_table
GROUP BY year;

-- Q9. Find maximum values of confirmed, deaths, recovered per year
SELECT EXTRACT(YEAR FROM Date) AS year,
       MAX(confirmed) AS max_confirmed, MAX(deaths) AS max_deaths, MAX(recovered) AS max_recovered
FROM corana_table
GROUP BY year;

-- Q10. The total number of cases of confirmed, deaths, recovered each month
SELECT EXTRACT(YEAR FROM Date) AS year, EXTRACT(MONTH FROM Date) AS month,
       SUM(confirmed) AS total_confirmed, SUM(deaths) AS total_deaths, SUM(recovered) AS total_recovered
FROM corana_table
GROUP BY year, month;

-- Q11. Check how corona virus spread out with respect to confirmed case
SELECT SUM(confirmed) AS total_confirmed, AVG(confirmed) AS avg_confirmed,
       VARIANCE(confirmed) AS variance_confirmed, STDDEV(confirmed) AS stdev_confirmed
FROM corana_table;

-- Q12. Check how corona virus spread out with respect to death case per month
SELECT SUM(deaths) AS total_deaths, AVG(deaths) AS avg_deaths,
       VARIANCE(deaths) AS variance_deaths, STDDEV(deaths) AS stdev_deaths
FROM corana_table
GROUP BY EXTRACT(YEAR FROM date_column), EXTRACT(MONTH FROM date_column);

-- Q13. Check how corona virus spread out with respect to recovered case
SELECT SUM(recovered) AS total_recovered, AVG(recovered) AS avg_recovered,
       VARIANCE(recovered) AS variance_recovered, STDDEV(recovered) AS stdev_recovered
FROM corana_table;

-- Q14. Find Country having highest number of Confirmed cases
SELECT country, MAX(confirmed) AS max_confirmed
FROM corana_table
GROUP BY country
ORDER BY max_confirmed DESC
LIMIT 1;

-- Q15. Find Country having lowest number of death cases
SELECT country, MIN(deaths) AS min_deaths
FROM corana_table
GROUP BY country
ORDER BY min_deaths ASC
LIMIT 1;

-- Q16. Find top 5 countries having highest recovered cases
SELECT country, SUM(recovered) AS total_recovered
FROM corana_table
GROUP BY country
ORDER BY total_recovered DESC
LIMIT 5;
