----------------
-- pharmacy
----------------
DROP TRIGGER IF EXISTS `polnyi_7_41`.`pharmacy_BEFORE_INSERT`;

DELIMITER $$
USE `polnyi_7_41`$$
CREATE DEFINER = CURRENT_USER TRIGGER `polnyi_7_41`.`pharmacy_BEFORE_INSERT` BEFORE INSERT ON `pharmacy` FOR EACH ROW
BEGIN
    declare street_name varchar(50);
    select `name` into street_name from street where `name` = new.`street`;
    if (street_name is null)
        then signal sqlstate '45000' set message_text = 'Cannot insert new value: wrong "street" parameter provided';
    end if;
END$$


----------------
-- worker
----------------
DROP TRIGGER IF EXISTS `polnyi_7_41`.`worker_BEFORE_INSERT`;

USE `polnyi_7_41`$$
CREATE DEFINER = CURRENT_USER TRIGGER `polnyi_7_41`.`worker_BEFORE_INSERT` BEFORE INSERT ON `worker` FOR EACH ROW
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

DELIMITER ;
