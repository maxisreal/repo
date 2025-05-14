CREATE VIEW getclasses AS SELECT classes.id AS class, rooms.name AS room, courses.name FROM classes INNER JOIN courses ON classes.course_id=courses.id INNER JOIN rooms ON classes.room_id=rooms.id;
CREATE VIEW getoverview AS SELECT getclasses.class, getclasses.room, getclasses.name, CONCAT_WS('',teachers.first_name, " ", teachers.last_name) AS teacher FROM getclasses INNER JOIN teachers on getclasses.class=teachers.schedule_id;

CREATE VIEW student_schedules AS
SELECT students.id,pd1,pd2,pd3,pd4,pd5,pd6,pd7,pd8,pd9,pd10 FROM schedules INNER JOIN students ON students.schedule_id=schedules.id;

CREATE VIEW teacher_schedules AS
SELECT teachers.id,pd1,pd2,pd3,pd4,pd5,pd6,pd7,pd8,pd9,pd10 FROM schedules INNER JOIN teachers ON teachers.schedule_id=schedules.id;

CREATE VIEW class_w_teachers AS
SELECT classes.id,room_id,course_id,first_name,last_name FROM classes INNER JOIN teacher_schedules ON
teacher_schedules.pd1=classes.id OR
teacher_schedules.pd2=classes.id OR
teacher_schedules.pd3=classes.id OR
teacher_schedules.pd4=classes.id OR
teacher_schedules.pd5=classes.id OR
teacher_schedules.pd6=classes.id OR
teacher_schedules.pd7=classes.id OR
teacher_schedules.pd8=classes.id OR
teacher_schedules.pd9=classes.id OR
teacher_schedules.pd10=classes.id
INNER JOIN teachers ON teacher_schedules.id=teachers.id;

CREATE VIEW class_courses AS
SELECT class_w_teachers.id,courses.name,rooms.name AS room_name,first_name,last_name FROM class_w_teachers INNER JOIN courses ON class_w_teachers.course_id=courses.id INNER JOIN rooms ON rooms.id=class_w_teachers.room_id;

CREATE PROCEDURE getSchedule(ID integer)
	WITH sched AS (SELECT pd1,pd2,pd3,pd4,pd5,pd6,pd7,pd8,pd9,pd10 FROM student_schedules WHERE student_schedules.id=ID)
	SELECT name,room_name,first_name,last_name FROM class_courses INNER JOIN sched ON class_courses.id=sched.pd1
	UNION
	SELECT name,room_name,first_name,last_name FROM class_courses INNER JOIN sched ON class_courses.id=sched.pd2
	UNION
	SELECT name,room_name,first_name,last_name FROM class_courses INNER JOIN sched ON class_courses.id=sched.pd3
	UNION
	SELECT name,room_name,first_name,last_name FROM class_courses INNER JOIN sched ON class_courses.id=sched.pd4
	UNION
	SELECT name,room_name,first_name,last_name FROM class_courses INNER JOIN sched ON class_courses.id=sched.pd5
	UNION
	SELECT name,room_name,first_name,last_name FROM class_courses INNER JOIN sched ON class_courses.id=sched.pd6
	UNION
	SELECT name,room_name,first_name,last_name FROM class_courses INNER JOIN sched ON class_courses.id=sched.pd7
	UNION
	SELECT name,room_name,first_name,last_name FROM class_courses INNER JOIN sched ON class_courses.id=sched.pd8
	UNION
	SELECT name,room_name,first_name,last_name FROM class_courses INNER JOIN sched ON class_courses.id=sched.pd9
	UNION
	SELECT name,room_name,first_name,last_name FROM class_courses INNER JOIN sched ON class_courses.id=sched.pd10;

