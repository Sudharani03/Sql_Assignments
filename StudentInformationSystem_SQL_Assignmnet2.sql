---Database :- SIS(Student Information System ) ---
--creating Student table---
Create table Students(StudentId int Primary key not null , 
FirstName varchar(50) not null ,
LastName Varchar(50) not null ,
DOB date not null ,
Email varchar(70) not null ,
PhoneNumber bigint not null )

--creating Courses table ---

Create table Courses(CourseId int Primary key not null , 
CourseName varchar(50) not null ,
Credits int not null ,
TeacherId int not null 
 )

 --Creating enrollments table---

Create table Enrollments(enrollmentId int Primary key not null , 
StudentId int not null ,
CourseId int not null ,
EnrollmentDate date  not null ,
 )

 --Creating Teacher Table---

Create table Teachers(TeacherId int Primary key not null , 
FirstName Varchar(50) not null ,
LastName varchar(50) not null ,
Email varchar(70)  not null ,
 )

 --Creating Payments table--

Create table Payments(PaymentId int Primary key not null , 
StudentId int not null ,
Amount int not null ,
PaymentDate Date  not null ,
 )

 --setting Foreign Keys ---

 Alter table Courses 
 ADD CONSTRAINT FK_Teachers 
 FOREIGN KEY (TeacherId) 
 REFERENCES Teachers(TeacherId)

 Alter table Enrollments
 ADD CONSTRAINT FK_Students
 FOREIGN KEY (StudentId) 
 REFERENCES Students(StudentId)

 Alter table Enrollments
 ADD CONSTRAINT FK_Courses
 FOREIGN KEY (CourseId)
 REFERENCES Courses(CourseId)

 Alter table Payments
 ADD CONSTRAINT FK_Student
 FOREIGN KEY (StudentId)
 REFERENCES Students(StudentId)

 --Inserting values into Students table --
 select * from Students
 Insert into Students values
 (1,'John', 'Doe', '1995-03-15', 'john.doe@example.com', 1234567890),
(2,'Jane', 'Smith', '1998-07-22', 'jane.smith@example.com', 9876543210),
(3,'Bob', 'Johnson', '1997-01-10', 'bob.johnson@example.com', 1122334455),
(4,'Alice', 'Williams', '1996-09-05', 'alice.williams@example.com', 9988776655),
(5,'Charlie', 'Brown', '1999-12-20', 'charlie.brown@example.com', 1122334455),
(6,'Eva', 'Miller', '1994-06-30', 'eva.miller@example.com', 9876543210),
(7,'David', 'Anderson', '1998-04-12', 'david.anderson@example.com', 1234567890),
(8,'Grace', 'Turner', '1997-11-08', 'grace.turner@example.com', 9988776655),
(9,'Frank', 'Moore', '1993-02-18', 'frank.moore@example.com', 1122334455),
(10,'Olivia', 'Clark', '1996-08-25', 'olivia.clark@example.com', 9876543210);

--Inserting values into Teachers Table --
Insert into Teachers values 
(101, 'John', 'Smith', 'john.smith@example.com'),
(102, 'Alice', 'Johnson', 'alice.johnson@example.com'),
(103, 'Michael', 'Williams', 'michael.williams@example.com'),
(104, 'Emily', 'Brown', 'emily.brown@example.com'),
(105, 'Daniel', 'Jones', 'daniel.jones@example.com'),
(106, 'Sophia', 'Davis', 'sophia.davis@example.com'),
(107, 'Matthew', 'Miller', 'matthew.miller@example.com'),
(108, 'Olivia', 'Taylor', 'olivia.taylor@example.com'),
(109, 'David', 'Anderson', 'david.anderson@example.com'),
(110, 'Emma', 'Thomas', 'emma.thomas@example.com');
select * from Teachers

