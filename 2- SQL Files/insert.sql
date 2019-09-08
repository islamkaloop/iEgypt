
INSERT INTO Category VALUES 
('Educational','Disscussing specification concerning education'),
('Investment','Disscussing specification concerning Investment'),
('Tourism','Disscussing specification concerning Tourism');

INSERT INTO Sub_category VALUES 
('educational','highschools'),
('educational','highereducation'),
('investment','banking'),
('investment','projects'),
('tourism','historical'),
('tourism','medical');

INSERT INTO "User" VALUES
('abdo.elbeltagy@gmail.com','abdelrahamn','mahmoud','ismail','7/1/1998','ami12345','1/1/2018',1),
('Ahmed.dardir@gmail.com','Ahmed','dardir','abdulhameed','1/25/1998','ada12345','1/1/2018',1),
('islamkaloop@gmail.com','islam','mohamed','rashid','5/20/1998','imr12345','1/1/2018',1),
('mohamedsabry@gmail.com','mohamed','sabry','hassen','7/8/1998','msh12345','1/1/2018',1),
('mohamedabdelrazeq@yahoo.com','mohamed','abdelrazeq','salem','12/10/1997','mas12345','1/1/2018',1),
('mohamedkhalled@gmail.com','mohamed','khalled','abdo','11/10/1998','mka12345','1/1/2018',1),
('mohamedmedhat@hotmail.com','mohamed','medhat','mohamed','2/5/1998','mmm12345','1/1/2018',1),
('mohamedhassanen@gmail.com','mohamed','mahmoud','hassanen','12/13/1997','mmh12345','1/1/2018',1),
('ezzelden2014@yahoo.com','ezzelden','badawy','hanafe','10/5/1998','ebh12345','1/1/2018',1),
('ahmedebaid@gmail.com','ahmed','khalled','hassan','12/10/1998','akh12345','1/1/2018',1),
('alielhosary@gmail.com','ali','mohamed','elhosary','4/6/1998','ame12345','1/1/2018',1),
('ahmedabdalelah@yahoo.com','ahmed','mohamed','abdalelah','11/8/1997','ama12345','1/1/2018',1),
('islamelbadry@hotmail.com','islam','mohamed','elbadry','3/25/1998','ime12345','1/1/2018',1);

INSERT INTO Viewer VALUES 
(1,'GUC','Universities','The German University in Cairo, GUC, is an Egyptian Private University founded by the presidential decree 27/2002, according to the law number 101/1992 and its executive regulations number 355/1996.'),
(2,'CIB','Banks','The biggest private sector bank in Egypt.'),
(3,'The Nile Ritz-Carlton','Hotels','Located in the heart of Cairo lies the iconic Nile Ritz-Carlton Cairo, located between the Nile river, Tahrir square and adjacent to the Egyptian Museum.');

INSERT INTO Notified_Person VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

INSERT INTO Contributor VALUES 
(4,5,'https://drive.google.com/drive/folders/00','graphic designers',1),
(5,4,'https://drive.google.com/drive/folders/11','photographers',2),
(6,10,'https://drive.google.com/drive/folders/22','video editors',3),
(7,7,'https://drive.google.com/drive/folders/33','directors',4),
(8,8,'https://drive.google.com/drive/folders/44','music producers',5);

INSERT INTO Staff VALUES
(9,'5/5/2000',5,150.0,6),
(10,'3/2/2010',8,100.0,7),
(11,'4/5/2000',5,150.0,8),
(12,'5/2/2010',8,100.0,9),
(13,'2/20/2012',7,50.0,10);

INSERT INTO Reviewer VALUES 
(9),
(10);

INSERT INTO Content_Type VALUES
('images'),
('videos'),
('sound tracks');

INSERT INTO Content_Manager VALUES
(11,'images'),
(12,'videos'),
(13,'sound tracks');

INSERT INTO Content VALUES
('https://drive.google.com/drive/folders/04','2/1/2010',4,'educational','highereducation','sound tracks'),
('https://drive.google.com/drive/folders/05','3/1/2009',5,'investment','banking','images'),
('https://drive.google.com/drive/folders/06','4/8/2012',6,'tourism','historical','videos'),
('https://drive.google.com/drive/folders/07','6/8/2016',7,'investment','banking','videos'),
('https://drive.google.com/drive/folders/08','7/8/2018',8,'educational','highereducation','images'),
('https://drive.google.com/drive/folders/09','7/3/2018',6,'tourism','historical','images');


INSERT INTO Original_Content VALUES
(1,11,null,0,0,null),
(2,13,null,0,0,null),
(3,12,null,0,0,null);

INSERT INTO Existing_Request VALUES
(1,1),
(2,2);

go
INSERT Notification_Object DEFAULT VALUES;
INSERT Notification_Object DEFAULT VALUES;
INSERT Notification_Object DEFAULT VALUES;
INSERT Notification_Object DEFAULT VALUES;
INSERT Notification_Object DEFAULT VALUES;
INSERT Notification_Object DEFAULT VALUES;
INSERT Notification_Object DEFAULT VALUES;
INSERT Notification_Object DEFAULT VALUES;
INSERT Notification_Object DEFAULT VALUES;
INSERT Notification_Object DEFAULT VALUES;
INSERT Notification_Object DEFAULT VALUES;
INSERT Notification_Object DEFAULT VALUES;
INSERT Notification_Object DEFAULT VALUES;
go

