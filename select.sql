# 1.查询同时存在1课程和2课程的情况
select *
from student_course sc1,student_course sc2
where sc1.courseId=1 and sc1.studentId=sc2.studentId and sc2.courseId=2;
# 2.查询同时存在1课程和2课程的情况
select *
from student_course sc1,student_course sc2
where sc1.courseId=1 and sc1.studentId=sc2.studentId and sc2.courseId=2;
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select s.name,avg(score)
from student_course sc,student s
where sc.studentId=s.id
group by s.id
having avg(score)>=60;
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select *
from student 
where id not in(select distinct studentId from student_course);
# 5.查询所有有成绩的SQL
select id,name,courseId,score
from student,student_course
where id  in(select distinct studentId from student_course) and id=studentId;
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select *
from student 
where id in(select sc1.studentId
from student_course sc1,student_course sc2 
where sc1.studentId=sc2.studentId and sc1.courseId=1 and sc2.courseId=2);
# 7.检索1课程分数小于60，按分数降序排列的学生信息
select s.id,s.name,sc.score
from student_course sc,student s
where s.id=sc.studentId and sc.courseId=1 and sc.score<60
order by sc.score desc;
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select courseId,avg(score)
from student_course 
group by courseId
order by avg(score) desc,courseId asc;
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select s.name,sc.score
from student s,student_course sc,course c
where c.name='数学' and sc.courseId=c.id and s.id=sc.studentId and sc.score<60;