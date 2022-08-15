/*
Database initialization for fabtotal

Creates a blank database schema for the site
Teagan Johner 2022-08-02
*/


CREATE TABLE account
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	username VARCHAR(128) UNIQUE,
	email VARCHAR(128) UNIQUE,
	lastLogin DATETIME,
	emailValidated BIT,
	createdOn DATETIME,
);

CREATE TABLE post
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	createdBy INT NOT NULL, FOREIGN KEY (createdBy) REFERENCES account(id),
	price DECIMAL(17,2),
	createdOn DATETIME,
	lastModifiedOn DATETIME
);

CREATE TABLE postDescription
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	postId INT NOT NULL, FOREIGN KEY (postId) REFERENCES post(id),
	accountId INT NOT NULL, FOREIGN KEY (accountId) REFERENCES account(id),
	content VARCHAR(MAX)
);

CREATE TABLE rating
(
	id INT IDENTITY(0,1) PRIMARY KEY
);

--Populate the rating table
WHILE ((SELECT COUNT(*) FROM rating) < 6) BEGIN
	INSERT dbo.rating DEFAULT VALUES
END

CREATE TABLE printerRating
(
	id INT IDENTITY(1,1) PRIMARY KEY,
	createdBy INT NOT NULL, FOREIGN KEY (createdBy) REFERENCES account(id),
	printerId INT NOT NULL, FOREIGN KEY (printerId) REFERENCES account(id),
	rating INT NOT NULL, FOREIGN KEY (rating) REFERENCES rating(id)
);

--Want to store hashes in filepaths under folders named as hashes of account names