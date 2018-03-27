SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `configurations`
ADD COLUMN `allow_download` INT(1) NOT NULL DEFAULT 0;
ALTER TABLE `configurations`
ADD COLUMN `disable_youtubeupload` INT(1) NOT NULL DEFAULT 0;

ALTER TABLE `categories` 
ADD `description` TEXT NOT NULL AFTER `clean_name`;

ALTER TABLE `categories` 
ADD `nextVideoOrder` INT(2) NOT NULL DEFAULT '0' AFTER `description`;

CHANGE COLUMN `smtpSecure` `smtpSecure` VARCHAR(255) NULL DEFAULT NULL COMMENT '\'ssl\'; // secure transfer enabled REQUIRED for Gmail' ,
CHANGE COLUMN `smtpHost` `smtpHost` VARCHAR(255) NULL DEFAULT NULL COMMENT '\"smtp.gmail.com\"' ,
CHANGE COLUMN `smtpUsername` `smtpUsername` VARCHAR(255) NULL DEFAULT NULL COMMENT '\"email@gmail.com\"' ,
CHANGE COLUMN `smtpPassword` `smtpPassword` VARCHAR(255) NULL DEFAULT NULL ,
CHANGE COLUMN `encoderURL` `encoderURL` VARCHAR(255) NULL DEFAULT NULL ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

UPDATE configurations SET  version = '4.9', modified = now() WHERE id = 1;