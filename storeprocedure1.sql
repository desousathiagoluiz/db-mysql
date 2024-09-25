DELIMITER //

CREATE PROCEDURE sp_people_save (
pdescpeople VARCHAR(256)
)
BEGIN

	INSERT INTO tb_peoples VALUES(NULL, pdescpeople, DEFAULT);
    
    SELECT * FROM tb_peoples WHERE idpeople = LAST_INSERT_ID();
    
END //

DELIMITER ;

CALL sp_people_save('EngYanghost');