--INserting values into Course Table 
Insert into Courses values 
(1, 'Introduction to Math', 3, 101),
(2, 'History of Science', 4, 102),
(3, 'English Literature', 3, 103),
(4, 'Computer Science 101', 5, 104),
(5, 'Chemistry Basics', 4, 105),
(6, 'Art Appreciation', 3, 106),
(7, 'Economics Principles', 4, 107),
(8, 'Physics Fundamentals', 5, 108),
(9, 'Psychology 101', 3, 109),
(10, 'Spanish Language', 4, 110);
Select * from Courses

--Insering values into enrollments table 
Insert into Enrollments values 
(201, 1, 1, '2023-01-15'),
(202, 2, 2, '2023-01-16'),
(203, 3, 3, '2023-01-17'),
(204, 4, 4, '2023-01-18'),
(205, 5, 5, '2023-01-19'),
(206, 6, 6, '2023-01-20'),
(207, 7, 7, '2023-01-21'),
(208, 8, 8, '2023-01-22'),
(209, 9, 9, '2023-01-23'),
(210, 10, 10, '2023-01-24');
select * from Enrollments

--Inserting values into Payments table 

Insert into Payments values 
(1, 1, 500, '2023-02-01'),
(2, 2, 750, '2023-02-05'),
(3, 3, 600, '2023-02-10'),
(4, 4, 900, '2023-02-15'),
(5, 5, 400, '2023-02-20'),
(6, 6, 550, '2023-02-25'),
(7, 7, 700, '2023-03-01'),
(8, 8, 800, '2023-03-05'),
(9, 9, 950, '2023-03-10'),
(10, 10, 600, '2023-03-15')
select * from Payments

------------------
select * from Students
select * from Teachers
Select * from Courses
Select * from Enrollments
select * from Payments



----------- Data Manipulation Language (DML)---------
--a) Insert 10 sampl records -- already done in creationa nd insertion file 
--b)Write an SQL query to insert a new student into the "Students" table with the following details:
--a. First Name: John
--b. Last Name: Doe
--c. Date of Birth: 1995-08-15
--d. Email: john.doe@example.com
--e. Phone Number: 1234567890

Insert into Students values (11,'John','Doe','1995-08-15','john.doe@example.com',1234567890)
select * from Students

--Qurey 2:-Write an SQL query to enroll a student in a course. Choose an existing student and course and
--insert a record into the "Enrollments" table with the enrollment date.
select * from Enrollments
select * from Students
select * from Courses

Insert into Enrollments values (211,5,1,GETDATE())

--Query 3 :- Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
--modify their email address.

select * from Teachers

Update Teachers
set Email='emmanewmail110@gmail.com'
where TeacherId = 110 

--Query 4 :- Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
--an enrollment record based on student and course.

Delete  from Enrollments 
where StudentId=5 and CourseId=1

select * from Enrollments

--Query 5 :-Update the "Courses" table to assign a specific teacher to a course. Choose any course and
--teacher from the respective tables

select * from Courses
select * from Teachers

Update Courses
set TeacherId=108
where CourseId=11

--Query 6 :- Delete a specific student from the "Students" table and remove all their enrollment records
--from the "Enrollments" table. Be sure to maintain referential integrity.

Delete from Enrollments where StudentId=2
Delete from Payments where StudentId=2
Delete from Students where StudentId=2

select * from Enrollments
select * from Payments 
select * from Students 

--Query 7 :- Update the payment amount for a specific payment record in the "Payments" table. Choose any
--payment record and modify the payment amount

select * from Payments 

Update Payments
set Amount = 1000
where PaymentId=3



--Aggregate functions and subQueries---




--Query 1 :- Write an SQL query to calculate the average number of students enrolled in each course. Use
--aggregate functions and subqueries to achieve this.

select * from Courses 
select * from Enrollments 

select CourseId ,
AVG(numofStudents) as Avg_No_Of_Stu_Enrolled
from  (
       select CourseId , count (StudentId) as numOfStudents
       from Enrollments
       Group by CourseId) as subquery
Group by CourseId ;

--Query 2 :- Identify the student(s) who made the highest payment. Use a subquery to find the maximum
--payment amount and then retrieve the student(s) associated with that amount.

Select * from Payments

select StudentId , Amount from Payments 
where Amount = (Select max(Amount) from Payments)
order by StudentId


