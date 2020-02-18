USE SpartaAcademy;

--=================Exercise 4.2=================--
--Add constraints to ensure that only set defined values can be entered into the specified attributes
ALTER TABLE CourseScheduleTrainers 
ADD CHECK(TrainerType = 'T' OR TrainerType = 'A');

ALTER TABLE Employees 
ADD CHECK(EmployeeType IN ('T', 'S', 'TA')); 

--set maximum capacity of rooms to be 25 only
ALTER TABLE Rooms
ADD CHECK(Capacity  <= 25);

--Updates Trainer Type in Course Schedule Trainers from TA to A (Drops initial check constraint)
UPDATE CourseScheduleTrainers
SET TrainerType = 'A'
WHERE TrainerID = 3;