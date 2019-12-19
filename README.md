# Knowledge Testing System Database

### ER diagram looks as follows:

![alt text](./db.png "ER diagram")


### Examples of SQL queries:
###### 1. Select all students enrolled to the course (id 7):
```sql
SELECT students.student_id, name, surname FROM students
JOIN studentscourses 
ON students.student_id = studentscourses.student_id
WHERE course_id = 7
``` 

student_id | name | surname
|---|---|---|
4 |	Martin |	Fowler
5 |	Mary |	Williams
6 |	Kate |	Devis
7 |	Ann |	Anderson
11 |	Alice |	Liddell
12 |	Dale |	Smith


###### 2. Select all courses to which particular student (id 8) is enrolled:
```sql
SELECT courses.course_id, name FROM courses 
JOIN studentscourses
ON courses.course_id = studentscourses.course_id
WHERE studentscourses.student_id = 8
```

course_id | name
|---|---|
5 |	DB basics
8 |	Advanced Java for web
6 |	Java advanced

###### 3. Select all students that should pass particular test (id 3)
```sql
SELECT students.student_id, name, surname FROM students
JOIN studentstests 
ON students.student_id = studentstests.student_id
WHERE test_id = 3
```

student_id | name | surname
|---|---|---|
3 | John | Brain
2 | Ed | Miller
8 | Antony | Joshua



###### 4. Select all tests for the course (id 7):
```sql
SELECT test_id, topic_title FROM tests
WHERE course_id = 7
```

test_id | topic_title
|---|---|
7 |	Spring MVC essentials
8 |	Web architecture
9 |	DropWizard


###### 5. Select all not completed tests for the student (id 8):
```sql
SELECT tests.test_id, topic_title FROM tests
JOIN studentstests
ON tests.test_id = studentstests.test_id
WHERE student_id = 8
AND (SELECT COUNT(*) FROM testattempts 
WHERE testattempts.students_test_id = studentstests.students_test_id) = 0
```

test_id | topic_title
|---|---|
1 |	What is db?
2 |	Query language
3 |	Relations
10 |	gRPC, HTTP/2
11 |	Apache Kafka
4 |	Connection to sockets
5 |	Connection to DB
6 |	JMX tools


###### 6. Select all questions for the test (id 2)
```sql
SELECT question_id, content, question_type FROM questions WHERE test_id = 2
```

question_id | content | question_type
|---|---|---|
2 |	What SQL stands for? |	OPEN
3 |	What CRUD stands for? |	OPEN
13 |	INSERT command belongs to |	TEST
14 |	Connect commands of one type |	CONNECT


###### 7. Select all answers for the test question (id 13)
```sql
SELECT answer_id, answer_content, is_right FROM answers WHERE question_id = 13
```
answer_id | answer_content | is_right
|---|---|---|
78 |	DDL |	0
79 |	DML |	1
80 |	DCL |	0
81 |	DQL |	0


###### 8. Select all answers for the connection type question (id 14)
**Left side answers**
```sql
SELECT answer_id, answer_content FROM answers WHERE answer_id IN
(SELECT answer_id FROM connectquestionsanswers WHERE question_id = 14)
```

answer_id | answer_content
|---|---|
82 |	INSERT
84 |	COMMIT
86 |	CREATE

**Right side answers**
```sql
SELECT answer_id, answer_content FROM answers WHERE answer_id IN
(SELECT correct_pair_answer_id FROM connectquestionsanswers WHERE question_id = 14)
```

answer_id | answer_content
|---|---|
83 |	UPDATE
85 |	ROLL BACK
87 |	ALTER


###### 9. Check student's (id 3) answer for open type question (id 2):
```sql
SELECT student_id, studentopenquestionanswers.question_id, answer AS student_answer,
answer_content AS correct_answer
FROM studentopenquestionanswers 
JOIN answers ON studentopenquestionanswers.question_id = answers.question_id
WHERE studentopenquestionanswers.question_id = 2 AND student_id = 3
```

student_id | question_id | student_answer | correct_answer
|---|---|---|---|
3 | 2 |	Structured Query Language |	Structured Query Language


###### 10. Check student's (id 8) answer for test type question (id 13):
**Student answer**
```sql
SELECT student_id, question_id, answer_id AS student_answer FROM studenttestanswers 
WHERE question_id = 13 AND student_id = 8
```

student_id | question_id | answer_id
|---|---|---|
8 |	13 |	81
8 |	13 |	79


**Right answer**
```sql
SELECT question_id, answer_id AS right_answer FROM answers 
WHERE question_id = 13 AND answers.is_right = true
```

question_id | right_answer
|---|---|
13 | 79
13 | 80


<u>This solution is used here, because test type questions is generics (can be one or more than one right answers)</u>


