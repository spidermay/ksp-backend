# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.23)
# Base de datos: app_kps
# Tiempo de Generación: 2022-11-29 06:36:20 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE SCHEMA `app_kps`;
USE `app_kps`;

# Volcado de tabla beneficiary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `beneficiary`;

CREATE TABLE `beneficiary` (
  `beneficiary_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `names` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `mother_lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `relationship` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `birthday` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sex` enum('male','female') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `date` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `updated` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `deleted` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`beneficiary_id`) USING BTREE,
  KEY `employee_id` (`employee_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `beneficiary` WRITE;
/*!40000 ALTER TABLE `beneficiary` DISABLE KEYS */;

INSERT INTO `beneficiary` (`beneficiary_id`, `employee_id`, `names`, `lastname`, `mother_lastname`, `relationship`, `birthday`, `image`, `sex`, `date`, `updated`, `deleted`)
VALUES
	(1,84,'BRIAN IVAN','ESCOBAR','CARRILLO','Hermano','28-02-1982','','male','','1669698105','0'),
	(2,2,'DANIEL ROMAN','AGUILAR','MARTINEZ','brother','AUMD861028HDFGRN04','','male','','','1'),
	(3,3,'ERNESTO','AYALA','HERNANDEZ','brother','AAHE931014HJCYRR03','','male','','','1'),
	(4,4,'ALFONSO','ASCENCIO','MIRANDA ','brother','AEMA740714HJCSRL06','','male','','','1'),
	(5,5,'FRANCISCO JAVIER','ALAMO','DIAZ','brother','AADF771005HJCLZR07','','male','','','1'),
	(6,6,'JAVIER','ALONSO','CORONADO','brother','AOCJ861230HZSLRV09','','male','','','1'),
	(7,7,'FRANCISCO','AYALA','HERNANDEZ ','brother','AAHF910718HJCYRR01','','male','','','1'),
	(8,8,'JOSE ARMANDO','AVALOS','RODRIGUEZ','brother','AARA910125HJCVDR00','','male','','','1'),
	(9,9,'ABRAHAM ISRAEL','ALVAREZ','CAMAÑO','brother','AACA911008HJCLMB08','','male','','','0'),
	(10,10,'HECTOR','DELGADO','GODINEZ','brother','DEGH650620HDFLDC02','','male','','','1'),
	(11,11,'MARIO FRANCISCO','BERNAL','GARCIA','brother','BEGM810124HGRRRR04','','male','','','1'),
	(12,12,'BEATRIZ ADRIANA ','BANDILLA','RODRIGUEZ','brother','BARB931106MJCNDT09','','female','','','1'),
	(13,13,'MARIA ANTONIA','DE LA TORRE','SOLIS','brother','TOSA630930MJCRLN05','','female','','','1'),
	(14,14,'ANTONIO ','DIAZ','MAYORGA','brother','DIMA640613HJCZYN09','','male','','','1'),
	(15,15,'ENRIQUE','DELGADO',' VALDIAVIA','brother','DEVE610801HJCLLN03','','male','','','1'),
	(16,16,'MAXIMINO','BARRAGAN ','SANCHEZ','brother','BASM600610HJCRNX03','','male','','','1'),
	(17,17,'LIBRADO','GUTIERREZ','LOPEZ','brother','GULL620720HJCTPB09','','male','','','1'),
	(18,18,'MARTIN','GOMEZ ','FLORES','brother','GOFM641214HJCMLR02','','male','','','1'),
	(19,19,'JUAN','GUERRERO ','NAVARRO','brother','GUNJ840425HJCRVN01','','male','','','1'),
	(20,20,'RAMON ','CHAVEZ ','HERRERA','brother','CAHR860520HCMHRM02','','male','','','1'),
	(21,21,'GILBERTO ','CORDOVA','GARCIA ','brother','COGG620203HJCRRL08','','male','','','1'),
	(22,22,'FRANCISCO JAVIER','CARDONA','CARRILLO','brother','CACF930107HJCRRR01','','male','','','1'),
	(23,23,'JUAN VICTOR ','GOMEZ ','PALACIOS ','brother','GOPJ590624HDFMLN07','','male','','','1'),
	(24,24,'GERMAN','GARCIA ','REYES','brother','GARG571009HJCRYR04','','male','','','1'),
	(25,25,'SILVANO ','GUZMAN ','HERNANDEZ ','brother','GUHS620210HJCZRL00','','male','','','1'),
	(26,26,'MARTIN ENRIQUE ','GONZALEZ ','RAMOS ','brother','GORM000109HJCNMRA9','','male','','','1'),
	(27,27,'ANTONIO','SANCHEZ ','FLORES','brother','FOSA571018HJCLNN09','','male','','','1'),
	(28,28,'MARTIN GONZALO','ESTRADA','CAUDILLO','brother','AECM650110HJCSDR04','','male','','','1'),
	(29,29,'HECTOR GERARDO','DUARTE ','GONZALEZ','brother','DUGH910903HJCRNC04','','male','','','1'),
	(30,30,'JOSE ALFREDO','DOMINGUEZ ','HERNANDEZ','brother','DOHA010816HJCMRLA8','','male','','','1'),
	(31,31,'ALDO CHRISTIAN','LOPEZ ','BARRAGAN','brother','LOBA800707HJJCPRL03','','male','','','1'),
	(32,32,'MAX ','FLORES','VILLASEÑOR ','brother','FOVM850815HJCLLX01','','male','','','1'),
	(33,33,'ROCIO','RAMIREZ','LARIOS','brother','LARR950806MJCMC06','','female','','','1'),
	(34,34,'JESUS RAMON','JIMENEZ','GONZALEZ ','brother','JIGJ910411HJCMNS09','','male','','','1'),
	(35,35,'OSCAR MANUEL','IBARRA','GONZALEZ','brother','IAGO710912HJCBNS02','','male','','','1'),
	(36,36,'MARTIN','GAYTAN','CANO','brother','GACM640715HSRYNR04','','male','','','1'),
	(37,37,'HONY JOSUE','HERNANDEZ','RIVERA','brother','HERH840120HNERVN00','','male','','','1'),
	(38,38,'HAROLD GIOVANNI','GINORI','OLANO','brother','GIOH771128HHGNLR04','','male','','','1'),
	(39,39,'SARA','MARISCAL','CARLOS','brother','MACS860510MJCRRR05','','female','','','1'),
	(40,40,'VICENTE ','MARTINEZ ','IBARRA','brother','MAIV790405HSPRBC07','','male','','','1'),
	(41,41,'MARIA GUADALUPE','MERCADO','HERNANDEZ','brother','MEHG930730MJCRRD00','','female','','','1'),
	(42,42,'LUIS ENRIQUE','CASTILLO','PLASCENCIA','brother','CAPL920821HJCSLS07','','male','','','1'),
	(43,43,'GERARDO','NAVARRO','TOBAR','brother','NATG651227HDFVBR05','','male','','','1'),
	(44,44,'ISMAEL','GUTIERREZ ','GALLARDO','brother','GUGI740819HJCTLS08','','male','','','1'),
	(45,45,'JOSE MANUEL','GOMEZ ','SALINAS','brother','GOSM981229HJCMLN04','','male','','','1'),
	(46,46,'JOSE LUIS ','GUERRA ','REYES ','brother','GURL521113HJCRYS08','','male','','','1'),
	(47,47,'RAMON','GUERRA','REYES','brother','GURR550226HNTRYM03','','male','','','1'),
	(48,48,'JOSE DE JESUS  ALEJANDRO','MORALES ','LARA','brother','MOLJ840518HJCRRS07','','male','','','1'),
	(49,49,'JUAN ERNESTO','MARTINEZ ','MANZO','brother','MAMJ760630HJCRNN03','','male','','','1'),
	(50,50,'RAFAEL','MARQUEZ','RODRIGUEZ','brother','MARR730313HJCRDF01','','male','','','1'),
	(51,51,'FELIPE DE JESUS ','PEÑA ','GUERRA ','brother','PEGF710205HNTXRL03','','male','','','1'),
	(52,52,'JOSUE ISIDORO','PATRON ','MENDEZ','brother','PAMJ840222HBCTNS07','','male','','','1'),
	(53,53,'MARCOS GUADALUPE','TEPOSTE ','JIMENEZ','brother','TEJM931204HJCPMR00','','male','','','1'),
	(54,54,'ROSALIA','VAZQUEZ','GARCIA','brother','VAGR620327MJCZRS02','','female','','','1'),
	(55,55,'GUILLERMO','VERA ','VAZQUEZ ','brother','VEVG940307HJCRZL02','','male','','','1'),
	(56,56,'ANTONIO','TORRES','RUIZ','brother','TORA710314JCRZN03','','male','','','1'),
	(57,57,'MARTHA LINA ','VILLALOBOS','CASILLAS','brother','VICM670210MJCLSR03','','female','','','1'),
	(58,58,'MARTIN','PARGA','JIMENEZ','brother','PAJM620503HJCRMR03','','male','','','1'),
	(59,59,'JUAN CARLOS','ORTIZ','ROSALES','brother','ROOJ970130HJCSRN01','','male','','','1'),
	(60,60,'GUSTAVO','VALLES ','ARTEAGA','brother','VAAG560727HDFLRS05','','male','','','1'),
	(61,61,'SERGIO','ANTEMATE ','PELAYO','brother','AEPS840311HVZNLR06','','male','','','1'),
	(62,62,'MATIAS','GALLEGOS','SALCEDO','brother','GASM670711HJCLLT07','','male','','','1'),
	(63,63,'OSCAR JESUS','AVILA','HERNANDEZ','brother','AIHO960820HTSVRS06','','male','','','1'),
	(64,64,'SAUL','MANJARREZ','SANCHEZ','brother','MASS640113HDFNNL04','','male','','','1'),
	(65,65,'DARWIN ARMANDO','CARTAGENA','MELARA','brother','CAMD940128HNERLR07','','male','','','1'),
	(66,66,'VICTOR DAVID','REYES','SAAVEDRA','brother','RESV780111HJCYVC02','','male','','','1'),
	(67,67,'JUAN MANUEL','LOPEZ','VAZQUEZ','brother','LOVJ650127HJCPZN03','','male','','','1'),
	(68,68,'CHRISTOPHER MICHEL IVAN','SALVADOR ','MEJIA','brother','SAMC011225HJCLJHA1','','male','','','1'),
	(69,69,'MANUEL','GUERRERO','HOSTIGUIN','brother','GUHM000810HJCRSNA9','','male','','','1'),
	(70,70,'OCTAVIO RAFAEL','ROSALES','BUENROSTRO','brother','ROBO840506HJCSNC00','','male','','','1'),
	(71,71,'ERNESTO','MEJIAS','NOGUERAS','brother','MEXE721013HNEJXR03','','male','','','1'),
	(72,72,'BENJAMIN','SANTOS','HERNANDEZ','brother','SAHB870115HHGNRN05','','male','','','1'),
	(73,73,'OSCAR','PEDRO','GONZALEZ ','brother','PEGO900328HJCDNS07','','male','','','1'),
	(74,74,'MARIA IMELDA ','MEJIA ','X','brother','MEXI870107MJCJXM07','','female','','','1'),
	(75,75,'JUAN FRANCISCO ','CUEVAS ','CASTILLO','brother','CUCJ740915HJCVSN00','','male','','','1'),
	(76,76,'GAMALIEL ','ROMERO','ESPINOSA','brother','ROEG840606HDFFMSM04','','male','','','1'),
	(77,77,'MOISES','REYNOSO','QUIÑONES ','brother','REQM721017HJCYXS08','','male','','','1'),
	(78,78,'LUIS FERNANDO','CARRILLO','MARTINEZ ','brother','CAML010601HJCRRSA9','','male','','','1'),
	(79,79,'HLLANET GUADALUPE','CARRION ','TELLEZ','brother','CATH700508MJCRLL06','','female','','','1'),
	(80,80,'RAFAEL','RUIZ ','REYNA ','brother','RARR860308HJCRRL08','','male','','','1'),
	(81,81,'Rubi Alejandra','Lara','Torres','brother','LATR971203MJCRRB08','','female','','','1'),
	(82,82,'May','Cortes','','brother','LATR971203MJCRRB08','','male','','','1'),
	(83,83,'Alan','Mora','','brother','LATR971203MJCRRB08','','male','','','0'),
	(84,84,'CARLOS DANIEL','JASSO','FRANCO','Hermano','JAFC000825HJCSRRA3','','male','','1669698320','1'),
	(85,85,'ALAN JOVANI','ALVAREZ','CAMAÑO','brother','AACA981128HJCLML06','','male','','','1'),
	(86,86,'HECTOR MANUEL ','GONZALEZ','ALMEIDA ','brother','GOAH740411HJCNLC03','','male','','','1'),
	(87,87,'MARTHA CECILIA ','GIL ','DE AVILA ','brother','GIAM640430MJCLVR08','','female','','','1'),
	(88,88,'GUSTAVO ADOLFO','MARTINEZ ','GONZALEZ ','brother','MAGG910323HJCRNS09','','male','','','1'),
	(89,89,'JULIO ERNESTO','GONZALEZ ','MENDOZA ','brother','GOMJ750316HJCNNL09','','male','','','1'),
	(90,90,'YOALI','TORRES','SANGEADO','Hermano','YOSY950718HCSRNV04','ITSZ.png','female','','1669703603','1'),
	(91,91,'DAVID ALBERTO ','RAMIREZ ','GONZALEZ','brother','RAGD920901HMCMNV05','','male','','','1'),
	(92,92,'JAIME ','MAGAÑA ','FELIX ','brother','MAFJ960626HJCGLM04','','male','','','1'),
	(93,93,'FIDEL ALBERTO','MONTEJO','ANTON','brother','MOAF740228HJCSNND00','','male','','','1'),
	(94,94,'RICARDO','VALDEZ','RAMOS','brother','5646848596','','male','','','1'),
	(95,95,'arturo','cano','cano','brother','898990','','male','','1669701649','1'),
	(96,96,'ruben','de alba','','brother','','','male','','','1'),
	(97,0,'string','string','string','string','string','','','1669623075','1669623412','0');

/*!40000 ALTER TABLE `beneficiary` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla employee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `mother_lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `salary` double NOT NULL DEFAULT '52000',
  `position_job` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'supervisor',
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hiring_date` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1669618548',
  `updated` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sex` enum('male','female') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `deleted` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;

INSERT INTO `employee` (`employee_id`, `names`, `lastname`, `mother_lastname`, `birthday`, `image`, `salary`, `position_job`, `status`, `hiring_date`, `date`, `updated`, `sex`, `deleted`)
VALUES
	(1,'BRIAN IVAN','ESCOBAR','CARRILLO','641800800','',52000,'supervisor','active','20-11-2022','1669618548','','male','0'),
	(2,'DANIEL ROMAN','AGUILAR','MARTINEZ','530884067','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(3,'ERNESTO','AYALA','HERNANDEZ','750578400','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(4,'ALFONSO','ASCENCIO','MIRANDA ','143013600','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(5,'FRANCISCO JAVIER','ALAMO','DIAZ','244916084','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(6,'JAVIER','ALONSO','CORONADO','536310874','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(7,'FRANCISCO','AYALA','HERNANDEZ ','679816800','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(8,'JOSE ARMANDO','AVALOS','RODRIGUEZ','664783200','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(9,'ABRAHAM ISRAEL','ALVAREZ','CAMAÑO','686901600','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(10,'HECTOR','DELGADO','GODINEZ','3012725485','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(11,'MARIO FRANCISCO','BERNAL','GARCIA','349164000','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(12,'BEATRIZ ADRIANA ','BANDILLA','RODRIGUEZ','752608240','',52000,'supervisor','active','20-11-2022','1669618548','','female','1'),
	(13,'MARIA ANTONIA','DE LA TORRE','SOLIS','-197402400','',52000,'supervisor','active','20-11-2022','1669618548','','female','1'),
	(14,'ANTONIO ','DIAZ','MAYORGA','-175197600','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(15,'ENRIQUE','DELGADO',' VALDIAVIA','-265649043','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(16,'MAXIMINO','BARRAGAN ','SANCHEZ','-28702907917','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(17,'LIBRADO','GUTIERREZ','LOPEZ','-235145004','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(18,'MARTIN','GOMEZ ','FLORES','-159277726','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(19,'JUAN','GUERRERO ','NAVARRO','451720800','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(20,'RAMON ','CHAVEZ ','HERRERA','516952800','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(21,'GILBERTO ','CORDOVA','GARCIA ','-249551019','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(22,'FRANCISCO JAVIER','CARDONA','CARRILLO','726386400','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(23,'JUAN VICTOR ','GOMEZ ','PALACIOS ','-332100000','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(24,'GERMAN','GARCIA ','REYES','-383236385','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(25,'SILVANO ','GUZMAN ','HERNANDEZ ','-248969393','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(26,'MARTIN ENRIQUE ','GONZALEZ ','RAMOS ','947397600','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(27,'ANTONIO','SANCHEZ ','FLORES','-385133284','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(28,'MARTIN GONZALO','ESTRADA','CAUDILLO','-156967200','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(29,'HECTOR GERARDO','DUARTE ','GONZALEZ','683897092','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(30,'JOSE ALFREDO','DOMINGUEZ ','HERNANDEZ','997958323','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(31,'ALDO CHRISTIAN','LOPEZ ','BARRAGAN','331797600','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(32,'MAX ','FLORES','VILLASEÑOR ','492933600','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(33,'ROCIO','RAMIREZ','LARIOS','807697015','',52000,'supervisor','active','20-11-2022','1669618548','','female','1'),
	(34,'JESUS RAMON','JIMENEZ','GONZALEZ ','671349600','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(35,'OSCAR MANUEL','IBARRA','GONZALEZ','53503200','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(36,'MARTIN','GAYTAN','CANO','-172414071','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(37,'HONY JOSUE','HERNANDEZ','RIVERA','443426400','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(38,'HAROLD GIOVANNI','GINORI','OLANO','249631200','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(39,'SARA','MARISCAL','CARLOS','516131801','',52000,'supervisor','active','20-11-2022','1669618548','','female','1'),
	(40,'VICENTE ','MARTINEZ ','IBARRA','292184551','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(41,'MARIA GUADALUPE','MERCADO','HERNANDEZ','744057983','',52000,'supervisor','active','20-11-2022','1669618548','','female','1'),
	(42,'LUIS ENRIQUE','CASTILLO','PLASCENCIA','714376800','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(43,'GERARDO','NAVARRO','TOBAR','-126631167','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(44,'ISMAEL','GUTIERREZ ','GALLARDO','146169356','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(45,'JOSE MANUEL','GOMEZ ','SALINAS','914911200','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(46,'JOSE LUIS ','GUERRA ','REYES ','-540651397','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(47,'RAMON','GUERRA','REYES','-468506642','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(48,'JOSE DE JESUS  ALEJANDRO','MORALES ','LARA','453103200','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(49,'JUAN ERNESTO','MARTINEZ ','MANZO','204974308','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(50,'RAFAEL','MARQUEZ','RODRIGUEZ','103541595','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(51,'FELIPE DE JESUS ','PEÑA ','GUERRA ','34595208','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(52,'JOSUE ISIDORO','PATRON ','MENDEZ','446294603','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(53,'MARCOS GUADALUPE','TEPOSTE ','JIMENEZ','755003218','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(54,'ROSALIA','VAZQUEZ','GARCIA','-245095200','',52000,'supervisor','active','20-11-2022','1669618548','','female','1'),
	(55,'GUILLERMO','VERA ','VAZQUEZ ','763040082','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(56,'ANTONIO','TORRES','RUIZ','37778400','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(57,'MARTHA LINA ','VILLALOBOS','CASILLAS','-91178906','',52000,'supervisor','active','20-11-2022','1669618548','','female','1'),
	(58,'MARTIN','PARGA','JIMENEZ','-241859183','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(59,'JUAN CARLOS','ORTIZ','ROSALES','854645613','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(60,'GUSTAVO','VALLES ','ARTEAGA','-423848193','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(61,'SERGIO','ANTEMATE ','PELAYO','447842863','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(62,'MATIAS','GALLEGOS','SALCEDO','-78159282','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(63,'OSCAR JESUS','AVILA','HERNANDEZ','840517200','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(64,'SAUL','MANJARREZ','SANCHEZ','-188316907','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(65,'DARWIN ARMANDO','CARTAGENA','MELARA','759750776','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(66,'VICTOR DAVID','REYES','SAAVEDRA','253350533','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(67,'JUAN MANUEL','LOPEZ','VAZQUEZ','-155492397','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(68,'CHRISTOPHER MICHEL IVAN','SALVADOR ','MEJIA','1009305179','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(69,'MANUEL','GUERRERO','HOSTIGUIN','965883600','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(70,'OCTAVIO RAFAEL','ROSALES','BUENROSTRO','452671200','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(71,'ERNESTO','MEJIAS','NOGUERAS','82533600','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(72,'BENJAMIN','SANTOS','HERNANDEZ','1595931351','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(73,'OSCAR','PEDRO','GONZALEZ ','638604000','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(74,'MARIA IMELDA ','MEJIA ','X','537039602','',52000,'supervisor','active','20-11-2022','1669618548','','female','1'),
	(75,'JUAN FRANCISCO ','CUEVAS ','CASTILLO','148456800','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(76,'GAMALIEL ','ROMERO','ESPINOSA','455360973','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(77,'MOISES','REYNOSO','QUIÑONES ','88158941','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(78,'LUIS FERNANDO','CARRILLO','MARTINEZ ','991371600','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(79,'HLLANET GUADALUPE','CARRION ','TELLEZ','10999759','',52000,'supervisor','active','20-11-2022','1669618548','','female','1'),
	(80,'RAFAEL','RUIZ ','REYNA ','510681754','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(81,'Rubi Alejandra','Lara','Torres','881137107','',52000,'supervisor','active','20-11-2022','1669618548','','female','1'),
	(82,'May','Cortes','','881137107','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(83,'Alan','Mora','','881137107','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(84,'CARLOS DANIEL','JASSO','FRANCO','967179600','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(85,'ALAN JOVANI','ALVAREZ','CAMAÑO','912232800','',52000,'supervisor','active','20-11-2022','1669618548','','male','0'),
	(86,'HECTOR MANUEL ','GONZALEZ','ALMEIDA ','132213600','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(87,'MARTHA CECILIA ','GIL ','DE AVILA ','1596776400','',52000,'supervisor','active','20-11-2022','1669618548','','female','1'),
	(88,'GUSTAVO ADOLFO','MARTINEZ ','GONZALEZ ','669708000','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(89,'JULIO ERNESTO','GONZALEZ ','MENDOZA ','164181600','',52000,'supervisor','active','20-11-2022','1669618548','','male','1'),
	(90,'YOALI','TORRES','SANGEADO','07-10-1987','Turko.jpg',52000,'supervisor','inactive','20-11-2022','1669618548','1669701867','female','1'),
	(91,'DAVID ALBERTO ','RAMIREZ ','GONZALEZ','715327200','',52000,'supervisor','active','20-11-2022','1669618548','','male','0'),
	(92,'JAIME ','MAGAÑA ','FELIX ','835765200','',52000,'supervisor','active','20-11-2022','1669618548','','male','0'),
	(93,'FIDEL ALBERTO','MONTEJO','ANTON','131263200','',52000,'supervisor','active','20-11-2022','1669618548','','male','0'),
	(94,'RICARDO','VALDEZ','RAMOS','224316000','',52000,'supervisor','active','20-11-2022','1669618548','','male','0'),
	(95,'string','string','string','string','',52000,'supervisor','active','20-11-2022','1669618548','1669620999','male','0'),
	(105,'string','string','string','string','',52000,'supervisor','active','20-11-2022','1669618548','','male','0'),
	(106,'string','string','string','string','',52000,'supervisor','active','20-11-2022','1669618548','','male','0');

/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
