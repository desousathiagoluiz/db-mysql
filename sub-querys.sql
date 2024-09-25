USE firstdb;

INSERT INTO tb_peoples (descpeople) VALUES ('Luiz');

SELECT * FROM tb_peoples WHERE descpeople LIKE 'T%';
SELECT idpeople FROM tb_peoples WHERE descpeople LIKE 'l%';

DELETE FROM tb_peoples WHERE idpeople = 1;
DELETE FROM tb_peoples WHERE idpeople = 3;

DELETE FROM tb_peoples WHERE idpeople IN(SELECT idpeople FROM tb_peoples WHERE descpeople LIKE 'l%');