###### 11. Check student's (id 8) answer for connect type question (id 14):
```sql
SELECT student_id, connectquestionsanswers.question_id, connectquestionsanswers.answer_id,
studentconnectquestionsanswers.pair_answer_id AS student_pair_choice,
connectquestionsanswers.correct_pair_answer_id AS correct_pair 
FROM connectquestionsanswers
JOIN studentconnectquestionsanswers
ON studentconnectquestionsanswers.answer_id = connectquestionsanswers.answer_id
WHERE connectquestionsanswers.question_id = 14 AND student_id = 8
```

student_id | question_id | answer_id | student_pair_choice |correct_pair_answer_id
|---|---|---|---|---|
8 | 14 | 82 |	83 |	83
8 | 14 | 84 |	87 |	85
8 | 14 | 86 |	85 |	87


###### 12. Check student's (id 1) answer for true-false type question (id 9):
```sql
SELECT student_id, studenttruefalseanswers.question_id,
CASE WHEN studenttruefalseanswers.answer = 1 THEN 
    "TRUE" 
ELSE 
    "FALSE"
END AS student_answer, 
answers.answer_content AS correct_answer FROM studenttruefalseanswers 
JOIN answers ON studenttruefalseanswers.question_id = answers.question_id
WHERE studenttruefalseanswers.question_id = 9 AND student_id = 1
```


student_id | question_id | student_answer | correct_answer
|---|---|---|---|
1 | 9 |	TRUE |	TRUE


###### 13. Check student's (id 1) answer for true-false type question (id 9) - multiple student answers:
```sql
SELECT student_id, studenttruefalseanswers.question_id,
CASE WHEN studenttruefalseanswers.answer = 1 THEN 
    "TRUE" 
ELSE 
    "FALSE"
END AS student_answer, 
answers.answer_content AS correct_answer, submitted_time FROM studenttruefalseanswers 
JOIN answers ON studenttruefalseanswers.question_id = answers.question_id
WHERE studenttruefalseanswers.question_id = 10 AND student_id = 5
ORDER BY submitted_time ASC
```
student_id | question_id | student_answer | correct_answer | submitted_time
|---|---|---|---|---|
5 |	10 |	FALSE |	TRUE |	2019-12-18 16:28:54.000000
5 |	10 |	TRUE |	TRUE |	2019-12-19 16:27:51.000000
5 |	10 |	FALSE |	TRUE |	2019-12-20 16:28:43.000000

###### 14. Get number of attempts used by some student (id 8) for the test (id 2):
```sql
SELECT student_id, test_id, COUNT(*) AS number_of_attempts FROM testattempts
JOIN studentstests 
ON testattempts.students_test_id = studentstests.students_test_id
WHERE student_id = 8 AND test_id = 2
```

student_id | test_id | number_of_attempts
|---|---|---|
8 | 2 | 1


### Triggers
**DB contains two triggers to synchronize tables StudentsCourses and StudentsTests**

#### After insert
```sql
DELIMITER ;;
 CREATE TRIGGER `StudentsCourses_AFTER_INSERT` AFTER INSERT ON `studentscourses` FOR EACH ROW BEGIN
	INSERT INTO StudentsTests(student_id, test_id) (SELECT NEW.student_id, test_id FROM Tests WHERE course_id = NEW.course_id);
END ;;
DELIMITER ;
```

#### After delete
```sql
DELIMITER ;;
CREATE TRIGGER `StudentsCourses_AFTER_DELETE` AFTER DELETE ON `studentscourses` FOR EACH ROW BEGIN
	DELETE FROM StudentsTests WHERE test_id IN (SELECT test_id FROM Tests AS t WHERE t.course_id = OLD.course_id);
END ;;
DELIMITER ;
```

#### List triggers
```sql
SHOW TRIGGERS
```
Trigger | Event | Table | Statement | Timing | Created | sql_mode | Definer | character_set_client | collation_connection | Database Collation
|---|---|---|---|---|---|---|---|---|---|---|
'StudentsCourses_AFTER_INSERT | INSERT | studentscourses | BEGIN <br/>	INSERT INTO StudentsTests(student_id, test_id) (SELECT NEW.student_id, test_id FROM Tests WHERE course_id = NEW.course_id);<br/>END | AFTER | 2019-12-19 11:40:01.80 | STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION | root@localhost | utf8mb4 | utf8mb4_0900_ai_ci | utf8mb4_0900_ai_ci'
'StudentsCourses_AFTER_DELETE | DELETE | studentscourses | BEGIN <br/>	DELETE FROM StudentsTests WHERE test_id IN (SELECT test_id FROM Tests AS t WHERE t.course_id = OLD.course_id);<br/>END | AFTER | 2019-12-19 11:40:01.82 | STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION | root@localhost | utf8mb4 | utf8mb4_0900_ai_ci | utf8mb4_0900_ai_ci'




