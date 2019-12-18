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

###### 3. Select all tests for the course (id 7):
```sql
SELECT test_id, topic_title FROM tests
WHERE course_id = 7
```

test_id | topic_title
|---|---|
7 |	Spring MVC essentials
8 |	Web architecture
9 |	DropWizard

###### 4. Select all not completed tests for the student (id 8):
```sql
SELECT tests.test_id, topic_title FROM tests
INNER JOIN studentstests
ON tests.test_id = studentstests.test_id
WHERE student_id = 8
AND completed_date IS NULL
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

##### 5. Select all questions for the test (id 2)
```sql
SELECT question_id, content, question_type FROM questions WHERE test_id = 2
```

question_id | content | question_type
|---|---|---|
2 |	What SQL stands for? |	OPEN
3 |	What CRUD stands for? |	OPEN
13 |	INSERT command belongs to |	TEST
14 |	Connect commands of one type |	CONNECT

##### 6. Select all answers for the test question (id 13)
```sql
SELECT answer_id, answer_content, is_right FROM answers WHERE question_id = 13
```
answer_id | answer_content | is_right
|---|---|---|
78 |	DDL |	0
79 |	DML |	1
80 |	DCL |	0
81 |	DQL |	0


##### 7. Select all answers for the connection type question (id 14)
```sql
SELECT answer_id, answer_content, is_right FROM answers WHERE question_id = 14
```
answer_id | answer_content | is_right
|---|---|---|
78 |	DDL |	0
79 |	DML |	1
80 |	DCL |	0
81 |	DQL |	0
