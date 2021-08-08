use ovoshi;

-- categories
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('яблоко');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('груша');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('банан');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('ананас');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('виноград');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('огурец');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('вишня');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('черешня');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('морковь');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('помидор');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('катрошка');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('лук');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('чеснок');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('кабачок');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('баклажан');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('перец');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('абрикос');
INSERT INTO `ovoshi`.`categories` (`name`) VALUES ('персик');

-- tmperature
INSERT INTO `ovoshi`.`temperature` (`max`, `min`) VALUES ('-5', '0');
INSERT INTO `ovoshi`.`temperature` (`max`, `min`) VALUES ('0', '10');
INSERT INTO `ovoshi`.`temperature` (`max`, `min`) VALUES ('10', '20');
INSERT INTO `ovoshi`.`temperature` (`max`, `min`) VALUES ('10', '15');
INSERT INTO `ovoshi`.`temperature` (`max`, `min`) VALUES ('18', '25');
INSERT INTO `ovoshi`.`temperature` (`max`, `min`) VALUES ('-1', '0');
INSERT INTO `ovoshi`.`temperature` (`max`, `min`) VALUES ('4', '10');

-- sort
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('голден', '20', '1', '3');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('ранетки', '25', '1', '3');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('red delicious', '30', '1', '3');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('банановая', '44', '2', '6');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('видная', '35', '2', '6');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('дюймовочка', '34', '2', '6');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('ровесница', '36', '2', '6');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('цукини \"желтоплодный\"', '20', '14', '7');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('цукини \"кавили F1\"', '25', '14', '7');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('аполлон', '25', '14', '2');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('белый', '28', '14', '7');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('болгарский', '10', '16', '3');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('изабелла F1', '15', '16', '2');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('молдавский ранний', '50', '10', '4');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('барнаульский', '55', '10', '4');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('хурма', '54', '10', '4');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('розовая', '5', '11', '3');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('журавлёнок F1', '15', '6', '2');
INSERT INTO `ovoshi`.`sort` (`name`, `price`, `categorie_id`, `temp_of_storage_id`) VALUES ('шололадница', '60', '7', '5');
INSERT INTO `ovoshi`.`sort` (`price`, `categorie_id`) VALUES ('4', '9');

-- storages
INSERT INTO `ovoshi`.`storages` (`adress`, `tel`) VALUES ('Neverland, 17', '3824923648723468');
INSERT INTO `ovoshi`.`storages` (`adress`, `tel`) VALUES ('Ovoshnaya, 56', '2346923394');
INSERT INTO `ovoshi`.`storages` (`adress`, `tel`) VALUES ('Fruktovaya, 78', '23874928374');
INSERT INTO `ovoshi`.`storages` (`adress`, `tel`) VALUES ('Cerreshnevaya, 32', '2834792374');

