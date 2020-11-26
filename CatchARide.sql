/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     21/11/2020 15:29:39                          */
/*==============================================================*/


DROP TABLE IF EXISTS BRAND;

DROP TABLE IF EXISTS CAR;

DROP TABLE IF EXISTS CARRENT;

DROP TABLE IF EXISTS CARTYPE;

DROP TABLE IF EXISTS CITY;

DROP TABLE IF EXISTS INVOICE;

DROP TABLE IF EXISTS REVIEW;

DROP TABLE IF EXISTS STATE;

DROP TABLE IF EXISTS USER;

/*==============================================================*/
/* Table: BRAND                                                 */
/*==============================================================*/
CREATE TABLE BRAND
(
   BRANDID              INT NOT NULL AUTO_INCREMENT,
   BRANDNAME            VARCHAR(255) NOT NULL,
   BRANDDESC            TEXT,
   BRANDLOGO            VARCHAR(255) DEFAULT 'default_brand_logo.png',
   PRIMARY KEY (BRANDID)
);

/*==============================================================*/
/* Table: CAR                                                   */
/*==============================================================*/
CREATE TABLE CAR
(
   CARID                INT NOT NULL AUTO_INCREMENT,
   BRANDID              INT NOT NULL,
   CARTYPEID            INT NOT NULL,
   CARNAME              VARCHAR(255) NOT NULL,
   CARTRANSMITION       VARCHAR(255) NOT NULL,
   CARMODELTYPE         VARCHAR(255),
   CARCAPACITY          INT,
   CARFUELTYPE          VARCHAR(255),
   CARPICTURE           VARCHAR(255) DEFAULT 'default_car_picture.png',
   PRIMARY KEY (CARID)
);

/*==============================================================*/
/* Table: CARRENT                                               */
/*==============================================================*/
CREATE TABLE CARRENT
(
   CARRENTID            INT NOT NULL AUTO_INCREMENT,
   CARID                INT,
   USERID               INT,
   CARLICENCENUMBER     VARCHAR(255) NOT NULL,
   CARRENTPRICE         INT NOT NULL,
   CARRENTYEAR          INT,
   CARRENTSTATUS        BOOL,
   CARRENTPICTURE       VARCHAR(255) DEFAULT 'default_car_rent_picture.png',
   PRIMARY KEY (CARRENTID)
);

/*==============================================================*/
/* Table: CARTYPE                                               */
/*==============================================================*/
CREATE TABLE CARTYPE
(
   CARTYPEID            INT NOT NULL AUTO_INCREMENT,
   CARTYPENAME          VARCHAR(255) NOT NULL,
   CARTYPEDESC          TEXT,
   PRIMARY KEY (CARTYPEID)
);

/*==============================================================*/
/* Table: CITY                                                  */
/*==============================================================*/
CREATE TABLE CITY
(
   CITYID               INT NOT NULL AUTO_INCREMENT,
   STATEID              INT NOT NULL,
   CITYNAME             VARCHAR(255) NOT NULL,
   PRIMARY KEY (CITYID)
);

/*==============================================================*/
/* Table: INVOICE                                               */
/*==============================================================*/
CREATE TABLE INVOICE
(
   INVOICE              INT NOT NULL AUTO_INCREMENT,
   USERID               INT,
   CARRENTID            INT NOT NULL,
   REVIEWID             INT,
   INVOICEDATE          DATE NOT NULL,
   RENTSTARTDATE        DATE NOT NULL,
   RENTSTOPDATE         DATE NOT NULL,
   RENTDRIVERUSE        BOOL NOT NULL,
   RENTTOTALCOST        INT NOT NULL,
   PRIMARY KEY (INVOICE)
);

/*==============================================================*/
/* Table: REVIEW                                                */
/*==============================================================*/
CREATE TABLE REVIEW
(
   REVIEWID             INT NOT NULL AUTO_INCREMENT,
   INVOICE              INT NOT NULL,
   REVIEWSTARS          INT NOT NULL,
   REVIEWCONTENT        TEXT,
   PRIMARY KEY (REVIEWID)
);

