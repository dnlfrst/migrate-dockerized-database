ALTER USER 'developer'@'%' IDENTIFIED WITH mysql_native_password BY '3AMTf?DcXxpczeaUPx2_?tTethw4aFmF';

CREATE TABLE `Manufacturer` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Name` TEXT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Model` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Name` TEXT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Car` (
  `ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Manufacturer` INT NOT NULL,
  `Model` INT NOT NULL,
  FOREIGN KEY (`Manufacturer`) REFERENCES `Manufacturer`(`ID`),
  FOREIGN KEY (`Model`) REFERENCES `Model`(`ID`)
);
