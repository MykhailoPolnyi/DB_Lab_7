DELIMITER $$
USE `polnyi_7_41`$$

-- ------------------------------
-- street
-- ------------------------------
DROP TRIGGER IF EXISTS `polnyi_7_41`.`street_BEFORE_DELETE`;

CREATE DEFINER=`root`@`localhost` TRIGGER `street_BEFORE_DELETE` BEFORE DELETE ON `street` FOR EACH ROW 
BEGIN
	signal sqlstate "45000" set message_text = 'Data from table "street" cannot be deleted';
END$$


-- ------------------------------
-- position
-- ------------------------------
DROP TRIGGER IF EXISTS `polnyi_7_41`.`position_BEFORE_DELETE`;

CREATE DEFINER=`root`@`localhost` TRIGGER `position_BEFORE_DELETE` BEFORE DELETE ON `position` FOR EACH ROW 
BEGIN
	declare is_position_present bool;
    select exists(select * from worker where worker.`position` = old.`name`) into is_position_present;
    if is_position_present
		then signal sqlstate "45000" set message_text = 'Cannot delete position if workers with this position present';
	end if;
END$$


-- ------------------------------
-- cure
-- ------------------------------
DROP TRIGGER IF EXISTS `polnyi_7_41`.`cure_BEFORE_DELETE`;

CREATE DEFINER=`root`@`localhost` TRIGGER `polnyi_7_41`.`cure_BEFORE_DELETE` BEFORE DELETE ON `cure` FOR EACH ROW
BEGIN
	delete from cure_has_target where cure_has_target.`cure_id` = old.`id`;
	delete from pharmacy_has_cure where pharmacy_has_cure.`cure_id` = old.`id`;
END$$


-- ------------------------------
-- pharmacy
-- ------------------------------
DROP TRIGGER IF EXISTS `polnyi_7_41`.`pharmacy_BEFORE_DELETE`;

CREATE DEFINER=`root`@`localhost` TRIGGER `polnyi_7_41`.`pharmacy_BEFORE_DELETE` BEFORE DELETE ON `pharmacy` FOR EACH ROW
BEGIN
	declare is_cures_in_pharmacy bool;
    declare is_workers_in_pharmacy bool;
    select exists(select * from pharmacy_has_cure where pharmacy_has_cure.`pharmacy_id` = old.`id`) into is_cures_in_pharmacy;
    if is_cures_in_pharmacy
		then signal sqlstate "45000" set message_text = "Cannot delete pharmacy with cures in this";
	end if;
	
    select exists(select * from worker where worker.`pharmacy_id` = old.`id`) into is_workers_in_pharmacy;
    if is_workers_in_pharmacy
		then signal sqlstate "45000" set message_text = "Cannot delete pharmacy with workers in this";
	end if;
END$$


-- ------------------------------
-- cure_target
-- ------------------------------
DROP TRIGGER IF EXISTS `polnyi_7_41`.`cure_target_BEFORE_DELETE`;

CREATE DEFINER=`root`@`localhost` TRIGGER `cure_target_BEFORE_DELETE` BEFORE DELETE ON `cure_target` FOR EACH ROW 
BEGIN
	declare is_target_exist bool;
    select exists(select * from cure_has_target where cure_has_target.`target` = old.`target`) into is_target_exist;
    if is_target_exist
		then signal sqlstate "45000" set message_text = 'Cannot delete target if cures with this target exist';
	end if;
END$$

DELIMITER ;