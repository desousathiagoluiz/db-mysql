USE firstdb;

SELECT * FROM tb_employees WHERE gender = 'M' AND payment > 1500;

UPDATE tb_employees SET payment = payment * 1.4 WHERE id = 12;

SELECT * FROM tb_employees WHERE gender = 'F' OR payment > 500;