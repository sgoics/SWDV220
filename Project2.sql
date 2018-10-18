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

CREATE TABLE borrower
(borrower_ID	INT	NOT NULL,
borrower_name	CHAR(20)	NOT NULL,
borrower_phone_number	INT	NOT NULL,
--Make borrower_ID Primary key
PRIMARY KEY(borrower_ID));

CREATE TABLE Artist
(artist_ID	INT	NOT NULL,
artistfName	CHAR(20)	NOT NULL,
artistlName CHAR(20)	NOT NULL,
--make artist_ID Primary key
PRIMARY KEY(artist_ID));

CREATE TABLE genre
(genre_ID	INT	NOT NULL,
--Make genre_ID Primary key
PRIMARY KEY(genre_ID));

CREATE TABLE loan_status
(status_ID INT NOT NULL,
status_info	VARCHAR(50) NOT NULL,
--Make disk_ID Primary key
PRIMARY KEY(status_ID));

CREATE TABLE disk_type
(disk_type_ID	INT	NOT NULL,
--Make disk_type_ID Primary key
PRIMARY KEY(disk_type_ID));

CREATE TABLE Disk
(disk_ID	INT	NOT NULL,
release_date DATETIME	NULL,
status_ID	INT	NOT NULL,
genre_ID	INT	NOT NULL,
disk_type_ID	INT	NOT NULL,
--Make disk_ID Primary Key
PRIMARY KEY(disk_ID),
--make genre_ID and disk_type_ID foreign keys
FOREIGN KEY (genre_ID) REFERENCES genre(genre_ID),
FOREIGN KEY (disk_type_ID) REFERENCES disk_type(disk_type_ID),
FOREIGN KEY (status_ID) REFERENCES loan_status(status_ID));


CREATE TABLE disk_artist
(artist_ID	INT	NOT NULL, 
disk_ID	INT	NOT NULL,
--Make artist_ID Primary
PRIMARY KEY(artist_ID, disk_ID),
FOREIGN KEY (artist_ID) REFERENCES Artist(artist_ID),
FOREIGN KEY (disk_ID) REFERENCES Disk (disk_ID));



CREATE TABLE disk_borrower
(disk_ID	INT	NOT NULL,
borrow_date	DATETIME	NOT NULL,
return_date	DATETIME	NOT NULL,
borrower_ID INT	NOT NULL,
PRIMARY KEY(borrow_date),
FOREIGN KEY (disk_ID) REFERENCES Disk (disk_ID),
FOREIGN KEY (borrower_ID) REFERENCES borrower (borrower_ID));

