/*==============================================================*/
/* Table: STATE                                                 */
/*==============================================================*/
CREATE TABLE STATE
(
   STATEID              INT NOT NULL AUTO_INCREMENT,
   STATENAME            VARCHAR(255) NOT NULL,
   PRIMARY KEY (STATEID)
);

/*==============================================================*/
/* Table: USER                                                  */
/*==============================================================*/
CREATE TABLE USER
(
   USERID               INT NOT NULL AUTO_INCREMENT,
   CITYID               INT NULL,
   USERNAME             VARCHAR(255) NOT NULL,
   USERFIRSTNAME        VARCHAR(255) NOT NULL,
   USERLASTNAME         VARCHAR(255) NOT NULL,
   USEREMAIL            VARCHAR(255) NOT NULL,
   USERPASSWORD         VARCHAR(255) NOT NULL,
   USERROLES            VARCHAR(255) NOT NULL,
   USERADDRESS          TEXT,
   USERPHONE            VARCHAR(15),
   USERPICTURE          VARCHAR(255) DEFAULT 'default_profile_picture.png',
   PRIMARY KEY (USERID)
);

ALTER TABLE CAR ADD CONSTRAINT FK_RELATIONSHIP_1 FOREIGN KEY (BRANDID)
      REFERENCES BRAND (BRANDID);

ALTER TABLE CAR ADD CONSTRAINT FK_RELATIONSHIP_7 FOREIGN KEY (CARTYPEID)
      REFERENCES CARTYPE (CARTYPEID);

ALTER TABLE CARRENT ADD CONSTRAINT FK_RELATIONSHIP_5 FOREIGN KEY (USERID)
      REFERENCES USER (USERID);

ALTER TABLE CARRENT ADD CONSTRAINT FK_RELATIONSHIP_6 FOREIGN KEY (CARID)
      REFERENCES CAR (CARID);

ALTER TABLE CITY ADD CONSTRAINT FK_RELATIONSHIP_2 FOREIGN KEY (STATEID)
      REFERENCES STATE (STATEID);

ALTER TABLE INVOICE ADD CONSTRAINT FK_RELATIONSHIP_11 FOREIGN KEY (REVIEWID)
      REFERENCES REVIEW (REVIEWID);

ALTER TABLE INVOICE ADD CONSTRAINT FK_RELATIONSHIP_4 FOREIGN KEY (USERID)
      REFERENCES USER (USERID);

ALTER TABLE INVOICE ADD CONSTRAINT FK_RELATIONSHIP_8 FOREIGN KEY (CARRENTID)
      REFERENCES CARRENT (CARRENTID);

ALTER TABLE REVIEW ADD CONSTRAINT FK_RELATIONSHIP_12 FOREIGN KEY (INVOICE)
      REFERENCES INVOICE (INVOICE);

ALTER TABLE USER ADD CONSTRAINT FK_RELATIONSHIP_9 FOREIGN KEY (CITYID)
      REFERENCES CITY (CITYID);

INSERT  INTO `state`(`STATENAME`) VALUES ('Jawa Tengah'),('Jawa Timur'),('Jawa Barat'),('DI Yogyakarta'),('DKI Jarakta'),('Banten'),('Bali'),('Nusa Tenggara Barat'),('Nusa Tenggara Timur');
INSERT  INTO `city`(`STATEID`,`CITYNAME`) VALUES ('2','Surabaya'),('2','Sidoarjo'),('2','Gresik'),('1','Semarang'),('4','Yogyakarta'),('5','Jakarta Pusat'),('5','Jakarta Timur'),('5','Jakarta Utara'),('5','Jakarta Barat'),('5','Jakarta Selatan'),('5','Kepulauan Seribu');
INSERT  INTO `cartype`(`CARTYPENAME`,`CARTYPEDESC`) VALUES ('SUV',NULL),('MPV',NULL);
