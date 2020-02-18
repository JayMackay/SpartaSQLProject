
USE SpartaAcademy;

--=================Exercise 3.1=================--
SELECT
cc.CourseName
,FORMAT(cs.StartDate, 'dd/MM/yyyy') AS 'Start Date'
,FORMAT(cs.EndDate, 'dd/MM/yyyy') AS 'End Date'
,a.AcademyName
,r.RoomName
,(SELECT e.FirstName + ' ' + e.LastName WHERE e.EmployeeType = 'T') AS 'Trainer'
,(SELECT csa.FirstName + ' ' + csa.LastName) AS 'Spartan' --In order to enter into third normal form inserted Spartan names into Attendees table to reference
FROM Employees e
INNER JOIN CourseScheduleTrainers cst ON e.EmployeeID = cst.EmployeeID
INNER JOIN CourseScheduleAttendees csa ON cst.TrainerID = csa.TrainerID
INNER JOIN CourseCatalog cc ON csa.CourseCatalogID = cc.CourseCatalogID
INNER JOIN CourseSchedule cs ON cc.CourseScheduleID = cs.CourseScheduleID
INNER JOIN Rooms r ON cs.RoomsID = r.RoomsID
INNER JOIN Academies a ON r.AcademyID = a.AcademyID;

--=================Exercise 3.2=================--
SELECT
cc.CourseName
,FORMAT(cs.StartDate, 'dd/MM/yyyy') AS 'Start Date'
,FORMAT(cs.EndDate, 'dd/MM/yyyy') AS 'End Date'
,a.AcademyName
,r.RoomName
,(SELECT e.FirstName + ' ' + e.LastName WHERE e.EmployeeType = 'T') AS 'Trainer'
,(SELECT CONCAT(LEFT(csa.FirstName, 1), LEFT(csa.LastName, 1))) AS 'Spartan Initials' --Concatenate the first letter starting from the left of the string for both the FirstName and LastName to get initials
FROM Employees e
INNER JOIN CourseScheduleTrainers cst ON e.EmployeeID = cst.EmployeeID
INNER JOIN CourseScheduleAttendees csa ON cst.TrainerID = csa.TrainerID
INNER JOIN CourseCatalog cc ON csa.CourseCatalogID = cc.CourseCatalogID
INNER JOIN CourseSchedule cs ON cc.CourseScheduleID = cs.CourseScheduleID
INNER JOIN Rooms r ON cs.RoomsID = r.RoomsID
INNER JOIN Academies a ON r.AcademyID = a.AcademyID;

--=================Exercise 3.3=================--
SELECT
cc.CourseName
,FORMAT(cs.StartDate, 'dd/MM/yyyy') AS 'Start Date'
,FORMAT(cs.EndDate, 'dd/MM/yyyy') AS 'End Date'
,FORMAT(DATEADD(week, 8, cs.StartDate), 'dd/MM/yyyy') AS 'Check Date' --Add 8 weeks to course
,CASE WHEN cc.CourseName = 'BA-Test' --Check case if CourseName is BA-Test
THEN FORMAT(DATEADD(week, 8, cs.StartDate), 'dd/MM/yyyy') --If true add 8 weeks
ELSE FORMAT(DATEADD(week, 12, cs.StartDate), 'dd/MM/yyyy') --If false add 12
END AS 'Check Date'
,a.AcademyName
,r.RoomName
,(SELECT e.FirstName + ' ' + e.LastName WHERE e.EmployeeType = 'T') AS 'Trainer'
,(SELECT CONCAT(LEFT(csa.FirstName, 1), LEFT(csa.LastName, 1))) AS 'Spartan Initials'
FROM Employees e
INNER JOIN CourseScheduleTrainers cst ON e.EmployeeID = cst.EmployeeID
INNER JOIN CourseScheduleAttendees csa ON cst.TrainerID = csa.TrainerID
INNER JOIN CourseCatalog cc ON csa.CourseCatalogID = cc.CourseCatalogID
INNER JOIN CourseSchedule cs ON cc.CourseScheduleID = cs.CourseScheduleID
INNER JOIN Rooms r ON cs.RoomsID = r.RoomsID
INNER JOIN Academies a ON r.AcademyID = a.AcademyID;
