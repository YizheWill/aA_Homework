--drop table replies;
--drop table question_likes;
--drop table question_follow;
--drop table questions;
--drop table users;
PRAGMA foreign_keys = ON;

create table users (
  id integer primary key,
  is_instructor boolean default false,
  fname string not null,
  lname string not null
);

insert into users (fname, lname) values ('will', 'wang');
insert into users (fname, lname) values ('aill', 'aang');
insert into users (fname, lname) values ('bill', 'bang');
insert into users (fname, lname) values ('cill', 'cang');
insert into users (fname, lname) values ('dill', 'dang');


create table questions (
  id integer primary key,
  title string not null,
  body string not null,
  author_id integer not null,
  foreign key (author_id) references users(id)
);

insert into questions (title, body, author_id) values ('Hello1', 'World1', 1);
insert into questions (title, body, author_id) values ('Hello2', 'World2', 2);
insert into questions (title, body, author_id) values ('Hello3', 'World3', 3);
insert into questions (title, body, author_id) values ('Hello4', 'World4', 4);

create table question_follows (
  id integer primary key,
  user_id integer not null,
  question_id integer not null,
  foreign key (user_id) references users(id),
  foreign key (question_id) references questions(id)
);

insert into question_follows (user_id, question_id) values (1, 2);
insert into question_follows (user_id, question_id) values (1, 3);
insert into question_follows (user_id, question_id) values (1, 4);
insert into question_follows (user_id, question_id) values (2, 2);


create table replies (
  id integer primary key,
  user_id integer not null,
  parent_reply_id integer,
  body string not null,
  question_id integer not null,
  foreign key (user_id) references users(id),
  foreign key (parent_reply_id) references replies(id),
  foreign key (question_id) references questions(id)
);

insert into replies (user_id, body, question_id) values (1, 'this is wills reply to hello world1', 1);
insert into replies (user_id, body, question_id) values (2, 'this is aills reply to hello world2', 2);
insert into replies (user_id, parent_reply_id, body, question_id) values (3, 1, 'this is bills reply to hello world1 sub reply', 1);


create table question_likes (
  id integer primary key,
  user_id integer not null,
  question_id integer not null,
  foreign key (user_id) references users(id),
  foreign key (question_id) references questions(id)
);


insert into question_likes (user_id, question_id) values (1, 1);
insert into question_likes (user_id, question_id) values (2, 1);
insert into question_likes (user_id, question_id) values (3, 1);
insert into question_likes (user_id, question_id) values (4, 1);
insert into question_likes (user_id, question_id) values (1, 2);

