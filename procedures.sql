USE `polnyi_7_41`;
DELIMITER $$


DROP procedure IF EXISTS `insert_worker`;

CREATE DEFINER=`root`@`localhost` 
PROCEDURE `insert_worker`(
    in new_surname varchar(50),
    in new_name varchar(50),
    in new_middle_name varchar(50),
    in pharmacy_id int,
    in position varchar(50),
    in id_number varchar(25),
    in passport_series_num CHAR(9),
    in seniority int,
    in birth_date date
)
BEGIN
    INSERT INTO `polnyi_7_41`.`worker` 
        (`surname`, `name`, `middle_name`, `pharmacy_id`, `position`, `id_number`, `passport_series_num`, `seniority`, `birth_date`) 
    VALUES 
        (new_surname, new_name, new_middle_name, pharmacy_id, position, id_number, passport_series_num, seniority, birth_date);
END$$


DROP procedure IF EXISTS `fill_street`;

CREATE DEFINER=`root`@`localhost`
PROCEDURE `fill_street` ()
BEGIN
    declare counter int default 0;
    declare street_num int;
    declare expected_new_street varchar(9);
    
    while counter < 10 do
        set street_num = FLOOR(RAND()*1000);
        set expected_new_street = concat("Noname", street_num);
        if (not exists(select * from `street` where street.`name` = expected_new_street))
            then 
            insert into `street`(`name`) values (expected_new_street);
            set counter = counter + 1;
        end if;
    end while;
END$$



DROP procedure IF EXISTS `create_pharmacy_name_table`;

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_pharmacy_name_table`()
BEGIN
    declare done bool default false;
    declare pharmacy_name varchar(45);
    declare first_value_passed bool default false;
    declare pharmacy_cursor cursor for select `name` from pharmacy;
    declare continue handler for not found set done = TRUE;
    set @create_statement = 'CREATE TABLE `pharmacy_names` ( ';
   
    open pharmacy_cursor;
    create_loop: loop
        fetch pharmacy_cursor into pharmacy_name;
        if (done)
            then 
                set @create_statement = concat(@create_statement, ");");
                leave create_loop;
        end if;
        if (first_value_passed) 
            then set @create_statement = concat(@create_statement, ",");
        end if;
        set @create_statement = concat(@create_statement, pharmacy_name, " int");
        set first_value_passed = true;
    end loop;
    
    drop table if exists `pharmacy_names`;
    prepare create_query from @create_statement;
    execute create_query;
    deallocate prepare create_query;
    
    close pharmacy_cursor;
END$$

DELIMITER ;
