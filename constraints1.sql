USE FIRSTDB;

DROP TABLE tb_employees;
DROP TABLE tb_peoples;

CREATE TABLE tb_peoples (
	idpeople INT AUTO_INCREMENT NOT NULL,
    descpeople VARCHAR(256) NOT NULL,
    dtresgister TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    CONSTRAINT PK_peoples PRIMARY KEY (idpeoples)    
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



