
use IMDB;

create table Movies(
Movie_id int primary key auto_increment,
Movie_name varchar(250) not null,
Release_date date,
Review text
);

insert into movies(Movie_name,Release_date,Review) values
('Nayakan','1982-10-21','Crime drama'),
('Coolie','2025-08-14','Action thriller'),
('3BHK','2025-07-04','Family drama');


create table Moviemedia(
Media_id int primary key auto_increment,
Movie_id int not null,
Media_type  enum('image','video') not null,
Media_url varchar(250) not null,
foreign key (Movie_id) References Movies(Movie_id) on delete cascade
);

insert into Moviemedia(Movie_id, Media_type, Media_url) values
(2,'image', 'https://movie.com/latest.jpg'),
(1,'video','https://movie.com/latestmovie.mp4'),
(1,'image','https://movie.com/image.jpg');
 

create table Genres(
genres_id int primary key auto_increment,
category_type varchar(50) unique not null
);

insert into Genres(category_type) values
('Family Drama'),
('Thriller'),
('Action');

create table Movie_genres(
Movie_id  int not null,
genres_id int not null,
primary key (Movie_id,genres_id),
foreign key (Movie_id) references Movies(Movie_id) on delete cascade,
foreign key (genres_id) references Genres(genres_id) on delete cascade
);

insert into Movie_genres(Movie_id,genres_id) values
(1,1),
(1,2),
(2,1);

create table User(
User_id int primary key auto_increment,
User_name varchar(50) unique not null,
User_mail_id varchar(100) unique not null,
User_phone_no varchar(20)
);

insert into User(User_name,User_mail_id,User_phone_no) values
('Raj','raj@gmail.com','8765348755'),
('Varun','varun@gmail.com','9476542388'),
('Priya','priya@gmail.com','8476349855');

create table Reviews(
Review_id int primary key auto_increment,
Movie_id int not null,
User_id int not null,
Rating tinyint check (Rating >= 0 and Rating <= 10),
Review_Comment text,
Review_date datetime default current_timestamp,
foreign key (Movie_id) references Movies(Movie_id) on delete cascade,
foreign key (User_id) references User(User_id) on delete cascade
);

insert into Reviews(Movie_id,User_id,Rating,Review_Comment) values
(2,1,9.5,'Action movie super entertaining'),
(1,2,8.0,'Thriller movie with lots of suspenses'),
(1,1,7.5,'Family drama very emotional');

create table Artist(
Artist_id int primary key auto_increment,
Artist_name varchar(50) unique not null,
Artist_details text
);

insert into Artist(Artist_name,Artist_details) values
('Kamal','Known for his acting skills'),
('Rajini','Stylish performer'),
('Siddharth','Good acting skills');

create table Skill(
Skill_id int primary key auto_increment,
Skill_name varchar(100) unique not null
);

insert into Skill (Skill_name) values
('Acting'),
('Directing'),
('Producing');

create table ArtistSkills(
Artist_id int not null,
Skill_id int not null,
primary key(Artist_id,Skill_id),
foreign key (Artist_id) references Artist(Artist_id) on delete cascade,
foreign key (Skill_id) references Skill(Skill_id) on delete cascade
);

insert into ArtistSkills(Artist_id,Skill_id) values
(1,1),
(1,2),
(2,1);

create table Roles(
Role_id int primary key auto_increment,
Role_name varchar(100) unique not null
);

insert into Roles(Role_name) values
('Actor'),
('Director'),
('Producer');

create table MultipleRole(
Movie_id int not null,
Artist_id int not null,
Role_id int not null,
Character_name varchar(250),
primary key(Movie_id, Artist_id, Role_id),
foreign key (Movie_id) references Movies(Movie_id) on delete cascade,
foreign key (Artist_id) references Artist(Artist_id) on delete cascade,
foreign key (Role_id) references Roles(Role_id) on delete cascade
);

insert into MultipleRole(Movie_id, Artist_id, Role_id, Character_name) values
(1,1,1,'Velu naiker'),
(2,2,1,'Deva');

select * from MultipleRole; 