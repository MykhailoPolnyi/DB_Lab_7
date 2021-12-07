DELIMITER $$
USE `polnyi_7_41`$$

--------------------------------
-- pharmacy
--------------------------------
DROP TRIGGER IF EXISTS `polnyi_7_41`.`pharmacy_BEFORE_UPDATE`;

CREATE DEFINER=`root`@`localhost` TRIGGER `pharmacy_BEFORE_UPDATE` BEFORE UPDATE ON `pharmacy` FOR EACH ROW 
BEGIN
	declare street_name varchar(50);
    select `name` into street_name from street where `name` = new.`street`;
    if (street_name is null)
		then signal sqlstate '45000' set message_text = 'Cannot update value: wrong "street" parameter provided';
    end if;
END$$


--------------------------------
-- worker
--------------------------------
DROP TRIGGER IF EXISTS `polnyi_7_41`.`worker_BEFORE_UPDATE`;

CREATE DEFINER = CURRENT_USER TRIGGER `polnyi_7_41`.`worker_BEFORE_UPDATE` BEFORE UPDATE ON `worker` FOR EACH ROW
BEGIN
	declare position_name varchar(50);
	declare pharmacy_id int;
    select `name` into position_name from position where position.`name` = new.`position`;
    if (position_name is null)
		then signal sqlstate '45000' set message_text = 'Cannot insert new value: wrong "position" parameter provided';
	end if;
	select `id` into pharmacy_id from pharmacy where pharmacy.id = new.`pharmacy_id`;
    if (pharmacy_id is null)
		then signal sqlstate '45000' set message_text = 'Cannot insert new value: wrond "pharmacy_id" parameter provided';
	end if;
END$$


--------------------------------
-- cure_has_target
--------------------------------
DROP TRIGGER IF EXISTS `polnyi_7_41`.`cure_has_target_BEFORE_UPDATE`;

CREATE DEFINER=`root`@`localhost` TRIGGER `cure_has_target_BEFORE_UPDATE` BEFORE UPDATE ON `cure_has_target` FOR EACH ROW 
BEGIN
	declare cure_id int;
    declare c_target varchar(50);
    select `id` into cure_id from cure where cure.`id` = new.`cure_id`;
    if (cure_id is null)
		then signal sqlstate "45000" set message_text = 'Cannot update value: wrong "cure_id" parameter provided';
	end if;
    select `target` into c_target from cure_target where cure_target.`target` = new.`target`;
    if (c_target is null)
		then signal sqlstate "45000" set message_text = 'Cannot update value: wrong "target" parameter provided';
	end if;
END$$
DELIMITER ;
