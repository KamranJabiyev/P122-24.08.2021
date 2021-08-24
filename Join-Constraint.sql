DROP TABLE Students

CREATE TABLE Students(
	Id int identity primary key,
	Name nvarchar(50) not null,
	Surname nvarchar(100),
	Age int check(Age>0),
	Email nvarchar(255) unique
)

INSERT INTO Students
VALUES('Ulvi','Qarazade',21,'ulvi@edu.az'),
	  ('Ismet','Qayibov',20,'ismet@code.edu.az')

Select * From Students


SELECT CHARINDEX('@',Email),Email FROM Students

SELECT SUBSTRING(Email,1,3),Email FROM Students
SELECT SUBSTRING(Email,1,CHARINDEX('@', Email)-1),Email FROM Students


--Relations

CREATE TABLE Countries(
	Id int identity primary key,
	Name nvarchar(100) not null,
	Population int,
	Area decimal(10,2)
)

CREATE TABLE Cities(
	Id int identity primary key,
	Name nvarchar(100) not null,
	Population int,
	Area decimal(10,2),
	CountryId int references Countries(Id)
)


CREATE TABLE Groups(
	Id int identity primary key,
	Name nvarchar(100) not null,
	MaxCount int
)

CREATE TABLE StudentGroup(
	Id int identity primary key,
	GroupId int references Groups(Id),
	StudentId int references Students(Id)
)

SELECT ct.Name 'City',c.Name 'Country' FROM Cities AS ct
JOIN
Countries AS c
ON
ct.CountryId=c.Id

SELECT * FROM Cities AS ct
FULL OUTER JOIN
Countries AS c
ON
ct.CountryId=c.Id

SELECT * FROM Cities AS ct
LEFT JOIN
Countries AS c
ON
ct.CountryId=c.Id
WHERE c.Id IS NULL

SELECT * FROM Cities AS ct
Right JOIN
Countries AS c
ON
ct.CountryId=c.Id

CREATE TABLE Positions(
	Id int identity primary key,
	Name nvarchar(100) not null,
	Dependency int
)

SELECT p1.Name 'Position',p2.Name 'Dependency' FROM Positions p1
LEFT JOIN Positions p2
ON
p1.Dependency=p2.Id


CREATE TABLE Sizes(
	Id int identity primary key,
	Size nvarchar(10) not null
)

CREATE TABLE Products(
	Id int identity primary key,
	Name nvarchar(100) not null
)

SELECT p.Name,s.Size FROM Products p
CROSS JOIN Sizes s

ALTER TABLE Students
ADD Point int check(Point>=0 AND Point<=100)


CREATE TABLE Grades(
	Id int identity primary key,
	Grade nvarchar(5) not null,
	MaxGrade int check(MaxGrade>=0 AND MaxGrade<=100),
	MinGrade int check(MinGrade>=0 AND MinGrade<=100)
)

SELECT Name,Surname,Email,Point,Grade FROM Students s
JOIN Grades gr
ON
s.Point BETWEEN gr.MinGrade AND gr.MaxGrade