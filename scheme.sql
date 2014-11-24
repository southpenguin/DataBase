Drop table `project`.Have;
Drop table `project`.Fans;
DROP TABLE `project`.Art;
Drop table `project`.Attend;
Drop table `project`.Likes;
Drop table `project`.Content;
Drop table `project`.Concert;
Drop table `project`.Follow;
Drop table `project`.Location;
Drop table `project`.Genre;
Drop table `project`.Lists;
Drop table `project`.User;
Drop table `project`.Content;

create table User (
	uid varchar(20),
	upassword varchar(20),
	ufname varchar(20),
	ulname varchar(20),
	uemail varchar(40),
	ucity varchar(20),
	uphone varchar(10),
	primary key (uid)
);

create table Art (
	aid varchar(20),
	apassword varchar(20),
	artname varchar(20),
	aemail varchar(40),
	asite varchar(100),
	primary key (aid)
);

create table Genre (
	gid int(2),
	ggenre char(20),
	primary key (gid)
);

create table Follow (
	followee varchar(20),
	follower varchar(20),
	foreign key (follower) references User(uid),
	foreign key (followee) references User(uid)
);

create table Fans (
	fan varchar(20),
	follow varchar(20),
	foreign key (fan) references User(uid),
	foreign key (follow) references Art(aid)
);

create table Location(
	lid int(10),
	lname char(20),
	lnumber int(8),
	street1 varchar(40),
	street2 varchar(40),
	city varchar(30),
	state char(2),
	zip int(5),
	primary key (lid)
);


create table Concert (
	cid int(10),
	cname varchar(40),
	date int(8),
	time int(4),
	price decimal(7,2),
	location int(10),
	capacity int(6),
	available int(6),
	cgenre int(2),
	primary key (cid),
	foreign key (cgenre) references Genre(gid),
	foreign key (location) references Location(lid)
);

create table Likes (
	luid varchar(20),
	lgenre int(2),
	foreign key (luid) references User(uid),
	foreign key (lgenre) references Genre(gid)
);

create table Have (
	haid varchar(20),
	hgenre int(2),
	foreign key (haid) references Art(aid),
	foreign key (hgenre) references Genre(gid)	
);

create table Attend (
	auid varchar(20),
	acid int(10),
	rate int(1),
	review varchar(500),
	foreign key (auid) references User(uid),
	foreign key (acid) references Concert(cid)
);

create table Lists (
	listid int(10),
	luid varchar(20),
	primary key (listid),
	foreign key (luid) references User(uid)
);

create table Content (
	clistid int(10),
	ccid int(10),
	foreign key (clistid) references Lists(listid),
	foreign key (ccid) references Concert(cid)
);

create table FollowList (
	flistid int(10),
	fluid varchar(20),
	foreign key (flistid) references Lists(listid),
	foreign key (fluid) references User(uid)
);

create table Hold (
	haid varchar(20),
    hcid int(20),
	foreign key (haid) references Art(aid),
	foreign key (hcid) references Concert(cid)
);