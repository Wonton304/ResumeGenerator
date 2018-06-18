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
	(city varchar(100) not null,
	postalCode varchar(100),
	primary key(postalCode)
);

create table Location2
	(address varchar(100),
	postalCode varchar(100),
	primary key (address, postalCode));

create table Location3
	(postalCode varchar(100),
	province varchar(100),
	primary key(postalCode)
);

create table Company(
	companyName varchar(100) primary key,
	companyDescription varchar(1000),
	companyDomain varchar(100)
);

create table SituatedIn(
	postalCode varchar(100),
	address varchar(100),
	companyName varchar(100),
	primary key (postalCode, address, companyName),
	foreign key (address, postalCode) REFERENCES Location2(address, postalCode)
	ON DELETE CASCADE,
	foreign key (companyName) REFERENCES Company(companyName)
	ON DELETE CASCADE
);

create table RequiredTechnology
	(technologyName varchar(100),
	technologyRole varchar(100),
	minimumProficiency INTEGER CHECK (minimumProficiency >= 0 and minimumProficiency <= 5),
	technologyType varchar(100),
	primary key(technologyName));

create table CodingProject1
	(language varchar(100),
	projectName varchar(100),
	complexity INTEGER CHECK (complexity <= 5 and complexity > 0),
	projectDescription varchar(1000),
	category varchar(100),
	primary key(language, projectName));

create table Experience(
	organization varchar(100),
	experienceRole varchar(100),
	duration INTEGER CHECK (duration >= 0 and duration <= 1000),
	experienceType varchar(100),
	experienceDescription varchar(1000),
	primary key (organization, experienceRole)
);

create table Award(
	awardDescription varchar(1000),
	awardName varchar(100),
	dateReceived varchar(100),
	primary key (awardName, dateReceived)
);

create table Hobby(
	hobbyName varchar(100) primary key
);

create table JobPostingPosts(
	id varchar(100) NOT NULL,
	companyName varchar(100) NOT NULL,
	field varchar(100),
	positionTitle varchar(100),
	description varchar(1000),
	primary key(id),
	foreign key (companyName) REFERENCES Company(companyName)
	ON DELETE CASCADE
);

create table Requires(
	id varchar(100),
	technologyName varchar(100),
	primary key (id, technologyName),
	foreign key (id) REFERENCES JobPostingPosts(id)
	ON DELETE CASCADE,
	foreign key (technologyName) REFERENCES  RequiredTechnology
	ON DELETE CASCADE
);

create table Applicant1(
	applicantPhoneNumber varchar(100),
	applicantCity varchar(100)
);

create table Applicant2(
	applicantName varchar(100),
	applicantEmail varchar(100) primary key,
	applicantAddress varchar(100),
	githubAccount varchar(100),
	personalDescription varchar(1000),
	applicantPhoneNumber varchar(100)
);

create table Applicant3(
	applicantPhoneNumber varchar(100),
	applicantProvince varchar(100)
);

create table AppliesTo(
	id varchar(100),
	applicantEmail varchar(100),
	primary key (id, applicantEmail),
	foreign key (id) REFERENCES JobPostingPosts(id)
	ON DELETE CASCADE,
	foreign key (applicantEmail) REFERENCES Applicant2(applicantEmail)
	ON DELETE CASCADE
);

create table HaveProject(
	applicantEmail varchar(100),
	projectName varchar(100),
	language varchar(100),
	primary key(applicantEmail, projectName, language),
	foreign key(language, projectName) REFERENCES CodingProject1(language, projectName)
	ON DELETE CASCADE,
	foreign key (applicantEmail) References Applicant2(applicantEmail)
	ON DELETE CASCADE
);

create table HaveExperience(
	applicantEmail varchar(100),
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
	dateReceived varchar(100),
	applicantEmail varchar(100),
	primary key (awardName, dateReceived, applicantEmail),
	foreign key (awardName, dateReceived) REFERENCES Award(awardName, dateReceived)
	ON DELETE CASCADE,
	foreign key (applicantEmail) REFERENCES Applicant2(applicantEmail)
	ON DELETE CASCADE
);

