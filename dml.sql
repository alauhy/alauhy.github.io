-- 插入记录  
insert into student(id,name,age,sex) values('003','零零三',21,'男');
-- 修改记录  
update student set name='零三' where id='003';
--  删除记录  
delete from student where id='003';
-- 查询记录  
select * from student where age<22;