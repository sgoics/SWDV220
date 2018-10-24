--3
--Show the disks in your database and any associated Individual artists only. Sort by Artist Last name, first Name and disk name.

select disk_name, release_date, artistfName, artistlName
from Disk AS D
join disk_artist on disk_artist.disk_ID = D.disk_ID
join Artist on disk_artist.artist_ID = artist.artist_ID
where groupName = ''
order by artistLname, artistFname, disk_name;

--4
--Create a view called View_Individual_Artist that shows the artists' names and not group names.
--Include the artist id in the view definition but do not display the id in your output.

CREATE VIEW View_Individual_Artist
AS
SELECT artistFname, artistLname, artist_ID
FROM Artist
Go
Select artistFname, artistLname
from View_Individual_Artist
Where artistFname NOT LIKE '' AND artistLname NOT LIKE ''--
ORDER BY artistFname, artistLname;

--5
--Show the disks in your database and any associated Group artists only.
--View_Individual_Artist view. Sort by Group Name & Disk Name.

SELECT disk_name, release_date, AR.groupName
FROM Disk AS D
LEFT JOIN disk_artist AS DA
ON D.disk_ID = DA.disk_ID
LEFT JOIN View_Individual_Artist AS A
ON A.artist_ID = DA.artist_ID
LEFT JOIN Artist AS AR
ON A.artist_ID = AR.artist_ID
Where AR.groupName NOT LIKE ''
ORDER BY AR.groupName, disk_name;

--6
--Show which disks have been borrowed and who borrowed them. Sort by Borrower's Last Name, (***then First name, then Disk name, then borrowed Date)

SELECT borrowerFname, borrowerLname, disk_name, borrow_date
FROM Disk
JOIN disk_borrower
ON Disk.disk_ID = disk_borrower.disk_ID
JOIN borrower
ON disk_borrower.borrower_ID = borrower.borrower_ID
ORDER BY borrowerLname, borrowerFname, disk_name, borrow_date;

--7
--In Disk ID order, show the number of times each disk has been borrowed.

SELECT D.disk_ID, disk_name, COUNT(DB.borrow_date) AS 'Times Borrowed'
FROM Disk AS D
LEFT JOIN disk_borrower AS DB
ON D.disk_ID = DB.disk_ID
GROUP BY D.disk_ID, disk_name
ORDER BY D.disk_ID

--8
--Show the disks outstanding or on-loan and who has each disk. Sory by disk name.

SELECT disk_name, borrow_date, return_date, borrowerLname
FROM Disk AS D
JOIN disk_borrower AS DB
ON D.disk_ID = DB.disk_ID
JOIN borrower AS B
ON DB.borrower_ID = B.borrower_ID
WHERE return_date IS NULL
ORDER BY borrowerLname;