--Query 3 :- Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the
--course(s) with the maximum enrollment count.

select c.CourseId,c.CourseName,EnrollmentsCount as enrollment_count
from Courses c
JOIN (
    SELECT
        CourseId,
        COUNT(StudentId) AS EnrollmentsCount
    FROM
        Enrollments
    GROUP BY
        CourseId
) AS EnrollmentCounts ON c.CourseId= EnrollmentCounts.CourseId
WHERE
    EnrollmentsCount = (SELECT MAX(EnrollmentsCount) FROM (
        SELECT
            COUNT(StudentId) AS EnrollmentsCount
        FROM
            Enrollments
        GROUP BY
            CourseId
    ) AS MaxEnrollments);



--Query 4 :- Calculate the total payments made to courses taught by each teacher. Use aggregate functions to sum 
--payments for each teacher's courses.

select * from Teachers
select * from Courses 
select * from Enrollments 
select * from Payments 

select Teachers.TeacherId , sum(Payments.Amount) as Tot_Payments , Courses.CourseName
from Teachers
join Courses on Teachers.TeacherId=Courses.TeacherId
join Enrollments on Courses.CourseId = Enrollments.CourseId
join Payments on Enrollments.StudentId = Payments.StudentId
group by Teachers.TeacherId , Courses.CourseName

--Query 5 :- Identify students who are enrolled in all available courses. Use subqueries to compare a 
--student's enrollments with the total number of courses.

select * from Enrollments
select * from Courses

select StudentId from Enrollments 
group by StudentId 
having count(CourseId) = (Select  count(*) from Courses)

--Query 6 :- Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to 
--find teachers with no course assignments.

select Teachers.TeacherId ,Teachers.FirstName+' '+Teachers.LastName as TeacherName from Teachers 
where TeacherId not in (select TeacherId from Courses)

--Query 7 :- Calculate the average age of all students. Use subqueries to calculate the age of each student 
--based on their date of birth.
select * from Students

select AVG(Age) as Avg_Age from
(select DateDiff(Year,DOB , GetDate()) as Age from Students ) as subquery 

--Query 8 :-  Identify courses with no enrollments. Use subqueries to find courses without enrollment 
--records.

select * from Courses
select * from Enrollments

select CourseId,CourseName from Courses 
where CourseId not in ( select CourseId from Enrollments)

--Query 9 :- Calculate the total payments made by each student for each course they are enrolled in. Use 
--subqueries and aggregate functions to sum payments.

SELECT DISTINCT e1.StudentId
FROM Enrollments e1
JOIN Enrollments e2 ON e1.StudentId = e2.StudentId
WHERE e1.CourseId <> e2.CourseId

--Query 10 :- Identify students who have made more than one payment. Use subqueries and aggregate 
--functions to count payments per student and filter for those with counts greater than one.

select P.StudentId , Count(*) as NumOfPayments 
from Payments P
group by P.StudentId 
having count(*) >1

--Query 11 :- Write an SQL query to calculate the total payments made by each student. Join the "Students" 
--table with the "Payments" table and use GROUP BY to calculate the sum of payments for each 
--student.
select * from students 
select * from Payments 

select P.StudentId, S.FirstName+' '+ LastName as StuName ,SUM(P.Amount) as TotAmount 
from Students S 
join Payments P 
on S.StudentId = P.StudentId 
group by P.StudentId , S.FirstName , S.LastName

--Query 12 :- Retrieve a list of course names along with the count of students enrolled in each course. Use 
--JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to 
--count enrollments.

Select * from Courses 
select * from Enrollments

select C.CourseName , Count(E.StudentId) as StudentCount 
from Courses C 
join Enrollments E
on C.CourseId = E.CourseId 
group by C.CourseName 

--Query 13 :- Calculate the average payment amount made by students. Use JOIN operations between the 
--"Students" table and the "Payments" table and GROUP BY to calculate the average.

select S.FirstName+' '+S.LastName ,AVG(P.Amount) as AvgPayment from Payments P
join Students S
on P.StudentId=S.StudentId
Group by S.FirstName , S.LastName 


