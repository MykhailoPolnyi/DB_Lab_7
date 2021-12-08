USE `polnyi_7_41`;
set global log_bin_trust_function_creators = 1;
DELIMITER $$

DROP function IF EXISTS `count_avg_seniority`;

CREATE FUNCTION `count_avg_seniority` ()
RETURNS INTEGER
BEGIN
	RETURN (select avg(seniority) from worker);
END$$


DROP function IF EXISTS `select_street`;

CREATE FUNCTION `select_street` (pharmacy_id int)
RETURNS varchar(50)
BEGIN
	RETURN (select street.`name` from street where street.`name` = (select `street` from pharmacy where pharmacy.`id` = pharmacy_id));
END$$

DELIMITER ;
