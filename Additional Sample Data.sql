USE SpartaAcademy;

--=================INSERT OCCURENCES INTO ROOMS TABLE=================--
INSERT INTO [dbo].[Rooms]
           ([AcademyID]
           ,[RoomName]
           ,[Description]
           ,[Capacity])
     VALUES
			(2, 'Room 1', 'Left side corner room', 15)
		   ,(2, 'Room 2', 'Middle room at the back', 15)
		   ,(2, 'Room 3', 'Corner room next to the kitchen', 18)
		   ,(2, 'Interrogation Room', 'Small interview room', 4)
		   ,(2, 'Boardroom', 'Use as last resort', 14);

--=================INSERT OCCURENCES INTO COURSE SCHEDULE=================--
INSERT INTO [dbo].[CourseSchedule]
           ([AcademyID]
           ,[RoomsID]
           ,[StartDate]
           ,[EndDate])
     VALUES
           (1, 6, '01/27/2020', '03/27/2020') --C# SDET Course
		   ,(1, 7, '02/03/2020', '04/10/2018'); --Data Analysis Course


--=================INSERT OCCURENCES INTO COURSE CATALOG=================--
INSERT INTO [dbo].[CourseCatalog]
           ([CourseName]
			,[CourseScheduleID]
			,[Duration])
     VALUES
			('C# SDET', 3, 10)
			,('Data Analysis', 4, 10);

--=================INSERT OCCURENCES INTO EMPLOYEES=================--
INSERT INTO [dbo].[Employees]
           ([FirstName]
           ,[LastName]
           ,[EmployeeType]
           ,[StartDate])
     VALUES
			('Nishant', 'Mandal','T', '07/02/2018') --Dates Are Formatted MM/dd/yyyy (Possible error)
			,('Cathy', 'French', 'TA', '07/01/2018')
			,('Paula', 'Kendra', 'T', '11/07/2019')
			,('Jared', 'Mackay', 'S', '01/27/2020') --New C# SDET stream
			,('Mitchell', 'Clarke', 'S', '01/27/2020')
			,('Nabil', 'Sufi', 'S', '01/27/2020')
			,('Jason', 'Evans', 'S', '01/27/2020')
			,('Pavel', 'Casian', 'S', '02/03/2020') --New data analyst stream
			,('Timothy', 'Hong', 'S', '02/03/2020')
			,('Kate', 'Greengrass', 'S', '02/03/2020')
			,('Emma', 'Chamberlain', 'S', '02/03/2020')

--=================INSERT OCCURENCES INTO COURSE SCHEDULE TRAINERS=================--
INSERT INTO [dbo].[CourseScheduleTrainers]
           ([CourseScheduleID]
		   ,[EmployeeID]
           ,[TrainerType])
     VALUES
			(3, 18, 'T')
			,(3, 19, 'TA')
			,(4, 20, 'T');

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
           (3, 3, 'Jared', 'Mackay', 21, 1)
		   ,(3, 3, 'Mitchell', 'Clarke', 22, 1)
		   ,(3, 3, 'Nabil', 'Sufi', 23, 1)
		   ,(3, 3, 'Jason', 'Evans', 24, 1)
		   ,(4, 5, 'Pavel', 'Casian', 25, 1)
		   ,(4, 5, 'Timothy', 'Hong', 26, 1)
		   ,(4, 5, 'Kate', 'Greengrass', 27, 1)
		   ,(4, 5, 'Emma', 'Chamberlain', 28, 1);