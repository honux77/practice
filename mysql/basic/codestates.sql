DROP TABLE IF EXISTS enroll;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS teachers;

CREATE TABLE teachers (
	id INT PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(64),
	department CHAR(4)
);
LOAD DATA LOCAL INFILE 'teachers.csv' INTO table teachers 
FIELDS TERMINATED BY ',';

CREATE TABLE classes (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name varchar(64) NOT NULL,
	room char(4) NOT NULL,
	teacher_id INT,
	FOREIGN KEY (teacher_id)
	REFERENCES teachers(id)
);

LOAD DATA LOCAL INFILE 'classes.csv' INTO table classes 
FIELDS TERMINATED BY ',';

CREATE TABLE students (
	name varchar(64) PRIMARY KEY,
	email varchar(64) NOT NULL	
);

LOAD DATA LOCAL INFILE 'students.csv' INTO table students 
FIELDS TERMINATED BY ',';

CREATE TABLE enroll (
	class_id INT,
	student_name varchar(64),
	FOREIGN KEY (class_id)
	REFERENCES classes(id),
	FOREIGN KEY (student_name)
	REFERENCES students(name),
	PRIMARY KEY(class_id, student_name)		
); 

LOAD DATA LOCAL INFILE 'enroll.csv' INTO table enroll 
FIELDS TERMINATED BY ',';
