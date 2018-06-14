drop table Location1;
drop table Location3;
drop table SituatedIn;
drop table Location2;
drop table Requires;
drop table RequiredTechnology;
drop table Applicant1;
drop table HaveProject;
drop table CodingProject1;
drop table HaveExperience;
drop table Experience;
drop table HaveAward;
drop table Award1;
drop table HaveHobby;
drop table Hobby;
drop table AppliesTo;
drop table JobPostingPost;
drop table Company;
drop table Applicant2;


create table Location1
(city varchar(50) not null,
postalCode varchar(50),
primary key(postalCode)
);

create table Location2
(address varchar(50),
postalCode varchar(50),
primary key (address, postalCode));

create table Location3
(postalCode varchar(50),
province varchar(50),
primary key(postalCode)
);

create table Company(
companyName varchar(30) primary key,
companyDomain varchar(30),
companyDescription varchar(500)
);

create table SituatedIn(
postalCode varchar(50),
address varchar(50),
companyName varchar(30),
primary key (postalCode, address, companyName),
foreign key (address, postalCode) REFERENCES Location2(address, postalCode)
ON DELETE CASCADE,
foreign key (companyName) REFERENCES Company(companyName)
ON DELETE CASCADE
);

create table RequiredTechnology
(technologyName varchar(40),
technologyRole varchar(30),
proficiencyRequirements INTEGER,
technologyType varchar(40),
primary key(technologyName));

create table CodingProject1
(language varchar(50),
projectName varchar(100) primary key,
complexity INTEGER,
projectDescription varchar(500),
category varchar(30));

create table Experience(
	organization varchar(100),
	experienceRole varchar(100),
	duration varchar(100),
	experienceType varchar(50),
	experienceDescription varchar(1000),
	primary key (organization, experienceRole)
);

create table Award1(
	awardDescription varchar(1000),
	awardName varchar(100) primary key,
	dateRecieved varchar(50)
);

create table Hobby(
	hobbyName varchar(50) primary key
);

create table JobPostingPost(
	id varchar(50) NOT NULL,
	companyName varchar(30) NOT NULL,
	field varchar(30),
	positionTitle varchar(100),
	description varchar(1000),
	primary key(id),
	foreign key (companyName) REFERENCES Company(companyName)
	ON DELETE CASCADE
);

create table Requires(
	id varchar(50),
	technologyName varchar(40),
	primary key (id, technologyName),
	foreign key (id) REFERENCES JobPostingPost(id)
	ON DELETE CASCADE,
	foreign key (technologyName) REFERENCES  RequiredTechnology
	ON DELETE CASCADE
);

create table Applicant1(
	applicantPhoneNumber varchar(30),
	applicantCity varchar(30)
);

create table Applicant2(
	applicantName varchar(40),
	applicantEmail varchar(60) primary key,
	applicantAddress varchar(50),
	githubAccount varchar(30),
	personalDescription varchar(1000),
	applicantPhoneNumber varchar(50)
);

create table AppliesTo(
	id varchar(50),
	applicantEmail varchar(60),
	primary key (id, applicantEmail),
	foreign key (id) REFERENCES JobPostingPost(id)
	ON DELETE CASCADE,
	foreign key (applicantEmail) REFERENCES Applicant2(applicantEmail)
	ON DELETE CASCADE
);

create table HaveProject(
	applicantEmail varchar(60),
	projectName varchar(100),
	foreign key(projectName) REFERENCES CodingProject1(projectName)
	ON DELETE CASCADE,
	foreign key (applicantEmail) References Applicant2(applicantEmail)
	ON DELETE CASCADE
);

create table HaveExperience(
	applicantEmail varchar(60),
	organization varchar(100),
	experienceRole varchar(100),
	primary key (organization, experienceRole, applicantEmail),
	foreign key (organization, experienceRole) REFERENCES Experience (organization, experienceRole)
	ON DELETE CASCADE,
	foreign key (applicantEmail) REFERENCES Applicant2(applicantEmail)
	ON DELETE CASCADE
);

create table HaveAward(
	awardName varchar(100),
	applicantEmail varchar(60),
	primary key (awardName, applicantEmail),
	foreign key (awardName) REFERENCES Award1(awardName)
	ON DELETE CASCADE,
	foreign key (applicantEmail) REFERENCES Applicant2(applicantEmail)
	ON DELETE CASCADE
);

