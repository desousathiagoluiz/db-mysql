USE firstdb;

INSERT INTO tb_peoples VALUES(1, 'Thiago', 'M');

INSERT INTO tb_peoples (gender, name) VALUES('F', 'Nayara');

SELECT * FROM tb_peoples;

INSERT INTO tb_peoples (name, gender) VALUES
('Jorge', 'M'),
('Filipe', 'M'),
('Thiago Luiz de Sousa', 'M'),
('Terezinha', 'F'),
('Angelina', 'F'),
('Ana Lúcia', 'F'),
('Iza', 'F');

SELECT * FROM tb_employees;
SELECT * FROM tb_peoples;

INSERT INTO tb_employees
SELECT id, name, 1412, CURRENT_DATE(), gender, NULL FROM tb_peoples;