--3, 4, 5
--Create insert, Update, and Delete stored procedures for the artist table, borrower table, disk table.
--Update procedure accepts a primary key value and thea artist's names for update.
--Insert accepts all columns as input parameters except for identity fields.
--Delete accepts a priamry key value for delete.

IF OBJECT_ID('sp_InsertArtist') IS NOT NULL
DROP PROC sp_InsertArtist
GO

CREATE PROC sp_InsertArtist
	@artist_ID INT,
	@artistFname VARCHAR(50),
	@artistLname VARCHAR(50),
	@groupName VARCHAR(50)

AS
	INSERT Artist
		VALUES(@artist_ID
				,@artistFname
				,@artistLname
				,@groupName
				);

GO

USE disk_inventory
GO
BEGIN TRY
	EXEC sp_InsertArtist
		4
		,'Hi'
		,'There';
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
	IF ERROR_NUMBER() >= 50000
		PRINT 'This is a custom error message.';
END CATCH;
GO



IF OBJECT_ID('sp_UpdateArtist') IS NOT NULL
	DROP PROC sp_UpdateArtist
GO

CREATE PROC sp_UpdateArtist
	@artist_ID INT,
	@artistFname	VARCHAR(50),
	@artistLname	VARCHAR(50),
	@groupName	VARCHAR(50)
AS
	Update Artist
	SET
		artistFName = @artistFname
		,artistLName = @artistLname
		,groupName = @groupName

WHERE artist_ID = @artist_ID
GO
BEGIN TRY
	EXEC sp_UpdateArtist
		14
		,'Hi 2'
		,'There 2';
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
	IF ERROR_NUMBER() >= 50000
		print 'This is a custom error message.';
END CATCH;
GO

--Accepts Primary Key Values
IF OBJECT_ID('sp_DeleteArtist') IS NOT NULL
	DROP PROC sp_DeleteArtist
GO

CREATE PROC sp_DeleteArtist
	@ArtistID	INT
AS
DELETE Artist
WHERE artist_ID = @ArtistID;
GO

BEGIN TRY
	EXEC sp_DeleteArtist
		18
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
	IF ERROR_NUMBER() >= 50000
		PRINT 'This is a custom error message.';
END CATCH;
GO

--Borrower table insert
IF OBJECT_ID('sp_InsertBorrower') IS NOT NULL
DROP PROC sp_InsertBorrower
GO

CREATE PROC sp_InsertBorrower
	@borrower_ID INT,
	@borrower_phone_number INT,
	@borrowerFname CHAR(20),
	@borrowerLname CHAR(20)
AS
INSERT Borrower
VALUES(
	@borrower_ID
	,@borrower_phone_number
	,@borrowerFname
	,@borrowerLname
	);
GO

USE disk_inventory
GO
BEGIN TRY
	EXEC sp_InsertBorrower
		'Insert'
		,'Borrower'
		,'555-555-5555';
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
	IF ERROR_NUMBER() >= 50000
		PRINT 'This is a custome error message.';
END CATCH;
GO

--Accepts primary key
IF OBJECT_ID('sp_UpdateBorrower') IS NOT NULL
	DROP PROC sp_UpdateBorrower
GO

CREATE PROC sp_UpdateBorrower
	@borrower_ID INT,
	@borrower_phone_number INT,
	@borrowerFname char(20),
	@borrowerLname char(20)
AS
	UPDATE borrower
	SET 
		borrower_phone_number = @borrower_phone_number,
		borrowerFname = @borrowerFname,
		borrowerLname = @borrowerLname

WHERE borrower_ID = @borrower_ID
GO
BEGIN TRY
	EXEC sp_UpdateBorrower
		17
		,'Borrower'
		,'Update'
		,'777-777-7777';
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
	IF ERROR_NUMBER() >= 50000
		PRINT 'This is a custom error message.';
END CATCH;
GO

--Delete pk
IF OBJECT_ID('sp_DeleteBorrower') IS NOT NULL
	DROP PROC sp_DeleteBorrower
GO

CREATE PROC sp_DeleteBorrower
	@borrower_ID INT
AS
DELETE borrower
WHERE borrower_ID = @borrower_ID
GO

BEGIN TRY
	EXEC sp_DeleteBorrower
		9
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
	IF ERROR_NUMBER() >= 50000
		PRINT 'This is a custom error message.';
END CATCH;
GO

--Disk Table
IF OBJECT_ID('sp_InsertDisk') IS NOT NULL
	DROP PROC sp_InsertDisk
GO

CREATE PROC sp_InsertDisk
	@disk_ID INT,
	@release_date DATETIME,
	@disk_name VARCHAR(20),
	@status_ID INT,
	@genre_ID INT,
	@disk_type_ID INT
AS
	INSERT Disk
	VALUES(
			@disk_ID,
			@release_date,
			@disk_name,
			@status_ID,
			@genre_ID,
			@disk_type_ID
			);
GO

USE disk_inventory
GO
BEGIN TRY
	EXEC sp_InsertDisk
		2
		,3
		,4
		,'Kid Kutty'
		,'2018-11-15';
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
	IF ERROR_NUMBER() >= 50000
		PRINT 'This is a custom error message.';
END CATCH;
GO

--Accepts PK on disk
IF OBJECT_ID('sp_UpdateDisk') IS NOT NULL
	DROP PROC sp_UpdateDisk
GO

CREATE PROC sp_UpdateDisk
	@disk_ID INT,
	@release_date DATETIME,
	@disk_name VARCHAR(20),
	@status_ID INT,
	@genre_ID INT,
	@disk_type_ID INT
AS
	UPDATE Disk
	SET
		disk_ID = @disk_ID
		,release_date = @release_date
		,disk_name = @disk_name
		,status_ID = @status_ID
		,genre_ID = @genre_ID
		,disk_type_ID = @disk_type_ID

WHERE disk_ID = @disk_ID
GO
BEGIN TRY
	EXEC sp_UpdateDisk
		11
		,1
		,2
		,4
		,'SQL Galaxy'
		,'2018-09-07';
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
	IF ERROR_NUMBER() >= 50000
		PRINT 'This is a custome error message.';
END CATCH;
GO
	
--Delete PK
IF OBJECT_ID('sp_DeleteDisk') IS NOT NULL
	DROP PROC sp_DeleteDisk
GO

CREATE PROC sp_DeleteDisk
	@DiskID INT
AS
	DELETE Disk
	WHERE disk_ID = @DiskID;
GO

BEGIN TRY
	EXEC sp_DeleteDisk	
		4
END TRY
BEGIN CATCH
	PRINT 'An error occurred.';
	PRINT 'Message: ' + CONVERT(VARCHAR, ERROR_MESSAGE());
	IF ERROR_NUMBER() >= 50000
		PRINT 'This is a custome error message.';
END CATCH;
GO


	
	


			

