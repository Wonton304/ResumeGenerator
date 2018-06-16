drop table Location1 CASCADE CONSTRAINTS;
drop table Location3 CASCADE CONSTRAINTS;

drop table SituatedIn CASCADE CONSTRAINTS;
drop table Location2 CASCADE CONSTRAINTS;
drop table Requires CASCADE CONSTRAINTS;
drop table RequiredTechnology CASCADE CONSTRAINTS;
drop table Applicant1 CASCADE CONSTRAINTS;
drop table HaveProject CASCADE CONSTRAINTS;
drop table CodingProject1 CASCADE CONSTRAINTS;
drop table HaveExperience CASCADE CONSTRAINTS;
drop table Experience CASCADE CONSTRAINTS;
drop table HaveAward CASCADE CONSTRAINTS;
drop table Award CASCADE CONSTRAINTS;
drop table HaveHobby CASCADE CONSTRAINTS;
drop table Hobby CASCADE CONSTRAINTS;
drop table AppliesTo CASCADE CONSTRAINTS;
drop table JobPostingPosts CASCADE CONSTRAINTS;
drop table Company CASCADE CONSTRAINTS;
drop table Applicant2 CASCADE CONSTRAINTS;
drop table Applicant3 CASCADE CONSTRAINTS;


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
	companyDescription varchar(1000),
	companyDomain varchar(30)
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
	minimumProficiency INTEGER,
	technologyType varchar(40),
	primary key(technologyName));

create table CodingProject1
	(language varchar(50),
	projectName varchar(100),
	complexity INTEGER,
	projectDescription varchar(500),
	category varchar(30),
	primary key(language, projectName));

create table Experience(
	organization varchar(100),
	experienceRole varchar(100),
	duration varchar(100),
	experienceType varchar(50),
	experienceDescription varchar(1000),
	primary key (organization, experienceRole)
);

create table Award(
	awardDescription varchar(1000),
	awardName varchar(100),
	dateReceived varchar(50),
	primary key (awardName, dateReceived)
);

create table Hobby(
	hobbyName varchar(50) primary key
);

