DROP DATABASE banco;

DROP DATABASE firstdb;

CREATE DATABASE firstdb;

USE firstdb;

CREATE TABLE tb_employees (
	id INT,
    name_empl VARCHAR(100),
    payment DECIMAL(10,2),
    admission DATE,
    gender ENUM('F', 'M'),
    register TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

DROP TABLE tb_employees;

INSERT INTO tb_employees VALUES(1, 'Thiago Luiz de Sousa', 21768.00, '2024-04-01', 'M', DEFAULT);

DESCRIBE tb_employees;

SELECT * FROM tb_employees;