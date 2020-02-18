--=================HARD RESET DATABASE=================--
USE master;
DROP DATABASE SpartaAcademy;
CREATE DATABASE SpartaAcademy;
USE SpartaAcademy;

--=================ACADEMY TABLE=================--
CREATE TABLE Academies
(
     AcademyID INT NOT NULL IDENTITY(1,1) PRIMARY KEY --Autoincremented Primary Keys in terms of future proofing the database
    ,AcademyName VARCHAR(30)
);

--=================ROOMS TABLES=================--
CREATE TABLE Rooms
(
     RoomsID INT NOT NULL IDENTITY(1,1) PRIMARY KEY
    ,AcademyID INT
    ,FOREIGN KEY (AcademyID) REFERENCES Academies (AcademyID)
    ,RoomName VARCHAR(30)
    ,"Description" VARCHAR(MAX) --Place description in quotations as it is a keyword  
    ,Capacity INT
);

--=================COURSE SCHEDULE TABLE=================--
CREATE TABLE CourseSchedule
(
     CourseScheduleID INT NOT NULL IDENTITY(1,1) PRIMARY KEY
    ,AcademyID INT
    ,FOREIGN KEY (AcademyID) REFERENCES Academies (AcademyID)
    ,RoomsID INT
    ,FOREIGN KEY (RoomsID) REFERENCES Rooms (RoomsID)
    ,StartDate DATE
    ,EndDate DATE
);

--=================COURSE EMPLOYEES TABLE=================--
CREATE TABLE Employees
(
    EmployeeID INT NOT NULL IDENTITY(1,1) PRIMARY KEY
    ,FirstName VARCHAR(30)
    ,LastName VARCHAR(30)
    ,EmployeeType VARCHAR(5)
    ,StartDate DATE
);

--=================COURSE SCHEDULE TRAINER TABLE=================--
CREATE TABLE CourseScheduleTrainers
(
     TrainerID INT NOT NULL IDENTITY(1,1) PRIMARY KEY
	,EmployeeID INT
    ,FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
    ,CourseScheduleID INT
    ,FOREIGN KEY (CourseScheduleID) REFERENCES CourseSchedule (CourseScheduleID)
    ,TrainerType VARCHAR(5)
);

--=================COURSE CATALOG TABLE=================--
 CREATE TABLE CourseCatalog
(
     CourseCatalogID INT NOT NULL IDENTITY(1,1) PRIMARY KEY
	,CourseScheduleID INT
	,FOREIGN KEY (CourseScheduleID) REFERENCES CourseSchedule (CourseScheduleID)
    ,CourseName VARCHAR(30)
    ,Duration INT
);

--=================COURSE SCHEDULE ATTENDEES TABLE=================--
CREATE TABLE CourseScheduleAttendees 
(
     AttendeeID INT NOT NULL IDENTITY(1,1) PRIMARY KEY
    ,CourseCatalogID INT
    ,FOREIGN KEY (CourseCatalogID) REFERENCES CourseCatalog (CourseCatalogID)
	,FirstName VARCHAR(30)
	,LastName VARCHAR(30)
	,TrainerID INT
	,FOREIGN KEY (TrainerID) REFERENCES CourseScheduleTrainers (TrainerID)
	,EmployeeID INT
	,FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
    ,Active BIT
);
