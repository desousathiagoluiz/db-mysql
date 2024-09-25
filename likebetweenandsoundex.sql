SELECT * FROM tb_employees WHERE name_empl LIKE '%a%';
SELECT * FROM tb_employees WHERE name_empl LIKE 'f%';
SELECT * FROM tb_employees WHERE name_empl LIKE '%a';
SELECT * FROM tb_employees WHERE name_empl LIKE '__l%';
SELECT * FROM tb_employees WHERE name_empl NOT LIKE '%h%';

SELECT * FROM tb_employees WHERE payment BETWEEN 1000 AND 2000;

SELECT * FROM tb_employees WHERE SOUNDEX(name_empl) = SOUNDEX('Felipe');