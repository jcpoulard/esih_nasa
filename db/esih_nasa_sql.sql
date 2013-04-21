SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `esih_picstoria` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `esih_picstoria` ;

-- -----------------------------------------------------
-- Table `esih_picstoria`.`files`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `esih_picstoria`.`files` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `mission` VARCHAR(45) NULL ,
  `roll` VARCHAR(45) NULL ,
  `frame` VARCHAR(45) NULL ,
  `width` VARCHAR(45) NULL ,
  `height` VARCHAR(45) NULL ,
  `filesize` VARCHAR(45) NULL ,
  `cldp` VARCHAR(45) NULL ,
  `lat` VARCHAR(45) NULL ,
  `lon` VARCHAR(45) NULL ,
  `geon` VARCHAR(255) NULL ,
  `feat` VARCHAR(255) NULL ,
  `url` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esih_picstoria`.`year_mission`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `esih_picstoria`.`year_mission` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id of the table year mission' ,
  `mission` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT 'Mission Name' ,
  `year` INT NOT NULL COMMENT 'Enter year of a mission ' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'Affected a mission to a specific year ';


-- -----------------------------------------------------
-- Table `esih_picstoria`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `esih_picstoria`.`users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(68) NOT NULL COMMENT 'User name (unique value) ' ,
  `email` VARCHAR(68) NOT NULL ,
  `password` VARCHAR(128) NOT NULL ,
  `type` VARCHAR(45) NULL COMMENT 'Tell if a user is a admin or not' ,
  `blocked` TINYINT(1) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) )
ENGINE = InnoDB
COMMENT = 'Table to create user in other to them to add medata about sp /* comment truncated */ /*ecific image*/';


-- -----------------------------------------------------
-- Table `esih_picstoria`.`metadata`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `esih_picstoria`.`metadata` (
  `id` BIGINT NOT NULL ,
  `id_file` BIGINT NOT NULL ,
  `titre` VARCHAR(45) NULL ,
  `type` VARCHAR(45) NULL ,
  `description` TEXT NULL ,
  `date_description` TIMESTAMP NULL ,
  `user_id` BIGINT NOT NULL ,
  `publish` TINYINT(1) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_users_idx` (`user_id` ASC) ,
  INDEX `fk_images_idx` (`id_file` ASC) ,
  CONSTRAINT `fk_users`
    FOREIGN KEY (`user_id` )
    REFERENCES `esih_picstoria`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_images`
    FOREIGN KEY (`id_file` )
    REFERENCES `esih_picstoria`.`files` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esih_picstoria`.`tags`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `esih_picstoria`.`tags` (
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `tags_name` VARCHAR(45) NOT NULL ,
  `id_image` BIGINT NOT NULL ,
  `id_users` BIGINT NOT NULL ,
  `date_tags` TIMESTAMP NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_tags_images_idx` (`id_image` ASC) ,
  INDEX `fk_tags_users_idx` (`id_users` ASC) ,
  CONSTRAINT `fk_tags_images`
    FOREIGN KEY (`id_image` )
    REFERENCES `esih_picstoria`.`files` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_users`
    FOREIGN KEY (`id_users` )
    REFERENCES `esih_picstoria`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esih_picstoria`.`comments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `esih_picstoria`.`comments` (
  `id` BIGINT NOT NULL ,
  `id_user` BIGINT NOT NULL ,
  `id_file` BIGINT NOT NULL ,
  `comment` VARCHAR(255) NOT NULL ,
  `date_comment` TIMESTAMP NULL ,
  `publish` TINYINT(1) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_comment_user_idx` (`id_user` ASC) ,
  INDEX `fk_comment_file_idx` (`id_file` ASC) ,
  CONSTRAINT `fk_comment_user`
    FOREIGN KEY (`id_user` )
    REFERENCES `esih_picstoria`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_file`
    FOREIGN KEY (`id_file` )
    REFERENCES `esih_picstoria`.`files` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `esih_picstoria`.`admin_events`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `esih_picstoria`.`admin_events` (
  `id` BIGINT NOT NULL ,
  `id_adm` BIGINT NULL ,
  `action` TEXT NULL ,
  `date_action` DATETIME NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

USE `esih_picstoria` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
