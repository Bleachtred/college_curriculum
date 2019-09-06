create table users
(
  userid int primary key,
  username varchar(20)not null,
  passwd varchar(20)not null,
  realname varchar(20)not null,
  email varchar(100) not null
);
create table FirstLevelTitle
(
  tid int primary key,
  title varchar(20) not null,
  creator int ,--references users(userid),
  createTime date
);
create table SecondLevelTitle
(
  tid int primary key,
  title varchar(20) not null,
  filepath varchar(2000) not null,
  parentid int references FirstLevelTitle(tid),
  creator int ,--references users(userid),
  createTime date
);

alter table FirstLevelTitle
add constraint FK_userid
foreign key(creator)references users(userid);

alter table SecondLevelTitle
add constraint FK_second_userid
foreign key(creator)references users(userid);


select * from firstleveltitle;
select * from secondleveltitle;



