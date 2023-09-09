-- Create a summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course

USE sql_devcamp_project;

SELECT AVG(grades_score) AS "Average score", courses_name AS "Course"
FROM grades g
JOIN registration r
ON g.grades_registration_id = r.registration_id
JOIN courses c
ON c.courses_id = r.course_course_id
GROUP BY c.courses_name
ORDER BY AVG(grades_score) ASC;