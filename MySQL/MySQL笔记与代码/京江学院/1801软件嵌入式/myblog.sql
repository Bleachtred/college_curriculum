/* 账号 */
create table `account`(
`category_id` int auto_increment,
`username` varchar(20) not null,
`password` varchar(20) not null,
`email` varchar(50) default null,
`gender` char not null,
`title` varchar(20) not null,
primary key(`category_id`),
unique(`username`)
)engine=InnoDB auto_increment=10001 default charset=utf8;
/* 新增列 */
alter table account add nickname varchar(20) default null;
alter table account add headimg varchar(20) default null;
/* 文章类别 */
create table `category`(
`category_id` int not null auto_increment,
`account_id` int not null,
`title` varchar(20) not null,
`description` varchar(100) default '暂无描述',
`articleNum` int default 0,
`visible` varchar(10) not null,
`createdTime` date not null,
primary key(`category_id`),
unique(`account_id`)
)engine=InnoDB auto_increment=10001 default charset=utf8;
/* 插入数据测试 */
insert category(account_id,title,visible,createdTime) values(10002,'我的博客','可访问','2019-09-03');
/* 修改数据 */
update category set account_id=10022 where category_id=10001;
/* 删除数据 */
delete from category where category_id=10001;