create table JobPostingPosts(
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
	foreign key (id) REFERENCES JobPostingPosts(id)
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

create table Applicant3(
	applicantPhoneNumber varchar(30),
	applicantProvince varchar(30)
);

create table AppliesTo(
	id varchar(50),
	applicantEmail varchar(60),
	primary key (id, applicantEmail),
	foreign key (id) REFERENCES JobPostingPosts(id)
	ON DELETE CASCADE,
	foreign key (applicantEmail) REFERENCES Applicant2(applicantEmail)
	ON DELETE CASCADE
);

create table HaveProject(
	applicantEmail varchar(60),
	projectName varchar(100),
	language varchar(50),
	primary key(applicantEmail, projectName, language),
	foreign key(language, projectName) REFERENCES CodingProject1(language, projectName)
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
	dateReceived varchar(50),
	applicantEmail varchar(60),
	primary key (awardName, dateReceived, applicantEmail),
	foreign key (awardName, dateReceived) REFERENCES Award(awardName, dateReceived)
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
values('V8A 2G1', 'British Columbia');

insert into Location1
values('Montérégie-Nord','J0L 2Y8');
insert into Location2
values('5655 Rue Saint-Zotique E','J0L 2Y8');
insert into Location3
values('J0L 2Y8', 'Quebec');

insert into Company
values('Intel', 'Tenetur ut quo optio in recusandae non rem voluptatem. Ipsam nostrum excepturi delectus voluptatum voluptas atque nulla. Error illo architecto similique accusamus. Magni et unde eveniet natus veritatis. Mollitia sequi ut adipisci a doloribus tempore harum aut. Perferendis provident accusantium quia asperiores dolores similique excepturi. Et nostrum ea tempora magnam doloribus. Pariatur qui voluptatem quis in tempore sint error. Et dolores architecto rerum officiis enim excepturi. Sequi sit tenetur repellat amet.', 'Technology');

insert into Company
values('Hootsuite', '	Pariatur ut excepturi et. Autem architecto rerum nostrum fuga aut. Esse debitis id sed quae voluptatibus. Reprehenderit dolor et dolorem aspernatur suscipit non. Velit explicabo nobis laborum quos repellendus. Recusandae nesciunt nisi ab quia tenetur autem nostrum. Architecto sit deleniti vitae quis suscipit consequatur. Molestiae sed optio est voluptatem. Quia ipsa dicta voluptas cumque facere voluptas. Alias voluptates quo sed magnam. Et ut quod ut.', 'Other');

insert into Company
values('Google', '	Maiores a aut et. Et aut dolores numquam neque nihil. Porro quia et dolorem voluptatem rerum. Sunt dolore sed ducimus natus nihil. Eligendi tempora non modi aut. Harum impedit esse et vel et ut. Est et hic voluptates ducimus omnis. Quis commodi corporis accusamus reiciendis nulla. Nihil reiciendis laboriosam quia doloribus nostrum qui architecto. Voluptatum quisquam et aut qui quis itaque eos. In officiis culpa similique magni sint voluptates soluta et. Ex sequi ut esse quibusdam modi sequi magnam.', 'Health');

insert into Company
values('Facebook', 'Quas dolorem repellendus natus incidunt nostrum fuga. Cupiditate soluta veniam occaecati repudiandae ut. Aperiam dolores asperiores blanditiis consequatur. Distinctio voluptas ipsa quas vero aut. Vero minima magnam occaecati voluptatem optio. Est animi tenetur sed tenetur nostrum. Sapiente doloribus ut cupiditate eos quod laudantium ut. Officia sed perspiciatis sed. A aliquid suscipit dolor fugiat accusamus. Molestiae quod reiciendis qui quia consequatur minus asperiores repellat. Officia praesentium accusantium dolores cupiditate sunt eius. Quisquam sit neque iusto qui. Rerum eos ut eaque. Ut quasi ut iste est ut cumque sit.
', 'Technology');

insert into Company
values('Amazon', 'Optio provident id et natus vel. Veritatis culpa sapiente ipsa dicta. Tempora ea voluptatem veritatis inventore non itaque alias eius. Cumque quas deserunt vero voluptatem neque nesciunt suscipit. Commodi rerum esse quos in est nihil explicabo autem. Vel ducimus deserunt consequatur tempore qui rerum magni. Doloremque sit minima aliquid et. Et perferendis dicta sit porro omnis et. Officia pariatur veritatis rem fuga. Maiores consequuntur commodi et consequatur. Esse est dolorem doloremque et maxime nemo.', 'Finance');

insert into Company
values('AppNeta', 'Molestiae consequatur laboriosam quod laudantium. Amet quidem inventore nihil quos aperiam. Et officia ipsa in et. Sit est quam laboriosam consequuntur vel quisquam ducimus. Quia nulla sed voluptates sunt esse cupiditate et. Nisi qui reiciendis perspiciatis nam ullam autem tenetur. Aliquid quibusdam vel error. Corporis rem maiores ullam officiis aperiam illum. Et iste ad animi quidem nobis nesciunt debitis facilis.', 'Finance');

insert into Company
values('Tasktop Technologies', 'Voluptas voluptas non similique facilis dolorum facere deleniti. Ratione molestiae nostrum autem tenetur consequatur et distinctio magni. Voluptatem consequatur libero et est. Nostrum rerum quisquam sed est ullam eum et quo. Eaque iusto quia earum accusamus ut aperiam odio aut. Qui omnis laudantium velit voluptatem adipisci accusamus quis. Beatae velit id quibusdam omnis quidem quo error. Commodi culpa voluptatibus nisi dolorem officia doloremque. Nihil dolores dolorum necessitatibus ut ullam ipsum magni.', 'Technology');

insert into Company
values('Fatigue Science', 'Porro praesentium error voluptatem rerum vel. Rerum excepturi saepe aut. Sit laborum vitae eligendi autem numquam similique enim. At et iste et culpa omnis. Et officia ab hic assumenda. Iure ullam debitis facilis. Cumque aspernatur earum et recusandae vel commodi non voluptate. Harum consectetur voluptate commodi fugit et nemo. Veritatis et cum tempora nihil. Amet quia ullam repudiandae occaecati delectus. Voluptas voluptatem ad ut occaecati ducimus natus explicabo.', 'Finance');

insert into Company
values('Absolute Software', '	Suscipit quam voluptatem pariatur pariatur dicta ipsa. Numquam expedita minus quia nihil aut est vel. Sit et odit dolores dolores. A et quia dolores dolorem facere qui nihil. Ea reiciendis deleniti et pariatur. Quidem sit enim laborum sit amet ullam occaecati perferendis. Qui ratione debitis fugiat neque et quia modi. Sit eum in voluptate dolores earum. Impedit aut excepturi suscipit et ut quidem. Aut voluptas et ullam quia est.', 'Other');

insert into Company
values('SAP', 'Veritatis error qui delectus nihil non. Quisquam sapiente unde aut et omnis assumenda eaque dolores. Sunt fugiat est et ut. Sint qui quis architecto nesciunt nisi id. Laboriosam sunt provident deleniti commodi quia. Fuga quibusdam doloribus asperiores illo. Molestiae dolor et nam qui. Qui in laborum aut ut et voluptate voluptas. Harum amet repellat et natus hic. Voluptatem et nihil iste et possimus enim.', 'Technology');

insert into Company
values('Trulioo', 'Qui ullam nihil sint dolores. Officia dignissimos aut qui pariatur doloribus. Sint explicabo temporibus natus exercitationem aut animi. Officiis ab minus exercitationem hic ducimus dolor sit et. Dignissimos alias et aliquid voluptas. Magni corporis quasi est et iure aspernatur quia nihil. Est a in eius cupiditate. Temporibus ullam doloremque rerum illum. Distinctio unde reiciendis rerum ducimus natus asperiores quis aut. Laborum doloremque est voluptatem maiores. Ipsa consequatur molestias eaque sit eveniet. Aut consequatur cupiditate non.', 'Health');

insert into Company
values('Splunk', '	Et incidunt ipsam itaque voluptates. Ut qui nihil sunt sint omnis non. Accusamus nihil quaerat voluptatum cum vel expedita similique beatae. Vitae corrupti quibusdam quod sit qui consequatur quisquam molestiae. Eos ullam dignissimos ullam voluptatem minima officiis. Soluta totam sunt hic quod dolorem distinctio. Repellat sunt accusantium quia aut eum dolorem. Libero sapiente voluptatem corrupti fugit. Sed repudiandae quae velit temporibus voluptas repellat. Ut qui est natus vero dignissimos qui ut in. Natus eveniet aperiam est temporibus ut autem.', 'Technology');

insert into Company
values('Visier', 'Molestias a qui iste est repellendus ut aut. Minus officiis laboriosam alias odit ab magnam dignissimos. Voluptatibus qui inventore eveniet dignissimos temporibus. Ipsum minus sit modi aut. Cupiditate laboriosam omnis culpa inventore. Quasi dolore quo atque non quo quisquam sunt. Deleniti sit quas quos assumenda quo cumque facere. Est aperiam qui enim. Illum laboriosam similique explicabo dolores voluptates quia. Architecto aut dolor repudiandae assumenda. Tempora nihil magnam saepe eum a.', 'Other');

insert into Company
values('Mojio', '	Labore quia aut ipsa excepturi enim recusandae. Aut quaerat officiis et consequatur beatae ratione. Harum quos voluptatem minima eveniet sit. Laboriosam distinctio ut deserunt adipisci placeat quidem molestiae. Eos voluptas quisquam dolorem quaerat magni. Molestias et qui mollitia nulla corrupti voluptatibus. Sequi sunt deleniti placeat ut est assumenda asperiores ipsa. Minus ab sunt sit nostrum tempore. Expedita doloremque harum voluptas sed ipsa asperiores omnis non. Eveniet perspiciatis amet accusantium ut id nam. In rerum mollitia harum omnis quia.', 'Technology');

insert into Company
values('Yelp', 'Illum atque id qui fuga omnis. Amet sint sint molestias excepturi dolores quo voluptate. Illum placeat id tenetur. Neque exercitationem alias inventore quo laudantium. Delectus veniam minus recusandae sed voluptas eum. Ea vitae ut in harum placeat. Magni aut repudiandae distinctio quas atque repellendus. Id dolor aut dolor error aut. Illo et dolores autem fugiat numquam recusandae. Est aliquam error dolor eligendi et et. Enim possimus eius eos quam quis.', 'Health');

insert into Company
values('EA', 'Tempora tempore in aut unde placeat et tempora. Animi quae mollitia alias quis maxime. Accusantium quae sequi ullam officia tempora vero earum. Magni suscipit officiis animi fugiat.', 'Finance');

insert into Company
values('Ubisoft', 'Est accusantium dolor suscipit ad qui. Repellendus omnis architecto cum quibusdam. Sed cum quibusdam repellendus eaque laudantium. Nisi itaque distinctio voluptas et quod ut. Facilis voluptatum minus fuga at ipsam sint. Porro quia sed quasi nulla aliquam et. Vel voluptatem est nobis ut non exercitationem optio. Facilis tenetur dolores corporis aut. Perferendis et qui consequatur ad provident. Dolorum molestiae quos architecto sed. Nobis libero dolor porro quo modi et nihil sed. Inventore amet laborum corporis. Ut nostrum ipsam sed labore molestias quisquam. Saepe unde eligendi eius facere nulla corrupti labore itaque. Harum non ipsam aut. Sed aut ut eum voluptas beatae qui architecto eos.', 'Technology');

insert into Company
values('Avigilon Corporation', '	Voluptas blanditiis dolores ut et. Quae voluptatem voluptate et quisquam in. Velit excepturi dicta tempore laboriosam ut ut quibusdam. Exercitationem rerum architecto exercitationem animi fuga. Est eos distinctio odit soluta aspernatur est sit rem. Ut occaecati quia et praesentium ea. Omnis repellendus corrupti officia et. Nemo eos labore ratione aspernatur. Ea in provident pariatur ratione tempore ea. Est facere ut odio at. Quaerat voluptatibus a esse minus.', 'Health');

insert into Company
values('Ayogo', 'Pariatur facilis impedit dolorem sunt cum eos. In quaerat repellat repudiandae et. Voluptatum doloribus et quibusdam voluptatem sed. Omnis adipisci nihil sed quo eos illum impedit. Quia quos suscipit quod praesentium ut. Fugit aut qui accusantium fugiat ab. Ea dolorum libero laborum voluptatem ut. Aut fuga magni eaque cumque eligendi qui quasi.', 'Technology');

insert into SituatedIn
values('T9A 3B2', '76 Archer Dr', 'Intel');

insert into SituatedIn
values('H9R 2V6', '15 Donegani Ave', 'Hootsuite');

insert into SituatedIn
values('S3N 0H8', '63 7 Ave N', 'Google');

insert into SituatedIn
values('M8V 1P4', '1 Blue Goose St', 'Facebook');

insert into SituatedIn
values('T1V 1X0', 'NE 15 19 1 West', 'Amazon');

insert into SituatedIn
values('E9E 1P8','10894 NB-430', 'AppNeta');

insert into SituatedIn
values('V3H 2J9', '140 Moody St', 'Tasktop Technologies');

insert into SituatedIn
values('H2Y 1W5', '270 Saint-Antoine St W', 'Fatigue Science');

insert into SituatedIn
values('L8E 3X0', '20 Caroline St S', 'Absolute Software');

insert into SituatedIn
values('L9T 2T5', '81 Ontario St N', 'SAP');

insert into SituatedIn
values('E5H 0L9', '5030 Route 1', 'Trulioo');

insert into SituatedIn
values('N2Z 3J7', '791 Durham St', 'Splunk');

insert into SituatedIn
values('T7E 0X9', '300 52 St', 'Visier');

insert into SituatedIn
values('V3H 1X4', '2800 Murray St', 'Mojio');

insert into SituatedIn
values('E5P 0J6', '9 Foster Ave W', 'Yelp');

insert into SituatedIn
values('E9G 0G9', '981 Rue Principale', 'EA');

insert into SituatedIn
values('H9W 0A6', '3663 Penticton St', 'Ubisoft');

insert into SituatedIn
values('T4H 2E2', '5038 50 St', 'Avigilon Corporation');

insert into SituatedIn
values('V8A 2G1', '4943 Kiwanis Ave', 'Ayogo');

insert into RequiredTechnology
values('C++', 'Web', '2', 'IDE');

insert into RequiredTechnology
values('C', 'Frontend', '3', 'Other');

insert into RequiredTechnology
values('Java', 'Firmware', '2', 'Other');

insert into RequiredTechnology
values('jQuery', 'Other', '2', 'Other');

insert into RequiredTechnology
values('MySQL', 'Web', '4', 'IDE');

insert into RequiredTechnology
values('NoSQL', 'Network', '1', 'Other');

insert into RequiredTechnology
values('JavaScript', 'Network', '0', 'Framework');

insert into RequiredTechnology
values('NodeJS', 'Network', '5', 'Language');

insert into RequiredTechnology
values('AngularJS', 'Web', '2', 'Other');

insert into RequiredTechnology
values('HTML', 'Network', '5', 'Framework');

insert into RequiredTechnology
values('CSS', 'Web', '1', 'IDE');

insert into RequiredTechnology
values('IntelliJ', 'Web', '0', 'Other');

insert into RequiredTechnology
values('Android Studio', 'Firmware', '1', 'Other');

insert into RequiredTechnology
values('Bootstrap', 'Network', '3', 'Framework');

insert into RequiredTechnology
values('Kotlin', 'Firmware', '5', 'IDE');

insert into RequiredTechnology
values('jUnit', 'Web', '3', 'Framework');

insert into RequiredTechnology
values('C#', 'Network', '0', 'Language');

insert into RequiredTechnology
values('Python', 'Firmware', '4', 'IDE');

insert into RequiredTechnology
values('R', 'Frontend', '0', 'Other');

insert into RequiredTechnology
values('MATLAB', 'Network', '2', 'Framework');

insert into RequiredTechnology
values('ABAP', 'Other', '2', 'Language');

insert into RequiredTechnology
values('Assembly', 'Firmware', '2', 'IDE');

insert into RequiredTechnology
values('JSON', 'Firmware', '0', 'Other');

insert into RequiredTechnology
values('REST', 'Web', '1', 'IDE');

insert into RequiredTechnology
values('MVC', 'Other', '5', 'IDE');

insert into RequiredTechnology
values('.Net', 'Other', '0', 'IDE');

insert into RequiredTechnology
values('Unity', 'Other', '5', 'Framework');

insert into RequiredTechnology
values('Mongo', 'Web', '2', 'Framework');

insert into RequiredTechnology
values('CosmosDb', 'Frontend', '3', 'Language');

insert into RequiredTechnology
values('ASP.NET', 'Other', '4', 'Framework');

-- insert into RequiredTechnology
-- values('.Net', 'Network', '1', 'Framework');

insert into RequiredTechnology
values('Git', 'Network', '1', 'Language');

insert into RequiredTechnology
values('Bitbucket', 'Backend', '0', 'Language');

insert into RequiredTechnology
values('Sourcetree', 'Web', '2', 'Framework');

insert into RequiredTechnology
values('Ruby', 'Firmware', '4', 'Other');

insert into RequiredTechnology
values('PHP', 'Backend', '0', 'IDE');

insert into RequiredTechnology
values('Vue', 'Frontend', '5', 'Framework');

insert into RequiredTechnology
values('SASS', 'Firmware', '3', 'Other');

insert into RequiredTechnology
values('React', 'Backend', '0', 'Framework');

insert into RequiredTechnology
values('Linux', 'Other', '1', 'Framework');

insert into RequiredTechnology
values('Typescript', 'Other', '2', 'Other');

insert into RequiredTechnology
values('MSSQL', 'Frontend', '4', 'Framework');

insert into JobPostingPosts
values('2tz51', 'Intel', 'Software', 'Team Lead', 'Sit sint magnam sit ut fugiat. Totam pariatur vel modi eaque nobis. Qui quasi iste et dolorem laborum ducimus voluptas. Voluptatibus qui quia dicta aut aperiam veritatis ut. Beatae culpa fugit cumque non totam est. Voluptatem incidunt optio ad perferendis sapiente. Quia ut porro et. Recusandae maiores fuga dolorem aut enim. Alias hic nulla aut quisquam sunt sapiente atque. Laborum repellendus deserunt est nihil modi. Enim dolorem quasi aut officia quia. Deleniti et explicabo dicta consequatur repudiandae ipsum. Ut eaque ut deleniti beatae laboriosam. Et repudiandae nulla quasi consequatur. Accusamus architecto et consequuntur ut quasi. Ut tempore voluptas odio. Totam animi illo praesentium nihil assumenda. Tempore vero vel laudantium minus at. Qui omnis occaecati quisquam illum et non suscipit.');

insert into JobPostingPosts
values('5fo52', 'Hootsuite', 'Hardware', 'Software Engineer in Test', 'Ad et veniam deserunt natus ut ut eligendi. At laborum odit nostrum quia quos nesciunt aut. Aut unde et alias doloremque iusto consequatur sit. Nesciunt aperiam porro ut eius veniam. Dolor est est ut repudiandae voluptate labore laudantium. Ipsam sunt quae quidem et commodi et itaque. Quibusdam corrupti et in ut adipisci ea nemo. Sapiente et sequi provident provident consequatur. Explicabo qui sequi nihil et consequatur totam aut eius. Asperiores ea sapiente sit incidunt minima. Et voluptatum labore quo totam qui aliquid. Et quibusdam facilis est. Sunt ducimus placeat placeat. Placeat reiciendis cum sed esse consequuntur. Recusandae quo dolorum sed nam. Laboriosam suscipit maiores quaerat sit ratione. Repellendus et officia fuga illo. Pariatur odio voluptas voluptates deserunt maxime qui esse. Nobis adipisci voluptatem ducimus rerum laborum. Dolorem modi nisi dolorum praesentium. Perferendis rerum sequi iure non sit alias.');

insert into JobPostingPosts
values('0nc05', 'Google', 'QA', 'Jr. Engineer', 'Et numquam eos voluptas est. Accusamus id eveniet ut voluptatum aperiam sed vero. Animi sint vel alias nulla. Cum tenetur sed atque in. Perspiciatis quia et minima deleniti sint et non. Aliquam et recusandae commodi suscipit. Deserunt natus pariatur quo ea dolorum. Et beatae illum nam quam cumque. Rerum modi voluptates maiores vero saepe. Ipsa illum delectus dolores ea eveniet accusantium. Quas voluptatem repudiandae eligendi eius. In omnis deserunt iusto dicta. Sit ut ullam voluptas quod corrupti voluptas. Rerum maxime suscipit quo voluptatum culpa esse sed rem. Ullam labore porro voluptas expedita et porro. Animi et doloribus eius dolores. Sequi quam est facilis et error quo blanditiis. Exercitationem doloribus aut perspiciatis excepturi nihil voluptas sint ea. Debitis nulla voluptatem rerum eos reiciendis. Quasi totam dolor facere placeat. Et minus sint beatae et. Similique incidunt error sapiente quo rerum ut.');

insert into JobPostingPosts
values('7er93', 'Facebook', 'QA', 'Full Stack Developer', 'Ut et et quibusdam. Non id velit soluta. Atque dolores nemo magnam quaerat maxime repellendus quae. Aperiam minus rem nesciunt et qui. Quos voluptas qui asperiores earum in pariatur est. Molestiae aut est molestiae id officiis. Tempore vel et eum minus. Sint facere amet saepe. Nam beatae ex sit similique exercitationem est. Impedit sunt in adipisci. Quia labore labore nobis et maxime sunt eaque. Ex ut omnis est optio deserunt sunt atque. Possimus itaque aperiam culpa dolore accusantium dolorum. Non doloribus placeat non nihil perspiciatis eius. Ipsum sit non dolorem inventore assumenda est maiores. Et illo sit dolore sed quis natus. Id suscipit et tempora omnis. Quis consequatur sunt eius sit. Officiis esse et earum totam libero repellat fugit. Consequatur dolorem velit neque molestias. Quis velit quas sint sint omnis earum. Ut qui laboriosam omnis asperiores id. At minima laudantium possimus ratione quisquam voluptatum. Voluptatem eum sed dignissimos facilis voluptatem nostrum.');

insert into JobPostingPosts
values('8oo50', 'Amazon', 'Hardware', 'Software Engineer in Test', 'Eveniet omnis consequuntur tenetur aspernatur amet. Labore reprehenderit ratione vel. Reiciendis dolore rerum aut sit vel quis. At iste sapiente delectus dolor. Tenetur aliquid rerum consequatur illo deserunt dolore. Earum error et fugiat consectetur eum ut ut. Excepturi distinctio quia nemo ab enim rerum placeat. Id atque qui iste maiores totam sit. Nam deserunt labore quisquam eum. Quia fugit quis ut porro. Rem voluptates magnam mollitia labore dignissimos consequatur at iure. Tenetur fuga eos deserunt autem et ad quis. Quasi et nemo reprehenderit autem qui repellendus et. Dolorem deleniti quo tenetur velit excepturi ipsum. Fugit totam molestiae quia est. Et et dolorem doloremque voluptas repellendus omnis. Voluptas ut saepe quasi rerum est rerum. Dolorum repellat voluptatem in quo. Ea fugit et sed quam rerum.');

insert into JobPostingPosts
values('1gv16', 'AppNeta', 'Software', 'Mobile Developer', 'Magni sit consequatur fugiat consectetur excepturi iusto ut est. Odio omnis nesciunt ut voluptas. Dolorem vel aut excepturi architecto. Dolorem ut nihil voluptates molestiae atque est. Ab hic quam ut delectus. Laboriosam sit est et sit. Deserunt harum enim et ex tempore. Neque voluptatum dolorem facilis. Facere iusto iste non. Aut dolorum aut quos totam ducimus cumque ad enim. Dolorum voluptatem cum dignissimos sed accusantium est blanditiis. Odit explicabo omnis autem assumenda aut. Et quis eum suscipit. Cum velit illum deserunt recusandae quos voluptatem asperiores voluptate. Quidem ullam officiis delectus. Similique quidem voluptatem rerum dolorem tenetur quia ratione. Aut rerum et ut quod quae. Vero dolorum quia aut repudiandae eligendi voluptates quis. Voluptatem nulla sit quod quis. Nostrum odio sit ducimus qui quia molestiae ut saepe. Sapiente minus fugit temporibus recusandae in.');

insert into JobPostingPosts
values('7xq30', 'Tasktop Technologies', 'Firmware', 'Web Developer', 'Voluptas debitis numquam sunt aspernatur dolor. Earum nam inventore esse. Voluptatem natus molestiae qui qui. Dolor eveniet est reprehenderit. Iusto incidunt reprehenderit quo sint est eius. Voluptatem laudantium magnam fugiat sed qui similique. Provident error aut possimus. Eius eos perspiciatis nobis recusandae sapiente sunt. Enim in animi perferendis et. Culpa ut magnam dolores ut ipsum et modi. Ducimus veritatis maxime consequatur laudantium molestiae dolorem. Aut tempore sit est aliquam. Rerum ut facere dolores ut maxime sed. Qui expedita ipsa accusantium reprehenderit dolores et. Rerum impedit ut commodi fugiat magnam nulla. Assumenda id labore voluptate eum autem. Consequatur dolor et enim numquam est illum laborum. Magnam delectus et quis velit. Cumque nobis culpa similique. Itaque assumenda repellat aperiam nulla fugit sint. Minus dignissimos fugiat excepturi et perspiciatis ratione. Accusamus ut odit dolor quia ab.');

insert into JobPostingPosts
values('6id12', 'Fatigue Science', 'Hardware', 'Junior Full Stack Developer', 'Tempora dolor earum voluptatibus dicta. Illum qui amet animi. Dolores ipsa sed earum odit. Necessitatibus sit voluptatem rerum veniam at dolorem vitae. Tenetur quia ut minima fugit aliquam enim. Voluptatem libero illum id voluptatem non nesciunt molestiae. Cupiditate non suscipit voluptatibus deserunt rerum. Dolor minima in assumenda corporis nam. Sit voluptatem quae maiores consectetur fuga quod. Quam unde dolorem tempora. Sit dicta reprehenderit delectus dolores id et. Veniam dicta tempora dolores officiis est sit. Distinctio atque molestiae ut minus. Id officia et nobis et eligendi veniam. Odio dolores quasi ipsum quasi maiores dolorum. Culpa dicta asperiores rerum veniam sunt ex labore nihil. Expedita qui et eligendi. Consectetur adipisci quia consequatur incidunt ut. Ut eos quidem tenetur quibusdam consequuntur. Fuga maiores rem perferendis quo et ipsa. Accusamus quia occaecati a laborum et. Fugiat eius veritatis non magni. Quos quod at quis ratione.');

insert into JobPostingPosts
values('5gi34', 'Absolute Software', 'Hardware', 'Full Stack Developer', 'Ad dolore dolor placeat. Veritatis ea enim voluptate et. Sunt qui voluptatem voluptatem quod. Debitis natus consequatur facere enim inventore quo voluptate. Nostrum voluptates unde earum occaecati beatae ducimus. Voluptatibus est distinctio quisquam fuga iure cum. Veritatis est itaque cum magnam unde. Odit voluptatem suscipit eligendi hic quaerat. Rerum soluta optio voluptatem assumenda occaecati id. Necessitatibus delectus laudantium temporibus eum repudiandae cumque dignissimos. Ut tempora accusantium fugiat illum. Aperiam quibusdam et voluptas aliquid laborum cumque fuga. Iusto autem architecto voluptatum. Dolores similique soluta incidunt et non vero. Voluptatem aut ut perferendis. Dolorum odio id qui enim maxime vero odit iure. In similique ut deserunt quibusdam delectus.');

insert into JobPostingPosts
values('4om22', 'SAP', 'Other', 'Coop Developer', 'Adipisci nobis dolore sapiente atque. Nam aperiam consequuntur aut sint reprehenderit. Nisi sit fugit voluptatum laborum excepturi. Nulla perspiciatis animi est quisquam deserunt blanditiis ut. Repudiandae repellendus non consequatur pariatur. Consequatur voluptas aut ratione. Alias soluta rerum iste nostrum est. Ut soluta illo hic in quia. Autem id fugiat amet harum. Nam qui minima illum ab eaque atque optio. Ullam natus aperiam ab dolorem consequuntur expedita. Dolores iure occaecati in nulla repellendus consequatur et. Molestias debitis aut sint distinctio rem. Corporis officia quia quia. In in eos quis facilis at sit. Voluptatum consequatur velit quia natus. Tempora dicta neque aliquam ipsa velit. Et molestiae non dolorem magnam. Autem labore et repellendus sed. Corrupti unde quis recusandae tempore rerum harum.');

insert into JobPostingPosts
values('6hu22', 'Trulioo', 'Other', 'Junior Soft Dev', 'Alias voluptatem illum qui fuga. Rerum magnam hic aut aut a. Id placeat voluptas expedita totam delectus. Omnis minus harum quo vel aperiam. Quas vero excepturi rerum repellat quo molestiae nulla et. Non possimus rerum qui vel commodi veniam quod. Maxime laudantium quo delectus et labore repudiandae inventore. In impedit voluptates corrupti incidunt. Temporibus ab harum earum consequatur magni. Quo doloremque deserunt maxime natus ducimus. Magni blanditiis et eos corrupti qui sit. Reiciendis animi voluptas sint cumque et dolorem esse. Magni fugiat occaecati hic qui id ea ducimus. Sed commodi necessitatibus est error. Excepturi eaque qui porro exercitationem eaque modi. Alias ipsum incidunt ut. Vero beatae voluptatum voluptas numquam ea nisi facere. Repellendus amet placeat aut saepe assumenda facere in. Voluptatem ea rerum et quo ut perferendis.');

insert into JobPostingPosts
values('8an91', 'Splunk', 'QA', 'Security Engineer', 'Qui at a modi in. Et dignissimos amet qui ea molestiae et. Dolorem impedit et impedit ullam provident nobis. Quaerat consequatur adipisci facilis consequatur nihil magni. Possimus harum et reprehenderit velit mollitia. Pariatur veritatis totam quo dolorum vel. Animi sequi officiis debitis sint veritatis. Minus voluptatem sed error labore dolore sequi. Quis dolorem non vero aliquam reiciendis et. Asperiores exercitationem voluptatibus neque eligendi est et harum consequatur. Sit voluptas velit reiciendis sapiente consequatur est. Impedit possimus qui mollitia rerum debitis ut laudantium. Sunt voluptatem fugit voluptatum consequuntur. Fugiat aperiam unde nulla. Veritatis eum est possimus. Est id sunt nihil et ea. Et ipsa minima minus in mollitia sed. Asperiores quia et maiores dolore eligendi et perspiciatis omnis. Inventore quia numquam cumque. Velit totam necessitatibus molestias qui. Asperiores omnis est nulla aperiam veritatis esse qui minus.');

insert into JobPostingPosts
values('1st75', 'Visier', 'Hardware', 'Jr. Engineer', 'Et numquam eos voluptas est. Accusamus id eveniet ut voluptatum aperiam sed vero. Animi sint vel alias nulla. Cum tenetur sed atque in. Perspiciatis quia et minima deleniti sint et non. Aliquam et recusandae commodi suscipit. Deserunt natus pariatur quo ea dolorum. Et beatae illum nam quam cumque. Rerum modi voluptates maiores vero saepe. Ipsa illum delectus dolores ea eveniet accusantium. Quas voluptatem repudiandae eligendi eius. In omnis deserunt iusto dicta. Sit ut ullam voluptas quod corrupti voluptas. Rerum maxime suscipit quo voluptatum culpa esse sed rem. Ullam labore porro voluptas expedita et porro. Animi et doloribus eius dolores. Sequi quam est facilis et error quo blanditiis. Exercitationem doloribus aut perspiciatis excepturi nihil voluptas sint ea. Debitis nulla voluptatem rerum eos reiciendis. Quasi totam dolor facere placeat. Et minus sint beatae et. Similique incidunt error sapiente quo rerum ut.');

insert into JobPostingPosts
values('7ki72', 'Mojio', 'Firmware', 'Junior Soft Dev', 'Dolore saepe quidem natus quidem omnis explicabo. Ut sit ad aliquam illo ratione molestiae eos. Sit perferendis sunt quis maiores quisquam molestias labore. Aliquam magnam perspiciatis voluptate error. Perspiciatis perspiciatis laborum sit dolores. Id ut aut non vel. Nemo ea ut et quibusdam est repellat. Eligendi tempore ipsum voluptas ad odit facere mollitia. Doloribus sit et voluptas nam sed quis officia. Nulla eum voluptatibus dolorem et. Nihil quo sunt architecto saepe perferendis. Qui esse quia et et sed id. Eum qui repudiandae consequatur voluptate quo nulla similique. Sint odit quos totam praesentium omnis illo. Mollitia sint delectus aliquid qui nulla aliquid illum. Voluptas impedit et libero est. Omnis et voluptas voluptas ex libero sit. Quam unde impedit corrupti doloribus nemo dicta. Aliquid dolores distinctio deserunt molestias sit aut voluptas. Sit nostrum neque sequi inventore error. Id a tempore ut. Eius impedit et cupiditate et sint vel officiis.');

insert into JobPostingPosts
values('4uj53', 'Yelp', 'Hardware', 'Jr. Mobile Developer', 'Voluptas autem dolores ex labore dolores corporis animi repellat. Autem deleniti voluptatem quia sequi eum. Possimus illum fugiat in odit eaque quod sint. Facilis et voluptates adipisci impedit est similique est est. Nihil est vel tempore architecto et placeat. Omnis ut error qui voluptatum natus culpa. Dolores consequatur aliquid autem quibusdam quo. Ex error eos nesciunt et occaecati voluptatibus soluta et. Nihil porro est ut nisi eos consequatur nulla. Molestiae sed officia voluptatem exercitationem facilis soluta. Eveniet sed magnam cupiditate delectus. Placeat voluptas enim dicta in nemo molestiae qui excepturi. Placeat id ratione molestias praesentium dolorem pariatur vel. Maiores sit a ipsam consequatur provident modi. Maxime tenetur consequatur placeat. Recusandae quia animi voluptas exercitationem. Hic molestiae magni tempore aut. Omnis dolorum autem autem. Quaerat quam totam non illum.');

insert into JobPostingPosts
values('4cq37', 'EA', 'Firmware', 'Coop Developer', 'Quo totam unde dolorem sed aspernatur omnis. Alias sunt et aut consequatur sapiente consequatur ipsam. Enim dolor sunt facilis aut. Aspernatur provident id et assumenda dolorem. Consequuntur nam laboriosam voluptas magnam architecto ea sed. Rerum maxime qui deserunt sapiente. Dolores doloribus est pariatur et fugiat. Quas reiciendis alias unde commodi impedit quae velit et. Consequuntur soluta et hic et. Libero enim est nihil natus ab nulla dolorum. Sit deleniti et eligendi aspernatur. Ut suscipit beatae officia rerum in. Et et illo eveniet est architecto neque. Sit et ratione assumenda sapiente voluptatem. Aspernatur eos sit est et velit dolores. Quo unde aperiam debitis. Et in aut qui ducimus rerum quae et iure. Qui saepe aliquam mollitia. Aut voluptatem ipsum consectetur est eum est alias. Molestiae deleniti velit officia nihil quod aut ullam. Dolorum aut magnam enim autem vitae id.');

insert into JobPostingPosts
values('5cd07', 'Ubisoft', 'QA', 'Software Developer Co-Op', 'Nam ducimus vitae explicabo repellendus. Similique et neque excepturi non et cupiditate at dolorem. Molestiae dolor autem qui assumenda. Modi ipsam illo dolorum voluptatem earum. Sed aliquid ex adipisci. Laudantium ex quidem non. Et deserunt blanditiis repudiandae molestiae quo voluptatem qui inventore. Aspernatur qui facilis saepe voluptate aspernatur dignissimos. Officia rerum quaerat placeat. Sunt nihil distinctio esse commodi qui ea aut. Ea natus error nostrum repudiandae eius voluptatum commodi. Autem dolorem placeat modi reiciendis. Est molestias dolores et minus qui non. Excepturi in animi harum esse distinctio. Ad culpa animi voluptas minima accusantium. Molestiae alias non natus necessitatibus repellendus fugiat. Eveniet voluptas placeat et nisi et non necessitatibus culpa. Amet aut facilis sit aperiam in. Fugit inventore distinctio quas nihil.');

insert into JobPostingPosts
values('2js33', 'Avigilon Corporation', 'Software', 'Mobile Developer', 'Ad dolore dolor placeat. Veritatis ea enim voluptate et. Sunt qui voluptatem voluptatem quod. Debitis natus consequatur facere enim inventore quo voluptate. Nostrum voluptates unde earum occaecati beatae ducimus. Voluptatibus est distinctio quisquam fuga iure cum. Veritatis est itaque cum magnam unde. Odit voluptatem suscipit eligendi hic quaerat. Rerum soluta optio voluptatem assumenda occaecati id. Necessitatibus delectus laudantium temporibus eum repudiandae cumque dignissimos. Ut tempora accusantium fugiat illum. Aperiam quibusdam et voluptas aliquid laborum cumque fuga. Iusto autem architecto voluptatum. Dolores similique soluta incidunt et non vero. Voluptatem aut ut perferendis. Dolorum odio id qui enim maxime vero odit iure. In similique ut deserunt quibusdam delectus.');

insert into JobPostingPosts
values('8ob06', 'Ayogo', 'Firmware', 'Backend Engineer', 'Sint vel et culpa alias. Et ut in quaerat doloribus. Dolorem maxime iure asperiores accusantium. Asperiores optio quia natus sint. Culpa error architecto aut aut. Impedit deleniti sunt eos provident maxime exercitationem. Eveniet aspernatur quisquam sed est. Sequi beatae sed a eum in. Eos eos iusto non eius. Accusantium est vitae doloribus dicta ipsam nostrum. Aut aut rerum laborum voluptatibus enim expedita sit. Asperiores voluptas corporis voluptas nostrum impedit aspernatur. Quae accusamus est dolor excepturi est eveniet. Omnis quia deserunt nisi magni autem ipsa. Sint eum qui inventore maiores sapiente facilis. Repudiandae id possimus doloremque maxime molestiae. Et quis sint nesciunt eaque facere. Consequatur est minima expedita ut. Voluptatem iure ex voluptate modi earum aut. Et qui odit dolore eveniet aut libero soluta. Quia culpa sit eum excepturi eius voluptatum. Ea ea recusandae laborum qui magni. Aut tenetur molestiae est omnis sint nostrum minima provident.');

insert into JobPostingPosts
values('2xs18', 'Intel', 'Firmware', 'Frontend Developer', 'Et numquam eos voluptas est. Accusamus id eveniet ut voluptatum aperiam sed vero. Animi sint vel alias nulla. Cum tenetur sed atque in. Perspiciatis quia et minima deleniti sint et non. Aliquam et recusandae commodi suscipit. Deserunt natus pariatur quo ea dolorum. Et beatae illum nam quam cumque. Rerum modi voluptates maiores vero saepe. Ipsa illum delectus dolores ea eveniet accusantium. Quas voluptatem repudiandae eligendi eius. In omnis deserunt iusto dicta. Sit ut ullam voluptas quod corrupti voluptas. Rerum maxime suscipit quo voluptatum culpa esse sed rem. Ullam labore porro voluptas expedita et porro. Animi et doloribus eius dolores. Sequi quam est facilis et error quo blanditiis. Exercitationem doloribus aut perspiciatis excepturi nihil voluptas sint ea. Debitis nulla voluptatem rerum eos reiciendis. Quasi totam dolor facere placeat. Et minus sint beatae et. Similique incidunt error sapiente quo rerum ut.');

insert into JobPostingPosts
values('2qb13', 'Hootsuite', 'Project Management', 'Jr. Software Developer', 'Quisquam sint aliquam quae aliquid at inventore autem. Deserunt eligendi possimus placeat quibusdam totam. In et aut repellendus qui. Mollitia facilis soluta voluptas omnis sunt ratione dicta quis. Dolores exercitationem quia ut neque. Porro exercitationem rem velit quia voluptatem iste necessitatibus. At velit eius in quia hic quis. Blanditiis rerum omnis et ut. Facere in ut saepe ipsum dolorem. Quasi rerum corrupti culpa explicabo. Cupiditate tenetur dolorem sit. Vel eum occaecati tempore libero. Incidunt facere voluptatibus ut quo perferendis. Iusto impedit alias quae sit. Hic officiis ex vel veritatis eveniet minima unde. Non delectus ab ut occaecati. Qui rem ad possimus in molestias tenetur. Sed in incidunt quasi est. Velit autem a iusto veritatis quod. Dolores assumenda temporibus et libero commodi facere. Et nihil aut mollitia magnam repellendus soluta repellat. Et ad quod dolorem nam necessitatibus aut.');

insert into JobPostingPosts
values('6ra55', 'Google', 'Project Management', 'QA', 'Minus ipsa repudiandae dignissimos. Molestiae qui dolor quis iste neque. Consequatur itaque unde praesentium culpa similique temporibus. Exercitationem sed illum quia aut in blanditiis rerum. Aut necessitatibus qui minima ad blanditiis doloremque explicabo repudiandae. Porro distinctio non voluptatem in ea. Ipsam error omnis sint dicta doloribus. Aperiam sit cupiditate fuga ullam magni qui ratione. Eius nobis alias asperiores. Ad minima placeat tempora eum totam. Ea consectetur quaerat culpa odio. Rem aliquam dolor quos harum voluptas. Ipsum mollitia velit non omnis excepturi omnis expedita officiis. Incidunt nisi tenetur eius qui blanditiis commodi. Veritatis assumenda laudantium accusamus corporis iure quia aut. Dolor debitis unde non sed non eum. Natus non quisquam est fugit. Explicabo sed aut assumenda alias non est. Porro et repellat quae ipsam ut. Et provident eaque nam aut.');

insert into JobPostingPosts
values('5fg14', 'Facebook', 'Project Management', 'Junior Full Stack Developer', 'Ut est qui natus ducimus. Excepturi reiciendis voluptas velit. Commodi modi eveniet praesentium velit. Quasi saepe quis aut omnis sed illo vel. Molestiae perspiciatis numquam hic ullam eveniet. Eius id delectus culpa quia blanditiis esse optio. A ab ea hic sunt recusandae tempora. Sit est inventore aut et ea praesentium soluta. Est est vel qui molestiae consequatur quo. Quae aut ut iure qui id distinctio modi. Harum dolorem et blanditiis saepe distinctio illum amet. Soluta quod quas omnis commodi ex quaerat eum. Ab facere quia eaque et. Sunt tempora doloribus quia blanditiis et. Rerum qui et culpa architecto ea alias. Vitae dignissimos sapiente voluptatum quas molestias enim facere ipsum. Aspernatur aliquam aliquam delectus consequuntur. Dolore voluptatum quod voluptatem voluptatem similique et. Praesentium possimus reprehenderit velit vero. Eos deleniti a vero est ut.');

insert into JobPostingPosts
values('6wu40', 'Amazon', 'QA', 'Software Engineer in Test', 'Dolore saepe quidem natus quidem omnis explicabo. Ut sit ad aliquam illo ratione molestiae eos. Sit perferendis sunt quis maiores quisquam molestias labore. Aliquam magnam perspiciatis voluptate error. Perspiciatis perspiciatis laborum sit dolores. Id ut aut non vel. Nemo ea ut et quibusdam est repellat. Eligendi tempore ipsum voluptas ad odit facere mollitia. Doloribus sit et voluptas nam sed quis officia. Nulla eum voluptatibus dolorem et. Nihil quo sunt architecto saepe perferendis. Qui esse quia et et sed id. Eum qui repudiandae consequatur voluptate quo nulla similique. Sint odit quos totam praesentium omnis illo. Mollitia sint delectus aliquid qui nulla aliquid illum. Voluptas impedit et libero est. Omnis et voluptas voluptas ex libero sit. Quam unde impedit corrupti doloribus nemo dicta. Aliquid dolores distinctio deserunt molestias sit aut voluptas. Sit nostrum neque sequi inventore error. Id a tempore ut. Eius impedit et cupiditate et sint vel officiis.');

insert into JobPostingPosts
values('1vz66', 'AppNeta', 'Software', 'Full Stack Developer', 'Voluptas debitis numquam sunt aspernatur dolor. Earum nam inventore esse. Voluptatem natus molestiae qui qui. Dolor eveniet est reprehenderit. Iusto incidunt reprehenderit quo sint est eius. Voluptatem laudantium magnam fugiat sed qui similique. Provident error aut possimus. Eius eos perspiciatis nobis recusandae sapiente sunt. Enim in animi perferendis et. Culpa ut magnam dolores ut ipsum et modi. Ducimus veritatis maxime consequatur laudantium molestiae dolorem. Aut tempore sit est aliquam. Rerum ut facere dolores ut maxime sed. Qui expedita ipsa accusantium reprehenderit dolores et. Rerum impedit ut commodi fugiat magnam nulla. Assumenda id labore voluptate eum autem. Consequatur dolor et enim numquam est illum laborum. Magnam delectus et quis velit. Cumque nobis culpa similique. Itaque assumenda repellat aperiam nulla fugit sint. Minus dignissimos fugiat excepturi et perspiciatis ratione. Accusamus ut odit dolor quia ab.');

insert into JobPostingPosts
values('5df81', 'Tasktop Technologies', 'Other', 'Junior Soft Dev', 'Sint vel et culpa alias. Et ut in quaerat doloribus. Dolorem maxime iure asperiores accusantium. Asperiores optio quia natus sint. Culpa error architecto aut aut. Impedit deleniti sunt eos provident maxime exercitationem. Eveniet aspernatur quisquam sed est. Sequi beatae sed a eum in. Eos eos iusto non eius. Accusantium est vitae doloribus dicta ipsam nostrum. Aut aut rerum laborum voluptatibus enim expedita sit. Asperiores voluptas corporis voluptas nostrum impedit aspernatur. Quae accusamus est dolor excepturi est eveniet. Omnis quia deserunt nisi magni autem ipsa. Sint eum qui inventore maiores sapiente facilis. Repudiandae id possimus doloremque maxime molestiae. Et quis sint nesciunt eaque facere. Consequatur est minima expedita ut. Voluptatem iure ex voluptate modi earum aut. Et qui odit dolore eveniet aut libero soluta. Quia culpa sit eum excepturi eius voluptatum. Ea ea recusandae laborum qui magni. Aut tenetur molestiae est omnis sint nostrum minima provident.');

insert into JobPostingPosts
values('5in26', 'Fatigue Science', 'Firmware', 'Junior Soft Dev', 'Et numquam eos voluptas est. Accusamus id eveniet ut voluptatum aperiam sed vero. Animi sint vel alias nulla. Cum tenetur sed atque in. Perspiciatis quia et minima deleniti sint et non. Aliquam et recusandae commodi suscipit. Deserunt natus pariatur quo ea dolorum. Et beatae illum nam quam cumque. Rerum modi voluptates maiores vero saepe. Ipsa illum delectus dolores ea eveniet accusantium. Quas voluptatem repudiandae eligendi eius. In omnis deserunt iusto dicta. Sit ut ullam voluptas quod corrupti voluptas. Rerum maxime suscipit quo voluptatum culpa esse sed rem. Ullam labore porro voluptas expedita et porro. Animi et doloribus eius dolores. Sequi quam est facilis et error quo blanditiis. Exercitationem doloribus aut perspiciatis excepturi nihil voluptas sint ea. Debitis nulla voluptatem rerum eos reiciendis. Quasi totam dolor facere placeat. Et minus sint beatae et. Similique incidunt error sapiente quo rerum ut.');

insert into JobPostingPosts
values('9ri86', 'Absolute Software', 'Firmware', 'Frontend Engineer', 'Quisquam sint aliquam quae aliquid at inventore autem. Deserunt eligendi possimus placeat quibusdam totam. In et aut repellendus qui. Mollitia facilis soluta voluptas omnis sunt ratione dicta quis. Dolores exercitationem quia ut neque. Porro exercitationem rem velit quia voluptatem iste necessitatibus. At velit eius in quia hic quis. Blanditiis rerum omnis et ut. Facere in ut saepe ipsum dolorem. Quasi rerum corrupti culpa explicabo. Cupiditate tenetur dolorem sit. Vel eum occaecati tempore libero. Incidunt facere voluptatibus ut quo perferendis. Iusto impedit alias quae sit. Hic officiis ex vel veritatis eveniet minima unde. Non delectus ab ut occaecati. Qui rem ad possimus in molestias tenetur. Sed in incidunt quasi est. Velit autem a iusto veritatis quod. Dolores assumenda temporibus et libero commodi facere. Et nihil aut mollitia magnam repellendus soluta repellat. Et ad quod dolorem nam necessitatibus aut.');

insert into JobPostingPosts
values('1sq51', 'SAP', 'QA', 'Junior Full Stack Developer', 'Voluptatibus sunt repellendus sapiente et. Voluptas voluptatem molestiae praesentium rerum. Nihil assumenda ea repudiandae adipisci iusto. Est atque rem est ea voluptates cumque nemo. Voluptatem et quis voluptatem sed sint quia. Possimus tempore amet corporis soluta consectetur. Eligendi quia quam nihil totam quod et. Occaecati doloremque eligendi eius laboriosam omnis optio aut. Libero facilis in et optio perspiciatis eius accusantium qui. Omnis ut quasi voluptas earum ipsam quia qui tempore. Animi blanditiis ipsum ducimus necessitatibus corporis. Est veritatis et corrupti atque nihil voluptatibus animi. Voluptatem provident dicta incidunt aut nam aut. At dolore atque architecto autem quam velit. Totam mollitia culpa possimus ut eaque recusandae. Minima iure qui aliquid cum error sapiente est optio. Quia ea dolores consequatur.');

insert into JobPostingPosts
values('8er49', 'Trulioo', 'Hardware', 'Infrastructure Engineer', 'Sit sint magnam sit ut fugiat. Totam pariatur vel modi eaque nobis. Qui quasi iste et dolorem laborum ducimus voluptas. Voluptatibus qui quia dicta aut aperiam veritatis ut. Beatae culpa fugit cumque non totam est. Voluptatem incidunt optio ad perferendis sapiente. Quia ut porro et. Recusandae maiores fuga dolorem aut enim. Alias hic nulla aut quisquam sunt sapiente atque. Laborum repellendus deserunt est nihil modi. Enim dolorem quasi aut officia quia. Deleniti et explicabo dicta consequatur repudiandae ipsum. Ut eaque ut deleniti beatae laboriosam. Et repudiandae nulla quasi consequatur. Accusamus architecto et consequuntur ut quasi. Ut tempore voluptas odio. Totam animi illo praesentium nihil assumenda. Tempore vero vel laudantium minus at. Qui omnis occaecati quisquam illum et non suscipit.');

insert into JobPostingPosts
values('6bo14', 'Splunk', 'Software', 'Intern', 'Minus ipsa repudiandae dignissimos. Molestiae qui dolor quis iste neque. Consequatur itaque unde praesentium culpa similique temporibus. Exercitationem sed illum quia aut in blanditiis rerum. Aut necessitatibus qui minima ad blanditiis doloremque explicabo repudiandae. Porro distinctio non voluptatem in ea. Ipsam error omnis sint dicta doloribus. Aperiam sit cupiditate fuga ullam magni qui ratione. Eius nobis alias asperiores. Ad minima placeat tempora eum totam. Ea consectetur quaerat culpa odio. Rem aliquam dolor quos harum voluptas. Ipsum mollitia velit non omnis excepturi omnis expedita officiis. Incidunt nisi tenetur eius qui blanditiis commodi. Veritatis assumenda laudantium accusamus corporis iure quia aut. Dolor debitis unde non sed non eum. Natus non quisquam est fugit. Explicabo sed aut assumenda alias non est. Porro et repellat quae ipsam ut. Et provident eaque nam aut.');

insert into JobPostingPosts
values('9ez37', 'Visier', 'Other', 'Backend Engineer', 'In maxime voluptatem qui praesentium corrupti aperiam non. Perspiciatis sed voluptatum at ea sed optio sunt laborum. Architecto et exercitationem et veritatis qui repudiandae. Enim voluptatum et sed explicabo iure blanditiis. Aut labore sequi omnis nobis ipsa. Voluptates dolores quasi voluptatem esse qui. Sunt atque culpa non. Beatae et eligendi iusto esse aut incidunt. Deserunt beatae ut tenetur autem maiores maxime. Nostrum qui dolor tenetur maiores. Voluptatem ea sed pariatur. Suscipit eos molestiae debitis rerum suscipit. Ducimus rerum delectus quo a doloribus adipisci sapiente. Minima temporibus et cum libero. Aperiam quibusdam quibusdam aliquam doloremque. Quaerat sapiente accusantium dolorum sapiente est. Reprehenderit neque quas dolorem explicabo modi perspiciatis. Consequatur praesentium asperiores nulla maxime repudiandae nesciunt in. Ad ut vero excepturi maxime. Dolore aut quo et iusto delectus quia quae aut. Neque reiciendis eos non consequatur reprehenderit tempora sunt.');

insert into JobPostingPosts
values('2ox78', 'Mojio', 'Firmware', 'Security Engineer', 'Reprehenderit odit quisquam unde doloribus qui. Facilis suscipit aut voluptatem non dolorem impedit illo. Doloribus in facilis quo minus recusandae quis vero. Tempore et dolor harum incidunt fuga. Culpa perferendis suscipit distinctio quisquam perferendis tenetur. Mollitia et laborum libero consequuntur unde. Ut ipsa sed quae ratione velit. Velit dolor ducimus ut ut delectus. Cupiditate aspernatur praesentium ab tempora est. Totam repellendus qui dolorum accusantium. Soluta aut odit laudantium laborum eveniet. Dolores officia explicabo ducimus deleniti culpa. Eligendi pariatur corporis occaecati alias non et sint officiis. Molestias accusamus porro non ut. Ut omnis consequuntur quod eveniet omnis ad rem. Ut a velit quia praesentium aperiam. Rerum ipsam ut itaque laboriosam qui. Repellat animi dignissimos illo at dolorem quae enim.');

insert into JobPostingPosts
values('5wi76', 'Yelp', 'Project Management', 'Web Developer', 'Ut est qui natus ducimus. Excepturi reiciendis voluptas velit. Commodi modi eveniet praesentium velit. Quasi saepe quis aut omnis sed illo vel. Molestiae perspiciatis numquam hic ullam eveniet. Eius id delectus culpa quia blanditiis esse optio. A ab ea hic sunt recusandae tempora. Sit est inventore aut et ea praesentium soluta. Est est vel qui molestiae consequatur quo. Quae aut ut iure qui id distinctio modi. Harum dolorem et blanditiis saepe distinctio illum amet. Soluta quod quas omnis commodi ex quaerat eum. Ab facere quia eaque et. Sunt tempora doloribus quia blanditiis et. Rerum qui et culpa architecto ea alias. Vitae dignissimos sapiente voluptatum quas molestias enim facere ipsum. Aspernatur aliquam aliquam delectus consequuntur. Dolore voluptatum quod voluptatem voluptatem similique et. Praesentium possimus reprehenderit velit vero. Eos deleniti a vero est ut.');

insert into JobPostingPosts
values('5hv85', 'EA', 'Software', 'Junior Mobile Developer', 'Magni sit consequatur fugiat consectetur excepturi iusto ut est. Odio omnis nesciunt ut voluptas. Dolorem vel aut excepturi architecto. Dolorem ut nihil voluptates molestiae atque est. Ab hic quam ut delectus. Laboriosam sit est et sit. Deserunt harum enim et ex tempore. Neque voluptatum dolorem facilis. Facere iusto iste non. Aut dolorum aut quos totam ducimus cumque ad enim. Dolorum voluptatem cum dignissimos sed accusantium est blanditiis. Odit explicabo omnis autem assumenda aut. Et quis eum suscipit. Cum velit illum deserunt recusandae quos voluptatem asperiores voluptate. Quidem ullam officiis delectus. Similique quidem voluptatem rerum dolorem tenetur quia ratione. Aut rerum et ut quod quae. Vero dolorum quia aut repudiandae eligendi voluptates quis. Voluptatem nulla sit quod quis. Nostrum odio sit ducimus qui quia molestiae ut saepe. Sapiente minus fugit temporibus recusandae in.');

insert into JobPostingPosts
values('7ma03', 'Ubisoft', 'Project Management', 'Mobile Developer', 'Minus ipsa repudiandae dignissimos. Molestiae qui dolor quis iste neque. Consequatur itaque unde praesentium culpa similique temporibus. Exercitationem sed illum quia aut in blanditiis rerum. Aut necessitatibus qui minima ad blanditiis doloremque explicabo repudiandae. Porro distinctio non voluptatem in ea. Ipsam error omnis sint dicta doloribus. Aperiam sit cupiditate fuga ullam magni qui ratione. Eius nobis alias asperiores. Ad minima placeat tempora eum totam. Ea consectetur quaerat culpa odio. Rem aliquam dolor quos harum voluptas. Ipsum mollitia velit non omnis excepturi omnis expedita officiis. Incidunt nisi tenetur eius qui blanditiis commodi. Veritatis assumenda laudantium accusamus corporis iure quia aut. Dolor debitis unde non sed non eum. Natus non quisquam est fugit. Explicabo sed aut assumenda alias non est. Porro et repellat quae ipsam ut. Et provident eaque nam aut.');

insert into JobPostingPosts
values('1rj01', 'Avigilon Corporation', 'Other', 'Software Developer', 'Dolores culpa omnis ad aliquam quos quod rerum. Dolore quo quo ex pariatur nihil eveniet illo. Aut enim a qui quam consectetur ducimus rem. Id est aut occaecati distinctio aut aut. Sint est itaque aspernatur quaerat tenetur rerum. Ut ea commodi alias tempora id. Rerum enim ea aperiam aut mollitia. Ratione illo dolore molestias quis voluptate. Molestiae autem adipisci odit et voluptatum a. Voluptatem unde aliquam et quae sed. Aperiam sequi dolorem omnis repudiandae. Voluptatem provident exercitationem qui. Modi sint numquam ipsam possimus et fuga. Consequuntur rerum sint dignissimos facilis neque molestias. Pariatur nobis magnam quia omnis recusandae aperiam. Incidunt et voluptate nihil cupiditate sapiente maiores sed. Nisi illo libero sint at ut temporibus. Harum quo suscipit reiciendis soluta ipsa temporibus quasi et.');

insert into JobPostingPosts
values('5et30', 'Ayogo', 'Hardware', 'Jr. Mobile Developer', 'Adipisci nobis dolore sapiente atque. Nam aperiam consequuntur aut sint reprehenderit. Nisi sit fugit voluptatum laborum excepturi. Nulla perspiciatis animi est quisquam deserunt blanditiis ut. Repudiandae repellendus non consequatur pariatur. Consequatur voluptas aut ratione. Alias soluta rerum iste nostrum est. Ut soluta illo hic in quia. Autem id fugiat amet harum. Nam qui minima illum ab eaque atque optio. Ullam natus aperiam ab dolorem consequuntur expedita. Dolores iure occaecati in nulla repellendus consequatur et. Molestias debitis aut sint distinctio rem. Corporis officia quia quia. In in eos quis facilis at sit. Voluptatum consequatur velit quia natus. Tempora dicta neque aliquam ipsa velit. Et molestiae non dolorem magnam. Autem labore et repellendus sed. Corrupti unde quis recusandae tempore rerum harum.');

insert into JobPostingPosts
values('9qk53', 'Intel', 'Project Management', 'QA', 'Ut et et quibusdam. Non id velit soluta. Atque dolores nemo magnam quaerat maxime repellendus quae. Aperiam minus rem nesciunt et qui. Quos voluptas qui asperiores earum in pariatur est. Molestiae aut est molestiae id officiis. Tempore vel et eum minus. Sint facere amet saepe. Nam beatae ex sit similique exercitationem est. Impedit sunt in adipisci. Quia labore labore nobis et maxime sunt eaque. Ex ut omnis est optio deserunt sunt atque. Possimus itaque aperiam culpa dolore accusantium dolorum. Non doloribus placeat non nihil perspiciatis eius. Ipsum sit non dolorem inventore assumenda est maiores. Et illo sit dolore sed quis natus. Id suscipit et tempora omnis. Quis consequatur sunt eius sit. Officiis esse et earum totam libero repellat fugit. Consequatur dolorem velit neque molestias. Quis velit quas sint sint omnis earum. Ut qui laboriosam omnis asperiores id. At minima laudantium possimus ratione quisquam voluptatum. Voluptatem eum sed dignissimos facilis voluptatem nostrum.');

insert into JobPostingPosts
values('4cu97', 'Hootsuite', 'QA', 'Jr. Software Developer', 'In maxime voluptatem qui praesentium corrupti aperiam non. Perspiciatis sed voluptatum at ea sed optio sunt laborum. Architecto et exercitationem et veritatis qui repudiandae. Enim voluptatum et sed explicabo iure blanditiis. Aut labore sequi omnis nobis ipsa. Voluptates dolores quasi voluptatem esse qui. Sunt atque culpa non. Beatae et eligendi iusto esse aut incidunt. Deserunt beatae ut tenetur autem maiores maxime. Nostrum qui dolor tenetur maiores. Voluptatem ea sed pariatur. Suscipit eos molestiae debitis rerum suscipit. Ducimus rerum delectus quo a doloribus adipisci sapiente. Minima temporibus et cum libero. Aperiam quibusdam quibusdam aliquam doloremque. Quaerat sapiente accusantium dolorum sapiente est. Reprehenderit neque quas dolorem explicabo modi perspiciatis. Consequatur praesentium asperiores nulla maxime repudiandae nesciunt in. Ad ut vero excepturi maxime. Dolore aut quo et iusto delectus quia quae aut. Neque reiciendis eos non consequatur reprehenderit tempora sunt.');

insert into JobPostingPosts
values('9ag71', 'Google', 'Hardware', 'Full Stack Developer', 'Dolore saepe quidem natus quidem omnis explicabo. Ut sit ad aliquam illo ratione molestiae eos. Sit perferendis sunt quis maiores quisquam molestias labore. Aliquam magnam perspiciatis voluptate error. Perspiciatis perspiciatis laborum sit dolores. Id ut aut non vel. Nemo ea ut et quibusdam est repellat. Eligendi tempore ipsum voluptas ad odit facere mollitia. Doloribus sit et voluptas nam sed quis officia. Nulla eum voluptatibus dolorem et. Nihil quo sunt architecto saepe perferendis. Qui esse quia et et sed id. Eum qui repudiandae consequatur voluptate quo nulla similique. Sint odit quos totam praesentium omnis illo. Mollitia sint delectus aliquid qui nulla aliquid illum. Voluptas impedit et libero est. Omnis et voluptas voluptas ex libero sit. Quam unde impedit corrupti doloribus nemo dicta. Aliquid dolores distinctio deserunt molestias sit aut voluptas. Sit nostrum neque sequi inventore error. Id a tempore ut. Eius impedit et cupiditate et sint vel officiis.');

insert into JobPostingPosts
values('4yv88', 'Facebook', 'Other', 'Backend Developer', 'Adipisci nobis dolore sapiente atque. Nam aperiam consequuntur aut sint reprehenderit. Nisi sit fugit voluptatum laborum excepturi. Nulla perspiciatis animi est quisquam deserunt blanditiis ut. Repudiandae repellendus non consequatur pariatur. Consequatur voluptas aut ratione. Alias soluta rerum iste nostrum est. Ut soluta illo hic in quia. Autem id fugiat amet harum. Nam qui minima illum ab eaque atque optio. Ullam natus aperiam ab dolorem consequuntur expedita. Dolores iure occaecati in nulla repellendus consequatur et. Molestias debitis aut sint distinctio rem. Corporis officia quia quia. In in eos quis facilis at sit. Voluptatum consequatur velit quia natus. Tempora dicta neque aliquam ipsa velit. Et molestiae non dolorem magnam. Autem labore et repellendus sed. Corrupti unde quis recusandae tempore rerum harum.');

insert into JobPostingPosts
values('2ee35', 'Amazon', 'QA', 'Backend Developer', 'Quae nesciunt perferendis distinctio. Cumque inventore quia asperiores repellendus dignissimos reiciendis in consequatur. Eius et minus veniam magni voluptas atque. Eligendi necessitatibus optio ut et vero cupiditate doloribus earum. Et dolorum fugiat doloribus repudiandae ut recusandae qui. Nihil ab ut sit repellendus natus iure. Omnis laudantium facere natus consequatur id incidunt. Error doloribus et sunt ut. Et a veritatis minima aut quam. Vitae ipsam libero modi omnis aperiam nemo nesciunt. Rerum eveniet vero ex aliquid laboriosam et. Sit sed id nam molestiae doloremque. Aspernatur deserunt nisi perspiciatis eos eligendi. Sed deleniti omnis ipsa quaerat. Iusto dolorem cumque aut in. Corporis consequatur impedit eveniet sint rerum. Provident adipisci quidem laudantium dolorem voluptate eius sit. Rerum minus fuga est quaerat explicabo officia magni. Non maiores iure et eius. Deserunt ducimus amet minima ut et distinctio. Id illo molestiae omnis doloremque.');

insert into JobPostingPosts
values('0cy27', 'AppNeta', 'Other', 'Frontend Developer', 'Sit sint magnam sit ut fugiat. Totam pariatur vel modi eaque nobis. Qui quasi iste et dolorem laborum ducimus voluptas. Voluptatibus qui quia dicta aut aperiam veritatis ut. Beatae culpa fugit cumque non totam est. Voluptatem incidunt optio ad perferendis sapiente. Quia ut porro et. Recusandae maiores fuga dolorem aut enim. Alias hic nulla aut quisquam sunt sapiente atque. Laborum repellendus deserunt est nihil modi. Enim dolorem quasi aut officia quia. Deleniti et explicabo dicta consequatur repudiandae ipsum. Ut eaque ut deleniti beatae laboriosam. Et repudiandae nulla quasi consequatur. Accusamus architecto et consequuntur ut quasi. Ut tempore voluptas odio. Totam animi illo praesentium nihil assumenda. Tempore vero vel laudantium minus at. Qui omnis occaecati quisquam illum et non suscipit.');

insert into JobPostingPosts
values('9qg47', 'Tasktop Technologies', 'Hardware', 'Full Stack Developer', 'Ut est qui natus ducimus. Excepturi reiciendis voluptas velit. Commodi modi eveniet praesentium velit. Quasi saepe quis aut omnis sed illo vel. Molestiae perspiciatis numquam hic ullam eveniet. Eius id delectus culpa quia blanditiis esse optio. A ab ea hic sunt recusandae tempora. Sit est inventore aut et ea praesentium soluta. Est est vel qui molestiae consequatur quo. Quae aut ut iure qui id distinctio modi. Harum dolorem et blanditiis saepe distinctio illum amet. Soluta quod quas omnis commodi ex quaerat eum. Ab facere quia eaque et. Sunt tempora doloribus quia blanditiis et. Rerum qui et culpa architecto ea alias. Vitae dignissimos sapiente voluptatum quas molestias enim facere ipsum. Aspernatur aliquam aliquam delectus consequuntur. Dolore voluptatum quod voluptatem voluptatem similique et. Praesentium possimus reprehenderit velit vero. Eos deleniti a vero est ut.');

insert into JobPostingPosts
values('2nh99', 'Fatigue Science', 'Other', 'Jr. Mobile Developer', 'Quae nesciunt perferendis distinctio. Cumque inventore quia asperiores repellendus dignissimos reiciendis in consequatur. Eius et minus veniam magni voluptas atque. Eligendi necessitatibus optio ut et vero cupiditate doloribus earum. Et dolorum fugiat doloribus repudiandae ut recusandae qui. Nihil ab ut sit repellendus natus iure. Omnis laudantium facere natus consequatur id incidunt. Error doloribus et sunt ut. Et a veritatis minima aut quam. Vitae ipsam libero modi omnis aperiam nemo nesciunt. Rerum eveniet vero ex aliquid laboriosam et. Sit sed id nam molestiae doloremque. Aspernatur deserunt nisi perspiciatis eos eligendi. Sed deleniti omnis ipsa quaerat. Iusto dolorem cumque aut in. Corporis consequatur impedit eveniet sint rerum. Provident adipisci quidem laudantium dolorem voluptate eius sit. Rerum minus fuga est quaerat explicabo officia magni. Non maiores iure et eius. Deserunt ducimus amet minima ut et distinctio. Id illo molestiae omnis doloremque.');

insert into JobPostingPosts
values('8rm09', 'Absolute Software', 'Other', 'Coop Developer', 'Minus ipsa repudiandae dignissimos. Molestiae qui dolor quis iste neque. Consequatur itaque unde praesentium culpa similique temporibus. Exercitationem sed illum quia aut in blanditiis rerum. Aut necessitatibus qui minima ad blanditiis doloremque explicabo repudiandae. Porro distinctio non voluptatem in ea. Ipsam error omnis sint dicta doloribus. Aperiam sit cupiditate fuga ullam magni qui ratione. Eius nobis alias asperiores. Ad minima placeat tempora eum totam. Ea consectetur quaerat culpa odio. Rem aliquam dolor quos harum voluptas. Ipsum mollitia velit non omnis excepturi omnis expedita officiis. Incidunt nisi tenetur eius qui blanditiis commodi. Veritatis assumenda laudantium accusamus corporis iure quia aut. Dolor debitis unde non sed non eum. Natus non quisquam est fugit. Explicabo sed aut assumenda alias non est. Porro et repellat quae ipsam ut. Et provident eaque nam aut.');

insert into JobPostingPosts
values('4be08', 'SAP', 'QA', 'Web Developer', 'Et error eum aut. Et perferendis dolorem aut mollitia excepturi. Qui ut adipisci at consequatur qui architecto et. Eaque voluptates officiis quibusdam. Est rerum inventore sed explicabo. Neque qui accusamus repudiandae soluta. Recusandae et recusandae quis nihil. Omnis sequi qui qui odio ipsa veniam laboriosam. Sapiente rem dolorem illo unde. Iure rerum facilis ut fuga est non porro. Provident voluptatum beatae consectetur dolor architecto aut iure sint. Provident nam itaque eius illum. Dolor alias unde nisi tempore. Voluptate tenetur et voluptatem sunt. A magni odit necessitatibus error dolorem facilis neque. Ad et et at ipsam. Dolor repudiandae qui itaque similique accusamus eos. Dolorem facilis culpa explicabo et. Tenetur inventore pariatur eum reprehenderit occaecati. Reiciendis quia non exercitationem excepturi molestiae iste. Dolor et voluptas odio. Beatae ut laudantium autem.');

insert into JobPostingPosts
values('5pu05', 'Trulioo', 'Hardware', 'Full Stack Developer', 'Ut est qui natus ducimus. Excepturi reiciendis voluptas velit. Commodi modi eveniet praesentium velit. Quasi saepe quis aut omnis sed illo vel. Molestiae perspiciatis numquam hic ullam eveniet. Eius id delectus culpa quia blanditiis esse optio. A ab ea hic sunt recusandae tempora. Sit est inventore aut et ea praesentium soluta. Est est vel qui molestiae consequatur quo. Quae aut ut iure qui id distinctio modi. Harum dolorem et blanditiis saepe distinctio illum amet. Soluta quod quas omnis commodi ex quaerat eum. Ab facere quia eaque et. Sunt tempora doloribus quia blanditiis et. Rerum qui et culpa architecto ea alias. Vitae dignissimos sapiente voluptatum quas molestias enim facere ipsum. Aspernatur aliquam aliquam delectus consequuntur. Dolore voluptatum quod voluptatem voluptatem similique et. Praesentium possimus reprehenderit velit vero. Eos deleniti a vero est ut.');

insert into JobPostingPosts
values('6xn53', 'Splunk', 'Firmware', 'Full Stack Developer', 'Et error eum aut. Et perferendis dolorem aut mollitia excepturi. Qui ut adipisci at consequatur qui architecto et. Eaque voluptates officiis quibusdam. Est rerum inventore sed explicabo. Neque qui accusamus repudiandae soluta. Recusandae et recusandae quis nihil. Omnis sequi qui qui odio ipsa veniam laboriosam. Sapiente rem dolorem illo unde. Iure rerum facilis ut fuga est non porro. Provident voluptatum beatae consectetur dolor architecto aut iure sint. Provident nam itaque eius illum. Dolor alias unde nisi tempore. Voluptate tenetur et voluptatem sunt. A magni odit necessitatibus error dolorem facilis neque. Ad et et at ipsam. Dolor repudiandae qui itaque similique accusamus eos. Dolorem facilis culpa explicabo et. Tenetur inventore pariatur eum reprehenderit occaecati. Reiciendis quia non exercitationem excepturi molestiae iste. Dolor et voluptas odio. Beatae ut laudantium autem.');

insert into Requires
values('5cd07', 'C++');

insert into Requires
values('0cy27', 'C');

insert into Requires
values('1st75', 'Java');

insert into Requires
values('8rm09', 'jQuery');

insert into Requires
values('2tz51', 'MySQL');

insert into Requires
values('6hu22', 'NoSQL');

insert into Requires
values('6wu40', 'JavaScript');

insert into Requires
values('5in26', 'NodeJS');

insert into Requires
values('1sq51', 'AngularJS');

insert into Requires
values('5cd07', 'HTML');

insert into Requires
values('5pu05', 'CSS');

insert into Requires
values('2nh99', 'IntelliJ');

insert into Requires
values('2ox78', 'Android Studio');

insert into Requires
values('9qg47', 'Bootstrap');

insert into Requires
values('2ox78', 'Kotlin');

insert into Requires
values('1vz66', 'jUnit');

insert into Requires
values('6id12', 'C#');

insert into Requires
values('9ag71', 'Python');

insert into Requires
values('5et30', 'R');

insert into Requires
values('6wu40', 'MATLAB');

insert into Requires
values('0cy27', 'ABAP');

insert into Requires
values('5pu05', 'Assembly');

insert into Requires
values('6xn53', 'JSON');

insert into Requires
values('2tz51', 'REST');

insert into Requires
values('8rm09', 'MVC');

insert into Requires
values('1st75', '.Net');

insert into Requires
values('0cy27', 'Unity');

insert into Requires
values('8er49', 'Mongo');

insert into Requires
values('5hv85', 'CosmosDb');

insert into Requires
values('8oo50', 'ASP.NET');

insert into Requires
values('1rj01', '.Net');

insert into Requires
values('2ee35', 'Git');

insert into Requires
values('6id12', 'Bitbucket');

insert into Requires
values('0cy27', 'Sourcetree');

insert into Requires
values('5pu05', 'Ruby');

insert into Requires
values('5cd07', 'PHP');

insert into Requires
values('1gv16', 'Vue');

insert into Requires
values('4yv88', 'SASS');

insert into Requires
values('2tz51', 'React');

insert into Requires
values('6id12', 'Linux');

insert into Requires
values('1sq51', 'Typescript');

insert into Requires
values('1sq51', 'MSSQL');

insert into Requires
values('2nh99', 'C++');

insert into Requires
values('9ag71', 'C');

insert into Requires
values('7xq30', 'Java');

insert into Requires
values('9ri86', 'jQuery');

insert into Requires
values('9ri86', 'MySQL');

insert into Requires
values('9ez37', 'NoSQL');

insert into Requires
values('4cu97', 'JavaScript');

insert into Requires
values('4yv88', 'NodeJS');

insert into Requires
values('6xn53', 'AngularJS');

insert into Requires
values('6id12', 'HTML');

insert into Requires
values('1sq51', 'CSS');

insert into Requires
values('7ki72', 'IntelliJ');

insert into Requires
values('2xs18', 'Android Studio');

insert into Requires
values('5df81', 'Bootstrap');

insert into Requires
values('8an91', 'Kotlin');

insert into Requires
values('5df81', 'jUnit');

insert into Requires
values('7ki72', 'C#');

insert into Requires
values('5pu05', 'Python');

insert into Requires
values('8ob06', 'R');

insert into Requires
values('9ez37', 'MATLAB');

insert into Requires
values('6hu22', 'ABAP');

insert into Requires
values('4yv88', 'Assembly');

insert into Requires
values('7xq30', 'JSON');

insert into Requires
values('6xn53', 'REST');

insert into Requires
values('7ma03', 'MVC');

insert into Requires
values('6hu22', '.Net');

insert into Requires
values('5in26', 'Unity');

insert into Requires
values('2ox78', 'Mongo');

insert into Requires
values('5pu05', 'CosmosDb');

insert into Requires
values('9qk53', 'ASP.NET');

insert into Requires
values('9ri86', '.Net');

insert into Requires
values('2ox78', 'Git');

insert into Requires
values('2ox78', 'Bitbucket');

insert into Requires
values('7er93', 'Sourcetree');

insert into Requires
values('4uj53', 'Ruby');

insert into Requires
values('6wu40', 'PHP');

insert into Requires
values('5gi34', 'Vue');

insert into Requires
values('4cu97', 'SASS');

insert into Requires
values('1st75', 'React');

insert into Requires
values('0cy27', 'Linux');

insert into Requires
values('5fg14', 'Typescript');

insert into Requires
values('9qg47', 'MSSQL');

insert into Requires
values('9ri86', 'C++');

insert into Requires
values('5pu05', 'C');

insert into Requires
values('1vz66', 'Java');

insert into Requires
values('4cu97', 'jQuery');

insert into Requires
values('8er49', 'MySQL');

insert into Requires
values('2tz51', 'NoSQL');

insert into Requires
values('5fg14', 'JavaScript');

insert into Requires
values('7xq30', 'NodeJS');

insert into Requires
values('5pu05', 'AngularJS');

insert into Requires
values('2xs18', 'HTML');

insert into Requires
values('6id12', 'CSS');




INSERT INTO Hobby VALUES('playing flute');
INSERT INTO Hobby VALUES('playing piano');
INSERT INTO Hobby VALUES('playing violin');
INSERT INTO Hobby VALUES('swimming');
INSERT INTO Hobby VALUES('bowling');
INSERT INTO Hobby VALUES('hockey');
INSERT INTO Hobby VALUES('martial arts');
INSERT INTO Hobby VALUES('basketball');
INSERT INTO Hobby VALUES('soccer');
INSERT INTO Hobby VALUES('baseball');
INSERT INTO Hobby VALUES('volleyball');
INSERT INTO Hobby VALUES('drawing');
INSERT INTO Hobby VALUES('programming');
INSERT INTO Hobby VALUES('reading');
INSERT INTO Hobby VALUES('volunteering');
INSERT INTO Hobby VALUES('cooking');
INSERT INTO Hobby VALUES('other');
INSERT INTO Hobby VALUES('gaming');
INSERT INTO Hobby VALUES('singing');
INSERT INTO Hobby VALUES('dancing');
INSERT INTO Award VALUES('Prize for science', 'Nobel Prize', '2006-11-21');
INSERT INTO Award VALUES('Best actress', 'Grammy Award', '1976-8-2');
INSERT INTO Award VALUES('Best actor', 'Emmy Award', '2004-7-10');
INSERT INTO Award VALUES('Best supporting role', 'Academy Award', '2003-12-25');
INSERT INTO Award VALUES('Best song', 'Billboard Award', '1999-6-11');
INSERT INTO Award VALUES('Bronze badge', 'Duke of Edinburgh', '1952-10-18');
INSERT INTO Award VALUES('Academic scholarship', 'Horatio Alger', '1960-8-23');
INSERT INTO Award VALUES('Highest provincial score', 'Provincial Scholarship', '1962-10-9');
INSERT INTO Award VALUES('Best national scholar', 'National Scholarship', '1956-7-13');
INSERT INTO Award VALUES('Prize for BizHacks', 'First in hackathon', '1990-9-4');
INSERT INTO Award VALUES('Prize for NWHacks', 'Second in hackathon', '1985-5-28');
INSERT INTO Award VALUES('Prize for MedHacks', 'Third in hackathon', '2016-7-3');
INSERT INTO Award VALUES('other', 'other', '2006-12-21');
INSERT INTO Award VALUES('90%+ average', 'Principals list', '2010-8-13');
INSERT INTO Award VALUES('80%+ average', 'Honour roll', '2002-6-2');
INSERT INTO Award VALUES('For great improvement', 'Most improved', '1954-12-16');
INSERT INTO Award VALUES('For high school swim team', 'Sportsmanship', '1987-5-18');
INSERT INTO Award VALUES('Olympic swimming', 'Gold medal', '1974-2-26');
INSERT INTO Award VALUES('Olympic 100m dash', 'Silver medal', '1996-7-8');
INSERT INTO Award VALUES('Olympic marathon', 'Bronze medal', '2017-1-10');
INSERT INTO Experience VALUES('Google', 'Software Engineer', 'less than one year', 'work', 'developed software');
INSERT INTO Experience VALUES('Yahoo!', 'Project Manager', '3+ years', 'work', 'oversaw projects');
INSERT INTO Experience VALUES('Yelp', 'Team Lead', '1-2 years', 'work', 'lead a team');
INSERT INTO Experience VALUES('Microsoft', 'Software Developer', '3+ years', 'work', 'developed software');
INSERT INTO Experience VALUES('Amazon', 'QA Lead', 'less than one year', 'work', 'tested and debugged code');
INSERT INTO Experience VALUES('Intel', 'Firmware Engineer', '3+ years', 'work', 'wrote firmware for SSD');
INSERT INTO Experience VALUES('SAP', 'DevOps', '1-2 years', 'work', 'developed stuff');
INSERT INTO Experience VALUES('Cisco', 'Web Developer', '1-2 years', 'work', 'developed web applications');
INSERT INTO Experience VALUES('Tasktop', 'QA Lead', '3+ years', 'work', 'tested and debugged');
INSERT INTO Experience VALUES('AppNeta', 'Software Developer', '1-2 years', 'work', 'developed software');
INSERT INTO Experience VALUES('Fatigue Science', 'Software Engineer', '3+ years', 'work', 'developed software');
INSERT INTO Experience VALUES('Trulioo', 'Mobile Developer', '1-2 years', 'work', 'developed mobile applications');
INSERT INTO Experience VALUES('Hootsuite', 'Web Application Developer', 'less than one year', 'work', 'developed web applications');
INSERT INTO Experience VALUES('Absolute Software', 'CloudOps', 'less than one year', 'work', 'developed cloud applications');
INSERT INTO Experience VALUES('TD Bank', 'Accounting Clerk', '1-2 years', 'work', 'did some accounting stuff');
INSERT INTO Experience VALUES('Zara', 'Cashier', '3+ years', 'work', 'sold clothes');
INSERT INTO Experience VALUES('SUS', 'VP Internal', '3+ years', 'extracurricular', 'in charge of internal team');
INSERT INTO Experience VALUES('UBC CVC', 'Events Committee Chair', 'less than one year', 'extracurricular', 'planned events');
INSERT INTO Experience VALUES('VGH', 'Volunteer', 'less than one year', 'volunteer', 'took care of patients');
INSERT INTO Experience VALUES('UBC CSSS', 'Social Officer', '3+ years', 'extracurricular', 'planned events');
INSERT INTO Experience VALUES('UBC CSA', 'Marketing Committee', '1-2 years', 'extracurricular', 'marketed events');
INSERT INTO Experience VALUES('UBC Dance Horizons', 'Prima Ballerina', 'less than one year', 'extracurricular', 'danced lead in Swan Lake');
INSERT INTO Experience VALUES('UBC Acapella', 'Lead Singer', '3+ years', 'extracurricular', 'sang lead in Shrekapella');
INSERT INTO Experience VALUES('Heart and Stroke Foundation', 'Sponsorship Chair', '3+ years', 'volunteer', 'sought after sponsorships');
INSERT INTO Experience VALUES('Safeway', 'Cashier', '3+ years', 'work', 'sold groceries');
INSERT INTO Experience VALUES('PNE', 'Ticket Seller', '3+ years', 'work', 'sold tickets');
INSERT INTO CodingProject1 VALUES('HTML', 'PriceBeat', 3, 'price match web app', 'academic');
INSERT INTO CodingProject1 VALUES('CSS', 'Bootcamp.org', 2, 'fitness website', 'personal');
INSERT INTO CodingProject1 VALUES('Swift', 'Calendar', 1, 'iphone calendar', 'personal');
INSERT INTO CodingProject1 VALUES('C/C++', 'Boggle Solver', 3, 'solves a boggle board', 'personal');
INSERT INTO CodingProject1 VALUES('JavaScript', 'Cookie Clicker', 1, 'cookie clicker game', 'personal');
INSERT INTO CodingProject1 VALUES('Java', 'BusesAreUs', 2, 'android applciation', 'personal');
INSERT INTO CodingProject1 VALUES('Python', 'RegisterMe', 2, 'web application for course registration', 'academic');
INSERT INTO CodingProject1 VALUES('Ruby', 'Facebook.com', 1, 'social media website', 'academic');
INSERT INTO CodingProject1 VALUES('Haskell', 'MathHelp', 1, 'math help website', 'academic');
INSERT INTO CodingProject1 VALUES('Prolog', 'FrogGer', 1, 'frogger game', 'academic');
INSERT INTO CodingProject1 VALUES('C#', 'MySims', 2, 'an avatar based game', 'personal');
INSERT INTO CodingProject1 VALUES('PHP', 'ResumeGenerator', 3, 'generates resume', 'personal');
INSERT INTO CodingProject1 VALUES('SQL', 'GetData', 2, 'generates data from around the world', 'personal');
INSERT INTO CodingProject1 VALUES('other', 'InMyFridge', 3, 'checks what recipes you can make with fridge ingredients', 'academic');
INSERT INTO Applicant1 VALUES('780-877-4951', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-877-4951', 'Alberta');
INSERT INTO Applicant2 VALUES('Jason Smith', 'Jason_9205@alumni.ubc.ca', '1025 Willingdon Lane', 'JasonSmith-65867', 'efficient', '780-877-4951');
INSERT INTO HaveHobby VALUES('Jason_9205@alumni.ubc.ca', 'playing flute');
INSERT INTO HaveAward VALUES('Nobel Prize', '2006-11-21', 'Jason_9205@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Jason_9205@alumni.ubc.ca', 'Google', 'Software Engineer');
INSERT INTO HaveProject VALUES('Jason_9205@alumni.ubc.ca', 'PriceBeat', 'HTML');
INSERT INTO AppliesTo VALUES('2tz51', 'Jason_9205@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-787-4915', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-787-4915', 'British Columbia');
INSERT INTO Applicant2 VALUES('Charlie Nakamura', 'Charlie_8547@alumni.ubc.ca', '4386 Margaret Way', 'CharlieNakamura-68414', 'thrive in fast-paced environments', '604-787-4915');
INSERT INTO HaveHobby VALUES('Charlie_8547@alumni.ubc.ca', 'playing piano');
INSERT INTO HaveAward VALUES('Grammy Award', '1976-8-2', 'Charlie_8547@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Charlie_8547@alumni.ubc.ca', 'Yahoo!', 'Project Manager');
INSERT INTO HaveProject VALUES('Charlie_8547@alumni.ubc.ca', 'Bootcamp.org', 'CSS');
INSERT INTO AppliesTo VALUES('5fo52', 'Charlie_8547@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-162-6079', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-162-6079', 'Ontario');
INSERT INTO Applicant2 VALUES('Anna Williams', 'Anna_7520@alumni.ubc.ca', '1114 Margaret Boulevard', 'AnnaWilliams-15633', 'can speak 7 languages fluenty', '905-162-6079');
INSERT INTO HaveHobby VALUES('Anna_7520@alumni.ubc.ca', 'playing violin');
INSERT INTO HaveAward VALUES('Emmy Award', '2004-7-10', 'Anna_7520@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Anna_7520@alumni.ubc.ca', 'Yelp', 'Team Lead');
INSERT INTO HaveProject VALUES('Anna_7520@alumni.ubc.ca', 'Calendar', 'Swift');
INSERT INTO AppliesTo VALUES('0nc05', 'Anna_7520@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-881-9355', 'Toronto');
INSERT INTO Applicant3 VALUES('647-881-9355', 'Ontario');
INSERT INTO Applicant2 VALUES('Donald Williams', 'Donald_3648@alumni.ubc.ca', '2108 Pretty Boulevard', 'DonaldWilliams-21869', 'can speak 7 languages fluenty', '647-881-9355');
INSERT INTO HaveHobby VALUES('Donald_3648@alumni.ubc.ca', 'swimming');
INSERT INTO HaveAward VALUES('Academy Award', '2003-12-25', 'Donald_3648@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Donald_3648@alumni.ubc.ca', 'Microsoft', 'Software Developer');
INSERT INTO HaveProject VALUES('Donald_3648@alumni.ubc.ca', 'Boggle Solver', 'C/C++');
INSERT INTO AppliesTo VALUES('7er93', 'Donald_3648@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-414-4681', 'Halifax');
INSERT INTO Applicant3 VALUES('902-414-4681', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('Timothy Smith', 'Timothy_8386@alumni.ubc.ca', '4599 Tuaq Way', 'TimothySmith-26486', 'positive energy', '902-414-4681');
INSERT INTO HaveHobby VALUES('Timothy_8386@alumni.ubc.ca', 'bowling');
INSERT INTO HaveAward VALUES('Billboard Award', '1999-6-11', 'Timothy_8386@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Timothy_8386@alumni.ubc.ca', 'Amazon', 'QA Lead');
INSERT INTO HaveProject VALUES('Timothy_8386@alumni.ubc.ca', 'Cookie Clicker', 'JavaScript');
INSERT INTO AppliesTo VALUES('8oo50', 'Timothy_8386@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-951-4991', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-951-4991', 'Ontario');
INSERT INTO Applicant2 VALUES('Josh Williams', 'Josh_7833@alumni.ubc.ca', '8411 Margaret Road', 'JoshWilliams-1173', 'team-player', '905-951-4991');
INSERT INTO HaveHobby VALUES('Josh_7833@alumni.ubc.ca', 'hockey');
INSERT INTO HaveAward VALUES('Duke of Edinburgh', '1952-10-18', 'Josh_7833@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Josh_7833@alumni.ubc.ca', 'Intel', 'Firmware Engineer');
INSERT INTO HaveProject VALUES('Josh_7833@alumni.ubc.ca', 'BusesAreUs', 'Java');
INSERT INTO AppliesTo VALUES('1gv16', 'Josh_7833@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-551-3804', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-551-3804', 'British Columbia');
INSERT INTO Applicant2 VALUES('Dorothy Weasley', 'Dorothy_388@alumni.ubc.ca', '2281 Pretty Place', 'DorothyWeasley-34369', 'just honestly wants money', '604-551-3804');
INSERT INTO HaveHobby VALUES('Dorothy_388@alumni.ubc.ca', 'martial arts');
INSERT INTO HaveAward VALUES('Horatio Alger', '1960-8-23', 'Dorothy_388@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Dorothy_388@alumni.ubc.ca', 'SAP', 'DevOps');
INSERT INTO HaveProject VALUES('Dorothy_388@alumni.ubc.ca', 'RegisterMe', 'Python');
INSERT INTO AppliesTo VALUES('7xq30', 'Dorothy_388@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-596-1883', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-596-1883', 'Ontario');
INSERT INTO Applicant2 VALUES('Po Nakamura', 'Po_4164@alumni.ubc.ca', '6200 E41st Boulevard', 'PoNakamura-71795', 'quick-learner', '905-596-1883');
INSERT INTO HaveHobby VALUES('Po_4164@alumni.ubc.ca', 'basketball');
INSERT INTO HaveAward VALUES('Provincial Scholarship', '1962-10-9', 'Po_4164@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Po_4164@alumni.ubc.ca', 'Cisco', 'Web Developer');
INSERT INTO HaveProject VALUES('Po_4164@alumni.ubc.ca', 'Facebook.com', 'Ruby');
INSERT INTO AppliesTo VALUES('6id12', 'Po_4164@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-674-9711', 'Montreal');
INSERT INTO Applicant3 VALUES('514-674-9711', 'Quebec');
INSERT INTO Applicant2 VALUES('Alison Longbottom', 'Alison_8541@alumni.ubc.ca', '8528 Alma Place', 'AlisonLongbottom-98440', 'hardworking', '514-674-9711');
INSERT INTO HaveHobby VALUES('Alison_8541@alumni.ubc.ca', 'soccer');
INSERT INTO HaveAward VALUES('National Scholarship', '1956-7-13', 'Alison_8541@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Alison_8541@alumni.ubc.ca', 'Tasktop', 'QA Lead');
INSERT INTO HaveProject VALUES('Alison_8541@alumni.ubc.ca', 'MathHelp', 'Haskell');
INSERT INTO AppliesTo VALUES('5gi34', 'Alison_8541@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-905-1399', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-905-1399', 'Nunavut');
INSERT INTO Applicant2 VALUES('George Longbottom', 'George_8125@alumni.ubc.ca', '3626 Burrard Lane', 'GeorgeLongbottom-83731', 'newly graduated', '867-905-1399');
INSERT INTO HaveHobby VALUES('George_8125@alumni.ubc.ca', 'baseball');
INSERT INTO HaveAward VALUES('First in hackathon', '1990-9-4', 'George_8125@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('George_8125@alumni.ubc.ca', 'AppNeta', 'Software Developer');
INSERT INTO HaveProject VALUES('George_8125@alumni.ubc.ca', 'FrogGer', 'Prolog');
INSERT INTO AppliesTo VALUES('4om22', 'George_8125@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-167-6150', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-167-6150', 'Nunavut');
INSERT INTO Applicant2 VALUES('Hillary Longbottom', 'Hillary_6589@alumni.ubc.ca', '1482 Oak Alley', 'HillaryLongbottom-9542', 'really desperate for a job', '867-167-6150');
INSERT INTO HaveHobby VALUES('Hillary_6589@alumni.ubc.ca', 'volleyball');
INSERT INTO HaveAward VALUES('Second in hackathon', '1985-5-28', 'Hillary_6589@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Hillary_6589@alumni.ubc.ca', 'Fatigue Science', 'Software Engineer');
INSERT INTO HaveProject VALUES('Hillary_6589@alumni.ubc.ca', 'MySims', 'C#');
INSERT INTO AppliesTo VALUES('6hu22', 'Hillary_6589@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-915-1890', 'Calgary');
INSERT INTO Applicant3 VALUES('403-915-1890', 'Alberta');
INSERT INTO Applicant2 VALUES('Kipling Yang', 'Kipling_1515@alumni.ubc.ca', '7125 Wart Boulevard', 'KiplingYang-75587', 'thrive in fast-paced environments', '403-915-1890');
INSERT INTO HaveHobby VALUES('Kipling_1515@alumni.ubc.ca', 'drawing');
INSERT INTO HaveAward VALUES('Third in hackathon', '2016-7-3', 'Kipling_1515@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Kipling_1515@alumni.ubc.ca', 'Trulioo', 'Mobile Developer');
INSERT INTO HaveProject VALUES('Kipling_1515@alumni.ubc.ca', 'ResumeGenerator', 'PHP');
INSERT INTO AppliesTo VALUES('8an91', 'Kipling_1515@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-862-8435', 'Halifax');
INSERT INTO Applicant3 VALUES('902-862-8435', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('Esther Malfoy', 'Esther_5509@alumni.ubc.ca', '8752 Porky Place', 'EstherMalfoy-23326', 'strong communication skills', '902-862-8435');
INSERT INTO HaveHobby VALUES('Esther_5509@alumni.ubc.ca', 'programming');
INSERT INTO HaveAward VALUES('other', '2006-12-21', 'Esther_5509@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Esther_5509@alumni.ubc.ca', 'Hootsuite', 'Web Application Developer');
INSERT INTO HaveProject VALUES('Esther_5509@alumni.ubc.ca', 'GetData', 'SQL');
INSERT INTO AppliesTo VALUES('1st75', 'Esther_5509@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-172-7296', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-172-7296', 'Alberta');
INSERT INTO Applicant2 VALUES('Andy Smith', 'Andy_3683@alumni.ubc.ca', '5622 Water Street', 'AndySmith-31812', 'can speak 7 languages fluenty', '780-172-7296');
INSERT INTO HaveHobby VALUES('Andy_3683@alumni.ubc.ca', 'reading');
INSERT INTO HaveAward VALUES('Principals list', '2010-8-13', 'Andy_3683@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Andy_3683@alumni.ubc.ca', 'Absolute Software', 'CloudOps');
INSERT INTO HaveProject VALUES('Andy_3683@alumni.ubc.ca', 'InMyFridge', 'other');
INSERT INTO AppliesTo VALUES('7ki72', 'Andy_3683@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-278-7022', 'Calgary');
INSERT INTO Applicant3 VALUES('403-278-7022', 'Alberta');
INSERT INTO Applicant2 VALUES('Timothy Smith', 'Timothy_7831@alumni.ubc.ca', '7251 E75th Way', 'TimothySmith-56733', 'strong communication skills', '403-278-7022');
INSERT INTO HaveHobby VALUES('Timothy_7831@alumni.ubc.ca', 'volunteering');
INSERT INTO HaveAward VALUES('Honour roll', '2002-6-2', 'Timothy_7831@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Timothy_7831@alumni.ubc.ca', 'TD Bank', 'Accounting Clerk');
INSERT INTO HaveProject VALUES('Timothy_7831@alumni.ubc.ca', 'PriceBeat', 'HTML');
INSERT INTO AppliesTo VALUES('4uj53', 'Timothy_7831@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-136-5101', 'Toronto');
INSERT INTO Applicant3 VALUES('647-136-5101', 'Ontario');
INSERT INTO Applicant2 VALUES('Harold Jacobsen', 'Harold_5298@alumni.ubc.ca', '2178 Dundas Parkway', 'HaroldJacobsen-53744', 'team-player', '647-136-5101');
INSERT INTO HaveHobby VALUES('Harold_5298@alumni.ubc.ca', 'cooking');
INSERT INTO HaveAward VALUES('Most improved', '1954-12-16', 'Harold_5298@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Harold_5298@alumni.ubc.ca', 'Zara', 'Cashier');
INSERT INTO HaveProject VALUES('Harold_5298@alumni.ubc.ca', 'Bootcamp.org', 'CSS');
INSERT INTO AppliesTo VALUES('4cq37', 'Harold_5298@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-905-5721', 'Montreal');
INSERT INTO Applicant3 VALUES('514-905-5721', 'Quebec');
INSERT INTO Applicant2 VALUES('RadishHead Choi', 'RadishHead_8112@alumni.ubc.ca', '2407 Burrard Way', 'RadishHeadChoi-90880', 'positive energy', '514-905-5721');
INSERT INTO HaveHobby VALUES('RadishHead_8112@alumni.ubc.ca', 'other');
INSERT INTO HaveAward VALUES('Sportsmanship', '1987-5-18', 'RadishHead_8112@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('RadishHead_8112@alumni.ubc.ca', 'SUS', 'VP Internal');
INSERT INTO HaveProject VALUES('RadishHead_8112@alumni.ubc.ca', 'Calendar', 'Swift');
INSERT INTO AppliesTo VALUES('5cd07', 'RadishHead_8112@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-518-3672', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-518-3672', 'Alberta');
INSERT INTO Applicant2 VALUES('Megan Weasley', 'Megan_6413@alumni.ubc.ca', '6879 Water Drive', 'MeganWeasley-56866', 'strong writing skills', '780-518-3672');
INSERT INTO HaveHobby VALUES('Megan_6413@alumni.ubc.ca', 'gaming');
INSERT INTO HaveAward VALUES('Gold medal', '1974-2-26', 'Megan_6413@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Megan_6413@alumni.ubc.ca', 'UBC CVC', 'Events Committee Chair');
INSERT INTO HaveProject VALUES('Megan_6413@alumni.ubc.ca', 'Boggle Solver', 'C/C++');
INSERT INTO AppliesTo VALUES('2js33', 'Megan_6413@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-558-6797', 'Calgary');
INSERT INTO Applicant3 VALUES('403-558-6797', 'Alberta');
INSERT INTO Applicant2 VALUES('Daisy Nakamura', 'Daisy_8499@alumni.ubc.ca', '6466 Dunbar Boulevard', 'DaisyNakamura-59194', 'quick-learner', '403-558-6797');
INSERT INTO HaveHobby VALUES('Daisy_8499@alumni.ubc.ca', 'singing');
INSERT INTO HaveAward VALUES('Silver medal', '1996-7-8', 'Daisy_8499@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Daisy_8499@alumni.ubc.ca', 'VGH', 'Volunteer');
INSERT INTO HaveProject VALUES('Daisy_8499@alumni.ubc.ca', 'Cookie Clicker', 'JavaScript');
INSERT INTO AppliesTo VALUES('8ob06', 'Daisy_8499@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-156-6022', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-156-6022', 'Nunavut');
INSERT INTO Applicant2 VALUES('Donald Specter', 'Donald_9889@alumni.ubc.ca', '3183 Burrard Crescent', 'DonaldSpecter-64867', 'quick-learner', '867-156-6022');
INSERT INTO HaveHobby VALUES('Donald_9889@alumni.ubc.ca', 'dancing');
INSERT INTO HaveAward VALUES('Bronze medal', '2017-1-10', 'Donald_9889@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Donald_9889@alumni.ubc.ca', 'UBC CSSS', 'Social Officer');
INSERT INTO HaveProject VALUES('Donald_9889@alumni.ubc.ca', 'BusesAreUs', 'Java');
INSERT INTO AppliesTo VALUES('2xs18', 'Donald_9889@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-657-1177', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-657-1177', 'Alberta');
INSERT INTO Applicant2 VALUES('John Weasley', 'John_9969@alumni.ubc.ca', '1805 Wart Alley', 'JohnWeasley-67236', 'just honestly wants money', '780-657-1177');
INSERT INTO HaveHobby VALUES('John_9969@alumni.ubc.ca', 'playing flute');
INSERT INTO HaveAward VALUES('Nobel Prize', '2006-11-21', 'John_9969@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('John_9969@alumni.ubc.ca', 'UBC CSA', 'Marketing Committee');
INSERT INTO HaveProject VALUES('John_9969@alumni.ubc.ca', 'RegisterMe', 'Python');
INSERT INTO AppliesTo VALUES('2qb13', 'John_9969@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-201-5441', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-201-5441', 'Alberta');
INSERT INTO Applicant2 VALUES('Jamie Li', 'Jamie_8112@alumni.ubc.ca', '6645 Templeton Drive', 'JamieLi-58579', 'newly graduated', '780-201-5441');
INSERT INTO HaveHobby VALUES('Jamie_8112@alumni.ubc.ca', 'playing piano');
INSERT INTO HaveAward VALUES('Grammy Award', '1976-8-2', 'Jamie_8112@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Jamie_8112@alumni.ubc.ca', 'UBC Dance Horizons', 'Prima Ballerina');
INSERT INTO HaveProject VALUES('Jamie_8112@alumni.ubc.ca', 'Facebook.com', 'Ruby');
INSERT INTO AppliesTo VALUES('6ra55', 'Jamie_8112@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-927-7697', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-927-7697', 'Alberta');
INSERT INTO Applicant2 VALUES('Minnie Hope', 'Minnie_7951@alumni.ubc.ca', '2732 Honeydukes Terrace', 'MinnieHope-38684', 'really fun to have around', '780-927-7697');
INSERT INTO HaveHobby VALUES('Minnie_7951@alumni.ubc.ca', 'playing violin');
INSERT INTO HaveAward VALUES('Emmy Award', '2004-7-10', 'Minnie_7951@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Minnie_7951@alumni.ubc.ca', 'UBC Acapella', 'Lead Singer');
INSERT INTO HaveProject VALUES('Minnie_7951@alumni.ubc.ca', 'MathHelp', 'Haskell');
INSERT INTO AppliesTo VALUES('5fg14', 'Minnie_7951@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-857-6460', 'Calgary');
INSERT INTO Applicant3 VALUES('403-857-6460', 'Alberta');
INSERT INTO Applicant2 VALUES('Sharon Pope', 'Sharon_6993@alumni.ubc.ca', '3459 Trafalger Road', 'SharonPope-30795', 'can speak 7 languages fluenty', '403-857-6460');
INSERT INTO HaveHobby VALUES('Sharon_6993@alumni.ubc.ca', 'swimming');
INSERT INTO HaveAward VALUES('Academy Award', '2003-12-25', 'Sharon_6993@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Sharon_6993@alumni.ubc.ca', 'Heart and Stroke Foundation', 'Sponsorship Chair');
INSERT INTO HaveProject VALUES('Sharon_6993@alumni.ubc.ca', 'FrogGer', 'Prolog');
INSERT INTO AppliesTo VALUES('6wu40', 'Sharon_6993@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-958-1936', 'Montreal');
INSERT INTO Applicant3 VALUES('514-958-1936', 'Quebec');
INSERT INTO Applicant2 VALUES('Angela Leong', 'Angela_2144@alumni.ubc.ca', '4329 E41st Place', 'AngelaLeong-88111', 'can speak 7 languages fluenty', '514-958-1936');
INSERT INTO HaveHobby VALUES('Angela_2144@alumni.ubc.ca', 'bowling');
INSERT INTO HaveAward VALUES('Billboard Award', '1999-6-11', 'Angela_2144@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Angela_2144@alumni.ubc.ca', 'Safeway', 'Cashier');
INSERT INTO HaveProject VALUES('Angela_2144@alumni.ubc.ca', 'MySims', 'C#');
INSERT INTO AppliesTo VALUES('1vz66', 'Angela_2144@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-165-5770', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-165-5770', 'Nunavut');
INSERT INTO Applicant2 VALUES('Esther Ho', 'Esther_2578@alumni.ubc.ca', '3883 Granville Place', 'EstherHo-55361', 'really desperate for a job', '867-165-5770');
INSERT INTO HaveHobby VALUES('Esther_2578@alumni.ubc.ca', 'hockey');
INSERT INTO HaveAward VALUES('Duke of Edinburgh', '1952-10-18', 'Esther_2578@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Esther_2578@alumni.ubc.ca', 'PNE', 'Ticket Seller');
INSERT INTO HaveProject VALUES('Esther_2578@alumni.ubc.ca', 'ResumeGenerator', 'PHP');
INSERT INTO AppliesTo VALUES('5df81', 'Esther_2578@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-396-6755', 'Toronto');
INSERT INTO Applicant3 VALUES('647-396-6755', 'Ontario');
INSERT INTO Applicant2 VALUES('George Jung', 'George_4899@alumni.ubc.ca', '1610 Dunbar Street', 'GeorgeJung-42558', 'really fun to have around', '647-396-6755');
INSERT INTO HaveHobby VALUES('George_4899@alumni.ubc.ca', 'martial arts');
INSERT INTO HaveAward VALUES('Horatio Alger', '1960-8-23', 'George_4899@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('George_4899@alumni.ubc.ca', 'Google', 'Software Engineer');
INSERT INTO HaveProject VALUES('George_4899@alumni.ubc.ca', 'GetData', 'SQL');
INSERT INTO AppliesTo VALUES('5in26', 'George_4899@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-395-2414', 'Calgary');
INSERT INTO Applicant3 VALUES('403-395-2414', 'Alberta');
INSERT INTO Applicant2 VALUES('Angela Leong', 'Angela_7223@alumni.ubc.ca', '8906 Dundas Boulevard', 'AngelaLeong-91045', 'thrive in fast-paced environments', '403-395-2414');
INSERT INTO HaveHobby VALUES('Angela_7223@alumni.ubc.ca', 'basketball');
INSERT INTO HaveAward VALUES('Provincial Scholarship', '1962-10-9', 'Angela_7223@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Angela_7223@alumni.ubc.ca', 'Yahoo!', 'Project Manager');
INSERT INTO HaveProject VALUES('Angela_7223@alumni.ubc.ca', 'InMyFridge', 'other');
INSERT INTO AppliesTo VALUES('9ri86', 'Angela_7223@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-437-8957', 'Calgary');
INSERT INTO Applicant3 VALUES('403-437-8957', 'Alberta');
INSERT INTO Applicant2 VALUES('Korra Jung', 'Korra_3723@alumni.ubc.ca', '1960 E75th Way', 'KorraJung-14038', 'just honestly wants money', '403-437-8957');
INSERT INTO HaveHobby VALUES('Korra_3723@alumni.ubc.ca', 'soccer');
INSERT INTO HaveAward VALUES('National Scholarship', '1956-7-13', 'Korra_3723@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Korra_3723@alumni.ubc.ca', 'Yelp', 'Team Lead');
INSERT INTO HaveProject VALUES('Korra_3723@alumni.ubc.ca', 'PriceBeat', 'HTML');
INSERT INTO AppliesTo VALUES('1sq51', 'Korra_3723@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-353-9768', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-353-9768', 'Alberta');
INSERT INTO Applicant2 VALUES('Aang Kan', 'Aang_3294@alumni.ubc.ca', '8920 Wart Drive', 'AangKan-5493', 'positive energy', '780-353-9768');
INSERT INTO HaveHobby VALUES('Aang_3294@alumni.ubc.ca', 'baseball');
INSERT INTO HaveAward VALUES('First in hackathon', '1990-9-4', 'Aang_3294@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Aang_3294@alumni.ubc.ca', 'Microsoft', 'Software Developer');
INSERT INTO HaveProject VALUES('Aang_3294@alumni.ubc.ca', 'Bootcamp.org', 'CSS');
INSERT INTO AppliesTo VALUES('8er49', 'Aang_3294@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-171-2207', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-171-2207', 'Alberta');
INSERT INTO Applicant2 VALUES('Alison Ross', 'Alison_9480@alumni.ubc.ca', '4736 Wart Place', 'AlisonRoss-57481', 'just honestly wants money', '780-171-2207');
INSERT INTO HaveHobby VALUES('Alison_9480@alumni.ubc.ca', 'volleyball');
INSERT INTO HaveAward VALUES('Second in hackathon', '1985-5-28', 'Alison_9480@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Alison_9480@alumni.ubc.ca', 'Amazon', 'QA Lead');
INSERT INTO HaveProject VALUES('Alison_9480@alumni.ubc.ca', 'Calendar', 'Swift');
INSERT INTO AppliesTo VALUES('6bo14', 'Alison_9480@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-540-8133', 'Halifax');
INSERT INTO Applicant3 VALUES('902-540-8133', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('Megan Ho', 'Megan_1326@alumni.ubc.ca', '7781 E49th Boulevard', 'MeganHo-24069', 'newly graduated', '902-540-8133');
INSERT INTO HaveHobby VALUES('Megan_1326@alumni.ubc.ca', 'drawing');
INSERT INTO HaveAward VALUES('Third in hackathon', '2016-7-3', 'Megan_1326@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Megan_1326@alumni.ubc.ca', 'Intel', 'Firmware Engineer');
INSERT INTO HaveProject VALUES('Megan_1326@alumni.ubc.ca', 'Boggle Solver', 'C/C++');
INSERT INTO AppliesTo VALUES('2ox78', 'Megan_1326@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-618-5851', 'Halifax');
INSERT INTO Applicant3 VALUES('902-618-5851', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('Sharon Jung', 'Sharon_2374@alumni.ubc.ca', '6650 Pretty Avenue', 'SharonJung-55586', 'just honestly wants money', '902-618-5851');
INSERT INTO HaveHobby VALUES('Sharon_2374@alumni.ubc.ca', 'programming');
INSERT INTO HaveAward VALUES('other', '2006-12-21', 'Sharon_2374@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Sharon_2374@alumni.ubc.ca', 'SAP', 'DevOps');
INSERT INTO HaveProject VALUES('Sharon_2374@alumni.ubc.ca', 'Cookie Clicker', 'JavaScript');
INSERT INTO AppliesTo VALUES('9ez37', 'Sharon_2374@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-683-1671', 'Montreal');
INSERT INTO Applicant3 VALUES('514-683-1671', 'Quebec');
INSERT INTO Applicant2 VALUES('Vivian Watanabe', 'Vivian_3017@alumni.ubc.ca', '8641 Trafalger Lane', 'VivianWatanabe-65744', 'strong communication skills', '514-683-1671');
INSERT INTO HaveHobby VALUES('Vivian_3017@alumni.ubc.ca', 'reading');
INSERT INTO HaveAward VALUES('Principals list', '2010-8-13', 'Vivian_3017@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Vivian_3017@alumni.ubc.ca', 'Cisco', 'Web Developer');
INSERT INTO HaveProject VALUES('Vivian_3017@alumni.ubc.ca', 'BusesAreUs', 'Java');
INSERT INTO AppliesTo VALUES('5wi76', 'Vivian_3017@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-540-3562', 'Halifax');
INSERT INTO Applicant3 VALUES('902-540-3562', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('Brianna Kitagawa', 'Brianna_3111@alumni.ubc.ca', '9687 Margaret Road', 'BriannaKitagawa-95494', 'newly graduated', '902-540-3562');
INSERT INTO HaveHobby VALUES('Brianna_3111@alumni.ubc.ca', 'volunteering');
INSERT INTO HaveAward VALUES('Honour roll', '2002-6-2', 'Brianna_3111@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Brianna_3111@alumni.ubc.ca', 'Tasktop', 'QA Lead');
INSERT INTO HaveProject VALUES('Brianna_3111@alumni.ubc.ca', 'RegisterMe', 'Python');
INSERT INTO AppliesTo VALUES('5hv85', 'Brianna_3111@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-156-1140', 'Montreal');
INSERT INTO Applicant3 VALUES('514-156-1140', 'Quebec');
INSERT INTO Applicant2 VALUES('Andy Weasley', 'Andy_9507@alumni.ubc.ca', '8900 Tuaq Street', 'AndyWeasley-72640', 'efficient', '514-156-1140');
INSERT INTO HaveHobby VALUES('Andy_9507@alumni.ubc.ca', 'cooking');
INSERT INTO HaveAward VALUES('Most improved', '1954-12-16', 'Andy_9507@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Andy_9507@alumni.ubc.ca', 'AppNeta', 'Software Developer');
INSERT INTO HaveProject VALUES('Andy_9507@alumni.ubc.ca', 'Facebook.com', 'Ruby');
INSERT INTO AppliesTo VALUES('7ma03', 'Andy_9507@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-273-6297', 'Toronto');
INSERT INTO Applicant3 VALUES('647-273-6297', 'Ontario');
INSERT INTO Applicant2 VALUES('Hillary Longbottom', 'Hillary_9569@alumni.ubc.ca', '8248 E41st Boulevard', 'HillaryLongbottom-14417', 'efficient', '647-273-6297');
INSERT INTO HaveHobby VALUES('Hillary_9569@alumni.ubc.ca', 'other');
INSERT INTO HaveAward VALUES('Sportsmanship', '1987-5-18', 'Hillary_9569@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Hillary_9569@alumni.ubc.ca', 'Fatigue Science', 'Software Engineer');
INSERT INTO HaveProject VALUES('Hillary_9569@alumni.ubc.ca', 'MathHelp', 'Haskell');
INSERT INTO AppliesTo VALUES('1rj01', 'Hillary_9569@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-234-1235', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-234-1235', 'British Columbia');
INSERT INTO Applicant2 VALUES('Sherry Ng', 'Sherry_8334@alumni.ubc.ca', '7774 Yonge Drive', 'SherryNg-89223', 'newly graduated', '604-234-1235');
INSERT INTO HaveHobby VALUES('Sherry_8334@alumni.ubc.ca', 'gaming');
INSERT INTO HaveAward VALUES('Gold medal', '1974-2-26', 'Sherry_8334@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Sherry_8334@alumni.ubc.ca', 'Trulioo', 'Mobile Developer');
INSERT INTO HaveProject VALUES('Sherry_8334@alumni.ubc.ca', 'FrogGer', 'Prolog');
INSERT INTO AppliesTo VALUES('5et30', 'Sherry_8334@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-291-4428', 'Halifax');
INSERT INTO Applicant3 VALUES('902-291-4428', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('Mikey Kitagawa', 'Mikey_6443@alumni.ubc.ca', '7794 Dunbar Place', 'MikeyKitagawa-98320', 'efficient', '902-291-4428');
INSERT INTO HaveHobby VALUES('Mikey_6443@alumni.ubc.ca', 'singing');
INSERT INTO HaveAward VALUES('Silver medal', '1996-7-8', 'Mikey_6443@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Mikey_6443@alumni.ubc.ca', 'Hootsuite', 'Web Application Developer');
INSERT INTO HaveProject VALUES('Mikey_6443@alumni.ubc.ca', 'MySims', 'C#');
INSERT INTO AppliesTo VALUES('9qk53', 'Mikey_6443@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-904-6772', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-904-6772', 'Nunavut');
INSERT INTO Applicant2 VALUES('Timothy Lee', 'Timothy_8857@alumni.ubc.ca', '7980 Templeton Place', 'TimothyLee-27768', 'efficient', '867-904-6772');
INSERT INTO HaveHobby VALUES('Timothy_8857@alumni.ubc.ca', 'dancing');
INSERT INTO HaveAward VALUES('Bronze medal', '2017-1-10', 'Timothy_8857@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Timothy_8857@alumni.ubc.ca', 'Absolute Software', 'CloudOps');
INSERT INTO HaveProject VALUES('Timothy_8857@alumni.ubc.ca', 'ResumeGenerator', 'PHP');
INSERT INTO AppliesTo VALUES('4cu97', 'Timothy_8857@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-393-8068', 'Montreal');
INSERT INTO Applicant3 VALUES('514-393-8068', 'Quebec');
INSERT INTO Applicant2 VALUES('Bob Longbottom', 'Bob_214@alumni.ubc.ca', '7618 Hyack Court', 'BobLongbottom-39705', 'team-player', '514-393-8068');
INSERT INTO HaveHobby VALUES('Bob_214@alumni.ubc.ca', 'playing flute');
INSERT INTO HaveAward VALUES('Nobel Prize', '2006-11-21', 'Bob_214@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Bob_214@alumni.ubc.ca', 'TD Bank', 'Accounting Clerk');
INSERT INTO HaveProject VALUES('Bob_214@alumni.ubc.ca', 'GetData', 'SQL');
INSERT INTO AppliesTo VALUES('9ag71', 'Bob_214@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-619-1252', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-619-1252', 'Nunavut');
INSERT INTO Applicant2 VALUES('Priscilla Carson', 'Priscilla_2022@alumni.ubc.ca', '8471 Porky Road', 'PriscillaCarson-729', 'hardworking', '867-619-1252');
INSERT INTO HaveHobby VALUES('Priscilla_2022@alumni.ubc.ca', 'playing piano');
INSERT INTO HaveAward VALUES('Grammy Award', '1976-8-2', 'Priscilla_2022@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Priscilla_2022@alumni.ubc.ca', 'Zara', 'Cashier');
INSERT INTO HaveProject VALUES('Priscilla_2022@alumni.ubc.ca', 'InMyFridge', 'other');
INSERT INTO AppliesTo VALUES('4yv88', 'Priscilla_2022@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-424-5852', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-424-5852', 'British Columbia');
INSERT INTO Applicant2 VALUES('James Specter', 'James_9427@alumni.ubc.ca', '5973 Yonge Alley', 'JamesSpecter-29128', 'positive energy', '604-424-5852');
INSERT INTO HaveHobby VALUES('James_9427@alumni.ubc.ca', 'playing violin');
INSERT INTO HaveAward VALUES('Emmy Award', '2004-7-10', 'James_9427@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('James_9427@alumni.ubc.ca', 'SUS', 'VP Internal');
INSERT INTO HaveProject VALUES('James_9427@alumni.ubc.ca', 'PriceBeat', 'HTML');
INSERT INTO AppliesTo VALUES('2ee35', 'James_9427@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-811-9190', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-811-9190', 'Alberta');
INSERT INTO Applicant2 VALUES('Sherry Ng', 'Sherry_4045@alumni.ubc.ca', '8401 Oak Lane', 'SherryNg-12162', 'just honestly wants money', '780-811-9190');
INSERT INTO HaveHobby VALUES('Sherry_4045@alumni.ubc.ca', 'swimming');
INSERT INTO HaveAward VALUES('Academy Award', '2003-12-25', 'Sherry_4045@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Sherry_4045@alumni.ubc.ca', 'UBC CVC', 'Events Committee Chair');
INSERT INTO HaveProject VALUES('Sherry_4045@alumni.ubc.ca', 'Bootcamp.org', 'CSS');
INSERT INTO AppliesTo VALUES('0cy27', 'Sherry_4045@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-945-3532', 'Montreal');
INSERT INTO Applicant3 VALUES('514-945-3532', 'Quebec');
INSERT INTO Applicant2 VALUES('Megan Specter', 'Megan_7677@alumni.ubc.ca', '5373 Shaughnessy Parkway', 'MeganSpecter-9063', 'work well under pressure', '514-945-3532');
INSERT INTO HaveHobby VALUES('Megan_7677@alumni.ubc.ca', 'bowling');
INSERT INTO HaveAward VALUES('Billboard Award', '1999-6-11', 'Megan_7677@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Megan_7677@alumni.ubc.ca', 'VGH', 'Volunteer');
INSERT INTO HaveProject VALUES('Megan_7677@alumni.ubc.ca', 'Calendar', 'Swift');
INSERT INTO AppliesTo VALUES('9qg47', 'Megan_7677@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-397-6975', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-397-6975', 'Ontario');
INSERT INTO Applicant2 VALUES('Megan Jones', 'Megan_4723@alumni.ubc.ca', '3010 King Edward Crescent', 'MeganJones-29552', 'can speak 7 languages fluenty', '905-397-6975');
INSERT INTO HaveHobby VALUES('Megan_4723@alumni.ubc.ca', 'hockey');
INSERT INTO HaveAward VALUES('Duke of Edinburgh', '1952-10-18', 'Megan_4723@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Megan_4723@alumni.ubc.ca', 'UBC CSSS', 'Social Officer');
INSERT INTO HaveProject VALUES('Megan_4723@alumni.ubc.ca', 'Boggle Solver', 'C/C++');
INSERT INTO AppliesTo VALUES('2nh99', 'Megan_4723@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-689-7992', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-689-7992', 'Nunavut');
INSERT INTO Applicant2 VALUES('Korra Kitagawa', 'Korra_2583@alumni.ubc.ca', '4393 Porky Court', 'KorraKitagawa-67330', 'hardworking', '867-689-7992');
INSERT INTO HaveHobby VALUES('Korra_2583@alumni.ubc.ca', 'martial arts');
INSERT INTO HaveAward VALUES('Horatio Alger', '1960-8-23', 'Korra_2583@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Korra_2583@alumni.ubc.ca', 'UBC CSA', 'Marketing Committee');
INSERT INTO HaveProject VALUES('Korra_2583@alumni.ubc.ca', 'Cookie Clicker', 'JavaScript');
INSERT INTO AppliesTo VALUES('8rm09', 'Korra_2583@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-344-4291', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-344-4291', 'Alberta');
INSERT INTO Applicant2 VALUES('Sherry Chen', 'Sherry_7219@alumni.ubc.ca', '7823 Tuaq Way', 'SherryChen-86231', 'thrive in fast-paced environments', '780-344-4291');
INSERT INTO HaveHobby VALUES('Sherry_7219@alumni.ubc.ca', 'basketball');
INSERT INTO HaveAward VALUES('Provincial Scholarship', '1962-10-9', 'Sherry_7219@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Sherry_7219@alumni.ubc.ca', 'UBC Dance Horizons', 'Prima Ballerina');
INSERT INTO HaveProject VALUES('Sherry_7219@alumni.ubc.ca', 'BusesAreUs', 'Java');
INSERT INTO AppliesTo VALUES('4be08', 'Sherry_7219@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-780-5724', 'Montreal');
INSERT INTO Applicant3 VALUES('514-780-5724', 'Quebec');
INSERT INTO Applicant2 VALUES('Alison Brown', 'Alison_3550@alumni.ubc.ca', '9696 Margaret Way', 'AlisonBrown-50694', 'just honestly wants money', '514-780-5724');
INSERT INTO HaveHobby VALUES('Alison_3550@alumni.ubc.ca', 'soccer');
INSERT INTO HaveAward VALUES('National Scholarship', '1956-7-13', 'Alison_3550@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Alison_3550@alumni.ubc.ca', 'UBC Acapella', 'Lead Singer');
INSERT INTO HaveProject VALUES('Alison_3550@alumni.ubc.ca', 'RegisterMe', 'Python');
INSERT INTO AppliesTo VALUES('5pu05', 'Alison_3550@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-956-4829', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-956-4829', 'British Columbia');
INSERT INTO Applicant2 VALUES('George Mao', 'George_2155@alumni.ubc.ca', '6651 Wart Lane', 'GeorgeMao-56658', 'quick-learner', '604-956-4829');
INSERT INTO HaveHobby VALUES('George_2155@alumni.ubc.ca', 'baseball');
INSERT INTO HaveAward VALUES('First in hackathon', '1990-9-4', 'George_2155@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('George_2155@alumni.ubc.ca', 'Heart and Stroke Foundation', 'Sponsorship Chair');
INSERT INTO HaveProject VALUES('George_2155@alumni.ubc.ca', 'Facebook.com', 'Ruby');
INSERT INTO AppliesTo VALUES('6xn53', 'George_2155@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-913-9943', 'Calgary');
INSERT INTO Applicant3 VALUES('403-913-9943', 'Alberta');
INSERT INTO Applicant2 VALUES('Mick Mophead', 'Mick_85@alumni.ubc.ca', '3987 Shaughnessy Parkway', 'MickMophead-13660', 'strong communication skills', '403-913-9943');
INSERT INTO HaveHobby VALUES('Mick_85@alumni.ubc.ca', 'volleyball');
INSERT INTO HaveAward VALUES('Second in hackathon', '1985-5-28', 'Mick_85@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Mick_85@alumni.ubc.ca', 'Safeway', 'Cashier');
INSERT INTO HaveProject VALUES('Mick_85@alumni.ubc.ca', 'MathHelp', 'Haskell');
INSERT INTO AppliesTo VALUES('2tz51', 'Mick_85@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-749-4689', 'Montreal');
INSERT INTO Applicant3 VALUES('514-749-4689', 'Quebec');
INSERT INTO Applicant2 VALUES('Tom Watanabe', 'Tom_6910@alumni.ubc.ca', '3387 Kingsway Avenue', 'TomWatanabe-81748', 'newly graduated', '514-749-4689');
INSERT INTO HaveHobby VALUES('Tom_6910@alumni.ubc.ca', 'drawing');
INSERT INTO HaveAward VALUES('Third in hackathon', '2016-7-3', 'Tom_6910@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Tom_6910@alumni.ubc.ca', 'PNE', 'Ticket Seller');
INSERT INTO HaveProject VALUES('Tom_6910@alumni.ubc.ca', 'FrogGer', 'Prolog');
INSERT INTO AppliesTo VALUES('5fo52', 'Tom_6910@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-447-3751', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-447-3751', 'Nunavut');
INSERT INTO Applicant2 VALUES('Priscilla Jones', 'Priscilla_2849@alumni.ubc.ca', '3495 E41st Way', 'PriscillaJones-79450', 'team-player', '867-447-3751');
INSERT INTO HaveHobby VALUES('Priscilla_2849@alumni.ubc.ca', 'programming');
INSERT INTO HaveAward VALUES('other', '2006-12-21', 'Priscilla_2849@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Priscilla_2849@alumni.ubc.ca', 'Google', 'Software Engineer');
INSERT INTO HaveProject VALUES('Priscilla_2849@alumni.ubc.ca', 'MySims', 'C#');
INSERT INTO AppliesTo VALUES('0nc05', 'Priscilla_2849@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-328-5490', 'Calgary');
INSERT INTO Applicant3 VALUES('403-328-5490', 'Alberta');
INSERT INTO Applicant2 VALUES('Esther Lestrange', 'Esther_4017@alumni.ubc.ca', '7680 Broadway Avenue', 'EstherLestrange-56930', 'quick-learner', '403-328-5490');
INSERT INTO HaveHobby VALUES('Esther_4017@alumni.ubc.ca', 'reading');
INSERT INTO HaveAward VALUES('Principals list', '2010-8-13', 'Esther_4017@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Esther_4017@alumni.ubc.ca', 'Yahoo!', 'Project Manager');
INSERT INTO HaveProject VALUES('Esther_4017@alumni.ubc.ca', 'ResumeGenerator', 'PHP');
INSERT INTO AppliesTo VALUES('7er93', 'Esther_4017@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-133-7921', 'Calgary');
INSERT INTO Applicant3 VALUES('403-133-7921', 'Alberta');
INSERT INTO Applicant2 VALUES('Christina Ross', 'Christina_1225@alumni.ubc.ca', '1164 Skana Parkway', 'ChristinaRoss-66606', 'can speak 7 languages fluenty', '403-133-7921');
INSERT INTO HaveHobby VALUES('Christina_1225@alumni.ubc.ca', 'volunteering');
INSERT INTO HaveAward VALUES('Honour roll', '2002-6-2', 'Christina_1225@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Christina_1225@alumni.ubc.ca', 'Yelp', 'Team Lead');
INSERT INTO HaveProject VALUES('Christina_1225@alumni.ubc.ca', 'GetData', 'SQL');
INSERT INTO AppliesTo VALUES('8oo50', 'Christina_1225@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-949-3131', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-949-3131', 'Ontario');
INSERT INTO Applicant2 VALUES('Mikey Smith', 'Mikey_6910@alumni.ubc.ca', '2064 Porky Lane', 'MikeySmith-60368', 'really desperate for a job', '905-949-3131');
INSERT INTO HaveHobby VALUES('Mikey_6910@alumni.ubc.ca', 'cooking');
INSERT INTO HaveAward VALUES('Most improved', '1954-12-16', 'Mikey_6910@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Mikey_6910@alumni.ubc.ca', 'Microsoft', 'Software Developer');
INSERT INTO HaveProject VALUES('Mikey_6910@alumni.ubc.ca', 'InMyFridge', 'other');
INSERT INTO AppliesTo VALUES('1gv16', 'Mikey_6910@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-197-1295', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-197-1295', 'British Columbia');
INSERT INTO Applicant2 VALUES('Bob Carson', 'Bob_2997@alumni.ubc.ca', '1496 Dunbar Drive', 'BobCarson-6091', 'efficient', '604-197-1295');
INSERT INTO HaveHobby VALUES('Bob_2997@alumni.ubc.ca', 'other');
INSERT INTO HaveAward VALUES('Sportsmanship', '1987-5-18', 'Bob_2997@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Bob_2997@alumni.ubc.ca', 'Amazon', 'QA Lead');
INSERT INTO HaveProject VALUES('Bob_2997@alumni.ubc.ca', 'PriceBeat', 'HTML');
INSERT INTO AppliesTo VALUES('7xq30', 'Bob_2997@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-562-3311', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-562-3311', 'British Columbia');
INSERT INTO Applicant2 VALUES('Brianna Mophead', 'Brianna_8126@alumni.ubc.ca', '8727 Yonge Crescent', 'BriannaMophead-2487', 'strong writing skills', '604-562-3311');
INSERT INTO HaveHobby VALUES('Brianna_8126@alumni.ubc.ca', 'gaming');
INSERT INTO HaveAward VALUES('Gold medal', '1974-2-26', 'Brianna_8126@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Brianna_8126@alumni.ubc.ca', 'Intel', 'Firmware Engineer');
INSERT INTO HaveProject VALUES('Brianna_8126@alumni.ubc.ca', 'Bootcamp.org', 'CSS');
INSERT INTO AppliesTo VALUES('6id12', 'Brianna_8126@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-486-5090', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-486-5090', 'Alberta');
INSERT INTO Applicant2 VALUES('Anna Smith', 'Anna_5367@alumni.ubc.ca', '9882 Honeydukes Drive', 'AnnaSmith-47964', 'can speak 7 languages fluenty', '780-486-5090');
INSERT INTO HaveHobby VALUES('Anna_5367@alumni.ubc.ca', 'singing');
INSERT INTO HaveAward VALUES('Silver medal', '1996-7-8', 'Anna_5367@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Anna_5367@alumni.ubc.ca', 'SAP', 'DevOps');
INSERT INTO HaveProject VALUES('Anna_5367@alumni.ubc.ca', 'Calendar', 'Swift');
INSERT INTO AppliesTo VALUES('5gi34', 'Anna_5367@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-766-6067', 'Calgary');
INSERT INTO Applicant3 VALUES('403-766-6067', 'Alberta');
INSERT INTO Applicant2 VALUES('Bob Crunch', 'Bob_5011@alumni.ubc.ca', '6760 Yonge Boulevard', 'BobCrunch-76729', 'can speak 7 languages fluenty', '403-766-6067');
INSERT INTO HaveHobby VALUES('Bob_5011@alumni.ubc.ca', 'dancing');
INSERT INTO HaveAward VALUES('Bronze medal', '2017-1-10', 'Bob_5011@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Bob_5011@alumni.ubc.ca', 'Cisco', 'Web Developer');
INSERT INTO HaveProject VALUES('Bob_5011@alumni.ubc.ca', 'Boggle Solver', 'C/C++');
INSERT INTO AppliesTo VALUES('4om22', 'Bob_5011@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-881-8586', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-881-8586', 'Ontario');
INSERT INTO Applicant2 VALUES('Tom Ross', 'Tom_1290@alumni.ubc.ca', '4434 W14th Crescent', 'TomRoss-97759', 'newly graduated', '905-881-8586');
INSERT INTO HaveHobby VALUES('Tom_1290@alumni.ubc.ca', 'playing flute');
INSERT INTO HaveAward VALUES('Nobel Prize', '2006-11-21', 'Tom_1290@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Tom_1290@alumni.ubc.ca', 'Tasktop', 'QA Lead');
INSERT INTO HaveProject VALUES('Tom_1290@alumni.ubc.ca', 'Cookie Clicker', 'JavaScript');
INSERT INTO AppliesTo VALUES('6hu22', 'Tom_1290@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-871-4370', 'Halifax');
INSERT INTO Applicant3 VALUES('902-871-4370', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('Josh Longbottom', 'Josh_3710@alumni.ubc.ca', '3334 Yonge Avenue', 'JoshLongbottom-48760', 'just honestly wants money', '902-871-4370');
INSERT INTO HaveHobby VALUES('Josh_3710@alumni.ubc.ca', 'playing piano');
INSERT INTO HaveAward VALUES('Grammy Award', '1976-8-2', 'Josh_3710@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Josh_3710@alumni.ubc.ca', 'AppNeta', 'Software Developer');
INSERT INTO HaveProject VALUES('Josh_3710@alumni.ubc.ca', 'BusesAreUs', 'Java');
INSERT INTO AppliesTo VALUES('8an91', 'Josh_3710@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-389-4667', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-389-4667', 'Alberta');
INSERT INTO Applicant2 VALUES('Jamie Pope', 'Jamie_4630@alumni.ubc.ca', '4637 Hastings Boulevard', 'JamiePope-46056', 'efficient', '780-389-4667');
INSERT INTO HaveHobby VALUES('Jamie_4630@alumni.ubc.ca', 'playing violin');
INSERT INTO HaveAward VALUES('Emmy Award', '2004-7-10', 'Jamie_4630@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Jamie_4630@alumni.ubc.ca', 'Fatigue Science', 'Software Engineer');
INSERT INTO HaveProject VALUES('Jamie_4630@alumni.ubc.ca', 'RegisterMe', 'Python');
INSERT INTO AppliesTo VALUES('1st75', 'Jamie_4630@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-283-7671', 'Calgary');
INSERT INTO Applicant3 VALUES('403-283-7671', 'Alberta');
INSERT INTO Applicant2 VALUES('Sherry Lee', 'Sherry_8783@alumni.ubc.ca', '7185 W16th Court', 'SherryLee-88202', 'positive energy', '403-283-7671');
INSERT INTO HaveHobby VALUES('Sherry_8783@alumni.ubc.ca', 'swimming');
INSERT INTO HaveAward VALUES('Academy Award', '2003-12-25', 'Sherry_8783@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Sherry_8783@alumni.ubc.ca', 'Trulioo', 'Mobile Developer');
INSERT INTO HaveProject VALUES('Sherry_8783@alumni.ubc.ca', 'Facebook.com', 'Ruby');
INSERT INTO AppliesTo VALUES('7ki72', 'Sherry_8783@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-501-9942', 'Halifax');
INSERT INTO Applicant3 VALUES('902-501-9942', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('Mick Yang', 'Mick_2541@alumni.ubc.ca', '4749 Skana Lane', 'MickYang-29087', 'really fun to have around', '902-501-9942');
INSERT INTO HaveHobby VALUES('Mick_2541@alumni.ubc.ca', 'bowling');
INSERT INTO HaveAward VALUES('Billboard Award', '1999-6-11', 'Mick_2541@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Mick_2541@alumni.ubc.ca', 'Hootsuite', 'Web Application Developer');
INSERT INTO HaveProject VALUES('Mick_2541@alumni.ubc.ca', 'MathHelp', 'Haskell');
INSERT INTO AppliesTo VALUES('4uj53', 'Mick_2541@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-742-4912', 'Toronto');
INSERT INTO Applicant3 VALUES('647-742-4912', 'Ontario');
INSERT INTO Applicant2 VALUES('Chris Potter', 'Chris_4439@alumni.ubc.ca', '9207 Hyack Lane', 'ChrisPotter-15506', 'thrive in fast-paced environments', '647-742-4912');
INSERT INTO HaveHobby VALUES('Chris_4439@alumni.ubc.ca', 'hockey');
INSERT INTO HaveAward VALUES('Duke of Edinburgh', '1952-10-18', 'Chris_4439@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Chris_4439@alumni.ubc.ca', 'Absolute Software', 'CloudOps');
INSERT INTO HaveProject VALUES('Chris_4439@alumni.ubc.ca', 'FrogGer', 'Prolog');
INSERT INTO AppliesTo VALUES('4cq37', 'Chris_4439@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-683-1523', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-683-1523', 'Ontario');
INSERT INTO Applicant2 VALUES('Charlie Chen', 'Charlie_970@alumni.ubc.ca', '4134 W16th Alley', 'CharlieChen-85285', 'strong writing skills', '905-683-1523');
INSERT INTO HaveHobby VALUES('Charlie_970@alumni.ubc.ca', 'martial arts');
INSERT INTO HaveAward VALUES('Horatio Alger', '1960-8-23', 'Charlie_970@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Charlie_970@alumni.ubc.ca', 'TD Bank', 'Accounting Clerk');
INSERT INTO HaveProject VALUES('Charlie_970@alumni.ubc.ca', 'MySims', 'C#');
INSERT INTO AppliesTo VALUES('5cd07', 'Charlie_970@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-925-9489', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-925-9489', 'British Columbia');
INSERT INTO Applicant2 VALUES('Daisy Jones', 'Daisy_8122@alumni.ubc.ca', '7177 Porky Parkway', 'DaisyJones-32974', 'really desperate for a job', '604-925-9489');
INSERT INTO HaveHobby VALUES('Daisy_8122@alumni.ubc.ca', 'basketball');
INSERT INTO HaveAward VALUES('Provincial Scholarship', '1962-10-9', 'Daisy_8122@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Daisy_8122@alumni.ubc.ca', 'Zara', 'Cashier');
INSERT INTO HaveProject VALUES('Daisy_8122@alumni.ubc.ca', 'ResumeGenerator', 'PHP');
INSERT INTO AppliesTo VALUES('2js33', 'Daisy_8122@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-664-7745', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-664-7745', 'Nunavut');
INSERT INTO Applicant2 VALUES('Charlotte Granger', 'Charlotte_1535@alumni.ubc.ca', '6436 W16th Boulevard', 'CharlotteGranger-75388', 'newly graduated', '867-664-7745');
INSERT INTO HaveHobby VALUES('Charlotte_1535@alumni.ubc.ca', 'soccer');
INSERT INTO HaveAward VALUES('National Scholarship', '1956-7-13', 'Charlotte_1535@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Charlotte_1535@alumni.ubc.ca', 'SUS', 'VP Internal');
INSERT INTO HaveProject VALUES('Charlotte_1535@alumni.ubc.ca', 'GetData', 'SQL');
INSERT INTO AppliesTo VALUES('8ob06', 'Charlotte_1535@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-173-3382', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-173-3382', 'Nunavut');
INSERT INTO Applicant2 VALUES('Bob Lee', 'Bob_468@alumni.ubc.ca', '5741 Skana Crescent', 'BobLee-24311', 'work well under pressure', '867-173-3382');
INSERT INTO HaveHobby VALUES('Bob_468@alumni.ubc.ca', 'baseball');
INSERT INTO HaveAward VALUES('First in hackathon', '1990-9-4', 'Bob_468@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Bob_468@alumni.ubc.ca', 'UBC CVC', 'Events Committee Chair');
INSERT INTO HaveProject VALUES('Bob_468@alumni.ubc.ca', 'InMyFridge', 'other');
INSERT INTO AppliesTo VALUES('2xs18', 'Bob_468@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-449-3751', 'Montreal');
INSERT INTO Applicant3 VALUES('514-449-3751', 'Quebec');
INSERT INTO Applicant2 VALUES('Minnie Jacobsen', 'Minnie_2349@alumni.ubc.ca', '3953 Kingsway Loop', 'MinnieJacobsen-55398', 'hardworking', '514-449-3751');
INSERT INTO HaveHobby VALUES('Minnie_2349@alumni.ubc.ca', 'volleyball');
INSERT INTO HaveAward VALUES('Second in hackathon', '1985-5-28', 'Minnie_2349@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Minnie_2349@alumni.ubc.ca', 'VGH', 'Volunteer');
INSERT INTO HaveProject VALUES('Minnie_2349@alumni.ubc.ca', 'PriceBeat', 'HTML');
INSERT INTO AppliesTo VALUES('2qb13', 'Minnie_2349@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-590-4944', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-590-4944', 'British Columbia');
INSERT INTO Applicant2 VALUES('Mikey Yang', 'Mikey_8431@alumni.ubc.ca', '5742 W10th Place', 'MikeyYang-28553', 'quick-learner', '604-590-4944');
INSERT INTO HaveHobby VALUES('Mikey_8431@alumni.ubc.ca', 'drawing');
INSERT INTO HaveAward VALUES('Third in hackathon', '2016-7-3', 'Mikey_8431@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Mikey_8431@alumni.ubc.ca', 'UBC CSSS', 'Social Officer');
INSERT INTO HaveProject VALUES('Mikey_8431@alumni.ubc.ca', 'Bootcamp.org', 'CSS');
INSERT INTO AppliesTo VALUES('6ra55', 'Mikey_8431@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-869-6270', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-869-6270', 'Alberta');
INSERT INTO Applicant2 VALUES('Vita Ho', 'Vita_610@alumni.ubc.ca', '2999 Pretty Alley', 'VitaHo-6986', 'hardworking', '780-869-6270');
INSERT INTO HaveHobby VALUES('Vita_610@alumni.ubc.ca', 'programming');
INSERT INTO HaveAward VALUES('other', '2006-12-21', 'Vita_610@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Vita_610@alumni.ubc.ca', 'UBC CSA', 'Marketing Committee');
INSERT INTO HaveProject VALUES('Vita_610@alumni.ubc.ca', 'Calendar', 'Swift');
INSERT INTO AppliesTo VALUES('5fg14', 'Vita_610@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-837-6455', 'Montreal');
INSERT INTO Applicant3 VALUES('514-837-6455', 'Quebec');
INSERT INTO Applicant2 VALUES('Amy Jones', 'Amy_4367@alumni.ubc.ca', '2711 E75th Street', 'AmyJones-58357', 'strong communication skills', '514-837-6455');
INSERT INTO HaveHobby VALUES('Amy_4367@alumni.ubc.ca', 'reading');
INSERT INTO HaveAward VALUES('Principals list', '2010-8-13', 'Amy_4367@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Amy_4367@alumni.ubc.ca', 'UBC Dance Horizons', 'Prima Ballerina');
INSERT INTO HaveProject VALUES('Amy_4367@alumni.ubc.ca', 'Boggle Solver', 'C/C++');
INSERT INTO AppliesTo VALUES('6wu40', 'Amy_4367@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-189-4303', 'Calgary');
INSERT INTO Applicant3 VALUES('403-189-4303', 'Alberta');
INSERT INTO Applicant2 VALUES('Elizabeth Weasley', 'Elizabeth_7867@alumni.ubc.ca', '1659 Wart Drive', 'ElizabethWeasley-19988', 'efficient', '403-189-4303');
INSERT INTO HaveHobby VALUES('Elizabeth_7867@alumni.ubc.ca', 'volunteering');
INSERT INTO HaveAward VALUES('Honour roll', '2002-6-2', 'Elizabeth_7867@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Elizabeth_7867@alumni.ubc.ca', 'UBC Acapella', 'Lead Singer');
INSERT INTO HaveProject VALUES('Elizabeth_7867@alumni.ubc.ca', 'Cookie Clicker', 'JavaScript');
INSERT INTO AppliesTo VALUES('1vz66', 'Elizabeth_7867@alumni.ubc.ca');
