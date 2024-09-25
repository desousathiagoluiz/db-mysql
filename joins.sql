SELECT * 
FROM tb_employees a
INNER JOIN tb_peoples b ON a.idpeople = b.idpeople;

SELECT * 
FROM tb_employees 
INNER JOIN tb_peoples USING(idpeople);

INSERT INTO tb_peoples (descpeople) VALUES ('Marcelo');

SELECT * FROM tb_peoples a
LEFT JOIN tb_employees b ON a.idpeople = b.idpeople;

SELECT * FROM tb_peoples a
RIGHT JOIN tb_employees b ON a.idpeople = b.idpeople;