--Use Master DB
use master;
--Drop DB if already exists
IF DB_ID('disk_inventory')IS NOT NULL
	DROP DATABASE disk_inventory
GO
--Create disk_inventory DB
CREATE DATABASE disk_inventory;
Go
--Use disk_inventory DB
USE disk_inventory;
GO

--Create Table
CREATE TABLE Disc
(disc_ID	INT	NOT NULL,
artist_name	CHAR(10)	NOT NULL,
release_date DATETIME	NOT NULL,
status_ID	INT	NOT NULL,
genre_ID	INT	NOT NULL,
disc_type_ID	INT	NOT NULL,
--Make disc_ID Primary Key
PRIMARY KEY(disc_ID));

CREATE TABLE disc_artist
(artist_ID	INT	NOT NULL,
disc_ID	INT	NOT NULL,
--Make artist_ID Primary
PRIMARY KEY(artist_ID),
--Make disc_id foreign key
FOREIGN KEY (disc_ID) REFERENCES Disc(disc_ID)) ;

CREATE TABLE Artist
(artist_ID	INT	NOT NULL,
artist_name	CHAR(20)	NOT NULL,
disc_ID	INT	NOT NULL,
--make artist_ID Primary key
PRIMARY KEY(artist_ID));

CREATE TABLE loan_status
(disc_ID	INT	NOT NULL,
borrower_ID	INT	NOT NULL,
--Make disc_ID Primary key
PRIMARY KEY(disc_ID));

CREATE TABLE disc_type
(disc_type_ID	INT	NOT NULL,
--Make disc_type_ID Primary key
PRIMARY KEY(disc_type_ID));

CREATE TABLE genre
(genre_ID	INT	NOT NULL,
--Make genre_ID Primary key
PRIMARY KEY(genre_ID));

CREATE TABLE borrower
(borrower_ID	INT	NOT NULL,
borrower_name	CHAR(20)	NOT NULL,
borrower_phone_number	INT	NOT NULL,
--Make borrower_ID Primary key
PRIMARY KEY(borrower_ID));

CREATE TABLE disc_borrower
(disc_ID	INT	NOT NULL,
borrow_date	DATETIME	NOT NULL,
return_date	DATETIME	NOT NULL,
borrower_ID INT	NOT NULL,
PRIMARY KEY(disc_ID),
FOREIGN KEY (disc_ID) REFERENCES Disc(disc_ID),
FOREIGN KEY(borrower_ID) REFERENCES borrower(borrower_ID));





