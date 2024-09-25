USE firstdb;

DROP TABLE tb_employees;
DROP TABLE tb_peoples;

CREATE TABLE tb_peoples (
	idpeople INT AUTO_INCREMENT NOT NULL,
    descpeople VARCHAR(256) NOT NULL,
    dtresgister TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    CONSTRAINT PK_peoples PRIMARY KEY (idpeople)    
) ENGINE = InnoDB;

CREATE TABLE tb_employees (
	idemployee INT AUTO_INCREMENT NOT NULL,
    idpeople INT NOT NULL,
    amountpay DECIMAL(10,2) NOT NULL DEFAULT 1000.00,
    admissiondt DATE NOT NULL,
    CONSTRAINT PK_employee PRIMARY KEY (idemployee),
    CONSTRAINT FK_employees_peoples FOREIGN KEY (idpeople)
		REFERENCES tb_peoples (idpeople)
);

INSERT INTO tb_peoples (descpeople) VALUES ('Thiago');

SELECT * FROM tb_peoples;

INSERT INTO tb_employees VALUES(NULL, 1, 5000, CURRENT_DATE());

SELECT * FROM tb_employees;

INSERT INTO tb_employees VALUES(NULL, 2, 5000, CURRENT_DATE());