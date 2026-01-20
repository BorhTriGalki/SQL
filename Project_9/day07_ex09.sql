SELECT 
    address,
    ROUND(MAX(age) - (MIN(age) / MAX(age)::numeric), 2) AS formula,
    ROUND(AVG(age), 2) AS average,
    MAX(age) - (MIN(age) / MAX(age)) > ROUND(AVG(age), 2) AS comparison
FROM person
GROUP BY 1
ORDER BY 1;