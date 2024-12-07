
CREATE TABLE student_has_partime_job (
    student_id INT,
    job_id INT,
    startDate DATE,
    endDate DATE,
    salary FLOAT,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (job_id) REFERENCES partimeJob(id)
);


CREATE TABLE partimeJob (
    id INT PRIMARY KEY,
    type VARCHAR(45),
    hours SMALLINT,
    position VARCHAR(45),
    company VARCHAR(45)
);


CREATE TABLE student_maintains_attendance (
    student_id INT,
    course_id INT,
    date DATE,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);


CREATE TABLE section_datslot (
    day VARCHAR(10),
    start_time TIME,
    end_time TIME,
    sectionID INT,
    FOREIGN KEY (sectionID) REFERENCES section(id)
);


CREATE TABLE student_issues_books (
    student_id INT,
    copyNo INT,
    issueDate DATE,
    returnDate DATE,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (copyNo) REFERENCES book(copyNo)
);

CREATE TABLE book_has_copies (
    book_id INT,
    copyNo INT PRIMARY KEY,
    status VARCHAR(45),
    FOREIGN KEY (book_id) REFERENCES book(id)
);

CREATE TABLE books (
    id INT PRIMARY KEY,
    bookName VARCHAR(45),
    description VARCHAR(45)
);

CREATE TABLE eBill (
    id INT PRIMARY KEY,
    student_id INT,
    dateOfPayment DATE,
    description VARCHAR(45),
    totalAmount FLOAT,
    semester VARCHAR(45),
    year YEAR,
    amountPaid FLOAT,
    FOREIGN KEY (student_id) REFERENCES student(id)
);

CREATE TABLE books_has_authors (
    book_id INT,
    author_id INT,
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE author (
    id INT PRIMARY KEY,
    firstname VARCHAR(45),
    lastname VARCHAR(45),
    details VARCHAR(45)
);


CREATE TABLE instructor_has_books (
    instructor_id INT,
    book_id INT,
    FOREIGN KEY (instructor_id) REFERENCES instructor(id),
    FOREIGN KEY (book_id) REFERENCES book(id)
);


CREATE TABLE student_academicRecord (
    student_id INT,
    pastMajor VARCHAR(45),
    greScore INT,
    pastGPA FLOAT,
    currentGPA FLOAT,
    workExperience VARCHAR(45),
    FOREIGN KEY (student_id) REFERENCES student(id)
);





CREATE TABLE Student (
    studentID INT PRIMARY KEY ,
    firstName VARCHAR(255),
    middleName VARCHAR(255),
    lastName VARCHAR(255),
    ssn VARCHAR(9),
    dob DATE,
    currentAddress VARCHAR(255),
    currentPhoneNo VARCHAR(15),
    email VARCHAR(255),
    sex ENUM('Male', 'Female', 'Other'),
    departmentID INT,
    guardianID INT,
    majorID INT,
    minorID INT,
    FOREIGN KEY (departmentID) REFERENCES Department(departmentID),
    FOREIGN KEY (guardianID) REFERENCES Guardian(guardianID),
    FOREIGN KEY (majorID) REFERENCES MajorDepartment(majorID),
    FOREIGN KEY (minorID) REFERENCES MinorDepartment(minorID)
);

CREATE TABLE Guardian (
    guardianID INT PRIMARY KEY,
    firstName VARCHAR(255),
    middleName VARCHAR(255),
    lastName VARCHAR(255),
    address VARCHAR(255),
    contactNo VARCHAR(15)
);


CREATE TABLE Department (
    departmentID INT PRIMARY KEY ,
    departmentName VARCHAR(255),
    description VARCHAR(255),
    budget DECIMAL(15, 2),
    officeNo VARCHAR(50)
);
CREATE TABLE MajorDepartment (
    majorID INT PRIMARY KEY ,
    departmentName VARCHAR(255),
    description VARCHAR(255)
);
CREATE TABLE MinorDepartment (
    minorID INT PRIMARY KEY ,
    departmentName VARCHAR(255),
    description VARCHAR(255)
);


CREATE TABLE Student_registers_courses (
    studentID INT,
    courseID INT,
    registrationDate DATE,
    PRIMARY KEY (studentID, courseID),
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (courseID) REFERENCES Course(courseID)
);
CREATE TABLE Course (
    courseID INT PRIMARY KEY,
    courseName VARCHAR(255),
    credits INT,
    hours INT,
    description VARCHAR(255),
    departmentID INT,
    FOREIGN KEY (departmentID) REFERENCES Department(departmentID)
);
CREATE TABLE Instructor (
    instructorID INT PRIMARY KEY ,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE Section (
    sectionID INT PRIMARY KEY,
    courseID INT,
    sectionName VARCHAR(255),
    instructorID INT,
    FOREIGN KEY (courseID) REFERENCES Course(courseID)
);

CREATE TABLE Assignment (
    assignmentID INT PRIMARY KEY ,
    sectionID INT,
    description VARCHAR(255),
    deadlineDate DATE,
    deadlineTime TIME,
    possiblePoints INT,
    FOREIGN KEY (sectionID) REFERENCES Section(sectionID)
);
CREATE TABLE Student_submit_assignment (
    assignmentID INT,
    studentID INT,
    evaluationDate DATE,
    pointsObtained INT,
    writtenEvaluation TEXT,
    submissionDate DATE,
    submissionTime TIME,
    PRIMARY KEY (assignmentID, studentID),
    FOREIGN KEY (assignmentID) REFERENCES Assignment(assignmentID),
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
);
CREATE TABLE GradeReport (
    reportID INT PRIMARY KEY ,
    studentID INT,
    courseID INT,
    attempt TINYINT,
    letterGrade ENUM('A', 'B', 'C', 'D', 'F'),
    numericGrade FLOAT,
    semester VARCHAR(50),
    year YEAR,
    FOREIGN KEY (studentID) REFERENCES Student(studentID),
    FOREIGN KEY (courseID) REFERENCES Course(courseID)
);


