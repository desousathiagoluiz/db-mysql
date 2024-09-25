UPDATE tb_employees
SET payment = 3000
WHERE id = 12;

SELECT * FROM tb_employees WHERE id = 12;

UPDATE tb_employees 
SET payment = 4000, admission = '2023-07-12' 
WHERE id = 16;

SELECT * FROM tb_employees WHERE id = 16;

UPDATE tb_employees SET payment = 4000.50 WHERE id = 12;