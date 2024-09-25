USE firstdb;

DELIMITER //

CREATE FUNCTION fn_income_tax (
pamountpay DECIMAL(10,2)
)
RETURNS DEC(10,2) DETERMINISTIC
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

END //

DELIMITER ;

SELECT *, fn_income_tax(a.amountpay) AS vlincometax
FROM tb_employees a
INNER JOIN tb_peoples b USING(idpeople);