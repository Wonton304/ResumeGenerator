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
