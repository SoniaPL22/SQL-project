-- Build a database with the following tables: Students, Courses, Professors, Grades
-- Foreign key relationships between the tables

CREATE SCHEMA `sql_devcamp_project` ;

CREATE TABLE `sql_devcamp_project`.`students` (
  `students_id` INT NOT NULL AUTO_INCREMENT,
  `students_name` VARCHAR(45) NOT NULL,
  `students_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`students_id`),
  UNIQUE INDEX `students_id_UNIQUE` (`students_id` ASC) VISIBLE,
  UNIQUE INDEX `students_email_UNIQUE` (`students_email` ASC) VISIBLE);


CREATE TABLE `sql_devcamp_project`.`courses` (
  `courses_id` INT NOT NULL AUTO_INCREMENT,
  `courses_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`courses_id`),
  UNIQUE INDEX `courses_id_UNIQUE` (`courses_id` ASC) VISIBLE,
  UNIQUE INDEX `courses_name_UNIQUE` (`courses_name` ASC) VISIBLE);

CREATE TABLE `sql_devcamp_project`.`registration` (
  `registration_id` INT NOT NULL AUTO_INCREMENT,
  `student_student_id` INT NULL,
  `course_course_id` INT NULL,
  INDEX `student_student_id_idx` (`student_student_id` ASC) VISIBLE,
  INDEX `course_course_id_idx` (`course_course_id` ASC) VISIBLE,
  PRIMARY KEY (`registration_id`),
  UNIQUE INDEX `registration_id_UNIQUE` (`registration_id` ASC) VISIBLE,
  CONSTRAINT `student_student_id`
    FOREIGN KEY (`student_student_id`)
    REFERENCES `sql_devcamp_project`.`students` (`students_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `course_course_id`
    FOREIGN KEY (`course_course_id`)
    REFERENCES `sql_devcamp_project`.`courses` (`courses_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);


CREATE TABLE `sql_devcamp_project`.`professors` (
  `professors_id` INT NOT NULL AUTO_INCREMENT,
  `professors_name` VARCHAR(45) NOT NULL,
  `professors_courses_id` INT NULL,
  PRIMARY KEY (`professors_id`),
  UNIQUE INDEX `professors_id_UNIQUE` (`professors_id` ASC) VISIBLE,
  INDEX `professors_courses_id_idx` (`professors_courses_id` ASC) VISIBLE,
  CONSTRAINT `professors_courses_id`
    FOREIGN KEY (`professors_courses_id`)
    REFERENCES `sql_devcamp_project`.`courses` (`courses_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);


CREATE TABLE `sql_devcamp_project`.`grades` (
  `grades_id` INT NOT NULL AUTO_INCREMENT,
  `grades_score` INT NOT NULL,
  `grades_students_id` INT NULL,
  `grades_courses_id` INT NULL,
  PRIMARY KEY (`grades_id`),
  UNIQUE INDEX `grades_id_UNIQUE` (`grades_id` ASC) VISIBLE,
  INDEX `grades_students_id_idx` (`grades_students_id` ASC) VISIBLE,
  INDEX `grades_courses_id_idx` (`grades_courses_id` ASC) VISIBLE,
  CONSTRAINT `grades_students_id`
    FOREIGN KEY (`grades_students_id`)
    REFERENCES `sql_devcamp_project`.`students` (`students_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `grades_courses_id`
    FOREIGN KEY (`grades_courses_id`)
    REFERENCES `sql_devcamp_project`.`courses` (`courses_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);


ALTER TABLE `sql_devcamp_project`.`grades` 
DROP FOREIGN KEY `grades_students_id`,
DROP FOREIGN KEY `grades_courses_id`;
ALTER TABLE `sql_devcamp_project`.`grades` 
DROP COLUMN `grades_courses_id`,
DROP COLUMN `grades_students_id`,
ADD COLUMN `grades_registration_id` INT NULL AFTER `grades_score`,
ADD INDEX `grades_registration_id_idx` (`grades_registration_id` ASC) VISIBLE,
DROP INDEX `grades_courses_id_idx` ,
DROP INDEX `grades_students_id_idx` ;
;
ALTER TABLE `sql_devcamp_project`.`grades` 
ADD CONSTRAINT `grades_registration_id`
  FOREIGN KEY (`grades_registration_id`)
  REFERENCES `sql_devcamp_project`.`registration` (`registration_id`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;


-- Create a script that populates all of the database tables with sample data


USE sql_devcamp_project;

INSERT INTO students (students_name, students_email)
VALUES ("Sonia", "sonia@gmail.com");

INSERT INTO students (students_name, students_email)
VALUES ("Juan", "juan@gmail.com");

INSERT INTO students (students_name, students_email)
VALUES ("Pablo", "pablo@gmail.com");

INSERT INTO students (students_name, students_email)
VALUES ("Jonh", "jonh@gmail.com");

INSERT INTO students (students_name, students_email)
VALUES ("Barbara", "barbara@gmail.com");

INSERT INTO students (students_name, students_email)
VALUES ("Veronica", "veronica@gmail.com");

INSERT INTO students (students_name, students_email)
VALUES ("Paul", "paul@gmail.com");

INSERT INTO students (students_name, students_email)
VALUES ("Jean", "jean@gmail.com");

INSERT INTO students (students_name, students_email)
VALUES ("Mark", "mark@gmail.com");

INSERT INTO students (students_name, students_email)
VALUES ("Mike", "mike@gmail.com");

SELECT *
FROM students;


USE sql_devcamp_project;

INSERT INTO courses (courses_name)
VALUES ("Maths");

INSERT INTO courses (courses_name)
VALUES ("Science");

INSERT INTO courses (courses_name)
VALUES ("English");

INSERT INTO courses (courses_name)
VALUES ("Spanish");

INSERT INTO courses (courses_name)
VALUES ("French");

INSERT INTO courses (courses_name)
VALUES ("Arts");

INSERT INTO courses (courses_name)
VALUES ("History");

SELECT *
FROM courses;


USE sql_devcamp_project;

INSERT INTO registration (student_student_id, course_course_id)
VALUES (1, 1);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (1, 2);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (1, 4);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (1, 6);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (2, 1);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (2, 4);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (2, 5);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (2, 7);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (3, 3);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (3, 4);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (3, 6);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (3, 7);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (4, 2);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (4, 3);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (4, 5);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (4, 7);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (5, 1);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (5, 2);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (5, 5);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (5, 7);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (6, 1);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (6, 3);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (6, 5);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (6, 7);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (7, 2);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (7, 4);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (7, 6);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (8, 2);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (8, 3);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (8, 4);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (8, 5);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (9, 1);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (9, 2);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (9, 3);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (9, 4);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (10, 4);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (10, 5);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (10, 6);

INSERT INTO registration (student_student_id, course_course_id)
VALUES (10, 7);

SELECT *
FROM registration;



USE sql_devcamp_project;

INSERT INTO professors (professors_name, professors_courses_id)
VALUES ("Rene", 1);

INSERT INTO professors (professors_name, professors_courses_id)
VALUES ("Marco", 2);

INSERT INTO professors (professors_name, professors_courses_id)
VALUES ("Lucius", 3);

INSERT INTO professors (professors_name, professors_courses_id)
VALUES ("Marta", 4);

INSERT INTO professors (professors_name, professors_courses_id)
VALUES ("Francesca", 5);

INSERT INTO professors (professors_name, professors_courses_id)
VALUES ("Killian", 6);

INSERT INTO professors (professors_name, professors_courses_id)
VALUES ("Michael", 7);

SELECT *
FROM professors;



USE sql_devcamp_project;

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (8, 1);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (9, 2);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (4, 3);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (2, 4);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (7, 5);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (6, 6);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (5, 7);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (9, 8);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (10, 9);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (1, 10);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (4, 11);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (8, 12);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (3, 13);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (5, 14);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (5, 15);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (7, 16);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (10, 17);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (9, 18);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (3, 19);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (8, 20);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (7, 21);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (3, 22);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (5, 23);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (7, 24);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (5, 25);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (6, 26);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (1, 27);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (2, 28);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (7, 29);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (8, 30);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (2, 31);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (9, 32);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (5, 33);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (7, 34);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (1, 35);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (4, 36);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (4, 37);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (8, 38);

INSERT INTO grades (grades_score, grades_registration_id)
VALUES (7, 39);

SELECT *
FROM grades;