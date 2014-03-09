-- Francys Scott, Cali Stenson, Megan Chen, Clara, Jennie.
-- Rosie Hackathon - March 8 2014
-- SQL for basic database for events.

-- This script only gets run one time!  from this point onwards, the website should update the database.

-- First, specify the database / server that we access.
-- Note:  haven't made this part yet - not yet exists.
use fscott_db;

-- Now clean out any existing table of the same name.
drop table if exists event;
drop table if exists user;
drop table if exists connection;
drop table if exists ride;
drop table if exists studybuddy;

create table event (
  eid int auto_increment not null, 
  name varchar(60),
  event_date date,
  event_time time,
  address varchar(50), 
  photo_id varchar(30),
  description varchar(500),
  primary key(eid) 
);

create table user(
  uid int auto_increment not null primary key, 
  username varchar(20),
  password varchar(20),
  email varchar(30),
  photo_id varchar(30)
);

create table connection(
        uid int, 
-- this is the uid from user table
   	eid int,
-- this is the event id from the event table
	primary key (uid,eid),
	foreign key (uid) references user,
	foreign key (eid) references event
);

create table ride(
  rid int auto_increment not null primary key;
  
);
-- Now this works


-- test with example user

insert into user values(null,'tester', 'testpassword', 'mchen4', '600499299992114');

-- test with an example item:
insert into event values (1468722776673580, 'Rosie Hackathon @ Wellesley: Collaborate for change, build stuff, have fun!', '2014-03-08', '11:00:00-18:00:00','21 Wellesley College Road','10100672860583886', 'Hey Wellesley! Want to learn new skills and show off your programming chops? Come to the Rosie Hackathon @ Wellesley!');

-- test with example connection:  classic insert.
insert into connection values(1, 1468722776673580);

-- testing to see if this all worked.
-- select (username, email) from (user) where email = 'mchen4';
-- select (username, email, name) from (user, event) where uid in (select uid from connection where eid="1468722776673580");