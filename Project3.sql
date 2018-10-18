USE [disk_inventory]
GO

INSERT INTO [dbo].[Artist]
           ([artist_ID]
           ,[artistName])
     VALUES
           (1,'Shakira'),
		   (2,'Calexico'),
		   (3,'Nils Frahm'),
		   (4,'Michael Jackson'),
		   (5,'Spoon'),
		   (6,'Knitty Gritty Band'),
		   (7,'Hank Williams'),
		   (8,'Shakey Graves'),
		   (9,'Brittney Spears'),
		   (10,'Def Leapard'),
		   (11,'Dr. Dog'),
		   (12,'Sylven Esso'),
		   (13,'Titanic'),
		   (14,'E.T'),
		   (15,'Goonies'),
		   (16,'Labrynth'),
		   (17,'Avatar'),
		   (18,'Seven'),
		   (19,'The Usual Suspects'),
		   (20,'Pulp Fiction')
GO

INSERT INTO [dbo].[disk_type]
           ([disk_type_ID])
     VALUES
           (1),
		   (2),
		   (3),
		   (4)
GO

--Insert at least 20 rows into the table
INSERT INTO [dbo].[borrower]
           ([borrower_ID]
           ,[borrower_phone_number]
           ,[borrowerFname]
           ,[borrowerLname])
     VALUES
           (1, 2085553698, 'James', 'Smith')
           ,(2, 2086625878, 'Austin', 'Merril')
           ,(3, 2082225874, 'Katy', 'Heinz')
           ,(4, 2081478523, 'Ricky', 'Davis')
		   ,(5, 2083698741, 'Alex', 'Marsters')
		   ,(6, 2083698521, 'Ginger', 'Ale')
		   ,(7, 2081472589, 'Franklin', 'Allsworth')
		   ,(8, 2088741558, 'Harry', 'Signs')
		   ,(9, 2082698941, 'Jim', 'Carry')
		   ,(10, 2084758912, 'Alicia', 'Arnold')
		   ,(11, 2081257845, 'Heather', 'Hemsworth')
		   ,(12, 2083698521, 'Bobby', 'Jackson')
		   ,(13, 2081257485, 'Amy', 'Riddler')
		   ,(14, 2089636985, 'Jessica', 'Bails')
		   ,(15, 2087894568, 'Larry', 'Smith')
		   ,(16, 2086988521, 'Justin', 'Ale')
		   ,(17, 2085247874, 'Jeff', 'Appleton')
		   ,(18, 2086982356, 'Mary', 'Arnold')
		   ,(19, 2084587812, 'Albert', 'Ryan')
		   ,(20, 2086988569, 'Rick', 'James')
GO
insert into borrower
values (21, 123, 'j', 'j')
--Delete only 1 row using a where clause
DELETE FROM borrower
WHERE borrowerFname = 'j';

INSERT INTO [dbo].[genre]
           ([genre_ID])
     VALUES
            (1),
		   (2),
		   (3),
		   (4)
GO

INSERT INTO [dbo].[loan_status]
           ([status_ID]
           ,[status_info])
     VALUES
           (1, 'In')
		   ,(2, 'Out')
GO

--Insert at least 20 rows of data into the table
INSERT INTO [dbo].[Disk]
           ([disk_ID]
           ,[release_date]
           ,[status_ID]
           ,[genre_ID]
           ,[disk_type_ID])
     VALUES
           (1,'2015-07-07',2,3,2),
		   (2,'2015-03-15',1,2,1),
		   (3,'2018-01-26',2,1,2),
		   (4,'1985-04-15',1,1,2),
		   (5,'2008-03-12',2,2,2),
		   (6,'2012-06-22',2,4,2),
		   (7,'1976-07-2',1,2,2),
		   (8,'2017-08-22',1,3,2),
		   (9,'2001-03-12',2,2,2),
		   (10,'1987-09-10',2,1,2),
		   (11,'2016-10-07',2,3,2),
		   (12,'2017-08-15',2,2,2),
		   (13,'1994-07-12',1,3,1),
		   (14,'1983-05-15',2,4,1),
		   (15,'1985-03-16',1,3,1),
		   (16,'1988-06-07',1,2,1),
		   (17,'2013-04-12',2,2,1),
		   (18,'1997-08-12',1,4,1),
		   (19,'1998-08-18',1,2,1),
		   (20,'1994-04-08',2,2,1)
GO
--Update only 1 row using where clause
UPDATE Disk
SET release_date = '2004-07-12'
WHERE disk_ID = 13;

--Insert at least 20 rows of data into the table
INSERT INTO [dbo].[disk_artist]
           ([artist_ID]
           ,[disk_ID])
	VALUES
			(1, 2)
		   ,(1, 3)
		   ,(2, 2)
		   ,(3, 4)
		   ,(4, 5)
		   ,(5, 6)
		   ,(6, 7)
		   ,(7, 8)
		   ,(8, 9)
		   ,(9, 10)
		   ,(10, 11)
		   ,(11, 12)
		   ,(12, 13)
		   ,(13, 14)
		   ,(14, 15)
		   ,(15, 16)
		   ,(16, 17)
		   ,(17, 18)
		   ,(18, 19)
		   ,(19, 20)
GO
--At least 1 disk must have at least 2 different artist rows here (disk_ID 2)
insert into disk_artist
values (4, 2);
--At least 1 artist must have at least 2 different disk rows here (artist_ID 1)
insert into disk_artist
values (1, 4);

INSERT INTO [dbo].[disk_borrower]
           ([disk_ID]
           ,[borrow_date]
           ,[return_date]
           ,[borrower_ID])
     VALUES
           (1,'2017-05-16','2017-05-18',1),
		   (2,'2017-06-16','2017-06-18',2),
		   (3,'2017-07-16','2017-07-18',3),
		   (4,'2017-08-16','2017-08-18',4),
		   (5,'2017-09-16','2017-09-18',5),
		   (6,'2017-10-16','2017-10-18',6),
		   (7,'2017-11-16','2017-11-18',7),
		   (8,'2017-12-16','2017-12-18',8),
		   (9,'2018-01-16',NULL ,9),
		   (10,'2018-02-16','2018-02-18',10),
		   (11,'2018-03-16','2018-03-18',11),
		   (12,'2018-04-16', NULL,12),
		   (13,'2018-05-16','2018-05-18',13),
		   (14,'2018-06-16','2018-06-18',14),
		   (15,'2018-07-16','2018-07-18',15),
		   (16,'2018-08-16',NULL, 16),
		   (17,'2018-09-16','2018-09-18',17),
		   (18,'2018-10-16','2018-10-18',18),
		   (19,'2016-11-16','2016-11-18',19),
		   (20,'2016-12-16',NULL, 20)
GO
alter table disk_borrower
alter column return_date datetime NULL;

--At least 1 disk has been borrowed by the same borrower 2 different times (borrower 1 disk 1)
insert into disk_borrower
values (1, '2018-06-21', '2018-06-23',1);
--At least 1 disk must have at least 2 different rows here/--At least 1 borrower must have at least 2 different rows here
insert into disk_borrower
values (3, '2017-05-23', '2017-05-25',1);

--Create a query to list the disks that are on loan and have not been returned. 
SELECT borrower_ID, disk_ID, borrow_date, return_date
FROM disk_borrower 
WHERE return_date IS NULL;
 




