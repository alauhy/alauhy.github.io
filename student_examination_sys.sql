CREATE TABLE student (
  id varchar(10) NOT NULL,
  name varchar(6) NOT NULL,
  age int(11) NOT NULL,
  sex enum('女','男') NOT NULL DEFAULT '男',
  PRIMARY KEY (`id`)
);

INSERT INTO student VALUES ('001', '张三', '18', '男');
INSERT INTO student VALUES ('002', '李四', '20', '女');


CREATE TABLE subject (
  id varchar(10) NOT NULL,
  subject varchar(8) NOT NULL,
  teacher varchar(8) NOT NULL,
  description varchar(30) DEFAULT NULL,
  PRIMARY KEY (id)
) ;

INSERT INTO subject VALUES ('1001', '语文', '王老师', '本次考试比较简单');
INSERT INTO subject VALUES ('1002', '数学', '刘老师', '本次考试比较难');


CREATE TABLE score (
  id varchar(10) NOT NULL,
  student_id varchar(10) NOT NULL,
  subject_id varchar(10) NOT NULL,
  score double NOT NULL,
  PRIMARY KEY (id),
  KEY score_std (student_id),
  KEY score_sub (subject_id),
  CONSTRAINT score_std FOREIGN KEY (student_id) REFERENCES `student` (`id`),
  CONSTRAINT score_sub FOREIGN KEY (subject_id) REFERENCES `subject` (`id`)
) ;

INSERT INTO score VALUES ('1', '001', '1001', '80');
INSERT INTO score VALUES ('2', '002', '1002', '60');
INSERT INTO score VALUES ('3', '001', '1001', '70');
INSERT INTO score VALUES ('4', '002', '1002', '60.5');