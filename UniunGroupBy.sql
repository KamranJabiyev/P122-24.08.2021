--UNION

CREATE TABLE GraduetedStudents(
	Id int identity primary key,
	Name nvarchar(50),
	Point int
)

SELECT Name,Point FROM Students
UNION
SELECT Name,Point FROM GraduetedStudents

SELECT Name,Point FROM Students
UNION ALL
SELECT Name,Point FROM GraduetedStudents

SELECT Name,Point FROM Students
EXCEPT
SELECT Name,Point FROM GraduetedStudents

SELECT Name,Point FROM GraduetedStudents
EXCEPT
SELECT Name,Point FROM Students

SELECT Name,Point FROM GraduetedStudents
INTERSECT
SELECT Name,Point FROM Students

SELECT * FROM Cities ct
JOIN Countries c
ON
ct.CountryId=c.Id

SELECT c.Name 'Country',COUNT(*) 'Count' FROM Cities ct
JOIN Countries c
ON
ct.CountryId=c.Id
GROUP BY c.Name


CREATE VIEW GetStudentDetail
AS
SELECT S.Name 'Name',
	   Surname,
	   Email,
	   G.Name 'Group',
	   Point 
	   FROM STUDENTS S
JOIN StudentGroup GS
ON S.Id = GS.StudentId
JOIN Groups G 
ON G.Id = GS.GroupID



CREATE materialized VIEW GetStudentDetailMaterialized
with(distribution=round_robin) 
AS
SELECT S.Name 'Name',
	   Surname,
	   Email,
	   G.Name 'Group',
	   Point 
	   FROM STUDENTS S
JOIN StudentGroup GS
ON S.Id = GS.StudentId
JOIN Groups G 
ON G.Id = GS.GroupID

SELECT * FROM GetStudentDetail

UPDATE  FROM GetStudentDetail
WHERE Name='Kamandar'


