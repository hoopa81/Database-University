
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