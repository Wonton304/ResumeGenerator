drop table Location1;
drop table Location2;
drop table Location3;
drop table SituatedIn;
drop table RequiredTechnology;
drop table CodingProject;
drop table Experience;
drop table Award;
drop table Hobby;
drop table Requires;
drop table Applicant1;
drop table Applicant2;
drop table Company;
drop table JobPostingPosts;
drop table HaveProject;
drop table HaveExperience;
drop table HaveAward;
drop table HaveHobby;
drop table AppliesTo;


create table Location1
	(city varchar(50) not null,
	postalCode varchar(50),
	primary key(postalCode)
);

create table Location2
	(country varchar(50),
	address varchar(50),
	postalCode varchar(50),
	primary key (address, postalCode));

	create table Location3(
		postalCode varchar(50),
		province varchar(50),
		primary key(postalCode)
	);

	create table SituatedIn(
		postalCode varchar(50),
		address varchar(50),
		companyName varchar(30),
		primary key (postalCode, address, companyName),
		foreign key (address) REFERENCES Location2(address)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
		foreign key (postalCode) REFERENCES Location2(postalCode)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
		foreign key (companyName) REFERENCES Company(companyName)
		ON DELETE CASCADE
		ON UPDATE CASCADE
	);

	create table RequiredTechnology(
		technologyName varchar(40) primary key,
		technologyRole varchar(30),
		proficiencyRequirements INTEGER,
		technologyType varchar(40)
	);


	create table CodingProject(
		language varchar(50),
		projectName varchar(100) primary key,
		complexity INTEGER
		projectDescription varchar(1000),
		category varchar(30),
	);

	create table Experience(
		organization varchar(100),
		experienceRole varchar(100),
		duration varchar(100)
		experienceType varchar(50),
		experienceDescription varchar(1000),
		primary key (organization, experienceRole)
	);

	create table Award(
		awardDescription varchar(1000),
		awardName varchar(100) primary key,
		dateRecieved varchar(50)
	);

	create table Hobby(
		hobbyName varchar(50) primary key
	);


	create table Requires(
		id varchar(50),
		technologyName varchar(40),
		primary key (id, technologyName),
		foreign key (id) REFERENCES JobPostingPost(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
		foreign key (technologyName) REFERENCES  RequiredTechnology(technologyName)
		ON UPDATE CASCADE
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

	create table Company(
		companyName varchar(30) primary key,
		companyDomain varchar(30),
		companyDescription varchar(500)
	);

	create table JobPostingPosts(
		id varchar(50) NOT NULL primary key,
		companyName varchar(30) NOT NULL,
		field varchar(30),
		positionTitle varchar(100),
		description varchar(1000)

		foreign key (companyName) REFERENCES Company(companyName),
		ON DELETE CASCADE
		ON UPDATE CASCADE
	);

	create table HaveProject(
		applicantEmail varchar(60),
		projectName varchar(100),
		foreign key(projectName) REFERENCES CodingProject(projectName)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
		foreign key (applicantEmail) References Applicant2(applicantEmail)
		ON DELETE CASCADE
		ON UPDATE CASCADE
	);

	create table HaveExperience(
		applicantEmail varchar(60),
		organization varchar(100),
		experienceRole (100),
		primary key (organization, experienceRole, applicantEmail),
		foreign key (organization, experienceRole) REFERENCES Experience (organization, experienceRole)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
		foreign key (applicantEmail) REFERENCES Applicant2(applicantEmail)
		ON DELETE CASCADE
		ON UPDATE CASCADE
	);





	create table HaveAward(
		awardName varchar(100),
		applicantEmail varchar(60),
		primary key (awardName, applicantEmail),
		foreign key (awardName) REFERENCES Award(awardName)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
		foreign key (applicantEmail) REFERENCES Applicant2(applicantEmail)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	);

	create table HaveHobby(
		applicantEmail varchar(60),
		hobbyName varchar(50),
		primary key (hobbyName, applicantEmail),
		foreign key (hobbyName) REFERENCES Hobby(hobbyName)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
		foreign key (applicantEmail) REFERENCES Applicant2(applicantEmail)
			ON DELETE CASCADE
			ON UPDATE CASCADE
		);

		create table AppliesTo(
			id varchar(50),
			applicantEmail varchar(60),
			primary key (id, applicantEmail),
			foreign key (id) REFERENCES JobPostingPost(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
			foreign key (applicantEmail) REFERENCES Applicant2(applicantEmail)
			ON DELETE CASCADE
			ON UPDATE CASCADE
		);