-- supplier
use ovoshi;
INSERT INTO `supplier` VALUES (1,'Durgan, Yost and Klein',3049,'2019-08-22 21:34:31','1985-03-16 15:35:05'),(2,'Hoppe-McCullough',333156,'1994-06-02 22:37:06','1990-08-19 13:14:47'),(3,'Zieme, Windler and Jakubowski',9006,'1991-12-13 17:10:08','1987-11-11 18:02:56'),(4,'Bayer-O\'Reilly',2385,'2004-03-09 03:21:43','2015-11-24 02:38:27'),(5,'Miller-Thiel',619391009,'1990-07-13 13:58:35','1986-03-18 18:27:08'),(6,'Schaden, Parisian and Ritchie',855,'1993-10-02 02:52:14','1982-12-24 15:35:08'),(7,'Ziemann-Frami',951,'2011-12-24 15:24:21','1975-04-16 03:08:45'),(8,'Breitenberg, Wunsch and Quitzon',0,'2002-07-07 05:39:45','1998-12-27 23:47:27'),(9,'Fahey, Gaylord and Durgan',167,'1982-08-16 07:18:37','1984-04-02 22:46:20'),(10,'Crooks, Boyer and Smitham',6,'1985-01-20 13:36:22','2003-09-16 18:14:33'),(11,'Christiansen Group',7743,'1997-11-22 14:17:21','1975-05-14 10:25:22'),(12,'Powlowski-Larson',0,'2008-10-15 14:49:29','1987-01-25 04:03:50'),(13,'Cronin-Hoeger',454769,'1983-06-24 19:11:28','2003-02-09 14:06:59'),(14,'Hirthe, Stanton and Little',303763,'1988-01-12 16:45:52','1994-03-11 10:17:24'),(15,'Schoen and Sons',247,'1995-08-26 05:13:11','1999-12-05 11:38:54'),(16,'Beatty, Mayert and Abbott',332,'1990-03-04 05:26:01','1980-08-09 15:46:56'),(17,'Boyle-Zemlak',952289383,'1987-02-20 14:34:33','1994-02-05 12:21:15'),(18,'Reinger-Hauck',7962,'1994-11-04 21:01:39','1974-04-19 10:50:02'),(19,'Yost, Franecki and Abernathy',20,'1991-02-09 01:02:59','1979-07-15 04:23:21'),(20,'Eichmann Group',952759694,'2010-11-27 06:44:20','1978-05-06 14:02:38'),(21,'Dibbert, O\'Reilly and Oberbrunner',53058,'1994-06-19 00:41:26','1999-02-02 13:36:00'),(22,'Schowalter-Leffler',9190,'1991-03-17 16:41:29','1990-02-02 16:09:12'),(23,'Bins Inc',4257,'1990-05-19 07:35:45','1979-03-24 01:25:04'),(24,'Murphy PLC',19059946,'1973-07-10 21:06:37','1970-05-23 08:20:03'),(25,'Marks, Zieme and Grady',779115921,'1998-06-18 19:15:05','1974-12-31 15:36:51'),(26,'Lockman LLC',2792815,'2021-02-18 08:21:31','2019-08-24 13:26:37'),(27,'Frami, Bins and Medhurst',27277256,'1977-10-27 18:10:38','1988-04-28 13:26:10'),(28,'Kozey, Dooley and Simonis',585,'2015-05-17 22:12:35','1997-09-16 06:42:26'),(29,'Block-King',1,'1982-10-13 18:45:50','2012-11-04 01:02:32'),(30,'O\'Hara-Beer',211952,'1976-05-02 23:20:48','2020-09-14 11:44:19'),(31,'O\'Connell and Sons',348,'2005-02-28 18:03:03','1997-03-27 18:11:22'),(32,'Feeney LLC',11495745,'1993-02-11 01:03:13','2016-12-19 22:26:50'),(33,'Wintheiser, Morissette and O\'Keefe',2547,'2014-10-04 12:57:45','1981-01-13 05:05:25'),(34,'Blick Ltd',0,'2018-02-06 11:46:12','1981-04-22 03:32:42'),(35,'Watsica-Franecki',681072,'1989-05-27 09:22:47','1985-10-01 23:07:16'),(36,'Grant and Sons',7,'1973-04-09 21:18:25','1992-07-29 23:07:41'),(37,'Batz-Mohr',8869900,'1975-12-01 10:42:00','1972-02-24 11:26:48'),(38,'Rempel PLC',1120,'1985-01-01 14:06:42','2010-01-05 00:19:03'),(39,'Jakubowski Ltd',69723773,'1999-08-21 22:14:01','1982-12-26 16:09:21'),(40,'West PLC',73680,'2014-01-04 13:15:51','1995-11-14 21:45:54'),(41,'Powlowski Group',6695083,'2008-12-31 08:48:28','1976-10-20 23:38:16'),(42,'Zemlak-Borer',267228156,'1978-12-28 09:19:56','2005-04-25 20:03:42'),(43,'Jacobson-Langworth',72077925,'2010-08-13 23:56:01','2012-05-26 09:14:29'),(44,'Reilly Ltd',8890,'2011-09-14 19:32:25','1986-11-02 17:20:36'),(45,'Kohler, Sauer and Conn',8568191,'1993-08-24 03:45:35','1999-04-06 23:48:15'),(46,'Schmitt-Hagenes',35,'1994-12-14 05:47:35','2000-03-01 20:05:29'),(47,'Stehr PLC',7367,'2006-11-02 17:22:47','1986-12-01 11:14:02'),(48,'DuBuque, Lubowitz and Spencer',2,'1988-06-26 06:42:38','1987-09-18 06:11:44'),(49,'Muller, Stiedemann and Erdman',0,'1991-11-02 18:43:37','1991-12-18 03:51:38'),(50,'Abshire LLC',902435,'1987-01-12 05:18:26','1980-02-11 00:37:23'),(51,'Goyette, Emmerich and Thompson',562578,'1976-02-08 19:37:59','2013-09-05 21:41:35'),(52,'Pacocha-Dach',4533,'1974-10-04 04:03:29','2013-04-18 02:42:42'),(53,'Durgan Group',571,'2013-10-05 11:04:39','1976-04-19 03:23:03'),(54,'Lakin PLC',535588731,'2000-05-14 13:51:08','2014-09-23 15:10:57'),(55,'Rowe-McClure',71908,'1992-02-21 18:26:47','1972-05-17 01:11:47'),(56,'Leannon PLC',50280,'1973-10-06 12:43:03','2000-03-04 17:37:18'),(57,'Carroll LLC',52148851,'1977-11-12 16:27:53','1987-04-15 02:31:13'),(58,'Thompson, Hegmann and Kautzer',262809,'2014-05-19 17:29:25','1990-01-03 17:07:27'),(59,'Roberts-Kertzmann',0,'1983-05-19 19:17:28','1994-12-20 16:32:10'),(60,'Beier PLC',0,'2016-02-04 00:41:20','1997-03-03 01:47:39'),(61,'Grimes, Koss and Homenick',0,'2008-07-09 18:07:08','1971-05-16 03:20:56'),(62,'Schneider, Graham and Abbott',1719,'2017-05-01 22:22:48','1979-12-14 00:51:04'),(63,'Quigley-Robel',921066689,'1979-02-22 00:08:59','1970-09-30 07:02:31'),(64,'Grimes and Sons',926,'2001-04-23 13:32:45','2012-10-26 16:35:18'),(65,'Koepp, Haley and Hyatt',7478,'1994-05-05 21:33:21','1973-01-21 09:02:01'),(66,'Orn, Lynch and Morar',7162535,'2011-07-22 06:52:17','2016-08-17 20:58:44'),(67,'Little, Donnelly and Murray',3,'1981-02-10 20:45:57','1983-02-04 06:15:54'),(68,'Murray, Armstrong and West',8032412,'1999-01-20 04:05:12','1989-03-12 14:40:38'),(69,'Armstrong-Barton',712414,'2001-10-08 08:43:45','1976-05-22 03:02:24'),(70,'Corkery Group',732200020,'1995-12-29 15:40:54','1972-09-15 14:18:23'),(71,'Bogan Group',0,'1989-03-28 10:17:25','1981-04-05 07:33:14'),(72,'Gleason, Ward and Zulauf',4151111,'1983-06-23 16:31:45','2006-11-24 19:02:11'),(73,'Cremin, Rolfson and Bruen',4,'2008-12-16 11:01:02','1999-11-22 19:23:07'),(74,'Ziemann PLC',8,'1999-05-02 01:49:16','2011-04-22 20:34:03'),(75,'Doyle-Rath',8025985,'2020-09-29 13:10:22','1999-08-24 09:37:00'),(76,'Breitenberg Ltd',0,'2010-05-18 04:48:53','1972-08-22 15:27:19'),(77,'Emmerich-Wehner',84903,'2009-12-18 07:47:07','2007-06-15 12:27:17'),(78,'Runte LLC',344399,'2010-10-21 12:43:33','2017-11-17 03:22:53'),(79,'Osinski, Erdman and Wehner',3084841,'1999-09-27 00:50:14','1983-01-27 09:30:10'),(80,'Shanahan-Beahan',3519034,'2001-01-27 16:58:39','1998-10-24 15:41:02'),(81,'Kirlin, Kemmer and Ullrich',0,'1995-07-19 02:50:03','1983-06-19 05:45:13'),(82,'Koepp, Jaskolski and Hintz',8619,'1977-09-03 23:41:02','1993-01-18 00:15:10'),(83,'Littel, Gislason and Runolfsdottir',1,'2011-12-24 13:22:32','1996-10-08 19:36:28'),(84,'Hammes Inc',80336405,'2003-08-10 06:01:13','1985-12-02 14:57:58'),(85,'Stiedemann, Kihn and Baumbach',0,'2018-11-07 10:52:31','1975-12-15 19:26:04'),(86,'Wiza-Bosco',4,'1989-01-12 02:50:59','2021-07-08 06:42:56'),(87,'Spencer, Gulgowski and Williamson',30308660,'2004-07-12 20:05:51','2013-11-06 16:50:09'),(88,'Feest, Blanda and Feil',72,'1998-11-19 22:02:21','2017-07-08 16:39:23'),(89,'Heathcote, Hintz and Beatty',89,'1989-04-22 16:40:44','1971-10-05 16:49:01'),(90,'Leannon, Funk and Heidenreich',3023089,'1988-12-24 16:43:18','2014-08-06 01:13:19'),(91,'Frami-Runolfsson',4,'1997-08-30 10:54:18','1984-01-16 08:04:17'),(92,'Baumbach-Zemlak',339,'2006-04-24 00:11:51','1976-10-07 10:45:52'),(93,'Predovic-Moen',7076709,'2001-09-29 12:29:49','1989-04-09 13:18:40'),(94,'Doyle, Predovic and Gislason',43795798,'2017-03-28 21:07:27','2004-02-23 17:21:50'),(95,'Lockman Inc',0,'1978-03-13 09:20:54','2020-07-12 19:45:39'),(96,'Ratke Inc',947,'1977-11-05 09:02:30','1992-08-16 00:33:20'),(97,'Wuckert-Schoen',74288,'1994-03-30 06:00:24','1980-11-26 02:33:30'),(98,'Schmeler Inc',473047,'1973-08-31 07:50:58','1985-07-05 11:47:03'),(99,'Cummings-Okuneva',236,'1995-04-16 03:11:13','1975-12-20 08:11:43'),(100,'Gerlach LLC',6553129,'2012-08-05 15:20:58','2007-06-13 22:10:06');

