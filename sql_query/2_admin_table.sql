DROP TABLE IF EXISTS `admin_profile`;
CREATE TABLE IF NOT EXISTS `admin_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

INSERT INTO `admin_profile` (`id`, `full_name`, `email`, `mobile`, `address`, `password`, `status`, `created_at`) VALUES
(1, 'IAM Admin', 'admin', '8939812121', 'Chennai', '21232f297a57a5a743894a0e4a801fc3', 1, '2020-06-17 13:09:52.830541');