create table HaveHobby(
	applicantEmail varchar(60),
	hobbyName varchar(50),
	primary key (hobbyName, applicantEmail),
	foreign key (hobbyName) REFERENCES Hobby(hobbyName)
	ON DELETE CASCADE,
	foreign key (applicantEmail) REFERENCES Applicant2(applicantEmail)
	ON DELETE CASCADE
);

insert into Location1
values('Wetaskiwin','T9A 3B2');
insert into Location2
values('76 Archer Dr','T9A 3B2');
insert into Location3
values('T9A 3B2', 'Alberta');

insert into Location1
values('Pointe-Claire','H9R 2V6');
insert into Location2
values('15 Donegani Ave','H9R 2V6');
insert into Location3
values('H9R 2V6', 'Quebec');

insert into Location1
values('Yorkton','S3N 0H8');
insert into Location2
values('63 7 Ave N','S3N 0H8');
insert into Location3
values('S3N 0H8', 'Saskatchewan');

insert into Location1
values('Etobicoke','M8V 1P4');
insert into Location2
values('1 Blue Goose St','M8V 1P4');
insert into Location3
values('M8V 1P4', 'Ontario');

insert into Location1
values('High River','T1V 1X0');
insert into Location2
values('NE 15 19 1 West','T1V 1X0');
insert into Location3
values('T1V 1X0', 'Alberta');


insert into Location1
values('Red Bank','E9E 1P8');
insert into Location2
values('10894 NB-430','E9E 1P8');
insert into Location3
values('E9E 1P8', 'New Brunswick');

insert into Location1
values('Port Moody','V3H 2J9');
insert into Location2
values('140 Moody St','V3H 2J9');
insert into Location3
values('V3H 2J9', 'British Columbia');

insert into Location1
values('Old Montreal','H2Y 1W5');
insert into Location2
values('270 Saint-Antoine St W','H2Y 1W5');
insert into Location3
values('H2Y 1W5', 'Quebec');

insert into Location1
values('Hamilton','L8E 3X0');
insert into Location2
values('20 Caroline St S','L8E 3X0');
insert into Location3
values('L8E 3X0', 'Ontairo');

insert into Location1
values('Milton','L9T 2T5');
insert into Location2
values('81 Ontario St N','L9T 2T5');
insert into Location3
values('L9T 2T5', 'Ontario');

insert into Location1
values('Pennfield','E5H 0L9');
insert into Location2
values('5030 Route 1','E5H 0L9');
insert into Location3
values('E5H 0L9', 'New Brunswick');

insert into Location1
values('Kincardine','N2Z 3J7');
insert into Location2
values('791 Durham St','N2Z 3J7');
insert into Location3
values('N2Z 3J7', 'Ontario');

insert into Location1
values('Edson','T7E 0X9');
insert into Location2
values('300 52 St','T7E 0X9');
insert into Location3
values('T7E 0X9', 'Alberta');

insert into Location1
values('Port Moody','V3H 1X4');
insert into Location2
values('2800 Murray St','V3H 1X4');
insert into Location3
values('V3H 1X4', 'British Columbia');

insert into Location1
values('Apohaqui','E5P 0J6');
insert into Location2
values('9 Foster Ave W','E5P 0J6');
insert into Location3
values('E5P 0J6', 'New Brunswick');

insert into Location1
values('Neguac','E9G 0G9');
insert into Location2
values('981 Rue Principale','E9G 0G9');
insert into Location3
values('E9G 0G9', 'New Brunswick');

insert into Location1
values('Beaconsfield','H9W 0A6');
insert into Location2
values('3663 Penticton St','H9W 0A6');
insert into Location3
values('H9W 0A6', 'Quebec');

insert into Location1
values('Olds','T4H 2E2');
insert into Location2
values('5038 50 St','T4H 2E2');
insert into Location3
values('T4H 2E2', 'Alberta');

insert into Location1
values('Powell River','V8A 2G1');
insert into Location2
values('4943 Kiwanis Ave','V8A 2G1');
insert into Location3
values('V8A 2G1'm 'British Columbia');

insert into Location1
values('Montérégie-Nord','J0L 2Y8');
insert into Location2
values('5655 Rue Saint-Zotique E','J0L 2Y8');
insert into Location3
values('J0L 2Y8', 'Quebec');
