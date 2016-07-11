# TO DO:

at this point this document is going to hold my ideas for getting the app up and running.

The basic goal of the app is to keep a database of kids and to allow the teacher to add anecdotal and observational notes to the kids quickly and easily by typing the notes into their phone/ipad/ or computer.

the app is for teachers to _quickly_ jot down notes that they can associate with students in their classroom.  Teachers can then later review the notes, ordered by student/timestamp/context (i.e. reading time/recess etc.).  Teachers should be able to sort/edit notes and then print reports that they can share with administrators or parents.

## models:
- Teacher
  - has many classes
  - has many students through classes
  - has many notes
  - columns:
    - name
    - email
    - password (use devise)
- Student
  - belongs to class
  - has one teacher
  - columns
    - name
    - class_id
- Class
  - belongs to teacher
  - has many students
  - columns
    - name
    - teacher_id
- Note
  - belongs to student
  - columns
    - student_id
    - content
    - context
- Context??
  - not sure if I really need a model for this one...