-- users
truncate users;
INSERT INTO `ovoshi`.`users` (`fistname`, `personal_disc`, `date_of_birth`, `fav_prod_id`) VALUES ('Max', '5', '1992-04-02 22:37:06', '20');
INSERT INTO `ovoshi`.`users` (`fistname`, `personal_disc`, `date_of_birth`, `fav_prod_id`) VALUES ('Alex', '1', '1999-05-04 22:37:06', '20');
INSERT INTO `ovoshi`.`users` (`fistname`, `personal_disc`, `date_of_birth`, `fav_prod_id`) VALUES ('Paul', '2', '1994-06-02 22:37:06', '1');
INSERT INTO `ovoshi`.`users` (`fistname`, `personal_disc`, `date_of_birth`, `fav_prod_id`) VALUES ('Andrew', '3', '1994-06-02 22:37:06', '5');
INSERT INTO `ovoshi`.`users` (`fistname`, `personal_disc`, `date_of_birth`, `fav_prod_id`) VALUES ('Lisa', '4', '1995-11-04 22:37:06', '17');
INSERT INTO `ovoshi`.`users` (`fistname`, `date_of_birth`, `fav_prod_id`) VALUES ('Masha', '1998-03-12 22:37:06', '20');
INSERT INTO `ovoshi`.`users` (`fistname`, `date_of_birth`, `fav_prod_id`) VALUES ('Sveta', '1997-08-04 22:37:06', '15');
INSERT INTO `ovoshi`.`users` (`fistname`, `personal_disc`, `date_of_birth`, `fav_prod_id`) VALUES ('Slava', '7', '1993-07-22 22:37:06', '6');
INSERT INTO `ovoshi`.`users` (`fistname`, `personal_disc`, `date_of_birth`, `fav_prod_id`) VALUES ('Valera', '6', '1987-05-18 22:37:06', '3');
INSERT INTO `ovoshi`.`users` (`fistname`, `personal_disc`, `date_of_birth`, `fav_prod_id`) VALUES ('Vera', '10', '1994-06-02 22:37:06', '9');
INSERT INTO `ovoshi`.`users` (`fistname`, `personal_disc`, `date_of_birth`, `fav_prod_id`) VALUES ('Yuri', '3', '1994-06-02 22:37:06', '20');
INSERT INTO `ovoshi`.`users` (`fistname`, `personal_disc`, `fav_prod_id`) VALUES ('Jack', '2', '20');
INSERT INTO `ovoshi`.`users` (`fistname`, `personal_disc`, `fav_prod_id`) VALUES ('Christina', '5', '17');
INSERT INTO `ovoshi`.`users` (`fistname`, `personal_disc`, `date_of_birth`, `fav_prod_id`) VALUES ('William', '5', '1989-02-11 22:37:06', '2');
INSERT INTO `ovoshi`.`users` (`fistname`, `fav_prod_id`) VALUES ('Mike', '2');
INSERT INTO `ovoshi`.`users` (`fistname`) VALUES ('Emmet');

