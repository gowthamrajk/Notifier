create database notifier;

use notifier;

create table `users`(
   `id` int(5) not null auto_increment,
   `username` varchar(250) default null,
   `email` varchar(50) default null,
   `mobile` varchar(30) default null,
   `password` varchar(30) default null,
   `confirmPassword` varchar(30) default null,
   primary key (`id`)
);

drop table users;

truncate table users;

select * from users;

create table `notebook`(
   `id` int(5) not null auto_increment,
   `name` varchar(250) default null,
   `status` varchar(50) default null,
   `date` varchar(30) default null,
   primary key (`id`)
);

create table `notes`(
   `id` int(5) not null auto_increment,
   `notename` varchar(250) default null,
   `notebookname` varchar(250) default null,
   `status` varchar(30) default null,
   `startdate` varchar(250) default null,
   `enddate` varchar(250) default null,
   `remainderdate` varchar(250) default null,
   primary key (`id`)
);

select * from notebook;

select * from notes;

drop table notebook;

drop table notes;

truncate table notebook;

truncate table notes;