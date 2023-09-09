-- The average grade that is given by each professor

USE sql_devcamp_project;

SELECT AVG (grades_score) AS "Average score", professors_name AS "Professor"
FROM grades g
JOIN professors p
ON g.grades_registration_id = p.professors_courses_id
GROUP BY professors_name;
