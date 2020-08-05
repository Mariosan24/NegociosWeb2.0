-- MySQL Workbench Synchronization
-- Generated: 2020-08-04 20:38
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: hondu

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `pharmacare` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `pharmacare`.`user` (
  `userCod` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userEmail` VARCHAR(80) NULL DEFAULT NULL,
  `userName` VARCHAR(80) NULL DEFAULT NULL,
  `userPswd` VARCHAR(128) NULL DEFAULT NULL,
  `userRgstrd` DATETIME NULL DEFAULT NULL,
  `userState` CHAR(3) NULL DEFAULT NULL,
  `userCell` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`userCod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pharmacare`.`type` (
  `typeCod` CHAR(3) NOT NULL,
  `typeDsc` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`typeCod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pharmacare`.`user_type` (
  `typeCodUT` CHAR(3) NOT NULL,
  `userCodUT` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  INDEX `userCodUT_idx` (`userCodUT` ASC) ,
  CONSTRAINT `userCodUTF`
    FOREIGN KEY (`userCodUT`)
    REFERENCES `pharmacare`.`user` (`userCod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `typeCodUTF`
    FOREIGN KEY (`typeCodUT`)
    REFERENCES `pharmacare`.`type` (`typeCod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pharmacare`.`type_module` (
  `typeCod` CHAR(3) NOT NULL,
  `mdlCod` VARCHAR(25) NOT NULL,
  INDEX `mdlCodTM_idx` (`mdlCod` ASC) ,
  CONSTRAINT `typeCodTM`
    FOREIGN KEY (`typeCod`)
    REFERENCES `pharmacare`.`type` (`typeCod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mdlCodTM`
    FOREIGN KEY (`mdlCod`)
    REFERENCES `pharmacare`.`module` (`mdlCod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pharmacare`.`module` (
  `mdlCod` VARCHAR(25) NOT NULL,
  `mdlDsc` VARCHAR(80) NULL DEFAULT NULL,
  `mdlState` CHAR(3) NULL DEFAULT NULL,
  `mdlClass` CHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`mdlCod`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pharmacare`.`factura` (
  `codFactura` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userCod` BIGINT(10) UNSIGNED NULL DEFAULT NULL,
  `fechaFactura` DATETIME NULL DEFAULT NULL,
  `subtotalFactura` DECIMAL(18,3) NULL DEFAULT NULL,
  `direccionFactura` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`codFactura`),
  INDEX `userCodF_idx` (`userCod` ASC) ,
  CONSTRAINT `userCodF`
    FOREIGN KEY (`userCod`)
    REFERENCES `pharmacare`.`user` (`userCod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pharmacare`.`facturaDetalle` (
  `codDetalle` BIGINT(10) NOT NULL AUTO_INCREMENT,
  `codFactura` BIGINT(10) UNSIGNED NOT NULL,
  `codProducto` BIGINT(10) UNSIGNED NOT NULL,
  `cantidadDetalle` INT(11) NULL DEFAULT NULL,
  `precioDetalle` DECIMAL(18,3) NULL DEFAULT NULL,
  PRIMARY KEY (`codDetalle`),
  INDEX `codFacturaD_idx` (`codFactura` ASC) ,
  INDEX `codProductoD_idx` (`codProducto` ASC) ,
  CONSTRAINT `codFacturaD`
    FOREIGN KEY (`codFactura`)
    REFERENCES `pharmacare`.`factura` (`codFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codProductoD`
    FOREIGN KEY (`codProducto`)
    REFERENCES `pharmacare`.`producto` (`codProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pharmacare`.`producto` (
  `codProducto` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `imagenProducto` VARCHAR(255) NULL DEFAULT NULL,
  `nombreProducto` VARCHAR(45) NULL DEFAULT NULL,
  `precioProducto` DECIMAL(18,3) NULL DEFAULT NULL,
  `stockProducto` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`codProducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
