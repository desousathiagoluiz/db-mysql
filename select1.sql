USE firstdb;

SELECT COUNT(*) AS total FROM tb_employees;

SELECT name_empl, payment AS current,
CONVERT(payment * 1.1, DEC(10,2)) AS 'payment with 10% increase'
FROM tb_employees;

