USE firstdb;

SELECT * FROM tb_employees;

UPDATE tb_employees
SET payment = payment * 1.1
WHERE id = id;

DELETE FROM tb_employees;