CREATE TABLE Student (
Student_ID Number(8) PRIMARY KEY,
First_Name Varchar(10) NOT NULL,
Last_Name Varchar(10) NOT NULL,
Gender Varchar(1) NOT NULL,
Contact_Details Varchar2(13) NOT NULL
);

CREATE TABLE Club (
Club_ID Number(5) PRIMARY KEY,
Club_Name Varchar2(20) NOT NULL,
President_ID Number(8) NOT NULL,
CONSTRAINT FK_Student
FOREIGN KEY (President_ID)
REFERENCES Student(Student_ID)
);

CREATE TABLE Membership (
Membership_ID Number(7) PRIMARY KEY,
Student_ID Number(8) NOT NULL,
Club_ID Number(5) NOT NULL,
Start_Date Date NOT NULL,
Fee_Date Date NOT NULL,
CONSTRAINT FK_Student_I
    FOREIGN KEY (Student_ID)
    REFERENCES Student(Student_ID),
CONSTRAINT FK_Club
    FOREIGN KEY (Club_ID)
    REFERENCES Club(Club_ID)
);

CREATE TABLE Event (
Event_ID Number(6) PRIMARY KEY,
Club_ID Number(5) NOT NULL,
Event_Detail Varchar2(30) NOT NULL,
Event_Date Date NOT NULL,
Location Varchar2(20) NOT NULL,
Cost Number(2) NOT NULL, CONSTRAINT FK_Club_I
    FOREIGN KEY (Club_ID)
    REFERENCES Club(Club_ID)
);

CREATE TABLE Attendance (
Attendance_ID Number(3) PRIMARY KEY,
Event_ID Number(6) NOT NULL,
Student_ID Number(8) NOT NULL,
Score_Rating Number(1) NOT NULL,
CONSTRAINT FK_Event
    FOREIGN KEY (Event_ID)
    REFERENCES Event(Event_ID),
CONSTRAINT FK_Student_J
    FOREIGN KEY (Student_ID)
    REFERENCES Student(Student_ID)
);
