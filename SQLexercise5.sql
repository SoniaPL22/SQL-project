
-- Finding which student and professor have the most courses in common

USE sql_devcamp_project;

SELECT professors_name AS "Professor", courses_name AS "Course", students_name AS "Student"
FROM students s
JOIN registration r
ON s.students_id = r.student_student_id
JOIN courses c
ON r.course_course_id = c.courses_id
JOIN professors p 
ON c.courses_id = p.professors_courses_id
ORDER BY p.professors_name;