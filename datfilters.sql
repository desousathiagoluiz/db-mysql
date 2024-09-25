SELECT * FROM tb_employees WHERE admission < '2024-02-24';
SELECT * FROM tb_employees WHERE admission > '2024-02-22';
SELECT * FROM tb_employees WHERE admission < '2024.02.24';
SELECT * FROM tb_employees WHERE admission > '2024.02.22';
SELECT * FROM tb_employees WHERE admission < '2024/02/24';
SELECT * FROM tb_employees WHERE admission > '2024/02/22';
SELECT * FROM tb_employees WHERE admission < '20240224';
SELECT * FROM tb_employees WHERE admission > '20240222';

UPDATE tb_employees SET admission = CURRENT_DATE() WHERE id = 16;

UPDATE tb_employees SET admission = DATE_ADD(CURRENT_DATE(), INTERVAL 60 DAY) WHERE id = 16;

SELECT DATEDIFF(admission, CURRENT_DATE()) AS 'days difference' FROM tb_employees WHERE id = 16;

SELECT * FROM tb_employees WHERE MONTH(admission) = 02;