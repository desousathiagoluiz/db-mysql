DELIMITER //

CREATE PROCEDURE sp_employee_save (
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

END //

DELIMITER ;

SELECT * FROM tb_employees;

CALL sp_employee_save('SanThiago', 50000, CURRENT_DATE());