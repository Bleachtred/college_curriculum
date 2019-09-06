/* 查看所有的数据库 */
show databases;
/*删除数据库t_test2019*/
drop database t_test2019;
/* 首先创建一个数据库,创建的同时规定字符编码为utf8 */
create database t_test2019 default character set utf8;
/* 查看创建数据库的字符编码  */
show create database t_test2019;
/* 进入到数据库t_test2019中 */
use t_test2019;
/* 查看所有的表 */
show tables;
/* 创建一个用户登录表，有用户名和密码  varchar表示字符串，20表示字符串长度*/
create table t_user(
user_name varchar(20),
user_pwd varchar(20)
);
/* 往t_user中添加一条数据  */
insert t_user(user_name,user_pwd) values('root','root');
/* 查询表t_user */
select * from t_user;

create table t_user (
  user_name varchar(20) not null, /* 不为空 */
  user_pwd varchar(20) default null /* 默认为空 */
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/* 创建表 */
create table `t_stu`(
`id` int not null primary key auto_increment,
`stu_num` varchar(20) not null,
`stu_name` varchar(20) not null,
`age` int not null,
`birth` date not null,
`address` varchar(50) default null 
)engine=InnoDB default charset=utf8; 

insert `t_stu`(id,stu_num,stu_name,age,birth,address) values (1,'20180901','赵强',19,'1999-01-15','镇江');
insert `t_stu` values (2,'20180902','周董',18,'2000-02-15','镇江');


insert `t_stu`(id,stu_num,stu_name,age,birth) values (3,'20180903','李老师',19,'1999-01-15');
/* 以下插入语句报错，缺少列
    原因：如果不写列名称，那么在插入数据时必须要写所有的列对应的值
            如果写了列名称，那么可以根据列名的个数一一对应值
 */
insert `t_stu` values (4,'20180904','胡可',18,'2000-02-15');
/* ERROR 1364 (HY000): Field 'stu_num' doesn't have a default value */
/* 对于不为空的列必须要给值，不然插入数据会报错 */
insert `t_stu`(id) values (5);


insert `t_stu`(stu_num,stu_name,age,birth,address) values ('20180901','赵强',19,'1999-01-15','镇江');
insert `t_stu` values ('20180902','周董',18,'2000-02-15','镇江');


/* auto_increment表示自增长的列，只能用在主键上。可以设置默认增长初始值 */
/* primary key表示主键 */
/* unique表示唯一的 */
create table `t_stu`(
`id` int not null  auto_increment,
`stu_num` varchar(20) not null,
`stu_name` varchar(20) not null,
`age` int not null,
`birth` date not null,
`address` varchar(50) default null,
primary key(`id`),
unique(`stu_num`)
)engine=InnoDB auto_increment=20190903 default charset=utf8; 

/* 新增列phone */
alter table `t_stu` add `phone` varchar(11);
/* 删除列 */
alter table `t_stu` drop  `phone`；
/* 新增列并且设置新增的列唯一 */
 alter table `t_stu` add `phone` varchar(11) unique;
/* 根据编号添加学生手机号 
不能使用insert语句进行插入，原因：insert语句插入是新增行。这里紧紧是修改某一列的值
使用update语句进行更新
update 表名 set 列名1=新值1,列名2=新值2 where 列名=值（表中存在的值）；
*/
update t_stu set phone='17367678172' where id=20190903;
/* 修改多个列的值 */
update t_stu set stu_name='张三',phone='17367678173' where stu_num='20180902';

/* 修改列名称 */
alter table t_stu change phone t_phone varchar(11);

/* 修改表名称 */
alter table t_stu rename stu;



