CREATE TABLE tb_orders(
	idorder INT AUTO_INCREMENT NOT NULL,
    idpeople INT NOT NULL,
    orderdt DATETIME NOT NULL,
    ordervl DEC(10, 2),
    CONSTRAINT PK_order PRIMARY KEY(idorder),
    CONSTRAINT FK_orders_peoples FOREIGN KEY (idpeople) REFERENCES tb_peoples (idpeople)
);

SELECT * FROM tb_peoples;

INSERT INTO tb_orders VALUES (NULL, 1, CURRENT_DATE(), 2200.00);
INSERT INTO tb_orders VALUES (NULL, 1, CURRENT_DATE(), 5000.00);
INSERT INTO tb_orders VALUES (NULL, 1, CURRENT_DATE(), 10000.00);
INSERT INTO tb_orders VALUES (NULL, 1, CURRENT_DATE(), 2000.00);
INSERT INTO tb_orders VALUES (NULL, 1, CURRENT_DATE(), 3000.00);

INSERT INTO tb_orders VALUES (NULL, 2, CURRENT_DATE(), 1999.99);
INSERT INTO tb_orders VALUES (NULL, 2, CURRENT_DATE(), 2999.99);
INSERT INTO tb_orders VALUES (NULL, 2, CURRENT_DATE(), 15000.00);

INSERT INTO tb_orders VALUES (NULL, 3, CURRENT_DATE(), 1800.00);

SELECT * FROM tb_orders;

SELECT * FROM tb_orders a INNER JOIN tb_peoples b USING(idpeople);

SELECT a.ordervl, b.descpeople FROM tb_orders a INNER JOIN tb_peoples b USING(idpeople);

SELECT b.descpeople, a.ordervl FROM tb_orders a INNER JOIN tb_peoples b USING(idpeople);

SELECT b.descpeople, a.ordervl FROM tb_orders a INNER JOIN tb_peoples b USING(idpeople) GROUP BY b.descpeople;

SELECT b.descpeople, SUM(a.ordervl) AS total, 
CONVERT(AVG(a.ordervl), DEC(10,2)) AS media,
CONVERT(MIN(a.ordervl), DEC(10,2)) AS 'minimum value',
CONVERT(MAX(a.ordervl), DEC(10,2)) AS 'maximum value',
COUNT(*) AS 'orders total'
FROM tb_orders a INNER JOIN tb_peoples b USING(idpeople) GROUP BY b.idpeople ORDER BY SUM(a.ordervl);

SELECT b.descpeople, a.ordervl FROM tb_orders a INNER JOIN tb_peoples b USING(idpeople) GROUP BY b.descpeople, a.ordervl;
