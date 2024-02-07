CREATE DATABASE mcqtest;

USE mcqtest;


-- Users Table
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('student', 'teacher') NOT NULL
) AUTO_INCREMENT = 1000;

-- Departments Table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL UNIQUE,
    hod_name VARCHAR(255) NOT NULL
);

-- Teachers Table
CREATE TABLE Teachers (
    user_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Students Table
CREATE TABLE Students (
    user_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Courses Table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(user_id)
);

-- Questions Table
CREATE TABLE Questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    question_text VARCHAR(1000) NOT NULL,
    option_a VARCHAR(255) NOT NULL,
    option_b VARCHAR(255) NOT NULL,
    option_c VARCHAR(255) NOT NULL,
    option_d VARCHAR(255) NOT NULL,
    correct_answer ENUM('A', 'B', 'C', 'D') NOT NULL,
    difficulty ENUM('easy', 'medium', 'hard') NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Tests Table
CREATE TABLE Tests (
    test_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    test_name VARCHAR(255) NOT NULL,
    start_time DATETIME,
    end_time DATETIME,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Test Questions (Mapping Table)
CREATE TABLE Test_Questions (
    test_id INT,
    question_id INT,
    PRIMARY KEY (test_id, question_id),
    FOREIGN KEY (test_id) REFERENCES Tests(test_id),
    FOREIGN KEY (question_id) REFERENCES Questions(question_id)
);

-- Results Table
CREATE TABLE Results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    test_id INT,
    student_id INT,
    score INT,
    FOREIGN KEY (test_id) REFERENCES Tests(test_id),
    FOREIGN KEY (student_id) REFERENCES Students(user_id)
);

-- Student Courses Enrollment (Mapping Table)
CREATE TABLE Student_Courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(user_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
