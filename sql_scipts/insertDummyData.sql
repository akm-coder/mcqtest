-- Users
INSERT INTO Users (username, password, role) VALUES 
('teacher1', 'pass123', 'teacher'),
('student1', 'pass123', 'student'),
('student2', 'pass123', 'student');

-- Departments
INSERT INTO Departments (department_name, hod_name) VALUES 
('Computer Science', 'Dr. Smith'),
('Mathematics', 'Dr. Johnson');

-- Assuming `user_id` for `teacher1` is `1001`
INSERT INTO Teachers (user_id, name, department_id) VALUES 
(1001, 'John Doe', 1);

-- Assuming `user_id` for `student1` and `student2` are `1002` and `1003`
INSERT INTO Students (user_id, name, age, department_id) VALUES 
(1002, 'Jane Doe', 20, 1),
(1003, 'Mike Ross', 22, 1);

-- Assuming `teacher_id` for John Doe is `1001`
INSERT INTO Courses (course_name, teacher_id) VALUES 
('Introduction to Programming', 1001),
('Data Structures', 1001);

-- Assuming `course_id` for "Introduction to Programming" is `1`
INSERT INTO Questions (course_id, question_text, option_a, option_b, option_c, option_d, correct_answer, difficulty) VALUES 
(1, 'What does HTML stand for?', 'Hyper Text Markup Language', 'Home Tool Markup Language', 'Hyperlinks and Text Markup Language', 'None of the above', 'A', 'easy'),
(1, 'Which data structure uses LIFO?', 'Queue', 'Stack', 'Array', 'LinkedList', 'B', 'medium');

-- Assuming `course_id` for "Introduction to Programming" is `1`
INSERT INTO Tests (course_id, test_name, start_time, end_time) VALUES 
(1, 'HTML Basics', '2024-02-01 10:00:00', '2024-02-01 12:00:00');

-- Test Questions for "HTML Basics" with `test_id` `1`
INSERT INTO Test_Questions (test_id, question_id) VALUES 
(1, 1),
(1, 2);

-- Results for "HTML Basics" test
INSERT INTO Results (test_id, student_id, score) VALUES 
(1, 1002, 90);

-- Student Courses Enrollment
INSERT INTO Student_Courses (student_id, course_id) VALUES 
(1002, 1),
(1003, 1);