create table HaveHobby(
	applicantEmail varchar(100),
	hobbyName varchar(100),
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
INSERT INTO Award VALUES('Prize for science', 'Nobel Prize', '1956-1-26');
INSERT INTO Award VALUES('Best actress', 'Grammy Award', '1974-9-21');
INSERT INTO Award VALUES('Best actor', 'Emmy Award', '1986-4-15');
INSERT INTO Award VALUES('Best supporting role', 'Academy Award', '1977-7-8');
INSERT INTO Award VALUES('Best song', 'Billboard Award', '1963-10-22');
INSERT INTO Award VALUES('Bronze badge', 'Duke of Edinburgh', '1951-11-13');
INSERT INTO Award VALUES('Academic scholarship', 'Horatio Alger', '1998-2-9');
INSERT INTO Award VALUES('Highest provincial score', 'Provincial Scholarship', '2009-2-25');
INSERT INTO Award VALUES('Best national scholar', 'National Scholarship', '1993-11-25');
INSERT INTO Award VALUES('Prize for BizHacks', 'First in hackathon', '1997-6-5');
INSERT INTO Award VALUES('Prize for NWHacks', 'Second in hackathon', '1962-1-26');
INSERT INTO Award VALUES('Prize for MedHacks', 'Third in hackathon', '2007-3-17');
INSERT INTO Award VALUES('other', 'other', '1966-3-4');
INSERT INTO Award VALUES('90%+ average', 'Principals list', '1968-1-25');
INSERT INTO Award VALUES('80%+ average', 'Honour roll', '1976-5-10');
INSERT INTO Award VALUES('For great improvement', 'Most improved', '1976-8-4');
INSERT INTO Award VALUES('For high school swim team', 'Sportsmanship', '1954-12-4');
INSERT INTO Award VALUES('Olympic swimming', 'Gold medal', '2005-11-17');
INSERT INTO Award VALUES('Olympic 100m dash', 'Silver medal', '1966-2-12');
INSERT INTO Award VALUES('Olympic marathon', 'Bronze medal', '1997-12-11');
INSERT INTO Experience VALUES('Google', 'Software Engineer', 6, 'work', 'developed software');
INSERT INTO Experience VALUES('Yahoo!', 'Project Manager', 3, 'work', 'oversaw projects');
INSERT INTO Experience VALUES('Yelp', 'Team Lead', 8, 'work', 'lead a team');
INSERT INTO Experience VALUES('Microsoft', 'Software Developer', 2, 'work', 'developed software');
INSERT INTO Experience VALUES('Amazon', 'QA Lead', 5, 'work', 'tested and debugged code');
INSERT INTO Experience VALUES('Intel', 'Firmware Engineer', 3, 'work', 'wrote firmware for SSD');
INSERT INTO Experience VALUES('SAP', 'DevOps', 1, 'work', 'developed stuff');
INSERT INTO Experience VALUES('Cisco', 'Web Developer', 3, 'work', 'developed web applications');
INSERT INTO Experience VALUES('Tasktop', 'QA Lead', 4, 'work', 'tested and debugged');
INSERT INTO Experience VALUES('AppNeta', 'Software Developer', 1, 'work', 'developed software');
INSERT INTO Experience VALUES('Fatigue Science', 'Software Engineer', 5, 'work', 'developed software');
INSERT INTO Experience VALUES('Trulioo', 'Mobile Developer', 5, 'work', 'developed mobile applications');
INSERT INTO Experience VALUES('Hootsuite', 'Web Application Developer', 5, 'work', 'developed web applications');
INSERT INTO Experience VALUES('Absolute Software', 'CloudOps', 5, 'work', 'developed cloud applications');
INSERT INTO Experience VALUES('TD Bank', 'Accounting Clerk', 6, 'work', 'did some accounting stuff');
INSERT INTO Experience VALUES('Zara', 'Cashier', 1, 'work', 'sold clothes');
INSERT INTO Experience VALUES('SUS', 'VP Internal', 5, 'extracurricular', 'in charge of internal team');
INSERT INTO Experience VALUES('UBC CVC', 'Events Committee Chair', 9, 'extracurricular', 'planned events');
INSERT INTO Experience VALUES('VGH', 'Volunteer', 9, 'volunteer', 'took care of patients');
INSERT INTO Experience VALUES('UBC CSSS', 'Social Officer', 9, 'extracurricular', 'planned events');
INSERT INTO Experience VALUES('UBC CSA', 'Marketing Committee', 8, 'extracurricular', 'marketed events');
INSERT INTO Experience VALUES('UBC Dance Horizons', 'Prima Ballerina', 2, 'extracurricular', 'danced lead in Swan Lake');
INSERT INTO Experience VALUES('UBC Acapella', 'Lead Singer', 1, 'extracurricular', 'sang lead in Shrekapella');
INSERT INTO Experience VALUES('Heart and Stroke Foundation', 'Sponsorship Chair', 8, 'volunteer', 'sought after sponsorships');
INSERT INTO Experience VALUES('Safeway', 'Cashier', 8, 'work', 'sold groceries');
INSERT INTO Experience VALUES('PNE', 'Ticket Seller', 8, 'work', 'sold tickets');
INSERT INTO CodingProject1 VALUES('C++', 'PriceBeat', 2, 'price match web app', 'personal');
INSERT INTO CodingProject1 VALUES('C', 'Bootcamp.org', 3, 'fitness website', 'personal');
INSERT INTO CodingProject1 VALUES('Java', 'Calendar', 1, 'iphone calendar', 'academic');
INSERT INTO CodingProject1 VALUES('jQuery', 'Boggle Solver', 1, 'solves a boggle board', 'academic');
INSERT INTO CodingProject1 VALUES('MySQL', 'Cookie Clicker', 2, 'cookie clicker game', 'personal');
INSERT INTO CodingProject1 VALUES('NoSQL', 'BusesAreUs', 1, 'android applciation', 'academic');
INSERT INTO CodingProject1 VALUES('JavaScript', 'RegisterMe', 3, 'web application for course registration', 'personal');
INSERT INTO CodingProject1 VALUES('NodeJS', 'Facebook.com', 3, 'social media website', 'personal');
INSERT INTO CodingProject1 VALUES('AngularJS', 'MathHelp', 2, 'math help website', 'personal');
INSERT INTO CodingProject1 VALUES('HTML', 'FrogGer', 1, 'frogger game', 'personal');
INSERT INTO CodingProject1 VALUES('CSS', 'MySims', 2, 'an avatar based game', 'academic');
INSERT INTO CodingProject1 VALUES('IntelliJ', 'ResumeGenerator', 3, 'generates resume', 'academic');
INSERT INTO CodingProject1 VALUES('Android Studio', 'GetData', 2, 'generates data from around the world', 'academic');
INSERT INTO CodingProject1 VALUES('Bootstrap', 'InMyFridge', 3, 'checks what recipes you can make with fridge ingredients', 'personal');
INSERT INTO CodingProject1 VALUES('Kotlin', 'Bobo', 1, 'displays pictures of dogs', 'academic');
INSERT INTO CodingProject1 VALUES('jUnit', 'Coconutty', 2, 'displays coconut recipes', 'academic');
INSERT INTO CodingProject1 VALUES('C#', 'Snake Game', 3, 'classic arcade snake game', 'personal');
INSERT INTO CodingProject1 VALUES('Python', 'Potato Farm', 3, 'game where you help farm potatoes', 'academic');
INSERT INTO CodingProject1 VALUES('R', 'Honesty', 1, 'anonymous forum', 'personal');
INSERT INTO CodingProject1 VALUES('MATLAB', 'Breadmaker', 3, 'bakery builder game', 'academic');
INSERT INTO CodingProject1 VALUES('ABAP', 'Balancer', 2, 'balancing game', 'personal');
INSERT INTO CodingProject1 VALUES('Assembly', 'AnimalTown', 1, 'zoo game', 'academic');
INSERT INTO CodingProject1 VALUES('JSON', 'Instagram', 3, 'social media app', 'personal');
INSERT INTO CodingProject1 VALUES('REST', 'Twitter', 3, 'social media app', 'academic');
INSERT INTO CodingProject1 VALUES('MVC', 'AIM', 3, 'messenger system', 'academic');
INSERT INTO CodingProject1 VALUES('.Net', 'MSN', 3, 'messenger system', 'academic');
INSERT INTO CodingProject1 VALUES('Unity', 'Taobao', 2, 'online marketplace', 'personal');
INSERT INTO CodingProject1 VALUES('Mongo', 'Aliexpress', 3, 'online marketplace', 'academic');
INSERT INTO CodingProject1 VALUES('CosmosDb', 'McDonalds', 1, 'fast food restaurant app', 'academic');
INSERT INTO CodingProject1 VALUES('ASP.NET', 'BestBuy.com', 2, 'online electronics market', 'academic');
INSERT INTO CodingProject1 VALUES('.Net', 'MoshiMonsters', 3, 'childrens game', 'personal');
INSERT INTO CodingProject1 VALUES('Git', 'Poptropica', 1, 'childrens game', 'academic');
INSERT INTO CodingProject1 VALUES('Bitbucket', 'Fantage', 3, 'childrens game', 'academic');
INSERT INTO CodingProject1 VALUES('Sourcetree', 'Baidu', 3, 'Chinese serach engine', 'personal');
INSERT INTO CodingProject1 VALUES('Ruby', 'Weibo', 1, 'Chinese social media', 'academic');
INSERT INTO CodingProject1 VALUES('PHP', 'Wechat', 3, 'Chinese social media', 'academic');
INSERT INTO CodingProject1 VALUES('Vue', 'billibilli', 1, 'video streaming', 'personal');
INSERT INTO CodingProject1 VALUES('SASS', 'QQ', 2, 'Chinese email', 'personal');
INSERT INTO CodingProject1 VALUES('React', 'Sudoku Solver', 2, 'solves sudoku puzzles', 'personal');
INSERT INTO CodingProject1 VALUES('Linux', 'PoolParty', 3, 'mobile game', 'academic');
INSERT INTO CodingProject1 VALUES('Typescript', 'Barbie.com', 1, 'childrens game', 'personal');
INSERT INTO CodingProject1 VALUES('MSSQL', 'Rehmap', 1, 'Rehab map', 'personal');
INSERT INTO Applicant1 VALUES('867-605-3696', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-605-3696', 'Nunavut');
INSERT INTO Applicant2 VALUES('Angela Mophead', 'Angela_8454@alumni.ubc.ca', '6750 W14th Place', 'AngelaMophead-69812', 'really desperate for a job', '867-605-3696');
INSERT INTO HaveHobby VALUES('Angela_8454@alumni.ubc.ca', 'playing flute');
INSERT INTO HaveAward VALUES('Nobel Prize', '1956-1-26', 'Angela_8454@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Angela_8454@alumni.ubc.ca', 'Google', 'Software Engineer');
INSERT INTO HaveProject VALUES('Angela_8454@alumni.ubc.ca', 'PriceBeat', 'C++');
INSERT INTO AppliesTo VALUES('7er93', 'Angela_8454@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7xq30', 'Angela_8454@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4om22', 'Angela_8454@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1st75', 'Angela_8454@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4cq37', 'Angela_8454@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-706-2837', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-706-2837', 'Ontario');
INSERT INTO Applicant2 VALUES('Bob Ng', 'Bob_1474@alumni.ubc.ca', '4991 Margaret Alley', 'BobNg-24575', 'newly graduated', '905-706-2837');
INSERT INTO HaveHobby VALUES('Bob_1474@alumni.ubc.ca', 'playing piano');
INSERT INTO HaveAward VALUES('Grammy Award', '1974-9-21', 'Bob_1474@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Bob_1474@alumni.ubc.ca', 'Yahoo!', 'Project Manager');
INSERT INTO HaveProject VALUES('Bob_1474@alumni.ubc.ca', 'Bootcamp.org', 'C');
INSERT INTO AppliesTo VALUES('8oo50', 'Bob_1474@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6id12', 'Bob_1474@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6hu22', 'Bob_1474@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7ki72', 'Bob_1474@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5cd07', 'Bob_1474@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-306-7110', 'Halifax');
INSERT INTO Applicant3 VALUES('902-306-7110', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('James Yang', 'James_8645@alumni.ubc.ca', '5567 Tuaq Street', 'JamesYang-54086', 'just honestly wants money', '902-306-7110');
INSERT INTO HaveHobby VALUES('James_8645@alumni.ubc.ca', 'playing violin');
INSERT INTO HaveAward VALUES('Emmy Award', '1986-4-15', 'James_8645@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('James_8645@alumni.ubc.ca', 'Yelp', 'Team Lead');
INSERT INTO HaveProject VALUES('James_8645@alumni.ubc.ca', 'Calendar', 'Java');
INSERT INTO AppliesTo VALUES('1gv16', 'James_8645@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5gi34', 'James_8645@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8an91', 'James_8645@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4uj53', 'James_8645@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2js33', 'James_8645@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-938-8338', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-938-8338', 'British Columbia');
INSERT INTO Applicant2 VALUES('Brianna Yang', 'Brianna_9431@alumni.ubc.ca', '5454 Porky Terrace', 'BriannaYang-74049', 'really fun to have around', '604-938-8338');
INSERT INTO HaveHobby VALUES('Brianna_9431@alumni.ubc.ca', 'swimming');
INSERT INTO HaveAward VALUES('Academy Award', '1977-7-8', 'Brianna_9431@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Brianna_9431@alumni.ubc.ca', 'Microsoft', 'Software Developer');
INSERT INTO HaveProject VALUES('Brianna_9431@alumni.ubc.ca', 'Boggle Solver', 'jQuery');
INSERT INTO AppliesTo VALUES('7xq30', 'Brianna_9431@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4om22', 'Brianna_9431@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1st75', 'Brianna_9431@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4cq37', 'Brianna_9431@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8ob06', 'Brianna_9431@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-113-8244', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-113-8244', 'Alberta');
INSERT INTO Applicant2 VALUES('Esther Granger', 'Esther_2778@alumni.ubc.ca', '1669 Shaughnessy Way', 'EstherGranger-85017', 'hardworking', '780-113-8244');
INSERT INTO HaveHobby VALUES('Esther_2778@alumni.ubc.ca', 'bowling');
INSERT INTO HaveAward VALUES('Billboard Award', '1963-10-22', 'Esther_2778@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Esther_2778@alumni.ubc.ca', 'Amazon', 'QA Lead');
INSERT INTO HaveProject VALUES('Esther_2778@alumni.ubc.ca', 'Cookie Clicker', 'MySQL');
INSERT INTO AppliesTo VALUES('6id12', 'Esther_2778@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6hu22', 'Esther_2778@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7ki72', 'Esther_2778@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5cd07', 'Esther_2778@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2xs18', 'Esther_2778@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-837-6019', 'Calgary');
INSERT INTO Applicant3 VALUES('403-837-6019', 'Alberta');
INSERT INTO Applicant2 VALUES('Alison Willis', 'Alison_9016@alumni.ubc.ca', '4492 W10th Way', 'AlisonWillis-50008', 'strong writing skills', '403-837-6019');
INSERT INTO HaveHobby VALUES('Alison_9016@alumni.ubc.ca', 'hockey');
INSERT INTO HaveAward VALUES('Duke of Edinburgh', '1951-11-13', 'Alison_9016@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Alison_9016@alumni.ubc.ca', 'Intel', 'Firmware Engineer');
INSERT INTO HaveProject VALUES('Alison_9016@alumni.ubc.ca', 'BusesAreUs', 'NoSQL');
INSERT INTO AppliesTo VALUES('5gi34', 'Alison_9016@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8an91', 'Alison_9016@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4uj53', 'Alison_9016@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2js33', 'Alison_9016@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2qb13', 'Alison_9016@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-919-5276', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-919-5276', 'British Columbia');
INSERT INTO Applicant2 VALUES('Bob Weasley', 'Bob_471@alumni.ubc.ca', '4063 E41st Alley', 'BobWeasley-37868', 'just honestly wants money', '604-919-5276');
INSERT INTO HaveHobby VALUES('Bob_471@alumni.ubc.ca', 'martial arts');
INSERT INTO HaveAward VALUES('Horatio Alger', '1998-2-9', 'Bob_471@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Bob_471@alumni.ubc.ca', 'SAP', 'DevOps');
INSERT INTO HaveProject VALUES('Bob_471@alumni.ubc.ca', 'RegisterMe', 'JavaScript');
INSERT INTO AppliesTo VALUES('4om22', 'Bob_471@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1st75', 'Bob_471@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4cq37', 'Bob_471@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8ob06', 'Bob_471@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6ra55', 'Bob_471@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-424-5226', 'Toronto');
INSERT INTO Applicant3 VALUES('647-424-5226', 'Ontario');
INSERT INTO Applicant2 VALUES('Anna Chen', 'Anna_5324@alumni.ubc.ca', '3537 Porky Drive', 'AnnaChen-32681', 'work well under pressure', '647-424-5226');
INSERT INTO HaveHobby VALUES('Anna_5324@alumni.ubc.ca', 'basketball');
INSERT INTO HaveAward VALUES('Provincial Scholarship', '2009-2-25', 'Anna_5324@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Anna_5324@alumni.ubc.ca', 'Cisco', 'Web Developer');
INSERT INTO HaveProject VALUES('Anna_5324@alumni.ubc.ca', 'Facebook.com', 'NodeJS');
INSERT INTO AppliesTo VALUES('6hu22', 'Anna_5324@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7ki72', 'Anna_5324@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5cd07', 'Anna_5324@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2xs18', 'Anna_5324@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5fg14', 'Anna_5324@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-672-7999', 'Halifax');
INSERT INTO Applicant3 VALUES('902-672-7999', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('Vivian Ross', 'Vivian_8454@alumni.ubc.ca', '3916 E75th Avenue', 'VivianRoss-54499', 'thrive in fast-paced environments', '902-672-7999');
INSERT INTO HaveHobby VALUES('Vivian_8454@alumni.ubc.ca', 'soccer');
INSERT INTO HaveAward VALUES('National Scholarship', '1993-11-25', 'Vivian_8454@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Vivian_8454@alumni.ubc.ca', 'Tasktop', 'QA Lead');
INSERT INTO HaveProject VALUES('Vivian_8454@alumni.ubc.ca', 'MathHelp', 'AngularJS');
INSERT INTO AppliesTo VALUES('8an91', 'Vivian_8454@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4uj53', 'Vivian_8454@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2js33', 'Vivian_8454@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2qb13', 'Vivian_8454@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6wu40', 'Vivian_8454@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-708-3836', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-708-3836', 'Alberta');
INSERT INTO Applicant2 VALUES('Po Granger', 'Po_2838@alumni.ubc.ca', '9817 Willingdon Lane', 'PoGranger-80887', 'just honestly wants money', '780-708-3836');
INSERT INTO HaveHobby VALUES('Po_2838@alumni.ubc.ca', 'baseball');
INSERT INTO HaveAward VALUES('First in hackathon', '1997-6-5', 'Po_2838@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Po_2838@alumni.ubc.ca', 'AppNeta', 'Software Developer');
INSERT INTO HaveProject VALUES('Po_2838@alumni.ubc.ca', 'FrogGer', 'HTML');
INSERT INTO AppliesTo VALUES('1st75', 'Po_2838@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4cq37', 'Po_2838@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8ob06', 'Po_2838@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6ra55', 'Po_2838@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1vz66', 'Po_2838@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-493-9572', 'Toronto');
INSERT INTO Applicant3 VALUES('647-493-9572', 'Ontario');
INSERT INTO Applicant2 VALUES('Christina Specter', 'Christina_9127@alumni.ubc.ca', '5313 King Edward Crescent', 'ChristinaSpecter-78610', 'strong communication skills', '647-493-9572');
INSERT INTO HaveHobby VALUES('Christina_9127@alumni.ubc.ca', 'volleyball');
INSERT INTO HaveAward VALUES('Second in hackathon', '1962-1-26', 'Christina_9127@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Christina_9127@alumni.ubc.ca', 'Fatigue Science', 'Software Engineer');
INSERT INTO HaveProject VALUES('Christina_9127@alumni.ubc.ca', 'MySims', 'CSS');
INSERT INTO AppliesTo VALUES('7ki72', 'Christina_9127@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5cd07', 'Christina_9127@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2xs18', 'Christina_9127@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5fg14', 'Christina_9127@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5df81', 'Christina_9127@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-224-2967', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-224-2967', 'Alberta');
INSERT INTO Applicant2 VALUES('Jamie Zhang', 'Jamie_7858@alumni.ubc.ca', '1343 Tuaq Crescent', 'JamieZhang-92783', 'efficient', '780-224-2967');
INSERT INTO HaveHobby VALUES('Jamie_7858@alumni.ubc.ca', 'drawing');
INSERT INTO HaveAward VALUES('Third in hackathon', '2007-3-17', 'Jamie_7858@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Jamie_7858@alumni.ubc.ca', 'Trulioo', 'Mobile Developer');
INSERT INTO HaveProject VALUES('Jamie_7858@alumni.ubc.ca', 'ResumeGenerator', 'IntelliJ');
INSERT INTO AppliesTo VALUES('4uj53', 'Jamie_7858@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2js33', 'Jamie_7858@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2qb13', 'Jamie_7858@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6wu40', 'Jamie_7858@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5in26', 'Jamie_7858@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-944-4866', 'Montreal');
INSERT INTO Applicant3 VALUES('514-944-4866', 'Quebec');
INSERT INTO Applicant2 VALUES('John Jacobsen', 'John_7643@alumni.ubc.ca', '5343 Margaret Road', 'JohnJacobsen-96900', 'can speak 7 languages fluenty', '514-944-4866');
INSERT INTO HaveHobby VALUES('John_7643@alumni.ubc.ca', 'programming');
INSERT INTO HaveAward VALUES('other', '1966-3-4', 'John_7643@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('John_7643@alumni.ubc.ca', 'Hootsuite', 'Web Application Developer');
INSERT INTO HaveProject VALUES('John_7643@alumni.ubc.ca', 'GetData', 'Android Studio');
INSERT INTO AppliesTo VALUES('4cq37', 'John_7643@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8ob06', 'John_7643@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6ra55', 'John_7643@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1vz66', 'John_7643@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ri86', 'John_7643@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-811-1777', 'Halifax');
INSERT INTO Applicant3 VALUES('902-811-1777', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('Sherry Williams', 'Sherry_5632@alumni.ubc.ca', '4598 Honeydukes Road', 'SherryWilliams-99492', 'work well under pressure', '902-811-1777');
INSERT INTO HaveHobby VALUES('Sherry_5632@alumni.ubc.ca', 'reading');
INSERT INTO HaveAward VALUES('Principals list', '1968-1-25', 'Sherry_5632@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Sherry_5632@alumni.ubc.ca', 'Absolute Software', 'CloudOps');
INSERT INTO HaveProject VALUES('Sherry_5632@alumni.ubc.ca', 'InMyFridge', 'Bootstrap');
INSERT INTO AppliesTo VALUES('5cd07', 'Sherry_5632@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2xs18', 'Sherry_5632@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5fg14', 'Sherry_5632@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5df81', 'Sherry_5632@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1sq51', 'Sherry_5632@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-574-2894', 'Toronto');
INSERT INTO Applicant3 VALUES('647-574-2894', 'Ontario');
INSERT INTO Applicant2 VALUES('Jason Ross', 'Jason_2135@alumni.ubc.ca', '7016 Willingdon Place', 'JasonRoss-33640', 'strong communication skills', '647-574-2894');
INSERT INTO HaveHobby VALUES('Jason_2135@alumni.ubc.ca', 'volunteering');
INSERT INTO HaveAward VALUES('Honour roll', '1976-5-10', 'Jason_2135@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Jason_2135@alumni.ubc.ca', 'TD Bank', 'Accounting Clerk');
INSERT INTO HaveProject VALUES('Jason_2135@alumni.ubc.ca', 'Bobo', 'Kotlin');
INSERT INTO AppliesTo VALUES('2js33', 'Jason_2135@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2qb13', 'Jason_2135@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6wu40', 'Jason_2135@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5in26', 'Jason_2135@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8er49', 'Jason_2135@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-790-7568', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-790-7568', 'British Columbia');
INSERT INTO Applicant2 VALUES('Esther Zhang', 'Esther_7443@alumni.ubc.ca', '7774 Dunbar Drive', 'EstherZhang-23073', 'work well under pressure', '604-790-7568');
INSERT INTO HaveHobby VALUES('Esther_7443@alumni.ubc.ca', 'cooking');
INSERT INTO HaveAward VALUES('Most improved', '1976-8-4', 'Esther_7443@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Esther_7443@alumni.ubc.ca', 'Zara', 'Cashier');
INSERT INTO HaveProject VALUES('Esther_7443@alumni.ubc.ca', 'Coconutty', 'jUnit');
INSERT INTO AppliesTo VALUES('8ob06', 'Esther_7443@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6ra55', 'Esther_7443@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1vz66', 'Esther_7443@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ri86', 'Esther_7443@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6bo14', 'Esther_7443@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-730-8368', 'Montreal');
INSERT INTO Applicant3 VALUES('514-730-8368', 'Quebec');
INSERT INTO Applicant2 VALUES('Kipling Ng', 'Kipling_8757@alumni.ubc.ca', '3866 E41st Court', 'KiplingNg-77416', 'can speak 7 languages fluenty', '514-730-8368');
INSERT INTO HaveHobby VALUES('Kipling_8757@alumni.ubc.ca', 'other');
INSERT INTO HaveAward VALUES('Sportsmanship', '1954-12-4', 'Kipling_8757@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Kipling_8757@alumni.ubc.ca', 'SUS', 'VP Internal');
INSERT INTO HaveProject VALUES('Kipling_8757@alumni.ubc.ca', 'Snake Game', 'C#');
INSERT INTO AppliesTo VALUES('2xs18', 'Kipling_8757@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5fg14', 'Kipling_8757@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5df81', 'Kipling_8757@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1sq51', 'Kipling_8757@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2ox78', 'Kipling_8757@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-643-5185', 'Toronto');
INSERT INTO Applicant3 VALUES('647-643-5185', 'Ontario');
INSERT INTO Applicant2 VALUES('Jason Mao', 'Jason_9001@alumni.ubc.ca', '2326 W10th Street', 'JasonMao-13132', 'strong writing skills', '647-643-5185');
INSERT INTO HaveHobby VALUES('Jason_9001@alumni.ubc.ca', 'gaming');
INSERT INTO HaveAward VALUES('Gold medal', '2005-11-17', 'Jason_9001@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Jason_9001@alumni.ubc.ca', 'UBC CVC', 'Events Committee Chair');
INSERT INTO HaveProject VALUES('Jason_9001@alumni.ubc.ca', 'Potato Farm', 'Python');
INSERT INTO AppliesTo VALUES('2qb13', 'Jason_9001@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6wu40', 'Jason_9001@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5in26', 'Jason_9001@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8er49', 'Jason_9001@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ez37', 'Jason_9001@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-884-9531', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-884-9531', 'Nunavut');
INSERT INTO Applicant2 VALUES('Harold Thompson', 'Harold_4600@alumni.ubc.ca', '7712 Alma Drive', 'HaroldThompson-71439', 'newly graduated', '867-884-9531');
INSERT INTO HaveHobby VALUES('Harold_4600@alumni.ubc.ca', 'singing');
INSERT INTO HaveAward VALUES('Silver medal', '1966-2-12', 'Harold_4600@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Harold_4600@alumni.ubc.ca', 'VGH', 'Volunteer');
INSERT INTO HaveProject VALUES('Harold_4600@alumni.ubc.ca', 'Honesty', 'R');
INSERT INTO AppliesTo VALUES('6ra55', 'Harold_4600@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1vz66', 'Harold_4600@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ri86', 'Harold_4600@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6bo14', 'Harold_4600@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5wi76', 'Harold_4600@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-336-1201', 'Calgary');
INSERT INTO Applicant3 VALUES('403-336-1201', 'Alberta');
INSERT INTO Applicant2 VALUES('Emily Mao', 'Emily_2963@alumni.ubc.ca', '9031 E41st Way', 'EmilyMao-95658', 'positive energy', '403-336-1201');
INSERT INTO HaveHobby VALUES('Emily_2963@alumni.ubc.ca', 'dancing');
INSERT INTO HaveAward VALUES('Bronze medal', '1997-12-11', 'Emily_2963@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Emily_2963@alumni.ubc.ca', 'UBC CSSS', 'Social Officer');
INSERT INTO HaveProject VALUES('Emily_2963@alumni.ubc.ca', 'Breadmaker', 'MATLAB');
INSERT INTO AppliesTo VALUES('5fg14', 'Emily_2963@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5df81', 'Emily_2963@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1sq51', 'Emily_2963@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2ox78', 'Emily_2963@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5hv85', 'Emily_2963@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-154-3876', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-154-3876', 'British Columbia');
INSERT INTO Applicant2 VALUES('Priscilla Jacobsen', 'Priscilla_2836@alumni.ubc.ca', '2626 Shaughnessy Road', 'PriscillaJacobsen-33144', 'quick-learner', '604-154-3876');
INSERT INTO HaveHobby VALUES('Priscilla_2836@alumni.ubc.ca', 'playing flute');
INSERT INTO HaveAward VALUES('Nobel Prize', '1956-1-26', 'Priscilla_2836@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Priscilla_2836@alumni.ubc.ca', 'UBC CSA', 'Marketing Committee');
INSERT INTO HaveProject VALUES('Priscilla_2836@alumni.ubc.ca', 'Balancer', 'ABAP');
INSERT INTO AppliesTo VALUES('6wu40', 'Priscilla_2836@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5in26', 'Priscilla_2836@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8er49', 'Priscilla_2836@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ez37', 'Priscilla_2836@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7ma03', 'Priscilla_2836@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-947-4120', 'Toronto');
INSERT INTO Applicant3 VALUES('647-947-4120', 'Ontario');
INSERT INTO Applicant2 VALUES('Sharon Jacobsen', 'Sharon_7252@alumni.ubc.ca', '8892 Oak Avenue', 'SharonJacobsen-65277', 'newly graduated', '647-947-4120');
INSERT INTO HaveHobby VALUES('Sharon_7252@alumni.ubc.ca', 'playing piano');
INSERT INTO HaveAward VALUES('Grammy Award', '1974-9-21', 'Sharon_7252@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Sharon_7252@alumni.ubc.ca', 'UBC Dance Horizons', 'Prima Ballerina');
INSERT INTO HaveProject VALUES('Sharon_7252@alumni.ubc.ca', 'AnimalTown', 'Assembly');
INSERT INTO AppliesTo VALUES('1vz66', 'Sharon_7252@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ri86', 'Sharon_7252@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6bo14', 'Sharon_7252@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5wi76', 'Sharon_7252@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1rj01', 'Sharon_7252@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-624-5777', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-624-5777', 'Ontario');
INSERT INTO Applicant2 VALUES('Esther Li', 'Esther_4972@alumni.ubc.ca', '3023 Dunbar Alley', 'EstherLi-71125', 'positive energy', '905-624-5777');
INSERT INTO HaveHobby VALUES('Esther_4972@alumni.ubc.ca', 'playing violin');
INSERT INTO HaveAward VALUES('Emmy Award', '1986-4-15', 'Esther_4972@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Esther_4972@alumni.ubc.ca', 'UBC Acapella', 'Lead Singer');
INSERT INTO HaveProject VALUES('Esther_4972@alumni.ubc.ca', 'Instagram', 'JSON');
INSERT INTO AppliesTo VALUES('5df81', 'Esther_4972@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1sq51', 'Esther_4972@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2ox78', 'Esther_4972@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5hv85', 'Esther_4972@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5et30', 'Esther_4972@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-130-5096', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-130-5096', 'British Columbia');
INSERT INTO Applicant2 VALUES('Vivian Choi', 'Vivian_9793@alumni.ubc.ca', '5178 Wart Way', 'VivianChoi-4034', 'team-player', '604-130-5096');
INSERT INTO HaveHobby VALUES('Vivian_9793@alumni.ubc.ca', 'swimming');
INSERT INTO HaveAward VALUES('Academy Award', '1977-7-8', 'Vivian_9793@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Vivian_9793@alumni.ubc.ca', 'Heart and Stroke Foundation', 'Sponsorship Chair');
INSERT INTO HaveProject VALUES('Vivian_9793@alumni.ubc.ca', 'Twitter', 'REST');
INSERT INTO AppliesTo VALUES('5in26', 'Vivian_9793@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8er49', 'Vivian_9793@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ez37', 'Vivian_9793@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7ma03', 'Vivian_9793@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9qk53', 'Vivian_9793@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-667-4489', 'Montreal');
INSERT INTO Applicant3 VALUES('514-667-4489', 'Quebec');
INSERT INTO Applicant2 VALUES('Sherry Potter', 'Sherry_3110@alumni.ubc.ca', '7617 W14th Lane', 'SherryPotter-54934', 'really fun to have around', '514-667-4489');
INSERT INTO HaveHobby VALUES('Sherry_3110@alumni.ubc.ca', 'bowling');
INSERT INTO HaveAward VALUES('Billboard Award', '1963-10-22', 'Sherry_3110@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Sherry_3110@alumni.ubc.ca', 'Safeway', 'Cashier');
INSERT INTO HaveProject VALUES('Sherry_3110@alumni.ubc.ca', 'AIM', 'MVC');
INSERT INTO AppliesTo VALUES('9ri86', 'Sherry_3110@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6bo14', 'Sherry_3110@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5wi76', 'Sherry_3110@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1rj01', 'Sherry_3110@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4cu97', 'Sherry_3110@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-463-4922', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-463-4922', 'Alberta');
INSERT INTO Applicant2 VALUES('Charlotte Pope', 'Charlotte_5474@alumni.ubc.ca', '6586 Willingdon Boulevard', 'CharlottePope-26623', 'quick-learner', '780-463-4922');
INSERT INTO HaveHobby VALUES('Charlotte_5474@alumni.ubc.ca', 'hockey');
INSERT INTO HaveAward VALUES('Duke of Edinburgh', '1951-11-13', 'Charlotte_5474@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Charlotte_5474@alumni.ubc.ca', 'PNE', 'Ticket Seller');
INSERT INTO HaveProject VALUES('Charlotte_5474@alumni.ubc.ca', 'MSN', '.Net');
INSERT INTO AppliesTo VALUES('1sq51', 'Charlotte_5474@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2ox78', 'Charlotte_5474@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5hv85', 'Charlotte_5474@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5et30', 'Charlotte_5474@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ag71', 'Charlotte_5474@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-648-9166', 'Calgary');
INSERT INTO Applicant3 VALUES('403-648-9166', 'Alberta');
INSERT INTO Applicant2 VALUES('Amy Willis', 'Amy_7957@alumni.ubc.ca', '9202 Kingsway Loop', 'AmyWillis-39807', 'quick-learner', '403-648-9166');
INSERT INTO HaveHobby VALUES('Amy_7957@alumni.ubc.ca', 'martial arts');
INSERT INTO HaveAward VALUES('Horatio Alger', '1998-2-9', 'Amy_7957@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Amy_7957@alumni.ubc.ca', 'Google', 'Software Engineer');
INSERT INTO HaveProject VALUES('Amy_7957@alumni.ubc.ca', 'Taobao', 'Unity');
INSERT INTO AppliesTo VALUES('8er49', 'Amy_7957@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ez37', 'Amy_7957@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7ma03', 'Amy_7957@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9qk53', 'Amy_7957@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4yv88', 'Amy_7957@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-755-2903', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-755-2903', 'Nunavut');
INSERT INTO Applicant2 VALUES('Vita Weasley', 'Vita_9149@alumni.ubc.ca', '4453 Yonge Place', 'VitaWeasley-71154', 'strong communication skills', '867-755-2903');
INSERT INTO HaveHobby VALUES('Vita_9149@alumni.ubc.ca', 'basketball');
INSERT INTO HaveAward VALUES('Provincial Scholarship', '2009-2-25', 'Vita_9149@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Vita_9149@alumni.ubc.ca', 'Yahoo!', 'Project Manager');
INSERT INTO HaveProject VALUES('Vita_9149@alumni.ubc.ca', 'Aliexpress', 'Mongo');
INSERT INTO AppliesTo VALUES('6bo14', 'Vita_9149@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5wi76', 'Vita_9149@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1rj01', 'Vita_9149@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4cu97', 'Vita_9149@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2ee35', 'Vita_9149@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-832-8157', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-832-8157', 'Alberta');
INSERT INTO Applicant2 VALUES('Jessica Malfoy', 'Jessica_3743@alumni.ubc.ca', '7787 Skana Alley', 'JessicaMalfoy-1384', 'work well under pressure', '780-832-8157');
INSERT INTO HaveHobby VALUES('Jessica_3743@alumni.ubc.ca', 'soccer');
INSERT INTO HaveAward VALUES('National Scholarship', '1993-11-25', 'Jessica_3743@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Jessica_3743@alumni.ubc.ca', 'Yelp', 'Team Lead');
INSERT INTO HaveProject VALUES('Jessica_3743@alumni.ubc.ca', 'McDonalds', 'CosmosDb');
INSERT INTO AppliesTo VALUES('2ox78', 'Jessica_3743@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5hv85', 'Jessica_3743@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5et30', 'Jessica_3743@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ag71', 'Jessica_3743@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('0cy27', 'Jessica_3743@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-740-5394', 'Toronto');
INSERT INTO Applicant3 VALUES('647-740-5394', 'Ontario');
INSERT INTO Applicant2 VALUES('Sharon Jacobsen', 'Sharon_505@alumni.ubc.ca', '1807 Alma Terrace', 'SharonJacobsen-79600', 'positive energy', '647-740-5394');
INSERT INTO HaveHobby VALUES('Sharon_505@alumni.ubc.ca', 'baseball');
INSERT INTO HaveAward VALUES('First in hackathon', '1997-6-5', 'Sharon_505@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Sharon_505@alumni.ubc.ca', 'Microsoft', 'Software Developer');
INSERT INTO HaveProject VALUES('Sharon_505@alumni.ubc.ca', 'BestBuy.com', 'ASP.NET');
INSERT INTO AppliesTo VALUES('9ez37', 'Sharon_505@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7ma03', 'Sharon_505@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9qk53', 'Sharon_505@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4yv88', 'Sharon_505@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9qg47', 'Sharon_505@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-774-3658', 'Toronto');
INSERT INTO Applicant3 VALUES('647-774-3658', 'Ontario');
INSERT INTO Applicant2 VALUES('Jason Li', 'Jason_9821@alumni.ubc.ca', '6560 Pretty Terrace', 'JasonLi-68638', 'positive energy', '647-774-3658');
INSERT INTO HaveHobby VALUES('Jason_9821@alumni.ubc.ca', 'volleyball');
INSERT INTO HaveAward VALUES('Second in hackathon', '1962-1-26', 'Jason_9821@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Jason_9821@alumni.ubc.ca', 'Amazon', 'QA Lead');
INSERT INTO HaveProject VALUES('Jason_9821@alumni.ubc.ca', 'MoshiMonsters', '.Net');
INSERT INTO AppliesTo VALUES('5wi76', 'Jason_9821@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1rj01', 'Jason_9821@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4cu97', 'Jason_9821@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2ee35', 'Jason_9821@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2nh99', 'Jason_9821@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-875-3219', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-875-3219', 'British Columbia');
INSERT INTO Applicant2 VALUES('Hailin Jung', 'Hailin_7651@alumni.ubc.ca', '6556 Water Way', 'HailinJung-12224', 'really fun to have around', '604-875-3219');
INSERT INTO HaveHobby VALUES('Hailin_7651@alumni.ubc.ca', 'drawing');
INSERT INTO HaveAward VALUES('Third in hackathon', '2007-3-17', 'Hailin_7651@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Hailin_7651@alumni.ubc.ca', 'Intel', 'Firmware Engineer');
INSERT INTO HaveProject VALUES('Hailin_7651@alumni.ubc.ca', 'Poptropica', 'Git');
INSERT INTO AppliesTo VALUES('5hv85', 'Hailin_7651@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5et30', 'Hailin_7651@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ag71', 'Hailin_7651@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('0cy27', 'Hailin_7651@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8rm09', 'Hailin_7651@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-230-9598', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-230-9598', 'Alberta');
INSERT INTO Applicant2 VALUES('Hillary Chen', 'Hillary_6517@alumni.ubc.ca', '5821 Kingsway Avenue', 'HillaryChen-13489', 'just honestly wants money', '780-230-9598');
INSERT INTO HaveHobby VALUES('Hillary_6517@alumni.ubc.ca', 'programming');
INSERT INTO HaveAward VALUES('other', '1966-3-4', 'Hillary_6517@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Hillary_6517@alumni.ubc.ca', 'SAP', 'DevOps');
INSERT INTO HaveProject VALUES('Hillary_6517@alumni.ubc.ca', 'Fantage', 'Bitbucket');
INSERT INTO AppliesTo VALUES('7ma03', 'Hillary_6517@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9qk53', 'Hillary_6517@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4yv88', 'Hillary_6517@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9qg47', 'Hillary_6517@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4be08', 'Hillary_6517@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-787-4031', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-787-4031', 'Nunavut');
INSERT INTO Applicant2 VALUES('Charlotte Crunch', 'Charlotte_341@alumni.ubc.ca', '1892 Templeton Drive', 'CharlotteCrunch-85052', 'efficient', '867-787-4031');
INSERT INTO HaveHobby VALUES('Charlotte_341@alumni.ubc.ca', 'reading');
INSERT INTO HaveAward VALUES('Principals list', '1968-1-25', 'Charlotte_341@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Charlotte_341@alumni.ubc.ca', 'Cisco', 'Web Developer');
INSERT INTO HaveProject VALUES('Charlotte_341@alumni.ubc.ca', 'Baidu', 'Sourcetree');
INSERT INTO AppliesTo VALUES('1rj01', 'Charlotte_341@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4cu97', 'Charlotte_341@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2ee35', 'Charlotte_341@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2nh99', 'Charlotte_341@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5pu05', 'Charlotte_341@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-622-2721', 'Toronto');
INSERT INTO Applicant3 VALUES('647-622-2721', 'Ontario');
INSERT INTO Applicant2 VALUES('Aang Pope', 'Aang_7714@alumni.ubc.ca', '5267 Hastings Street', 'AangPope-41156', 'can speak 7 languages fluenty', '647-622-2721');
INSERT INTO HaveHobby VALUES('Aang_7714@alumni.ubc.ca', 'volunteering');
INSERT INTO HaveAward VALUES('Honour roll', '1976-5-10', 'Aang_7714@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Aang_7714@alumni.ubc.ca', 'Tasktop', 'QA Lead');
INSERT INTO HaveProject VALUES('Aang_7714@alumni.ubc.ca', 'Weibo', 'Ruby');
INSERT INTO AppliesTo VALUES('5et30', 'Aang_7714@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ag71', 'Aang_7714@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('0cy27', 'Aang_7714@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8rm09', 'Aang_7714@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6xn53', 'Aang_7714@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-667-4951', 'Montreal');
INSERT INTO Applicant3 VALUES('514-667-4951', 'Quebec');
INSERT INTO Applicant2 VALUES('Jessica Pope', 'Jessica_1492@alumni.ubc.ca', '5220 Dunbar Avenue', 'JessicaPope-42204', 'strong writing skills', '514-667-4951');
INSERT INTO HaveHobby VALUES('Jessica_1492@alumni.ubc.ca', 'cooking');
INSERT INTO HaveAward VALUES('Most improved', '1976-8-4', 'Jessica_1492@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Jessica_1492@alumni.ubc.ca', 'AppNeta', 'Software Developer');
INSERT INTO HaveProject VALUES('Jessica_1492@alumni.ubc.ca', 'Wechat', 'PHP');
INSERT INTO AppliesTo VALUES('9qk53', 'Jessica_1492@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4yv88', 'Jessica_1492@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9qg47', 'Jessica_1492@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4be08', 'Jessica_1492@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2tz51', 'Jessica_1492@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-193-2538', 'Calgary');
INSERT INTO Applicant3 VALUES('403-193-2538', 'Alberta');
INSERT INTO Applicant2 VALUES('Aang Ho', 'Aang_7356@alumni.ubc.ca', '4661 Granville Crescent', 'AangHo-56922', 'strong writing skills', '403-193-2538');
INSERT INTO HaveHobby VALUES('Aang_7356@alumni.ubc.ca', 'other');
INSERT INTO HaveAward VALUES('Sportsmanship', '1954-12-4', 'Aang_7356@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Aang_7356@alumni.ubc.ca', 'Fatigue Science', 'Software Engineer');
INSERT INTO HaveProject VALUES('Aang_7356@alumni.ubc.ca', 'billibilli', 'Vue');
INSERT INTO AppliesTo VALUES('4cu97', 'Aang_7356@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2ee35', 'Aang_7356@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2nh99', 'Aang_7356@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5pu05', 'Aang_7356@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5fo52', 'Aang_7356@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-885-5783', 'Halifax');
INSERT INTO Applicant3 VALUES('902-885-5783', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('Daisy Crunch', 'Daisy_6839@alumni.ubc.ca', '3355 Broadway Court', 'DaisyCrunch-62615', 'quick-learner', '902-885-5783');
INSERT INTO HaveHobby VALUES('Daisy_6839@alumni.ubc.ca', 'gaming');
INSERT INTO HaveAward VALUES('Gold medal', '2005-11-17', 'Daisy_6839@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Daisy_6839@alumni.ubc.ca', 'Trulioo', 'Mobile Developer');
INSERT INTO HaveProject VALUES('Daisy_6839@alumni.ubc.ca', 'QQ', 'SASS');
INSERT INTO AppliesTo VALUES('9ag71', 'Daisy_6839@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('0cy27', 'Daisy_6839@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8rm09', 'Daisy_6839@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6xn53', 'Daisy_6839@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('0nc05', 'Daisy_6839@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-994-3330', 'Halifax');
INSERT INTO Applicant3 VALUES('902-994-3330', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('RadishHead Hope', 'RadishHead_493@alumni.ubc.ca', '1020 King Edward Drive', 'RadishHeadHope-944', 'just honestly wants money', '902-994-3330');
INSERT INTO HaveHobby VALUES('RadishHead_493@alumni.ubc.ca', 'singing');
INSERT INTO HaveAward VALUES('Silver medal', '1966-2-12', 'RadishHead_493@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('RadishHead_493@alumni.ubc.ca', 'Hootsuite', 'Web Application Developer');
INSERT INTO HaveProject VALUES('RadishHead_493@alumni.ubc.ca', 'Sudoku Solver', 'React');
INSERT INTO AppliesTo VALUES('4yv88', 'RadishHead_493@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9qg47', 'RadishHead_493@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4be08', 'RadishHead_493@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2tz51', 'RadishHead_493@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7er93', 'RadishHead_493@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-550-5745', 'Toronto');
INSERT INTO Applicant3 VALUES('647-550-5745', 'Ontario');
INSERT INTO Applicant2 VALUES('Harold Kan', 'Harold_38@alumni.ubc.ca', '8634 E75th Loop', 'HaroldKan-51719', 'really fun to have around', '647-550-5745');
INSERT INTO HaveHobby VALUES('Harold_38@alumni.ubc.ca', 'dancing');
INSERT INTO HaveAward VALUES('Bronze medal', '1997-12-11', 'Harold_38@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Harold_38@alumni.ubc.ca', 'Absolute Software', 'CloudOps');
INSERT INTO HaveProject VALUES('Harold_38@alumni.ubc.ca', 'PoolParty', 'Linux');
INSERT INTO AppliesTo VALUES('2ee35', 'Harold_38@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2nh99', 'Harold_38@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5pu05', 'Harold_38@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5fo52', 'Harold_38@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8oo50', 'Harold_38@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-318-5423', 'Halifax');
INSERT INTO Applicant3 VALUES('902-318-5423', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('Hillary Chen', 'Hillary_6154@alumni.ubc.ca', '5763 Trafalger Way', 'HillaryChen-49200', 'positive energy', '902-318-5423');
INSERT INTO HaveHobby VALUES('Hillary_6154@alumni.ubc.ca', 'playing flute');
INSERT INTO HaveAward VALUES('Nobel Prize', '1956-1-26', 'Hillary_6154@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Hillary_6154@alumni.ubc.ca', 'TD Bank', 'Accounting Clerk');
INSERT INTO HaveProject VALUES('Hillary_6154@alumni.ubc.ca', 'Barbie.com', 'Typescript');
INSERT INTO AppliesTo VALUES('0cy27', 'Hillary_6154@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8rm09', 'Hillary_6154@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6xn53', 'Hillary_6154@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('0nc05', 'Hillary_6154@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1gv16', 'Hillary_6154@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-955-7748', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-955-7748', 'British Columbia');
INSERT INTO Applicant2 VALUES('RadishHead Mao', 'RadishHead_5580@alumni.ubc.ca', '1941 W10th Road', 'RadishHeadMao-375', 'strong communication skills', '604-955-7748');
INSERT INTO HaveHobby VALUES('RadishHead_5580@alumni.ubc.ca', 'playing piano');
INSERT INTO HaveAward VALUES('Grammy Award', '1974-9-21', 'RadishHead_5580@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('RadishHead_5580@alumni.ubc.ca', 'Zara', 'Cashier');
INSERT INTO HaveProject VALUES('RadishHead_5580@alumni.ubc.ca', 'Rehmap', 'MSSQL');
INSERT INTO AppliesTo VALUES('9qg47', 'RadishHead_5580@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4be08', 'RadishHead_5580@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2tz51', 'RadishHead_5580@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7er93', 'RadishHead_5580@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7xq30', 'RadishHead_5580@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-912-7893', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-912-7893', 'Alberta');
INSERT INTO Applicant2 VALUES('Elizabeth Weasley', 'Elizabeth_5919@alumni.ubc.ca', '8965 Templeton Place', 'ElizabethWeasley-81828', 'strong writing skills', '780-912-7893');
INSERT INTO HaveHobby VALUES('Elizabeth_5919@alumni.ubc.ca', 'playing violin');
INSERT INTO HaveAward VALUES('Emmy Award', '1986-4-15', 'Elizabeth_5919@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Elizabeth_5919@alumni.ubc.ca', 'SUS', 'VP Internal');
INSERT INTO HaveProject VALUES('Elizabeth_5919@alumni.ubc.ca', 'PriceBeat', 'C++');
INSERT INTO AppliesTo VALUES('2nh99', 'Elizabeth_5919@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5pu05', 'Elizabeth_5919@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5fo52', 'Elizabeth_5919@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8oo50', 'Elizabeth_5919@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6id12', 'Elizabeth_5919@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-850-8819', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-850-8819', 'Ontario');
INSERT INTO Applicant2 VALUES('Amy Smith', 'Amy_8977@alumni.ubc.ca', '6578 Yonge Loop', 'AmySmith-44188', 'positive energy', '905-850-8819');
INSERT INTO HaveHobby VALUES('Amy_8977@alumni.ubc.ca', 'swimming');
INSERT INTO HaveAward VALUES('Academy Award', '1977-7-8', 'Amy_8977@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Amy_8977@alumni.ubc.ca', 'UBC CVC', 'Events Committee Chair');
INSERT INTO HaveProject VALUES('Amy_8977@alumni.ubc.ca', 'Bootcamp.org', 'C');
INSERT INTO AppliesTo VALUES('8rm09', 'Amy_8977@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6xn53', 'Amy_8977@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('0nc05', 'Amy_8977@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1gv16', 'Amy_8977@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5gi34', 'Amy_8977@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-236-3069', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-236-3069', 'British Columbia');
INSERT INTO Applicant2 VALUES('Sharon Li', 'Sharon_2056@alumni.ubc.ca', '7295 Shaughnessy Lane', 'SharonLi-46694', 'strong communication skills', '604-236-3069');
INSERT INTO HaveHobby VALUES('Sharon_2056@alumni.ubc.ca', 'bowling');
INSERT INTO HaveAward VALUES('Billboard Award', '1963-10-22', 'Sharon_2056@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Sharon_2056@alumni.ubc.ca', 'VGH', 'Volunteer');
INSERT INTO HaveProject VALUES('Sharon_2056@alumni.ubc.ca', 'Calendar', 'Java');
INSERT INTO AppliesTo VALUES('4be08', 'Sharon_2056@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2tz51', 'Sharon_2056@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7er93', 'Sharon_2056@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7xq30', 'Sharon_2056@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4om22', 'Sharon_2056@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-757-7290', 'Montreal');
INSERT INTO Applicant3 VALUES('514-757-7290', 'Quebec');
INSERT INTO Applicant2 VALUES('Po Granger', 'Po_7945@alumni.ubc.ca', '9565 Water Alley', 'PoGranger-43602', 'can speak 7 languages fluenty', '514-757-7290');
INSERT INTO HaveHobby VALUES('Po_7945@alumni.ubc.ca', 'hockey');
INSERT INTO HaveAward VALUES('Duke of Edinburgh', '1951-11-13', 'Po_7945@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Po_7945@alumni.ubc.ca', 'UBC CSSS', 'Social Officer');
INSERT INTO HaveProject VALUES('Po_7945@alumni.ubc.ca', 'Boggle Solver', 'jQuery');
INSERT INTO AppliesTo VALUES('5pu05', 'Po_7945@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5fo52', 'Po_7945@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8oo50', 'Po_7945@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6id12', 'Po_7945@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6hu22', 'Po_7945@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-501-6015', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-501-6015', 'Alberta');
INSERT INTO Applicant2 VALUES('George Ng', 'George_4712@alumni.ubc.ca', '9425 Yonge Lane', 'GeorgeNg-80311', 'positive energy', '780-501-6015');
INSERT INTO HaveHobby VALUES('George_4712@alumni.ubc.ca', 'martial arts');
INSERT INTO HaveAward VALUES('Horatio Alger', '1998-2-9', 'George_4712@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('George_4712@alumni.ubc.ca', 'UBC CSA', 'Marketing Committee');
INSERT INTO HaveProject VALUES('George_4712@alumni.ubc.ca', 'Cookie Clicker', 'MySQL');
INSERT INTO AppliesTo VALUES('6xn53', 'George_4712@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('0nc05', 'George_4712@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1gv16', 'George_4712@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5gi34', 'George_4712@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8an91', 'George_4712@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-454-4898', 'Calgary');
INSERT INTO Applicant3 VALUES('403-454-4898', 'Alberta');
INSERT INTO Applicant2 VALUES('Jessica Hope', 'Jessica_7082@alumni.ubc.ca', '1574 Templeton Loop', 'JessicaHope-39741', 'hardworking', '403-454-4898');
INSERT INTO HaveHobby VALUES('Jessica_7082@alumni.ubc.ca', 'basketball');
INSERT INTO HaveAward VALUES('Provincial Scholarship', '2009-2-25', 'Jessica_7082@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Jessica_7082@alumni.ubc.ca', 'UBC Dance Horizons', 'Prima Ballerina');
INSERT INTO HaveProject VALUES('Jessica_7082@alumni.ubc.ca', 'BusesAreUs', 'NoSQL');
INSERT INTO AppliesTo VALUES('2tz51', 'Jessica_7082@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7er93', 'Jessica_7082@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7xq30', 'Jessica_7082@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4om22', 'Jessica_7082@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1st75', 'Jessica_7082@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-757-6542', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-757-6542', 'Nunavut');
INSERT INTO Applicant2 VALUES('RadishHead Yang', 'RadishHead_7109@alumni.ubc.ca', '2516 W10th Avenue', 'RadishHeadYang-20859', 'just honestly wants money', '867-757-6542');
INSERT INTO HaveHobby VALUES('RadishHead_7109@alumni.ubc.ca', 'soccer');
INSERT INTO HaveAward VALUES('National Scholarship', '1993-11-25', 'RadishHead_7109@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('RadishHead_7109@alumni.ubc.ca', 'UBC Acapella', 'Lead Singer');
INSERT INTO HaveProject VALUES('RadishHead_7109@alumni.ubc.ca', 'RegisterMe', 'JavaScript');
INSERT INTO AppliesTo VALUES('5fo52', 'RadishHead_7109@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8oo50', 'RadishHead_7109@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6id12', 'RadishHead_7109@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6hu22', 'RadishHead_7109@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7ki72', 'RadishHead_7109@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-736-8444', 'Toronto');
INSERT INTO Applicant3 VALUES('647-736-8444', 'Ontario');
INSERT INTO Applicant2 VALUES('Jamie Mophead', 'Jamie_5393@alumni.ubc.ca', '9630 Hastings Avenue', 'JamieMophead-80785', 'positive energy', '647-736-8444');
INSERT INTO HaveHobby VALUES('Jamie_5393@alumni.ubc.ca', 'baseball');
INSERT INTO HaveAward VALUES('First in hackathon', '1997-6-5', 'Jamie_5393@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Jamie_5393@alumni.ubc.ca', 'Heart and Stroke Foundation', 'Sponsorship Chair');
INSERT INTO HaveProject VALUES('Jamie_5393@alumni.ubc.ca', 'Facebook.com', 'NodeJS');
INSERT INTO AppliesTo VALUES('0nc05', 'Jamie_5393@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1gv16', 'Jamie_5393@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5gi34', 'Jamie_5393@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8an91', 'Jamie_5393@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4uj53', 'Jamie_5393@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-875-8753', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-875-8753', 'British Columbia');
INSERT INTO Applicant2 VALUES('Dorothy Li', 'Dorothy_2645@alumni.ubc.ca', '5744 W14th Place', 'DorothyLi-68069', 'strong communication skills', '604-875-8753');
INSERT INTO HaveHobby VALUES('Dorothy_2645@alumni.ubc.ca', 'volleyball');
INSERT INTO HaveAward VALUES('Second in hackathon', '1962-1-26', 'Dorothy_2645@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Dorothy_2645@alumni.ubc.ca', 'Safeway', 'Cashier');
INSERT INTO HaveProject VALUES('Dorothy_2645@alumni.ubc.ca', 'MathHelp', 'AngularJS');
INSERT INTO AppliesTo VALUES('7er93', 'Dorothy_2645@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7xq30', 'Dorothy_2645@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4om22', 'Dorothy_2645@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1st75', 'Dorothy_2645@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4cq37', 'Dorothy_2645@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-981-2506', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-981-2506', 'Nunavut');
INSERT INTO Applicant2 VALUES('Minnie Crunch', 'Minnie_5501@alumni.ubc.ca', '5493 Water Drive', 'MinnieCrunch-96060', 'hardworking', '867-981-2506');
INSERT INTO HaveHobby VALUES('Minnie_5501@alumni.ubc.ca', 'drawing');
INSERT INTO HaveAward VALUES('Third in hackathon', '2007-3-17', 'Minnie_5501@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Minnie_5501@alumni.ubc.ca', 'PNE', 'Ticket Seller');
INSERT INTO HaveProject VALUES('Minnie_5501@alumni.ubc.ca', 'FrogGer', 'HTML');
INSERT INTO AppliesTo VALUES('8oo50', 'Minnie_5501@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6id12', 'Minnie_5501@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6hu22', 'Minnie_5501@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7ki72', 'Minnie_5501@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5cd07', 'Minnie_5501@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('514-992-3536', 'Montreal');
INSERT INTO Applicant3 VALUES('514-992-3536', 'Quebec');
INSERT INTO Applicant2 VALUES('Vita Potter', 'Vita_2296@alumni.ubc.ca', '8321 King Edward Road', 'VitaPotter-8629', 'thrive in fast-paced environments', '514-992-3536');
INSERT INTO HaveHobby VALUES('Vita_2296@alumni.ubc.ca', 'programming');
INSERT INTO HaveAward VALUES('other', '1966-3-4', 'Vita_2296@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Vita_2296@alumni.ubc.ca', 'Google', 'Software Engineer');
INSERT INTO HaveProject VALUES('Vita_2296@alumni.ubc.ca', 'MySims', 'CSS');
INSERT INTO AppliesTo VALUES('1gv16', 'Vita_2296@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5gi34', 'Vita_2296@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8an91', 'Vita_2296@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4uj53', 'Vita_2296@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2js33', 'Vita_2296@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-307-1966', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-307-1966', 'British Columbia');
INSERT INTO Applicant2 VALUES('Charlotte Crunch', 'Charlotte_1576@alumni.ubc.ca', '3301 King Edward Avenue', 'CharlotteCrunch-24047', 'team-player', '604-307-1966');
INSERT INTO HaveHobby VALUES('Charlotte_1576@alumni.ubc.ca', 'reading');
INSERT INTO HaveAward VALUES('Principals list', '1968-1-25', 'Charlotte_1576@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Charlotte_1576@alumni.ubc.ca', 'Yahoo!', 'Project Manager');
INSERT INTO HaveProject VALUES('Charlotte_1576@alumni.ubc.ca', 'ResumeGenerator', 'IntelliJ');
INSERT INTO AppliesTo VALUES('7xq30', 'Charlotte_1576@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4om22', 'Charlotte_1576@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1st75', 'Charlotte_1576@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4cq37', 'Charlotte_1576@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8ob06', 'Charlotte_1576@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-909-4078', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-909-4078', 'Ontario');
INSERT INTO Applicant2 VALUES('Hailin Thompson', 'Hailin_7988@alumni.ubc.ca', '4750 Hyack Terrace', 'HailinThompson-73156', 'quick-learner', '905-909-4078');
INSERT INTO HaveHobby VALUES('Hailin_7988@alumni.ubc.ca', 'volunteering');
INSERT INTO HaveAward VALUES('Honour roll', '1976-5-10', 'Hailin_7988@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Hailin_7988@alumni.ubc.ca', 'Yelp', 'Team Lead');
INSERT INTO HaveProject VALUES('Hailin_7988@alumni.ubc.ca', 'GetData', 'Android Studio');
INSERT INTO AppliesTo VALUES('6id12', 'Hailin_7988@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6hu22', 'Hailin_7988@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7ki72', 'Hailin_7988@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5cd07', 'Hailin_7988@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2xs18', 'Hailin_7988@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-417-5830', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-417-5830', 'Nunavut');
INSERT INTO Applicant2 VALUES('George Leong', 'George_8418@alumni.ubc.ca', '8189 Porky Terrace', 'GeorgeLeong-77029', 'newly graduated', '867-417-5830');
INSERT INTO HaveHobby VALUES('George_8418@alumni.ubc.ca', 'cooking');
INSERT INTO HaveAward VALUES('Most improved', '1976-8-4', 'George_8418@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('George_8418@alumni.ubc.ca', 'Microsoft', 'Software Developer');
INSERT INTO HaveProject VALUES('George_8418@alumni.ubc.ca', 'InMyFridge', 'Bootstrap');
INSERT INTO AppliesTo VALUES('5gi34', 'George_8418@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8an91', 'George_8418@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4uj53', 'George_8418@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2js33', 'George_8418@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2qb13', 'George_8418@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-422-9401', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-422-9401', 'Ontario');
INSERT INTO Applicant2 VALUES('RadishHead Weasley', 'RadishHead_8449@alumni.ubc.ca', '5655 Pretty Alley', 'RadishHeadWeasley-45292', 'team-player', '905-422-9401');
INSERT INTO HaveHobby VALUES('RadishHead_8449@alumni.ubc.ca', 'other');
INSERT INTO HaveAward VALUES('Sportsmanship', '1954-12-4', 'RadishHead_8449@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('RadishHead_8449@alumni.ubc.ca', 'Amazon', 'QA Lead');
INSERT INTO HaveProject VALUES('RadishHead_8449@alumni.ubc.ca', 'Bobo', 'Kotlin');
INSERT INTO AppliesTo VALUES('4om22', 'RadishHead_8449@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1st75', 'RadishHead_8449@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4cq37', 'RadishHead_8449@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8ob06', 'RadishHead_8449@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6ra55', 'RadishHead_8449@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-154-9228', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-154-9228', 'British Columbia');
INSERT INTO Applicant2 VALUES('Mick Carson', 'Mick_5329@alumni.ubc.ca', '6811 E41st Avenue', 'MickCarson-14930', 'newly graduated', '604-154-9228');
INSERT INTO HaveHobby VALUES('Mick_5329@alumni.ubc.ca', 'gaming');
INSERT INTO HaveAward VALUES('Gold medal', '2005-11-17', 'Mick_5329@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Mick_5329@alumni.ubc.ca', 'Intel', 'Firmware Engineer');
INSERT INTO HaveProject VALUES('Mick_5329@alumni.ubc.ca', 'Coconutty', 'jUnit');
INSERT INTO AppliesTo VALUES('6hu22', 'Mick_5329@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7ki72', 'Mick_5329@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5cd07', 'Mick_5329@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2xs18', 'Mick_5329@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5fg14', 'Mick_5329@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-570-5868', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-570-5868', 'Nunavut');
INSERT INTO Applicant2 VALUES('Vivian Mophead', 'Vivian_5607@alumni.ubc.ca', '1611 Hastings Place', 'VivianMophead-62737', 'just honestly wants money', '867-570-5868');
INSERT INTO HaveHobby VALUES('Vivian_5607@alumni.ubc.ca', 'singing');
INSERT INTO HaveAward VALUES('Silver medal', '1966-2-12', 'Vivian_5607@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Vivian_5607@alumni.ubc.ca', 'SAP', 'DevOps');
INSERT INTO HaveProject VALUES('Vivian_5607@alumni.ubc.ca', 'Snake Game', 'C#');
INSERT INTO AppliesTo VALUES('8an91', 'Vivian_5607@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4uj53', 'Vivian_5607@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2js33', 'Vivian_5607@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2qb13', 'Vivian_5607@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6wu40', 'Vivian_5607@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-322-3026', 'Calgary');
INSERT INTO Applicant3 VALUES('403-322-3026', 'Alberta');
INSERT INTO Applicant2 VALUES('Sherry Kan', 'Sherry_6673@alumni.ubc.ca', '9446 Alma Drive', 'SherryKan-23492', 'strong writing skills', '403-322-3026');
INSERT INTO HaveHobby VALUES('Sherry_6673@alumni.ubc.ca', 'dancing');
INSERT INTO HaveAward VALUES('Bronze medal', '1997-12-11', 'Sherry_6673@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Sherry_6673@alumni.ubc.ca', 'Cisco', 'Web Developer');
INSERT INTO HaveProject VALUES('Sherry_6673@alumni.ubc.ca', 'Potato Farm', 'Python');
INSERT INTO AppliesTo VALUES('1st75', 'Sherry_6673@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4cq37', 'Sherry_6673@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8ob06', 'Sherry_6673@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6ra55', 'Sherry_6673@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1vz66', 'Sherry_6673@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-717-8197', 'Halifax');
INSERT INTO Applicant3 VALUES('902-717-8197', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('Dorothy Thompson', 'Dorothy_5148@alumni.ubc.ca', '3390 Willingdon Terrace', 'DorothyThompson-66755', 'newly graduated', '902-717-8197');
INSERT INTO HaveHobby VALUES('Dorothy_5148@alumni.ubc.ca', 'playing flute');
INSERT INTO HaveAward VALUES('Nobel Prize', '1956-1-26', 'Dorothy_5148@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Dorothy_5148@alumni.ubc.ca', 'Tasktop', 'QA Lead');
INSERT INTO HaveProject VALUES('Dorothy_5148@alumni.ubc.ca', 'Honesty', 'R');
INSERT INTO AppliesTo VALUES('7ki72', 'Dorothy_5148@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5cd07', 'Dorothy_5148@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2xs18', 'Dorothy_5148@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5fg14', 'Dorothy_5148@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5df81', 'Dorothy_5148@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-215-7903', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-215-7903', 'Ontario');
INSERT INTO Applicant2 VALUES('Chris Granger', 'Chris_1940@alumni.ubc.ca', '5427 Water Loop', 'ChrisGranger-80708', 'just honestly wants money', '905-215-7903');
INSERT INTO HaveHobby VALUES('Chris_1940@alumni.ubc.ca', 'playing piano');
INSERT INTO HaveAward VALUES('Grammy Award', '1974-9-21', 'Chris_1940@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Chris_1940@alumni.ubc.ca', 'AppNeta', 'Software Developer');
INSERT INTO HaveProject VALUES('Chris_1940@alumni.ubc.ca', 'Breadmaker', 'MATLAB');
INSERT INTO AppliesTo VALUES('4uj53', 'Chris_1940@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2js33', 'Chris_1940@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2qb13', 'Chris_1940@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6wu40', 'Chris_1940@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5in26', 'Chris_1940@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-174-3248', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-174-3248', 'Ontario');
INSERT INTO Applicant2 VALUES('Minnie Li', 'Minnie_2450@alumni.ubc.ca', '5308 Burrard Lane', 'MinnieLi-9865', 'thrive in fast-paced environments', '905-174-3248');
INSERT INTO HaveHobby VALUES('Minnie_2450@alumni.ubc.ca', 'playing violin');
INSERT INTO HaveAward VALUES('Emmy Award', '1986-4-15', 'Minnie_2450@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Minnie_2450@alumni.ubc.ca', 'Fatigue Science', 'Software Engineer');
INSERT INTO HaveProject VALUES('Minnie_2450@alumni.ubc.ca', 'Balancer', 'ABAP');
INSERT INTO AppliesTo VALUES('4cq37', 'Minnie_2450@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8ob06', 'Minnie_2450@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6ra55', 'Minnie_2450@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1vz66', 'Minnie_2450@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ri86', 'Minnie_2450@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('780-775-3531', 'Edmonton');
INSERT INTO Applicant3 VALUES('780-775-3531', 'Alberta');
INSERT INTO Applicant2 VALUES('Hillary Brown', 'Hillary_9857@alumni.ubc.ca', '9468 Hyack Street', 'HillaryBrown-4791', 'hardworking', '780-775-3531');
INSERT INTO HaveHobby VALUES('Hillary_9857@alumni.ubc.ca', 'swimming');
INSERT INTO HaveAward VALUES('Academy Award', '1977-7-8', 'Hillary_9857@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Hillary_9857@alumni.ubc.ca', 'Trulioo', 'Mobile Developer');
INSERT INTO HaveProject VALUES('Hillary_9857@alumni.ubc.ca', 'AnimalTown', 'Assembly');
INSERT INTO AppliesTo VALUES('5cd07', 'Hillary_9857@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2xs18', 'Hillary_9857@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5fg14', 'Hillary_9857@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5df81', 'Hillary_9857@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1sq51', 'Hillary_9857@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-622-9167', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-622-9167', 'Nunavut');
INSERT INTO Applicant2 VALUES('Mick Williams', 'Mick_2979@alumni.ubc.ca', '8098 Trafalger Lane', 'MickWilliams-99793', 'newly graduated', '867-622-9167');
INSERT INTO HaveHobby VALUES('Mick_2979@alumni.ubc.ca', 'bowling');
INSERT INTO HaveAward VALUES('Billboard Award', '1963-10-22', 'Mick_2979@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Mick_2979@alumni.ubc.ca', 'Hootsuite', 'Web Application Developer');
INSERT INTO HaveProject VALUES('Mick_2979@alumni.ubc.ca', 'Instagram', 'JSON');
INSERT INTO AppliesTo VALUES('2js33', 'Mick_2979@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2qb13', 'Mick_2979@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6wu40', 'Mick_2979@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5in26', 'Mick_2979@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8er49', 'Mick_2979@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('905-890-9304', 'Mississauga');
INSERT INTO Applicant3 VALUES('905-890-9304', 'Ontario');
INSERT INTO Applicant2 VALUES('Jason Leong', 'Jason_139@alumni.ubc.ca', '9348 Burrard Court', 'JasonLeong-30542', 'team-player', '905-890-9304');
INSERT INTO HaveHobby VALUES('Jason_139@alumni.ubc.ca', 'hockey');
INSERT INTO HaveAward VALUES('Duke of Edinburgh', '1951-11-13', 'Jason_139@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Jason_139@alumni.ubc.ca', 'Absolute Software', 'CloudOps');
INSERT INTO HaveProject VALUES('Jason_139@alumni.ubc.ca', 'Twitter', 'REST');
INSERT INTO AppliesTo VALUES('8ob06', 'Jason_139@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6ra55', 'Jason_139@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1vz66', 'Jason_139@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ri86', 'Jason_139@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6bo14', 'Jason_139@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-178-9670', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-178-9670', 'Nunavut');
INSERT INTO Applicant2 VALUES('Amy Jung', 'Amy_4162@alumni.ubc.ca', '4696 Hyack Road', 'AmyJung-65043', 'really desperate for a job', '867-178-9670');
INSERT INTO HaveHobby VALUES('Amy_4162@alumni.ubc.ca', 'martial arts');
INSERT INTO HaveAward VALUES('Horatio Alger', '1998-2-9', 'Amy_4162@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Amy_4162@alumni.ubc.ca', 'TD Bank', 'Accounting Clerk');
INSERT INTO HaveProject VALUES('Amy_4162@alumni.ubc.ca', 'AIM', 'MVC');
INSERT INTO AppliesTo VALUES('2xs18', 'Amy_4162@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5fg14', 'Amy_4162@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5df81', 'Amy_4162@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1sq51', 'Amy_4162@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2ox78', 'Amy_4162@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('902-172-7928', 'Halifax');
INSERT INTO Applicant3 VALUES('902-172-7928', 'Nova Scotia');
INSERT INTO Applicant2 VALUES('Priscilla Choi', 'Priscilla_12@alumni.ubc.ca', '3584 Hastings Street', 'PriscillaChoi-66706', 'really desperate for a job', '902-172-7928');
INSERT INTO HaveHobby VALUES('Priscilla_12@alumni.ubc.ca', 'basketball');
INSERT INTO HaveAward VALUES('Provincial Scholarship', '2009-2-25', 'Priscilla_12@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Priscilla_12@alumni.ubc.ca', 'Zara', 'Cashier');
INSERT INTO HaveProject VALUES('Priscilla_12@alumni.ubc.ca', 'MSN', '.Net');
INSERT INTO AppliesTo VALUES('2qb13', 'Priscilla_12@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6wu40', 'Priscilla_12@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5in26', 'Priscilla_12@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8er49', 'Priscilla_12@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ez37', 'Priscilla_12@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('867-434-6962', 'Iqaluit');
INSERT INTO Applicant3 VALUES('867-434-6962', 'Nunavut');
INSERT INTO Applicant2 VALUES('Vita Malfoy', 'Vita_2302@alumni.ubc.ca', '1755 Trafalger Parkway', 'VitaMalfoy-1918', 'newly graduated', '867-434-6962');
INSERT INTO HaveHobby VALUES('Vita_2302@alumni.ubc.ca', 'soccer');
INSERT INTO HaveAward VALUES('National Scholarship', '1993-11-25', 'Vita_2302@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Vita_2302@alumni.ubc.ca', 'SUS', 'VP Internal');
INSERT INTO HaveProject VALUES('Vita_2302@alumni.ubc.ca', 'Taobao', 'Unity');
INSERT INTO AppliesTo VALUES('6ra55', 'Vita_2302@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1vz66', 'Vita_2302@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ri86', 'Vita_2302@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6bo14', 'Vita_2302@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5wi76', 'Vita_2302@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-862-9815', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-862-9815', 'British Columbia');
INSERT INTO Applicant2 VALUES('Jessica Zhang', 'Jessica_2394@alumni.ubc.ca', '2156 Yonge Place', 'JessicaZhang-40754', 'strong writing skills', '604-862-9815');
INSERT INTO HaveHobby VALUES('Jessica_2394@alumni.ubc.ca', 'baseball');
INSERT INTO HaveAward VALUES('First in hackathon', '1997-6-5', 'Jessica_2394@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Jessica_2394@alumni.ubc.ca', 'UBC CVC', 'Events Committee Chair');
INSERT INTO HaveProject VALUES('Jessica_2394@alumni.ubc.ca', 'Aliexpress', 'Mongo');
INSERT INTO AppliesTo VALUES('5fg14', 'Jessica_2394@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5df81', 'Jessica_2394@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1sq51', 'Jessica_2394@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2ox78', 'Jessica_2394@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5hv85', 'Jessica_2394@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-259-8311', 'Toronto');
INSERT INTO Applicant3 VALUES('647-259-8311', 'Ontario');
INSERT INTO Applicant2 VALUES('Angela Kan', 'Angela_5740@alumni.ubc.ca', '6599 Dunsmuir Loop', 'AngelaKan-1146', 'positive energy', '647-259-8311');
INSERT INTO HaveHobby VALUES('Angela_5740@alumni.ubc.ca', 'volleyball');
INSERT INTO HaveAward VALUES('Second in hackathon', '1962-1-26', 'Angela_5740@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Angela_5740@alumni.ubc.ca', 'VGH', 'Volunteer');
INSERT INTO HaveProject VALUES('Angela_5740@alumni.ubc.ca', 'McDonalds', 'CosmosDb');
INSERT INTO AppliesTo VALUES('6wu40', 'Angela_5740@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5in26', 'Angela_5740@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8er49', 'Angela_5740@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ez37', 'Angela_5740@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7ma03', 'Angela_5740@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('403-414-1213', 'Calgary');
INSERT INTO Applicant3 VALUES('403-414-1213', 'Alberta');
INSERT INTO Applicant2 VALUES('Chris Brown', 'Chris_894@alumni.ubc.ca', '8403 Burrard Court', 'ChrisBrown-56395', 'team-player', '403-414-1213');
INSERT INTO HaveHobby VALUES('Chris_894@alumni.ubc.ca', 'drawing');
INSERT INTO HaveAward VALUES('Third in hackathon', '2007-3-17', 'Chris_894@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Chris_894@alumni.ubc.ca', 'UBC CSSS', 'Social Officer');
INSERT INTO HaveProject VALUES('Chris_894@alumni.ubc.ca', 'BestBuy.com', 'ASP.NET');
INSERT INTO AppliesTo VALUES('1vz66', 'Chris_894@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ri86', 'Chris_894@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6bo14', 'Chris_894@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5wi76', 'Chris_894@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1rj01', 'Chris_894@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-947-6998', 'Toronto');
INSERT INTO Applicant3 VALUES('647-947-6998', 'Ontario');
INSERT INTO Applicant2 VALUES('Alison Mao', 'Alison_8602@alumni.ubc.ca', '1729 Kingsway Crescent', 'AlisonMao-232', 'efficient', '647-947-6998');
INSERT INTO HaveHobby VALUES('Alison_8602@alumni.ubc.ca', 'programming');
INSERT INTO HaveAward VALUES('other', '1966-3-4', 'Alison_8602@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Alison_8602@alumni.ubc.ca', 'UBC CSA', 'Marketing Committee');
INSERT INTO HaveProject VALUES('Alison_8602@alumni.ubc.ca', 'MoshiMonsters', '.Net');
INSERT INTO AppliesTo VALUES('5df81', 'Alison_8602@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1sq51', 'Alison_8602@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('2ox78', 'Alison_8602@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5hv85', 'Alison_8602@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5et30', 'Alison_8602@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('604-789-7483', 'Vancouver');
INSERT INTO Applicant3 VALUES('604-789-7483', 'British Columbia');
INSERT INTO Applicant2 VALUES('Esther Kan', 'Esther_9022@alumni.ubc.ca', '3073 Oak Parkway', 'EstherKan-82146', 'efficient', '604-789-7483');
INSERT INTO HaveHobby VALUES('Esther_9022@alumni.ubc.ca', 'reading');
INSERT INTO HaveAward VALUES('Principals list', '1968-1-25', 'Esther_9022@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('Esther_9022@alumni.ubc.ca', 'UBC Dance Horizons', 'Prima Ballerina');
INSERT INTO HaveProject VALUES('Esther_9022@alumni.ubc.ca', 'Poptropica', 'Git');
INSERT INTO AppliesTo VALUES('5in26', 'Esther_9022@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('8er49', 'Esther_9022@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9ez37', 'Esther_9022@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('7ma03', 'Esther_9022@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('9qk53', 'Esther_9022@alumni.ubc.ca');
INSERT INTO Applicant1 VALUES('647-591-9893', 'Toronto');
INSERT INTO Applicant3 VALUES('647-591-9893', 'Ontario');
INSERT INTO Applicant2 VALUES('RadishHead Kan', 'RadishHead_6031@alumni.ubc.ca', '7571 Alma Court', 'RadishHeadKan-48472', 'just honestly wants money', '647-591-9893');
INSERT INTO HaveHobby VALUES('RadishHead_6031@alumni.ubc.ca', 'volunteering');
INSERT INTO HaveAward VALUES('Honour roll', '1976-5-10', 'RadishHead_6031@alumni.ubc.ca');
INSERT INTO HaveExperience VALUES('RadishHead_6031@alumni.ubc.ca', 'UBC Acapella', 'Lead Singer');
INSERT INTO HaveProject VALUES('RadishHead_6031@alumni.ubc.ca', 'Fantage', 'Bitbucket');
INSERT INTO AppliesTo VALUES('9ri86', 'RadishHead_6031@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('6bo14', 'RadishHead_6031@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('5wi76', 'RadishHead_6031@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('1rj01', 'RadishHead_6031@alumni.ubc.ca');
INSERT INTO AppliesTo VALUES('4cu97', 'RadishHead_6031@alumni.ubc.ca');
