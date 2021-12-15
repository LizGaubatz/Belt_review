-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema recipes_review
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `recipes_review` ;

-- -----------------------------------------------------
-- Schema recipes_review
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `recipes_review` DEFAULT CHARACTER SET utf8 ;
USE `recipes_review` ;

-- -----------------------------------------------------
-- Table `recipes_review`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recipes_review`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipes_review`.`recipes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recipes_review`.`recipes` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(255) NULL,
  `instructions` VARCHAR(255) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `time` TINYINT(1) NULL,
  `user_id` INT NULL,
  INDEX `fk_recipies_users_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_recipies_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `recipes_review`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
recipesrecipes