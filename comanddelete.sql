DELETE FROM tb_employees WHERE id = 1;

START TRANSACTION;

DELETE FROM tb_peoples;

SELECT * FROM tb_peoples;

ROLLBACK;

COMMIT;

INSERT INTO tb_peoples VALUES(NULL, 'Thiago', 'M');

TRUNCATE TABLE tb_peoples;