SELECT b.descpeople, SUM(a.ordervl) AS total, 
CONVERT(AVG(a.ordervl), DEC(10,2)) AS media,
CONVERT(MIN(a.ordervl), DEC(10,2)) AS 'minimum value',
CONVERT(MAX(a.ordervl), DEC(10,2)) AS 'maximum value',
COUNT(*) AS 'orders total'
FROM tb_orders a INNER JOIN tb_peoples b USING(idpeople) 
GROUP BY b.idpeople 
HAVING SUM(a.ordervl) > 19300
ORDER BY SUM(a.ordervl);