-- box
truncate box;
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `date_of_arrival`, `status`, `storage_id`) VALUES ('1', '20', '1', '2021-07-09', 'filled', '1');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `date_of_arrival`, `status`, `storage_id`) VALUES ('1', '11', '34', '2021-07-09', 'filled', '2');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `date_of_arrival`, `status`, `storage_id`) VALUES ('1', '12', '55', '2021-07-09', 'filled', '3');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `date_of_arrival`, `status`, `storage_id`) VALUES ('1', '13', '66', '2021-07-09', 'filled', '4');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `date_of_arrival`, `status`, `storage_id`) VALUES ('2', '14', '77', '2021-07-09', 'filled', '2');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `date_of_arrival`, `status`, `storage_id`) VALUES ('2', '15', '54', '2021-07-09', 'filled', '3');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `date_of_arrival`, `status`, `storage_id`) VALUES ('2', '16', '62', '2021-07-09', 'filled', '1');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `date_of_arrival`, `status`, `storage_id`) VALUES ('1', '17', '78', '2021-07-09', 'filled', '2');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `date_of_arrival`, `status`, `storage_id`) VALUES ('1', '18', '90', '2021-07-09', 'filled', '4');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `date_of_arrival`, `status`, `storage_id`) VALUES ('2', '10', '89', '2021-07-09', 'filled', '2');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `date_of_arrival`, `status`, `storage_id`) VALUES ('3', '1', '76', '2021-07-09', 'filled', '1');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `date_of_arrival`, `status`, `storage_id`) VALUES ('1', '3', '56', '2021-07-09', 'filled', '2');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `date_of_arrival`, `status`, `storage_id`) VALUES ('2', '4', '43', '2021-07-09', 'filled', '3');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `status`, `storage_id`) VALUES ('1', '35', '22', 'filled', '3');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `date_of_arrival`, `status`, `storage_id`) VALUES ('3', '36', '14', '2021-07-09', 'filled', '4');
INSERT INTO `ovoshi`.`box` (`weight`, `sort_id`, `supplier_id`, `status`, `storage_id`) VALUES ('2', '7', '22', 'filled', '4');

