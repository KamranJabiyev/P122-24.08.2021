CREATE PROCEDURE GetAllStudent
AS
SELECT * FROM Students

EXEC GetAllStudent


CREATE PROCEDURE GetStudentWithPoint @point int
AS
SELECT * FROM Students
WHERE Point>@point

EXEC GetStudentWithPoint 80


CREATE PROCEDURE GetStudentWithPointAndName @point int, @name nvarchar(50)
AS
SELECT * FROM STudents
WHERE Point>@point AND Name=@name

EXEC GetStudentWithPointAndName @name='Kamandar',@point=80

CREATE PROCEDURE GetStudentWithPointAndNameDefault @point int=50, @name nvarchar(50)
AS
SELECT * FROM STudents
WHERE Point>@point AND Name=@name

EXEC GetStudentWithPointAndNameDefault @name='Kamandar'
