CREATE DATABASE firstdb;

USE firstdb;

CREATE TABLE clients (
	id INT,
    nome VARCHAR(100)    
);

INSERT INTO clients VALUES(1, 'Thiago Luiz');

INSERT INTO clients (name, id) VALUES('Thiago Luiz de Sousa', 2);

SELECT * FROM clients;