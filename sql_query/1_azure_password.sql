DROP TABLE IF EXISTS `azure_password`;
CREATE TABLE IF NOT EXISTS `azure_password` (
  `azure_id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `azure_created_date` datetime NOT NULL COMMENT 'Date',
  `azure_Team` varchar(100) NOT NULL COMMENT 'Team',
  `azure_ManagerEmailID` varchar(100) NOT NULL COMMENT 'Manager Email',
  `azure_SenderName` varchar(100) NOT NULL COMMENT 'Sender Name',
  `azure_SenderEmailID` varchar(100) NOT NULL COMMENT 'Sender Email',
  `azure_IAM_User_Email` varchar(100) NOT NULL COMMENT 'IAM User Email',
  `azure_IAM_User_Password` varchar(100) NOT NULL COMMENT 'IAM User Password',
  PRIMARY KEY (`azure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

ALTER TABLE azure_password AUTO_INCREMENT=001;