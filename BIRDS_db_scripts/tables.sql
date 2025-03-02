drop table birds_food; 
drop table birds_nests; 
drop table birds_migration; 
drop table migration; 
drop table nests; 
drop table food; 
drop table photos; 
drop table locations; 
drop table nicknames; 
drop table birds; 
create table birds 
(bird_id decimal(3) not null primary key,
bird_name varchar(30) not null unique,
height decimal(4,2) not null,
weight decimal(4,2) not null,
wingspan decimal(4,2) null,
eggs decimal(2) not null,
broods decimal(1) null,
incubation decimal(2) not null,
fledging decimal(3) not null,
nest_builder char(1)  not null); 
 
create table nicknames 
(bird_id decimal(3) not null, 
nickname varchar(30) not null, 
constraint nicknames_pk primary key (bird_id, nickname), 
constraint nicknames_bird_id_fk foreign key (bird_id) references birds (bird_id)); 
 
create table locations 
(location_id decimal(2) not null primary key, 
location_name varchar(30) not null unique); 
 
create table photos 
(photo_id  decimal(5) not null primary key, 
photo_file  varchar(30) not null unique, 
photo_date  date  not null, 
photo_location_id decimal(2) not null, 
bird_id   decimal(3) not null, 
constraint photos_bird_id foreign key (bird_id) references birds (bird_id), 
constraint photos_location_id foreign key (photo_location_id) references locations 
(location_id)); 
 
create table food 
(food_id decimal(3) not null primary key, 
food_name varchar(30) not null unique); 
 
create table birds_food 
(bird_id decimal(3) not null,  
food_id  decimal(3) not null, 
constraint birds_food_pk primary key (bird_id, food_id), 
constraint birds_food_bird_fk foreign key (bird_id) references birds (bird_id), 
constraint birds_food_food_fk foreign key (food_id) references food (food_id)); 
 
create table nests 
(nest_id decimal(1) not null primary key, 
nest_name varchar(20) not null unique); 
 
create table birds_nests 
(bird_id decimal(3) not null primary key,
nest_id decimal(1) not null,
constraint birds_nests_bird_fk foreign key (bird_id) references birds (bird_id), 
constraint birds_nests_nest_fk foreign key (nest_id) references nests (nest_id)); 

create table migration 
(migration_id decimal(2) not null primary key,
migration_location varchar(30) not null unique);

create table birds_migration 
(bird_id  decimal(3) not null,
migration_id decimal(2) not null,
constraint birds_migration_pk primary key (bird_id, migration_id), 
constraint birds_migration_bird_fk foreign key (bird_id) references birds (bird_id), 
constraint birds_migration_migration_fk foreign key (migration_id) references migration 
(migration_id));