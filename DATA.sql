--------BRAND----------
INSERT INTO BRAND (BRANDID, BRANDNAME,BRANDDESC,BRANDLOGO) VALUES (1, "Toyota", "Produsen Asal Jepang", "path Toyota");
INSERT INTO BRAND (BRANDID, BRANDNAME,BRANDDESC,BRANDLOGO) VALUES (2, "Daihatsu", "Daihatsu Indonesia merupakan produsen mobil baru dengan 9 model pilihan", "path Daihatsu");
INSERT INTO BRAND (BRANDID, BRANDNAME,BRANDDESC,BRANDLOGO) VALUES (3, "Honda", "Honda merupakan salah satu produsen kendaraan terbesar di dunia sejak tahun 1959", "path Honda");
INSERT INTO BRAND (BRANDID, BRANDNAME,BRANDDESC,BRANDLOGO) VALUES (4, "Mitsubishi", "Mitsubishi Motors saat ini menyediakan 8 model untuk Indonesia", "path Mitsubishi");
INSERT INTO BRAND (BRANDID, BRANDNAME,BRANDDESC,BRANDLOGO) VALUES (5, "Suzuki", "Suzuki Indonesia merupakan produsen mobil baru dengan 11 model pilihan", "path Suzuki");
INSERT INTO BRAND (BRANDID, BRANDNAME,BRANDDESC,BRANDLOGO) VALUES (6, "Nissan", "Nissan Indonesia merupakan produsen mobil baru dengan 8 model pilihan", "path Nissan");
-----CAR TYPE---------
INSERT INTO CARTYPE (CARTYPEID,CARTYPENAME,CARTYPEDESC) VALUES (1,"JEEP","jeep");
INSERT INTO CARTYPE (CARTYPEID,CARTYPENAME,CARTYPEDESC) VALUES (2,"CTCAR","ctcar");
INSERT INTO CARTYPE (CARTYPEID,CARTYPENAME,CARTYPEDESC) VALUES (3,"SEDAN","sedan");
-----STATE----
INSERT INTO STATE (STATEID, STATENAME) VALUES (1, "JAWA TIMUR");
INSERT INTO STATE (STATEID, STATENAME) VALUES (2, "JAWA BARAT");
INSERT INTO STATE (STATEID, STATENAME) VALUES (3, "JAWA TENGAH");
INSERT INTO STATE (STATEID, STATENAME) VALUES (4, "KALIMANTAN TIMUR");
INSERT INTO STATE (STATEID, STATENAME) VALUES (5, "KALIMANTAN BARAT");
INSERT INTO STATE (STATEID, STATENAME) VALUES (6, "KALIMANTAN SELATAN");
INSERT INTO STATE (STATEID, STATENAME) VALUES (7, "KALIMANTAN UTARA");
INSERT INTO STATE (STATEID, STATENAME) VALUES (8, "KALIMANTAN TENGAH");
----CITY--------
INSERT INTO CITY (CITYID,STATEID,CITYNAME) VALUES (1,1,"SURABAYA");
INSERT INTO CITY (CITYID,STATEID,CITYNAME) VALUES (2,1,"SIDOARJO");
INSERT INTO CITY (CITYID,STATEID,CITYNAME) VALUES (3,1,"PASURUAN");
------CAR-----------
INSERT INTO CAR(CARID,BRANDID,CARTYPEID,CARNAME,CARTRANSMITION,CARMODELTYPE,CARCAPACITY,CARFUELTYPE,CARPICTURE) 
VALUES (1,1,1,"CAR AA","MANUAL","HATCHBACK",2,"DIESEL","pic_AA");
INSERT INTO CAR(CARID,BRANDID,CARTYPEID,CARNAME,CARTRANSMITION,CARMODELTYPE,CARCAPACITY,CARFUELTYPE,CARPICTURE) 
VALUES (2,2,2,"CAR BB","MATIC","COUPE",2,"ETHANOL","pic_BB");
INSERT INTO CAR(CARID,BRANDID,CARTYPEID,CARNAME,CARTRANSMITION,CARMODELTYPE,CARCAPACITY,CARFUELTYPE,CARPICTURE) 
VALUES (3,3,3,"CAR CC","MANUAL","SPORT",2,"BIODIESEL","pic_CC");
INSERT INTO CAR(CARID,BRANDID,CARTYPEID,CARNAME,CARTRANSMITION,CARMODELTYPE,CARCAPACITY,CARFUELTYPE,CARPICTURE) 
VALUES (4,4,1,"CAR DD","MATIC","STATION WAGON",2,"DIESEL","pic_DD");
INSERT INTO CAR(CARID,BRANDID,CARTYPEID,CARNAME,CARTRANSMITION,CARMODELTYPE,CARCAPACITY,CARFUELTYPE,CARPICTURE) 
VALUES (5,5,2,"CAR EE","MANUAL","HATCHBACK",2,"ELECTRIC","pic_EE");
