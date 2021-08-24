CREATE DATABASE Practice
USE Practice
CREATE TABLE Students(
Id int identity primary key,
Name nvarchar(50),
)
CREATE TABLE Groups(
Id int identity primary key,
Name nvarchar(50),
)
CREATE TABLE GroupStudent(
Id int identity primary key,
StudentId int,
GroupID int,
    FOREIGN KEY (StudentId) REFERENCES Students(Id),
    FOREIGN KEY (GroupID) REFERENCES Groups(Id),

)
SELECT G.Name [Group],COUNT(*) FROM STUDENTS S
JOIN GroupStudent GS
ON S.Id = GS.StudentId
JOIN Groups G 
ON G.Id = GS.GroupID
GROUP BY G.Name

