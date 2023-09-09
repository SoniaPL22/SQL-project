-- Sort students by the courses that they are enrolled in

USE sql_devcamp_project;

SELECT students_name AS "Student", courses_name AS "Course"
FROM students s
JOIN registration r
ON s.students_id = r.student_student_id
JOIN courses c
ON c.courses_id = r. course_course_id
ORDER BY courses_name;