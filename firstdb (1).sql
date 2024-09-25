-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: firstdb
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_employees`
--

DROP TABLE IF EXISTS `tb_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_employees` (
  `idemployee` int NOT NULL AUTO_INCREMENT,
  `idpeople` int NOT NULL,
  `amountpay` decimal(10,2) NOT NULL DEFAULT '1000.00',
  `admissiondt` date NOT NULL,
  PRIMARY KEY (`idemployee`),
  KEY `FK_employees_peoples` (`idpeople`),
  CONSTRAINT `FK_employees_peoples` FOREIGN KEY (`idpeople`) REFERENCES `tb_peoples` (`idpeople`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employees`
--

LOCK TABLES `tb_employees` WRITE;
/*!40000 ALTER TABLE `tb_employees` DISABLE KEYS */;
INSERT INTO `tb_employees` VALUES (1,1,5000.00,'2024-02-25'),(3,6,50000.00,'2024-02-26');
/*!40000 ALTER TABLE `tb_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_orders`
--

DROP TABLE IF EXISTS `tb_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_orders` (
  `idorder` int NOT NULL AUTO_INCREMENT,
  `idpeople` int NOT NULL,
  `orderdt` datetime NOT NULL,
  `ordervl` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idorder`),
  KEY `FK_orders_peoples` (`idpeople`),
  CONSTRAINT `FK_orders_peoples` FOREIGN KEY (`idpeople`) REFERENCES `tb_peoples` (`idpeople`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_orders`
--

LOCK TABLES `tb_orders` WRITE;
/*!40000 ALTER TABLE `tb_orders` DISABLE KEYS */;
INSERT INTO `tb_orders` VALUES (1,1,'2024-02-25 00:00:00',2200.00),(2,1,'2024-02-25 00:00:00',5000.00),(3,1,'2024-02-25 00:00:00',10000.00),(4,1,'2024-02-25 00:00:00',2000.00),(5,2,'2024-02-25 00:00:00',1999.99),(6,2,'2024-02-25 00:00:00',2999.99),(7,2,'2024-02-25 00:00:00',15000.00),(8,3,'2024-02-25 00:00:00',1800.00);
/*!40000 ALTER TABLE `tb_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_peoples`
--

DROP TABLE IF EXISTS `tb_peoples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_peoples` (
  `idpeople` int NOT NULL AUTO_INCREMENT,
  `descpeople` varchar(256) NOT NULL,
  `dtresgister` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idpeople`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_peoples`
--

LOCK TABLES `tb_peoples` WRITE;
/*!40000 ALTER TABLE `tb_peoples` DISABLE KEYS */;
INSERT INTO `tb_peoples` VALUES (1,'Thiago','2024-02-25 21:06:40'),(2,'Marcelo','2024-02-25 21:35:42'),(3,'Luiz','2024-02-25 22:25:38'),(4,'EngYanghost','2024-02-26 02:18:34'),(5,'EngYanghost','2024-02-26 02:19:32'),(6,'SanThiago','2024-02-26 03:12:06');
/*!40000 ALTER TABLE `tb_peoples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_orderstotals`
--

DROP TABLE IF EXISTS `v_orderstotals`;
/*!50001 DROP VIEW IF EXISTS `v_orderstotals`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_orderstotals` AS SELECT 
 1 AS `descpeople`,
 1 AS `total`,
 1 AS `media`,
 1 AS `minimum value`,
 1 AS `maximum value`,
 1 AS `orders total`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'firstdb'
--

--
-- Dumping routines for database 'firstdb'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_income_tax` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_income_tax`(
pamountpay DECIMAL(10,2)
) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN

	DECLARE vincometax DECIMAL(10,2);
    
    /*
		até 1903,98 não paga imposto
        1903,99 até 2826,65 paga 7,5% deduzir do imposto 142,80
        2826,65 até 3751,05 paga 15% deduzir do imposto 354,80
        3751,05 até 4664,68 paga 22,5% deduzir do imposto 636,13
        acima de 4664,68 paga 27,5% deduzir do imposto 869,36
	*/
        
	SET vincometax = CASE
		WHEN pamountpay <= 19903.98 THEN 0
        WHEN pamountpay >= 19903.99 AND pamountpay <= 28260.65 THEN (pamountpay * .075) - 1472.79
        WHEN pamountpay >= 28260.65 AND pamountpay <= 37510.05 THEN (pamountpay * .15) - 3540.80
        WHEN pamountpay >= 37510.05 AND pamountpay <= 46640.68 THEN (pamountpay * .225) - 6360.13
        WHEN pamountpay >= 46640.68 THEN (pamountpay * .275) - 8690.36
    END;
    
    RETURN vincometax;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_employee_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_employee_save`(
pdescpeople VARCHAR(256),
pamountpay DECIMAL(10,2),
padmissiondt DATETIME
)
BEGIN

	DECLARE vidpeople INT;
    
    START TRANSACTION;
    
    IF NOT EXISTS(SELECT idpeople FROM tb_peoples WHERE descpeople = pdescpeople) THEN
    
		INSERT INTO tb_peoples VALUES(NULL, pdescpeople, DEFAULT);
        
        SET vidpeople = LAST_INSERT_ID();
        
	ELSE
    
		SELECT 'User Add Register DataBase!' AS result;
        ROLLBACK;
        
	END IF;
    
    IF NOT EXISTS(SELECT idpeople FROM tb_employees WHERE idpeople = vidpeople) THEN
    
		INSERT INTO tb_employees VALUES(NULL, vidpeople, pamountpay, padmissiondt);
        
	ELSE
    
		SELECT 'User Add Register DataBase!' AS result;
        ROLLBACK;
        
	END IF;
    
    COMMIT;
    
    SELECT 'Success Register Data!' AS result;   

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_people_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_people_save`(
pdescpeople VARCHAR(256)
)
BEGIN

	INSERT INTO tb_peoples VALUES(NULL, pdescpeople, DEFAULT);
    
    SELECT * FROM tb_peoples WHERE idpeople = LAST_INSERT_ID();
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_orderstotals`
--

/*!50001 DROP VIEW IF EXISTS `v_orderstotals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_orderstotals` AS select `b`.`descpeople` AS `descpeople`,sum(`a`.`ordervl`) AS `total`,cast(avg(`a`.`ordervl`) as decimal(10,2)) AS `media`,cast(min(`a`.`ordervl`) as decimal(10,2)) AS `minimum value`,cast(max(`a`.`ordervl`) as decimal(10,2)) AS `maximum value`,count(0) AS `orders total` from (`tb_orders` `a` join `tb_peoples` `b` on((`a`.`idpeople` = `b`.`idpeople`))) group by `b`.`idpeople` order by sum(`a`.`ordervl`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-09 18:31:13
