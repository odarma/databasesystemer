-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`farge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`farge` (
  `id` INT NOT NULL,
  `navn` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`dyr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dyr` (
  `id` INT NOT NULL,
  `latinsk_navn` VARCHAR(45) NULL,
  `vanlig_navn` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`kategori`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`kategori` (
  `id` INT NOT NULL,
  `navn` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`hardhet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`hardhet` (
  `id` INT NOT NULL,
  `navn` VARCHAR(5) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`plante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`plante` (
  `botanisk_navn` VARCHAR(45) NOT NULL,
  `navn` VARCHAR(45) NULL,
  `hardhet` INT NOT NULL,
  `jordforhold` VARCHAR(45) NULL,
  `kategori_id` INT NOT NULL,
  PRIMARY KEY (`botanisk_navn`),
  INDEX `fk_plante_kategori1_idx` (`kategori_id` ASC) VISIBLE,
  INDEX `fk_plante_hardhet1_idx` (`hardhet` ASC) VISIBLE,
  CONSTRAINT `fk_plante_kategori1`
    FOREIGN KEY (`kategori_id`)
    REFERENCES `mydb`.`kategori` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plante_hardhet1`
    FOREIGN KEY (`hardhet`)
    REFERENCES `mydb`.`hardhet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`plante_farge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`plante_farge` (
  `farge_id` INT NOT NULL,
  `plante_botanisk_navn` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`farge_id`, `plante_botanisk_navn`),
  INDEX `fk_farge_has_plante_plante1_idx` (`plante_botanisk_navn` ASC) VISIBLE,
  INDEX `fk_farge_has_plante_farge_idx` (`farge_id` ASC) VISIBLE,
  CONSTRAINT `fk_farge_has_plante_farge`
    FOREIGN KEY (`farge_id`)
    REFERENCES `mydb`.`farge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_farge_has_plante_plante1`
    FOREIGN KEY (`plante_botanisk_navn`)
    REFERENCES `mydb`.`plante` (`botanisk_navn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vannbehov`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vannbehov` (
  `id` INT NOT NULL,
  `navn` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`stell`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`stell` (
  `plante_botanisk_navn` VARCHAR(45) NOT NULL,
  `lokasjon` VARCHAR(45) NOT NULL,
  `grotid_uke` INT NULL,
  `naering` VARCHAR(45) NULL,
  `lysforhold` VARCHAR(45) NULL,
  `hoeyde_cm` INT NULL,
  `kvm` INT NULL,
  `allergivennli` TINYINT NULL,
  `vannbehov_id` INT NOT NULL,
  `blomstringstid` INT NULL,
  PRIMARY KEY (`plante_botanisk_navn`, `lokasjon`),
  INDEX `fk_stell_plante1_idx` (`plante_botanisk_navn` ASC) VISIBLE,
  INDEX `fk_stell_vannbehov1_idx` (`vannbehov_id` ASC) VISIBLE,
  CONSTRAINT `fk_stell_plante1`
    FOREIGN KEY (`plante_botanisk_navn`)
    REFERENCES `mydb`.`plante` (`botanisk_navn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stell_vannbehov1`
    FOREIGN KEY (`vannbehov_id`)
    REFERENCES `mydb`.`vannbehov` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`plante_dyr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`plante_dyr` (
  `plante_botanisk_navn` VARCHAR(45) NOT NULL,
  `dyr_id` INT NOT NULL,
  `skadedyr/nyttedyr` VARCHAR(45) NULL,
  PRIMARY KEY (`plante_botanisk_navn`, `dyr_id`),
  INDEX `fk_plante_has_dyr_dyr1_idx` (`dyr_id` ASC) VISIBLE,
  INDEX `fk_plante_has_dyr_plante1_idx` (`plante_botanisk_navn` ASC) VISIBLE,
  CONSTRAINT `fk_plante_has_dyr_plante1`
    FOREIGN KEY (`plante_botanisk_navn`)
    REFERENCES `mydb`.`plante` (`botanisk_navn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plante_has_dyr_dyr1`
    FOREIGN KEY (`dyr_id`)
    REFERENCES `mydb`.`dyr` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