INSERT INTO New_Request VALUES
(1,1,'sand storm effect in my video',1,1,4),
(1,1,'edit my game graphics to be bright',2,2,4),
(1,1,'a nice photo of the red sea',3,3,5),
(1,1,'photoshop this picture into natural view',1,4,5),
(1,1,'mount sinai photo ',2,5,5),
(1,1,'filter music out',3,6,8),
(1,1,'edit sound quality',1,7,8),
(1,1,'a remix of my song',2,8,8),
(0,0,'grey level logo',3,9,null),					-- 3 users with no certain contributor
(0,0,'personal icon design',1,10,null),
(0,0,'green logo',2,11,null);

INSERT INTO announcement VALUES
('1/1/2018','1/2/2018',1,1),
('1/1/2018','1/2/2018',2,1),
('1/1/2018','1/2/2018',3,1),
('1/1/2018','1/2/2018',4,1),
('1/1/2018','1/2/2018',5,1),
('1/1/2018','1/2/2018',1,2),
('1/1/2018','1/2/2018',2,2),
('1/1/2018','1/2/2018',3,2),
('1/1/2018','1/2/2018',4,2),
('1/1/2018','1/2/2018',5,2),
('1/1/2018','1/2/2018',1,3),
('1/1/2018','1/2/2018',2,3),
('1/1/2018','1/2/2018',3,3),
('1/1/2018','1/2/2018',4,3),
('1/1/2018','1/2/2018',5,3),
('1/1/2018','1/2/2018',1,4),
('1/1/2018','1/2/2018',2,4),
('1/1/2018','1/2/2018',3,4),
('1/1/2018','1/2/2018',4,4),
('1/1/2018','1/2/2018',5,4),
('1/1/2018','1/2/2018',1,5),
('1/1/2018','1/2/2018',2,5),
('1/1/2018','1/2/2018',3,5),
('1/1/2018','1/2/2018',4,5),
('1/1/2018','1/2/2018',5,5),
('1/1/2018','1/2/2018',5,5),
('1/1/2018','1/2/2018',1,6),
('1/1/2018','1/2/2018',2,6),
('1/1/2018','1/2/2018',3,6),
('1/1/2018','1/2/2018',4,6),
('1/1/2018','1/2/2018',5,6),
('1/1/2018','1/2/2018',1,7),
('1/1/2018','1/2/2018',2,7),
('1/1/2018','1/2/2018',3,7),
('1/1/2018','1/2/2018',4,7),
('1/1/2018','1/2/2018',5,7),
('1/1/2018','1/2/2018',1,8),
('1/1/2018','1/2/2018',2,8),
('1/1/2018','1/2/2018',3,8),
('1/1/2018','1/2/2018',4,8),
('1/1/2018','1/2/2018',5,8),
('1/1/2018','1/2/2018',1,9),
('1/1/2018','1/2/2018',2,9),
('1/1/2018','1/2/2018',3,9),
('1/1/2018','1/2/2018',4,9),
('1/1/2018','1/2/2018',5,9),
('1/1/2018','1/2/2018',1,10),
('1/1/2018','1/2/2018',2,10),
('1/1/2018','1/2/2018',3,10),
('1/1/2018','1/2/2018',4,10),
('1/1/2018','1/2/2018',5,10),
('1/1/2018','1/2/2018',1,11),
('1/1/2018','1/2/2018',2,11),
('1/1/2018','1/2/2018',3,11),
('1/1/2018','1/2/2018',4,11),
('1/1/2018','1/2/2018',5,11),
('1/1/2018','1/2/2018',1,12),
('1/1/2018','1/2/2018',2,12),
('1/1/2018','1/2/2018',3,12),
('1/1/2018','1/2/2018',4,12),
('1/1/2018','1/2/2018',5,12),
('1/1/2018','1/2/2018',6,12),
('1/1/2018','1/2/2018',7,12),
('1/1/2018','1/2/2018',8,12),
('1/1/2018','1/2/2018',9,12),
('1/1/2018','1/2/2018',10,12),
('1/1/2018','1/2/2018',1,13),
('1/1/2018','1/2/2018',2,13),
('1/1/2018','1/2/2018',3,13),
('1/1/2018','1/2/2018',4,13),
('1/1/2018','1/2/2018',5,13),
('1/1/2018','1/2/2018',6,13),
('1/1/2018','1/2/2018',7,13),
('1/1/2018','1/2/2018',8,13),
('1/1/2018','1/2/2018',9,13),
('1/1/2018','1/2/2018',10,13);

INSERT INTO New_Content VALUES
(4,3,'2/1/2018'),
(5,4,'3/15/2018'),
(6,5,null);

-- 3 new content from 3 diff contributor , is that right ? check
INSERT INTO event VALUES
('running around the campus','GUC Campus ','Cairo','3/12/2018','captain mdhat',12,1),
('musical gathering','Al-rehab','Cairo','12/12/2018','musc instructor taric',13,2);

INSERT INTO event_photos_link VALUES
(1,'https://drive.google.com/drive/folders/55'),
(2,'https://drive.google.com/drive/folders/66');

INSERT INTO event_videos_link VALUES
(1,'https://drive.google.com/drive/folders/77'),
(2,'https://drive.google.com/drive/folders/88');

INSERT INTO advertisement VALUES
('Come and run with us!','GUC Campus-cairo',1,1),
('Come and sing with us!','Al-rehab-cairo',2,2);

INSERT INTO ads_photos_link VALUES
(1,'https://drive.google.com/drive/folders/99'),
(2,'https://drive.google.com/drive/folders/01');

INSERT INTO ads_video_link VALUES
(1,'https://drive.google.com/drive/folders/02'),
(2,'https://drive.google.com/drive/folders/03');




