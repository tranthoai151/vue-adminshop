use shopdmin;
DROP TABLE `shopdmin`.`file`;
CREATE TABLE IF NOT EXISTS `file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `storage` TEXT DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `shopdmin`.`category` ADD `file_id` bigint(20) NULL AFTER `name`;


ALTER TABLE `shopdmin`.`category` ADD UNIQUE KEY `ux_category_file_id` (`file_id`);
ALTER TABLE `shopdmin`.`category` ADD CONSTRAINT `fk_category_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`)