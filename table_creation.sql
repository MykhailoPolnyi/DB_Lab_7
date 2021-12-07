-- -----------------------------------------------------
-- Schema polnyi_7_41
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `polnyi_7_41` DEFAULT CHARACTER SET utf8 ;
USE `polnyi_7_41`;

DROP TABLE IF EXISTS `cure_has_target`;
DROP TABLE IF EXISTS `pharmacy_has_cure`;
DROP TABLE IF EXISTS `worker`;
DROP TABLE IF EXISTS `pharmacy`;
DROP TABLE IF EXISTS `cure`;
DROP TABLE IF EXISTS `cure_target`;
DROP TABLE IF EXISTS `position`;
DROP TABLE IF EXISTS `street`;


CREATE TABLE `street` (
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


CREATE TABLE `cure_target` (
  `target` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`target`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `position` (
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


CREATE TABLE `cure` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `by_prescription` TINYINT ZEROFILL NOT NULL,
  `is_drug` TINYINT ZEROFILL NOT NULL,
  `is_psychotropic` TINYINT ZEROFILL NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE `pharmacy` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `street` VARCHAR(50) NOT NULL,
  `house_num` VARCHAR(20) NOT NULL,
  `work_time_start` TIME NOT NULL,
  `work_time_end` TIME NOT NULL,
  `is_saturday_weekend` TINYINT NOT NULL,
  `is_sunday_weekend` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE `worker` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `surname` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `middle_name` VARCHAR(50) NOT NULL,
  `pharmacy_id` INT NOT NULL,
  `position` VARCHAR(50) NOT NULL,
  `id_number` VARCHAR(25) NOT NULL,
  `passport_series` VARCHAR(25) NOT NULL,
  `passport_num` VARCHAR(25) NOT NULL,
  `seniority` DOUBLE ZEROFILL UNSIGNED NOT NULL,
  `birth_date` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE `pharmacy_has_cure` (
  `pharmacy_id` INT NOT NULL,
  `cure_id` INT NOT NULL,
  PRIMARY KEY (`pharmacy_id`, `cure_id`))
ENGINE = InnoDB;


CREATE TABLE `cure_has_target` (
  `cure_id` INT NOT NULL,
  `target` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`cure_id`, `target`))
ENGINE = InnoDB;
