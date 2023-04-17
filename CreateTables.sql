-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema restoran_hci
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema restoran_hci
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restoran_hci` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `restoran_hci` ;

-- -----------------------------------------------------
-- Table `restoran_hci`.`STO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restoran_hci`.`STO` (
  `IdSto` INT NOT NULL,
  `BrojMjesta` INT NOT NULL,
  `Zauzet` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`IdSto`),
  UNIQUE INDEX `IdSto_UNIQUE` (`IdSto` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restoran_hci`.`ZAPOSLENI`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restoran_hci`.`ZAPOSLENI` (
  `IdZaposleni` INT NOT NULL AUTO_INCREMENT,
  `Uloga` VARCHAR(50) NOT NULL,
  `Ime` VARCHAR(50) NOT NULL,
  `Prezime` VARCHAR(50) NOT NULL,
  `KorisničkoIme` VARCHAR(50) NOT NULL,
  `Lozinka` VARCHAR(256) NOT NULL,
  `BrojTelefona` VARCHAR(20) NOT NULL,
  `MjestoStanovanja` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdZaposleni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restoran_hci`.`RAČUN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restoran_hci`.`RAČUN` (
  `IdRačun` INT NOT NULL AUTO_INCREMENT,
  `UkupnaCijena` DECIMAL(6,2) NOT NULL,
  `Datum` DATE NOT NULL,
  `ZAPOSLENI_IdZaposleni` INT NOT NULL,
  PRIMARY KEY (`IdRačun`),
  INDEX `fk_RAČUN_ZAPOSLENI1_idx` (`ZAPOSLENI_IdZaposleni` ASC) VISIBLE,
  CONSTRAINT `fk_RAČUN_ZAPOSLENI1`
    FOREIGN KEY (`ZAPOSLENI_IdZaposleni`)
    REFERENCES `restoran_hci`.`ZAPOSLENI` (`IdZaposleni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restoran_hci`.`VRSTA_ARTIKLA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restoran_hci`.`VRSTA_ARTIKLA` (
  `IdVrstaArtikla` INT NOT NULL AUTO_INCREMENT,
  `Naziv` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdVrstaArtikla`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restoran_hci`.`ARTIKAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restoran_hci`.`ARTIKAL` (
  `IdArtikal` INT NOT NULL AUTO_INCREMENT,
  `Naziv` VARCHAR(50) NOT NULL,
  `Cijena` DECIMAL(4,2) NOT NULL,
  `Opis` VARCHAR(200) NOT NULL DEFAULT '',
  `Aktivan` TINYINT NOT NULL,
  `VRSTA_ARTIKLA_IdVrstaArtikla` INT NOT NULL,
  PRIMARY KEY (`IdArtikal`),
  INDEX `fk_ARTIKAL_VRSTA_ARTIKLA1_idx` (`VRSTA_ARTIKLA_IdVrstaArtikla` ASC) VISIBLE,
  CONSTRAINT `fk_ARTIKAL_VRSTA_ARTIKLA1`
    FOREIGN KEY (`VRSTA_ARTIKLA_IdVrstaArtikla`)
    REFERENCES `restoran_hci`.`VRSTA_ARTIKLA` (`IdVrstaArtikla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restoran_hci`.`STAVKA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restoran_hci`.`STAVKA` (
  `RAČUN_IdRačun` INT NOT NULL,
  `ARTIKAL_IdArtikal` INT NOT NULL,
  `Cijena` DECIMAL(4,2) NOT NULL,
  `Količina` INT NOT NULL,
  PRIMARY KEY (`RAČUN_IdRačun`, `ARTIKAL_IdArtikal`),
  INDEX `fk_STAVKA_ARTIKAL1_idx` (`ARTIKAL_IdArtikal` ASC) VISIBLE,
  CONSTRAINT `fk_STAVKA_RAČUN1`
    FOREIGN KEY (`RAČUN_IdRačun`)
    REFERENCES `restoran_hci`.`RAČUN` (`IdRačun`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_STAVKA_ARTIKAL1`
    FOREIGN KEY (`ARTIKAL_IdArtikal`)
    REFERENCES `restoran_hci`.`ARTIKAL` (`IdArtikal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restoran_hci`.`STATUS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restoran_hci`.`STATUS` (
  `IdStatus` INT NOT NULL AUTO_INCREMENT,
  `Naziv` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdStatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restoran_hci`.`NARUDŽBA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restoran_hci`.`NARUDŽBA` (
  `IdNarudžba` INT NOT NULL AUTO_INCREMENT,
  `DatumVrijeme` DATETIME NOT NULL,
  `STO_IdSto` INT NOT NULL,
  `STATUS_IdStatus` INT NOT NULL,
  `RAČUN_IdRačun` INT NULL,
  `ZAPOSLENI_IdZaposleni` INT NOT NULL,
  PRIMARY KEY (`IdNarudžba`),
  INDEX `fk_NARUDŽBA_STO1_idx` (`STO_IdSto` ASC) VISIBLE,
  INDEX `fk_NARUDŽBA_STATUS1_idx` (`STATUS_IdStatus` ASC) VISIBLE,
  INDEX `fk_NARUDŽBA_RAČUN1_idx` (`RAČUN_IdRačun` ASC) VISIBLE,
  INDEX `fk_NARUDŽBA_ZAPOSLENI1_idx` (`ZAPOSLENI_IdZaposleni` ASC) VISIBLE,
  CONSTRAINT `fk_NARUDŽBA_STO1`
    FOREIGN KEY (`STO_IdSto`)
    REFERENCES `restoran_hci`.`STO` (`IdSto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NARUDŽBA_STATUS1`
    FOREIGN KEY (`STATUS_IdStatus`)
    REFERENCES `restoran_hci`.`STATUS` (`IdStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NARUDŽBA_RAČUN1`
    FOREIGN KEY (`RAČUN_IdRačun`)
    REFERENCES `restoran_hci`.`RAČUN` (`IdRačun`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NARUDŽBA_ZAPOSLENI1`
    FOREIGN KEY (`ZAPOSLENI_IdZaposleni`)
    REFERENCES `restoran_hci`.`ZAPOSLENI` (`IdZaposleni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restoran_hci`.`JELO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restoran_hci`.`JELO` (
  `Recept` VARCHAR(1000) NOT NULL DEFAULT '',
  `VeličinaPorcije` VARCHAR(50) NOT NULL DEFAULT 'Standardna',
  `ARTIKAL_IdArtikal` INT NOT NULL,
  PRIMARY KEY (`ARTIKAL_IdArtikal`),
  INDEX `fk_JELO_ARTIKAL1_idx` (`ARTIKAL_IdArtikal` ASC) VISIBLE,
  CONSTRAINT `fk_JELO_ARTIKAL1`
    FOREIGN KEY (`ARTIKAL_IdArtikal`)
    REFERENCES `restoran_hci`.`ARTIKAL` (`IdArtikal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restoran_hci`.`PROIZVOĐAČ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restoran_hci`.`PROIZVOĐAČ` (
  `IdProizvođač` INT NOT NULL AUTO_INCREMENT,
  `Naziv` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdProizvođač`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restoran_hci`.`PIĆE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restoran_hci`.`PIĆE` (
  `ARTIKAL_IdArtikal` INT NOT NULL,
  `TrenutnaKoličina` INT NOT NULL DEFAULT 100,
  `PROIZVOĐAČ_IdProizvođač` INT NULL,
  PRIMARY KEY (`ARTIKAL_IdArtikal`),
  INDEX `fk_PIĆE_ARTIKAL1_idx` (`ARTIKAL_IdArtikal` ASC) VISIBLE,
  INDEX `fk_PIĆE_PROIZVOĐAČ1_idx` (`PROIZVOĐAČ_IdProizvođač` ASC) VISIBLE,
  CONSTRAINT `fk_PIĆE_ARTIKAL1`
    FOREIGN KEY (`ARTIKAL_IdArtikal`)
    REFERENCES `restoran_hci`.`ARTIKAL` (`IdArtikal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PIĆE_PROIZVOĐAČ1`
    FOREIGN KEY (`PROIZVOĐAČ_IdProizvođač`)
    REFERENCES `restoran_hci`.`PROIZVOĐAČ` (`IdProizvođač`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restoran_hci`.`NARUDŽBA_ima_ARTIKAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restoran_hci`.`NARUDŽBA_ima_ARTIKAL` (
  `NARUDŽBA_IdNarudžba` INT NOT NULL,
  `ARTIKAL_IdArtikal` INT NOT NULL,
  `Količina` INT NOT NULL,
  PRIMARY KEY (`NARUDŽBA_IdNarudžba`, `ARTIKAL_IdArtikal`),
  INDEX `fk_NARUDŽBA_has_ARTIKAL_ARTIKAL1_idx` (`ARTIKAL_IdArtikal` ASC) VISIBLE,
  INDEX `fk_NARUDŽBA_has_ARTIKAL_NARUDŽBA1_idx` (`NARUDŽBA_IdNarudžba` ASC) VISIBLE,
  CONSTRAINT `fk_NARUDŽBA_has_ARTIKAL_NARUDŽBA1`
    FOREIGN KEY (`NARUDŽBA_IdNarudžba`)
    REFERENCES `restoran_hci`.`NARUDŽBA` (`IdNarudžba`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NARUDŽBA_has_ARTIKAL_ARTIKAL1`
    FOREIGN KEY (`ARTIKAL_IdArtikal`)
    REFERENCES `restoran_hci`.`ARTIKAL` (`IdArtikal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
