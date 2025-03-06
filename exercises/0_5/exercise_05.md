# 5. University management system

## A university needs a system to manage students, courses, and professors.

## each student can enroll in multiple courses.

## each course is taught by one professor.

## a teacher can teach multiple courses.

### a. Identify entities and their relationships

### b. Come up with possible attributes for the entities

### c. Draw conceptual ERD with cardinalities

### d. Define business rules (e.g. a student can enroll in max 4 courses)

Studenttabell
| student_id | name |courses|
| ---------- | -------------- |
| 1 | Anna Andersson |3|
| 2 | Kalle Karlsson |2|
| 3 | Siri Sirisson |4|

Kurstabell
| course_id | course_name | course_professor |
| --------- | --------------- | ------------------ |
| 1 | Datamodellering | Karin Kristiansson |
| 2 | SQL | Fredrik Eriksson |
| 3 | Programmering 1 | Sandra Sanders |
| 4 | Dataplatformar | Karin Kristiansson |

Professor tabell
| professor_id | professor_name |
| ------------ | ------------------ |
| 1 | Karin Kristiansson |
| 2 | Fredrik Eriksson |
| 3 | Sandra Sanders |

## Conceptual ERD with cardinalities

<img src = "../../assets/exercise_o5.png" width=400>
