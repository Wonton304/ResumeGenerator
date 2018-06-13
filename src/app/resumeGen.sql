CREATE TABLE Location1(
city CHAR(20),
postalCode CHAR(20) PRIMARY KEY
);

CREATE TABLE Location2(
	country CHAR(20),
	address CHAR(50),
	postalCode CHAR(20),
	PRIMARY KEY (address, postalCode)
);

CREATE TABLE Location3(
	postalCode CHAR(20) PRIMARY KEY,
	province CHAR(20)
);

CREATE TABLE SituatedIn(
postalCode CHAR(20),
address CHAR(50),
companyName CHAR(30),
PRIMARY KEY (postalCode, address, companyName),
FOREIGN KEY (address) REFERENCES Location2(address)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (postalCode) REFERENCES Location2(postalCode)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (companyName) REFERENCES Company(companyName)
	ON DELETE CASCADE
ON UPDATE CASCADE
	);

CREATE TABLE RequiredTechnology(
technologyName CHAR(40) PRIMARY KEY,
technologyRole CHAR(30),
proficiencyRequirements INTEGER,
technologyType CHAR(40)
);


CREATE TABLE CodingProject(
language CHAR(20),
projectName CHAR(100) PRIMARY KEY,
complexity INTEGER
projectDescription CHAR(1000),
category CHAR(30),
);

CREATE TABLE Experience(
organization CHAR(100),
experienceRole CHAR(100),
duration CHAR(100)
experienceType CHAR(50),
experienceDescription CHAR(1000),
PRIMARY KEY (organization, experienceRole)
);

CREATE TABLE Award(
awardDescription CHAR(1000),
awardName CHAR(100) PRIMARY KEY,
dateRecieved CHAR(50)
);

CREATE TABLE Hobby(
hobbyName CHAR(20) PRIMARY KEY
);


CREATE TABLE Requires(
id CHAR(20),
technologyName CHAR(40),
PRIMARY KEY (id, technologyName)
FOREIGN KEY (id) REFERENCES JobPostingPost(id)
	ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (technologyName) REFERENCES  RequiredTechnology(technologyName)
		ON UPDATE CASCADE
			ON DELETE CASCADE
);

CREATE TABLE Applicant1(
applicantPhoneNumber CHAR(30),
applicantCity CHAR(30)
);

CREATE TABLE Applicant2(
applicantName CHAR(40),
applicantEmail CHAR(60) PRIMARY KEY,
applicantAddress CHAR(50),
githubAccount CHAR(30),
personalDescription CHAR(1000),
applicantPhoneNumber CHAR(20)
);

CREATE TABLE Company(
companyName CHAR(30) PRIMARY KEY,
companyDomain CHAR(30),
companyDescription CHAR(500)
);

CREATE TABLE JobPostingPosts(
id CHAR(20) NOT NULL PRIMARY KEY,
companyName CHAR(30) NOT NULL,
field CHAR(30),
positionTitle CHAR(100)
FOREIGN KEY (companyName) REFERENCES Company(companyName)
	ON DELETE CASCADE,
	ON UPDATE CASCADE
);

CREATE TABLE HaveProject(
applicantEmail CHAR(60),
projectName CHAR(100),
FOREIGN KEY(projectName) REFERENCES CodingProject(projectName),
ON DELETE CASCADE
ON UPDATE CASCADE
FOREIGN KEY (applicantEmail) References Applicant2(applicantEmail),
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE HaveExperience(
applicantEmail CHAR(60),
organization CHAR(100),
experienceRole (100),
PRIMARY KEY (organization, experienceRole, applicantEmail),
FOREIGN KEY (organization, experienceRole) REFERENCES Experience (organization, experienceRole)
ON DELETE CASCADE
ON UPDATE CASCADE
FOREIGN KEY (applicantEmail) REFERENCES Applicant2(applicantEmail)
ON DELETE CASCADE
ON UPDATE CASCADE
);





CREATE TABLE HaveAward(
awardName CHAR(100),
applicantEmail CHAR(60),
PRIMARY KEY (awardName, applicantEmail),
FOREIGN KEY (awardName) REFERENCES Award(awardName)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (applicantEmail) REFERENCES Applicant2(applicantEmail),
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE HaveHobby(
applicantEmail CHAR(60),
	hobbyName CHAR(20),
		PRIMARY KEY (hobbyName, applicantEmail),
		FOREIGN KEY (hobbyName) REFERENCES Hobby(hobbyName),
ON DELETE CASCADE
			ON UPDATE CASCADE
		FOREIGN KEY (applicantEmail) REFERENCES Applicant2(applicantEmail,
			ON DELETE CASCADE
			ON UPDATE CASCADE
	);

	CREATE TABLE AppliesTo(
		id CHAR(20),
		applicantEmail CHAR(60),
		PRIMARY KEY (id, applicantEmail),
		FOREIGN KEY (id) REFERENCES JobPostingPost(id)
			ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (applicantEmail) REFERENCES Applicant2(applicantEmail)
	ON DELETE CASCADE
ON UPDATE CASCADE
	);
