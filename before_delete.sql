DELIMITER $$
USE `polnyi_7_41`$$

--------------------------------
-- street
--------------------------------
DROP TRIGGER IF EXISTS `polnyi_7_41`.`street_BEFORE_DELETE`;

CREATE DEFINER=`root`@`localhost` TRIGGER `pharmacy_BEFORE_UPDATE` BEFORE UPDATE ON `pharmacy` FOR EACH ROW 
BEGIN
	signal sqlstate "45000" set message_text = 'Data from table "street" cannot be deleted';
END$$


--------------------------------
-- position
--------------------------------
DROP TRIGGER IF EXISTS `polnyi_7_41`.`position_BEFORE_DELETE`;

CREATE DEFINER = CURRENT_USER TRIGGER `polnyi_7_41`.`position_BEFORE_DELETE` BEFORE DELETE ON `position` FOR EACH ROW
BEGIN
	declare is_position_present bool;
    select exists(select * from worker where worker.`position` = old.`name`) into is_position_present;
    if is_position_present
		then signal sqlstate "45000" set message_text = 'Cannot delete position if workers with this position present';
	end if;
END$$

DELIMITER ;