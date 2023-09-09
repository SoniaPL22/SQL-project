-- The top grades for each student

USE sql_devcamp_project;

SELECT MAX(grades_score) AS "Top grade", students_name AS "Student"
FROM grades g
JOIN students s
ON s.students_id = g.grades_registration_id
GROUP BY students_name;