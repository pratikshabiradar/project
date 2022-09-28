
CREATE TABLE `student` (
  `student_pk` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150),
  `dob` varchar(50),
  `gender` varchar(50),
  `email` varchar(250) ,
  `address` varchar(450),
  `contact` varchar(50),
  `enrollment` varchar(150),
  `semester` varchar(150),
PRIMARY KEY (`student_pk`));


CREATE TABLE `teacher` (
  `teacher_pk` int NOT NULL AUTO_INCREMENT,
  `tname` varchar(150),
  `tdob` varchar(50),
  `tgender` varchar(50),
  `temail` varchar(250) ,
  `taddress` varchar(450),
  `tcontact` varchar(50),
  `teacherid` varchar(150),
PRIMARY KEY (`teacher_pk`));

CREATE TABLE `room` (
  `room_pk` int NOT NULL AUTO_INCREMENT,
  `roomno` varchar(150),
PRIMARY KEY (`room_pk`));

CREATE TABLE `roomstudentmapping` (
  `roomstudentmapping_pk` int NOT NULL AUTO_INCREMENT,
  `room_fk` int NOT NULL,
  `student_fk` int NOT NULL,
   `date` varchar(50),
  PRIMARY KEY (`roomstudentmapping_pk`),
  KEY `room_fk` (`room_fk`),
  KEY `student_fk` (`student_fk`),
  CONSTRAINT `room_fk` FOREIGN KEY (`room_fk`) REFERENCES `room` (`room_pk`),
  CONSTRAINT `student_fk` FOREIGN KEY (`student_fk`) REFERENCES `student` (`student_pk`)
);



CREATE TABLE `roomteachermapping` (
  `roomteachermapping_pk` int NOT NULL AUTO_INCREMENT,
  `troom_fk` int NOT NULL,
  `teacher_fk` int NOT NULL,
  `date` varchar(50),
  PRIMARY KEY (`roomteachermapping_pk`),
  KEY `troom_fk` (`troom_fk`),
  KEY `teacher_fk` (`teacher_fk`),
  CONSTRAINT `troom_fk` FOREIGN KEY (`troom_fk`) REFERENCES `room` (`room_pk`),
  CONSTRAINT `teacher_fk` FOREIGN KEY (`teacher_fk`) REFERENCES `teacher` (`teacher_pk`)
);


CREATE TABLE `newappuser` (
  `appuser_pk` int NOT NULL AUTO_INCREMENT,
  `email` varchar(250) ,
  `pass` varchar(150),
  `role` varchar(50),
PRIMARY KEY (`appuser_pk`));

insert into newappuser (email,pass,role) values ('admin@gmail.com','admin','admin');