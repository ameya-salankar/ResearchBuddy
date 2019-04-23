DROP database RBuddy;
CREATE database RBuddy;
use RBuddy;


CREATE TABLE IF NOT EXISTS article (
  idArticle INT NOT NULL,
  URL VARCHAR(45) NULL,
  Title VARCHAR(150) NOT NULL,
  Abstract VARCHAR(1500) NULL,
  PRIMARY KEY (idArticle));

CREATE TABLE IF NOT EXISTS author (
  idAuthor INT NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(45) NOT NULL,
  lastName VARCHAR(45) NULL,
  institueName VARCHAR(45) NULL,
  PRIMARY KEY (idAuthor));

CREATE TABLE IF NOT EXISTS keyWord (
  articleID INT NOT NULL,
  Keyword VARCHAR(45) NOT NULL,
  PRIMARY KEY (articleID, Keyword),
  CONSTRAINT fkArticle
    FOREIGN KEY (articleID)
    REFERENCES Article (idArticle)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS medium (
  Type VARCHAR(20) NOT NULL,
  ISBN VARCHAR(45) NOT NULL,
  Name VARCHAR(45) NOT NULL,
  Description VARCHAR(500) NULL,
  PRIMARY KEY (ISBN, Type));

CREATE TABLE IF NOT EXISTS published_in (
  articleID INT NOT NULL,
  ISBN VARCHAR(45) NOT NULL,
  Publisher VARCHAR(45) NOT NULL,
  Date DATE NOT NULL,
  PRIMARY KEY (articleID, ISBN),
  INDEX fkISBN_idx (ISBN ASC) ,
  CONSTRAINT fkID
    FOREIGN KEY (articleID)
    REFERENCES Article (idArticle)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fkISBN
    FOREIGN KEY (ISBN)
    REFERENCES Medium (ISBN)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS bibliography (
  articleID INT NOT NULL,
  Reference VARCHAR(45) NOT NULL,
  PRIMARY KEY (articleID, Reference),
  CONSTRAINT fkAID
    FOREIGN KEY (articleID)
    REFERENCES Article (idArticle)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS writes (
  authorID INT NOT NULL,
  articleID INT NOT NULL,
  PRIMARY KEY (authorID, articleID),
  INDEX fkArticle_idx (articleID ASC) ,
  CONSTRAINT fkAuthor
    FOREIGN KEY (authorID)
    REFERENCES Author (idAuthor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fkwriter
    FOREIGN KEY (articleID)
    REFERENCES Article (idArticle)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

set FOREIGN_key_checks = 0;

/* INSERT QUERIES */
insert into article values(312315,'www.google.com','Citizenship and Science: The Connecting Axes','The purpose of the Citizenship and Science Exchange (CaSE) project was to enable pupils to critically evaluate the inter-related roles of Science and Citizenship. It also aspired to raise an awareness of the interdependencies that exist between communities in the Irish border region.');

insert into article values(312316,'www.google.com','Pastoral Care in Schools: Promoting Positive Behaviour','This document provides guidance for staff to develop and review their policies and procedures surronding the way pupils behave in schools. It reflects strategies and examples of good practice to help promote and maintain positive behaviour in schools. There is also a section on developing an anti-bullying culture.');

insert into article values(312317,'www.google.com','Schools for the Future: Funding, Strategy, Sharing','The Review examines funding of the education system, in particular the strategic planning and organisation of the schools’ estate, taking account of the curriculum changes, including the wider provision for 14-19 year olds, and also demographic trends.');

insert into article values(312319,'www.google.com','Gifted and talented children in (and out) of the classroom','This Literature Review report provides teachers with information and guidance on identifying gifted and talented children in their classroom. A guidance document addressing identification, whole school management and classroom strategies for educating these children will be published later this year. It also provides information on the particular issues faced by gifted and talented children.');

insert into article values(312321,'www.google.com','Educational neuroscience and neuroscientific education: in search of a mutual middle-way','Cognitive neuroscientific research into learning, especially literacy and numeracy, is well into its second decade. The potential benefits to education, particularly for SEN, were also noted many years ago (Byrnes & Fox, 1998), viz that cognitive neuroscience might offer new data and a fresh perspective on some hitherto intractable educational problems, for example, why do some children not learn to read as easily as most; why doesn’t every child ‘get’ fractions (O’Boyle & Gill, 1998)? The responses of the education profession, especially in the UK, have been mixed. On the one hand, there are those ageing education academics who, after a lifetime of not understanding and disparaging all science, see no need to change their ways now. On the other hand, there are the ‘brain-based’ enthusiasts who hope that the current fads of left-right thinking, brain gym, etc., will address the complexities and daily challenges of the mixed-ability classroom (Goswami, 2004). A middle-way would seem to involve neuroscientific education for both groups so that education can shape a professionally informative educational neuroscience research agenda of the future. This paper discusses five arguments (Geake, 1998) in favour of the development of an educational neuroscience.');

insert into article values(312322,'www.google.com','Teaching the nature of science in schools: what makes a lesson effective?','The study on which this paper draws is one project within an ESRC funded network looking at evidence-based practice in science education (EPSE), and is concerned with the teaching of "ideas and evidence" in school science lessons. In an initial phase, a three round Delphi study (Dalkey et al. 1963) asked a panel of 23 individuals drawn from 5 communities with an interest in science education – scientists, philosophers of science, sociologists of science, science educators and science teachers – about aspects of the nature of science that they felt should be part of the compulsory school science curriculum.');

insert into article values(312323,'www.google.com','The Recruitment and Retention of Teachers in Post-Primary Schools in Northern Ireland','This survey sought to investigate anecdotal claims of a shortfall in the recruitment of teachers in certain subject areas by providing accurate and statistically reliable information on the issue. Focused on the post-primary school sector in Northern Ireland, the research considers the profile of teachers within subject departments, including those who are currently teaching subjects for which they are not qualified. The recruitment patterns and difficulties experienced by principals and the subsequent effect this has on curriculum planning were also examined.');

insert into article values(312324,'www.google.com','Report of a Survey of Substitute Teaching and its Management in Northern Ireland','Following a review of substitute teaching by the Northern Ireland Audit Office (NIAO) in 2002, and by the House of Commons Committee of Public Accounts (PAC) in 2003, the Department of Education, Northern Ireland, requested the Education and Training Inspectorate (the Inspectorate) in the academic year 2003-2004 to inspect the work of substitute teachers, and the effectiveness of their management in schools. The number of nurseries and schools inspected as part of the survey of substitute teaching was 108, including 16 nurseries, seven special schools, 69 primary schools and 16 post-primary schools. Interviews were held with most of the substitute teachers whose work was inspected; these interviews centred on their experience of working as substitute teachers and issues arising. Furthermore, interviews were held with the principals of almost all of the nurseries and the schools to determine the nature and effectiveness of the schools’ management of substitute cover and issues arising.');

insert into article values(312325,'www.google.com','The Induction and Early Professional Development of Beginning Teachers','In Northern Ireland, the teacher competence model underpins the integrated approach to early teacher education. Since not all of the competences are acquired during initial teacher education, the stages of induction, the first year of teaching, and early professional development (EPD), the second and third years of teaching, are central to the continuing professional development (CPD) of beginning teachers. The Inspectorate visited 60 beginning teachers in schools.The visits also included discussions with principals, teacher-tutors and other key support personnel in the schools. In addition, the Inspectorate drew on evidence from schools’ inspections held during the two years of the survey.');

insert into article values(312326,'www.google.com','GTCNI reviews of teacher competences and continuing professional development','This report articulates a new and dynamic vision for teacher education and professional development and maps out a variety of professional pathways and in addition creates a vehicle to allow teachers to reflect meaningfully on their development needs and how these might be best addressed.');


insert into author values (1, 'Lefty', 'Minmagh', 'Allama Iqbal Open University');
insert into author values (2, 'Samaria', 'Fassbender', 'Universidad de Puerto Rico, Rio Pedras');
insert into author values (3, 'Viviene', 'Gostall', 'College of Notre Dame of Maryland');
insert into author values (4, 'Byrann', 'Kahan', 'Osaka Institute of Technology');
insert into author values (5, 'Sharyl', 'Deverill', 'Gonabad University of Medical Sciences');
insert into author values (6, 'Donnamarie', 'Argo', 'Fachhochschule Ravensburg-Weingarten');
insert into author values (7, 'Stephine', 'Knapp', 'Zaporizhzhe National University');
insert into author values (8, 'Gilli', 'Hendriksen', 'Payap University Chaiang Mai');
insert into author values (9, 'Quent', 'Crumly', 'British University in Dubai');
insert into author values (10, 'Lorrayne', 'Cane', 'Concordia College, Ann Arbor');
insert into author values(11,'Charlotte', 'Holland',' School of Education Studies, DCU');
insert into author values(12, 'Peter', 'McKenna',' School of Education Studies, DCU');


insert into writes values (1, 312316);
insert into writes values (2, 312317);
insert into writes values (3, 312319);
insert into writes values (4, 312321);
insert into writes values (5, 312322);
insert into writes values (6, 312323);
insert into writes values (7, 312324);
insert into writes values (8, 312325);
insert into writes values (9, 312326);
insert into writes values (10, 312325);
insert into writes values (11, 312315);
insert into writes values (12, 312315);

insert into medium values ('Book', '331464823-5', 'Citizenship and Science', 'A generic description.');
insert into medium values ('Conference', '354534477-0', 'Positivity in Schools', 'A generic description.');
insert into medium values ('Journal', '035336430-4','Schools and the World','');
insert into medium values ('Book', '777840951-8', '', 'A generic description.');
insert into medium values ('Conference', '504746422-9', '', 'A generic description.');
insert into medium values ('Journal', '198351112-9', '', 'A generic description.');
insert into medium values ('Conference', '917411380-1', '', 'A generic description.');
insert into medium values ('Journal', '975720631-8', '', 'A generic description.');
insert into medium values ('Conference', '186811065-6', '', 'A generic description.');
insert into medium values ('Journal', '894944533-6', '', 'A generic description.');

insert into published_in values(312315,'331464823-5','','2005-09-01');
insert into published_in values(312316,'354534477-0','','2001-04-01');
insert into published_in values(312317,'035336430-4','','2006-12-01');
insert into published_in values(312319,'777840951-8','','2006-02-01');
insert into published_in values(312321,'504746422-9','','2005-08-01');
insert into published_in values(312322,'198351112-9','','2002-09-01');
insert into published_in values(312323,'917411380-1','','2006-09-01');
insert into published_in values(312324,'975720631-8','','2004-04-01');
insert into published_in values(312325,'186811065-6','','2004-08-01');
insert into published_in values(312326,'894944533-6','','2005-03-01');


insert into bibliography values(312315,'');
insert into bibliography values(312316,'');
insert into bibliography values(312317,'');
insert into bibliography values(312319,'');
insert into bibliography values(312321,'');
insert into bibliography values(312322,'');
insert into bibliography values(312323,'');
insert into bibliography values(312324,'');
insert into bibliography values(312325,'');
insert into bibliography values(312326,'');
