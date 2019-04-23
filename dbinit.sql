DROP database RBuddy;
CREATE database RBuddy;
use RBuddy;

CREATE TABLE IF NOT EXISTS Article (
  idArticle INT NOT NULL,
  URL VARCHAR(45) NULL,
  Title VARCHAR(150) NOT NULL,
  Abstract VARCHAR(1500) NULL,
  PRIMARY KEY (idArticle));

CREATE TABLE IF NOT EXISTS Author (
  idAuthor INT NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(45) NOT NULL,
  lastName VARCHAR(45) NULL,
  instituteName VARCHAR(45) NULL,
  PRIMARY KEY (idAuthor));

CREATE TABLE IF NOT EXISTS KeyWord (
  articleID INT NOT NULL,
  Keyword VARCHAR(45) NOT NULL,
  PRIMARY KEY (articleID, Keyword),
  CONSTRAINT fkArticle
    FOREIGN KEY (articleID)
    REFERENCES Article (idArticle)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS Medium (
  Type VARCHAR(20) NOT NULL,
  ISBN VARCHAR(45) NOT NULL,
  Name VARCHAR(45) NOT NULL,
  PRIMARY KEY (ISBN, Type));

CREATE TABLE IF NOT EXISTS Published_In (
  articleID INT NOT NULL,
  ISBN VARCHAR(45) NOT NULL,
  Publisher VARCHAR(45) NOT NULL,
  Date DATE NOT NULL,
  PRIMARY KEY (articleID, ISBN),
  INDEX fkISBN_idx (ISBN ASC),
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

CREATE TABLE IF NOT EXISTS Writes (
  authorID INT NOT NULL,
  articleID INT NOT NULL,
  PRIMARY KEY (authorID, articleID),
  INDEX fkArticle_idx (articleID ASC),
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
