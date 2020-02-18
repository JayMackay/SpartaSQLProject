USE SpartaAcademy;

--=================INSERT OCCURENCES INTO ACADEMIES TABLE=================--           
INSERT INTO [dbo].[Academies]
           ([AcademyName])
     VALUES
			('Richmond')
			,('Birmingham')
			,('Leeds');


--=================INSERT OCCURENCES INTO ROOMS TABLE=================--
INSERT INTO [dbo].[Rooms]
           ([AcademyID]
           ,[RoomName]
           ,[Description]
           ,[Capacity])
     VALUES
			(1, 'Room 1', 'Next to the new Lo; sign', 12)
		   ,(1, 'Room 2', 'Behind the new Sparta sign', 18)
		   ,(1, 'Room 3', 'No air-con',18)
		   ,(1, 'Room 4', 'Has second door with number lock', 10)
		   ,(1, 'Boardroom', 'Use as last resort', 14);

--=================INSERT OCCURENCES INTO COURSE SCHEDULE=================--
INSERT INTO [dbo].[CourseSchedule]
           ([AcademyID]
           ,[RoomsID]
           ,[StartDate]
           ,[EndDate])
     VALUES
           (1, 1, '01/15/2018', '03/02/2018')
		   ,(1, 3, '01/22/2018', '03/03/2018');


--=================INSERT OCCURENCES INTO COURSE CATALOG=================--
INSERT INTO [dbo].[CourseCatalog]
           ([CourseName]
			,[CourseScheduleID]
			,[Duration])
     VALUES
			('BA-Test', 1, 7)
			,('Engineering', 2, 12);

--=================INSERT OCCURENCES INTO EMPLOYEES=================--
INSERT INTO [dbo].[Employees]
           ([FirstName]
           ,[LastName]
           ,[EmployeeType]
           ,[StartDate])
     VALUES
			('Tim', 'Cawte', 'T', '07/14/2017')
			,('Richard', 'Gurney', 'T', '07/01/2017')
			,('Adam', 'Smith', 'S', '01/15/2018')
			,('John', 'Williams', 'S', '01/15/2018')
			,('Nick', 'Willis', 'S', '01/15/2018')
			,('Jenny', 'Jones', 'S', '01/15/2018')
			,('Katie', 'Price', 'S', '01/15/2018')
			,('Peter', 'Brown', 'S', '01/15/2018')
			,('Mo', 'Khan', 'S', '01/22/2018')
			,('Juan', 'Carlos', 'S', '01/22/2018')
			,('Jan', 'Miller', 'S', '01/22/2018')
			,('Kyle', 'Carpenter', 'S', '01/22/2018')
			,('Alvarao', 'Carlos', 'S', '01/22/2018')
			,('Margaret', 'Baker', 'S', '01/22/2018')
			,('Oti', 'Mwase', 'S', '01/22/2018')
			,('Joe', 'Mann', 'S', '01/22/2018')
			,('Steve', 'Harris', 'S', '01/22/2018');

--=================INSERT OCCURENCES INTO COURSE SCHEDULE TRAINERS=================--
INSERT INTO [dbo].[CourseScheduleTrainers]
           ([CourseScheduleID]
		   ,[EmployeeID]
           ,[TrainerType])
     VALUES
			(1, 1, 'T')
			,(2, 2, 'T');

--=================INSERT OCCURENCES INTO COURSE SCHEDULE ATTENDEES=================--
--REMOVED START DATE AS THIS LINKS WITH COURSE SCHEDULE
INSERT INTO [dbo].[CourseScheduleAttendees]
           ([CourseCatalogID]
		   ,[TrainerID]
		   ,[FirstName]
		   ,[LastName]
		   ,[EmployeeID]
           ,[Active]) 
     VALUES
			(1, 1, 'Adam', 'Smith', 3, 1)
			,(1, 1, 'John', 'Williams', 4, 1)
			,(1, 1, 'Nick', 'Willis', 5, 1) 
			,(1, 1, 'Jenny', 'Jones', 6, 1) 
			,(1, 1, 'Katie', 'Price', 7, 1) 
			,(1, 1, 'Peter', 'Brown', 8, 1)
			,(2, 2, 'Mo', 'Khan', 9, 1)  
			,(2, 2, 'Juan', 'Carlos', 10, 1)
			,(2, 2, 'Jan', 'Miller', 11, 1) 
			,(2, 2, 'Kyle', 'Carpenter', 12,  1)
			,(2, 2, 'Alvarao', 'Carlos', 13, 1) 
			,(2, 2, 'Margaret', 'Baker', 14, 1) 
			,(2, 2, 'Oti', 'Mwase', 15, 1)
			,(2, 2, 'Joe', 'Mann', 16, 1)
			,(2, 2, 'Steve', 'Harris', 17, 1);

--=================SHOW ALL TABLES=================--
SELECT * FROM Academies;
SELECT * FROM Rooms;
SELECT * FROM CourseSchedule;
SELECT * FROM CourseCatalog;
SELECT * FROM CourseScheduleAttendees
SELECT * FROM Employees;
SELECT * FROM CourseScheduleTrainers;
