SELECT * FROM tb_employees ORDER BY name_empl;
SELECT * FROM tb_employees ORDER BY 2;
SELECT * FROM tb_employees ORDER BY payment;
SELECT * FROM tb_employees ORDER BY payment DESC;
SELECT * FROM tb_employees ORDER BY payment DESC, name_empl ASC;
SELECT * FROM tb_employees ORDER BY payment LIMIT 0, 3;
SELECT * FROM tb_employees 
WHERE YEAR(admission) = 2024 AND MONTH(admission) = 4
ORDER BY payment LIMIT 0, 3;