--------------- JOINS ----------------



select * from Students
select * from Courses
select * from Teachers
select * from Enrollments
select * from Payments
--Query 1 :- Write an SQL query to calculate the total payments made by a specific student. You will need to
--join the "Payments" table with the "Students" table based on the student's ID.

select * from Students
select * from Payments

select Students.FirstName , sum(Payments.Amount) as TotPaymentbyStudent
from Students join Payments 
on Students.StudentId = Payments.StudentId
where Students.StudentId = 1
Group by FirstName

--Query 2 :- Write an SQL query to retrieve a list of courses along with the count of students enrolled in each
--course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.

select * from Courses 
select * from Enrollments

select Courses.CourseId,Courses.CourseName , Count(StudentId) as Tot_Stu_Enrolled
from Courses left join Enrollments
on Courses.CourseId = Enrollments.CourseId
Group by Courses.CourseId,CourseName 

--Query 3 :- Write an SQL query to find the names of students who have not enrolled in any course. Use a
--LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.

select * from Students 
select * from Enrollments

select Students.FirstName from Students 
left join Enrollments on  Students.StudentId = Enrollments.StudentId
where Enrollments.enrollmentId is null 

--Query 4 :- Write an SQL query to retrieve the first name, last name of students, and the names of the courses
 --they are enrolled in. Use JOIN operations between the "Students" table and the"Enrollments" and "Courses" tables.
 select * from students 
 select * from Enrollments
 select * from Courses

 select Students.FirstName , Students.LastName , Courses.CourseName 
 from Students join Enrollments 
 on Students.StudentId = Enrollments.StudentId
 join Courses 
 on Enrollments.CourseId = Courses.CourseId
 Group by FirstName , LastName , CourseName

 --Query 5 :- Create a query to list the names of teachers and the courses they are assigned to. Join the
--"Teacher" table with the "Courses" table.
select * from Teachers 
select * from Courses 

select Teachers.FirstName,Courses.CourseName 
from Teachers join Courses 
on  Teachers.TeacherId = Courses.TeacherId
Group by FirstName , CourseName

--Query 6 :- Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the
--"Students" table with the "Enrollments" and "Courses" tables

Select * from Students 
select * from Enrollments
select * from Courses

Select Students.FirstName , Enrollments.EnrollmentDate , Courses.CourseName 
from Students join Enrollments 
on Students.StudentId = Enrollments.StudentId 
join Courses 
on Enrollments.CourseId = Courses.CourseId
where Courses.CourseName='Spanish Language'
Group by FirstName , EnrollmentDate , CourseName

--Query 7 :- Find the names of students who have not made any payments. Use a LEFT JOIN between the
--"Students" table and the "Payments" table and filter for students with NULL payment records.

Select Students.FirstName from Students 
left join Payments on Students.StudentId=Payments.StudentId
where Payments.PaymentId is null 
group by FirstName

--Query 8 :- Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN
--between the "Courses" table and the "Enrollments" table and filter for courses with NULLenrollment records.

select Courses.CourseName from Courses 
left join Enrollments on Courses.CourseId=Enrollments.CourseId
where Enrollments.EnrollmentId is null 
group by CourseName

-- Query 9 :- Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments"
--table to find students with multiple enrollment records.

SELECT
    e1.StudentId,
    s.FirstName,
    s.LastName
FROM
    Enrollments e1
JOIN
    Enrollments e2 ON e1.StudentId = e2.StudentId AND e1.enrollmentId <> e2.enrollmentId
JOIN
    Students s ON e1.StudentId = s.StudentId
GROUP BY
    e1.StudentId, s.FirstName, s.LastName
HAVING
    COUNT(DISTINCT e1.CourseId) < 1;

--Query 10 :-  Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher"
--table and the "Courses" table and filter for teachers with NULL course assignments.

select Teachers.FirstName from Teachers 
left join Courses 
on Teachers.TeacherId = Courses.TeacherId
where Courses.CourseId is null 
group by FirstName