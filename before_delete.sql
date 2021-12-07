--------------------------------
-- pharmacy
--------------------------------
DROP TRIGGER IF EXISTS `polnyi_7_41`.`street_BEFORE_DELETE`;

DELIMITER $$
USE `polnyi_7_41`$$
CREATE DEFINER = CURRENT_USER TRIGGER `polnyi_7_41`.`street_BEFORE_DELETE` BEFORE DELETE ON `street` FOR EACH ROW
BEGIN
	signal sqlstate "45000" set message_text = 'Data from table "street" cannot be deleted';
END$$
DELIMITER ;
