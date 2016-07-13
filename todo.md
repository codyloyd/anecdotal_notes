# TO DO:

The basic goal of the app is to keep a database of kids and to allow the teacher to add anecdotal and observational notes to the kids quickly and easily by typing the notes into their phone/ipad/ or computer.

the app is for teachers to _quickly_ jot down notes that they can associate with students in their classroom.  Teachers can then later review the notes, ordered by student/timestamp/context (i.e. reading time/recess etc.).  Teachers should be able to sort/edit notes and then print reports that they can share with administrators or parents.

## todo:
- add validations for user/studentgroup/student name
- allow editing and deleting notes
- make forms for creating a student_group/students
- add context tag
- figure out the select class then student stuff for creating a note quickly
- add authentication stuff.. so it redirects or fails gracefully for users not logged in.
- create different home page for users not logged in.

## models:
- User
  - has many student_groups
  - has many students through student_groups
  - has many notes
  - columns:
    - name
    - email
    - password (use devise)
- Student
  - belongs to student_group
  - has one teacher
  - columns
    - name
    - student_group_id
- StudentGroup (is a classroom, or a period)
  - belongs to teacher
  - has many students
  - columns
    - name
    - teacher_id
- Student Note
  - belongs to student
  - columns
    - teacher_id
    - student_id
    - content
    - context?? (add later)
- Context??
  - not sure if I really need a model for this one.
