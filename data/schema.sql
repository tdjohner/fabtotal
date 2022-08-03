/*
Database initialization for fabtotal

Creates a blank database schema for the site
Teagan Johner 2022-08-02
*/


CREATE TABLE account
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	username VARCHAR(64),
	email VARCHAR(64),
	lastLogin DATETIME,
	emailValidated BIT,
	createdOn DATETIME,
);

CREATE TABLE post
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	posterAccountId INT NOT NULL, FOREIGN KEY (posterAccountId) REFERENCES account(id),
	price DECIMAL(17,2),
	createdOn DATETIME,
	lastModifiedOn DATETIME
);

CREATE TABLE postDescription
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	postId INT NOT NULL, FOREIGN KEY (postId) REFERENCES post(id),
	accountId INT NOT NULL, FOREIGN KEY (accountId) REFERENCES account(id)
);