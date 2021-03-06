USE [Vidzy]
GO
/****** Object:  StoredProcedure [dbo].[spAddVideo]    Script Date: 2020-07-28 6:30:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spAddVideo]
(
	@Name varchar(255),
	@ReleaseDate datetime,
	@Genre varchar(255),
	@Classification tinyint
)
AS

	DECLARE @GenreId tinyint
	SET @GenreId = (SELECT Id FROM Genres WHERE Name = @Genre)

	INSERT INTO Videos (Name, ReleaseDate)
	VALUES (@Name, @ReleaseDate)

	DECLARE @VideoId int
	SET @VideoId = SCOPE_IDENTITY()

	INSERT INTO Videos( Name,ReleaseDate,GenreID,Classification)
	VALUES (@Name, @ReleaseDate,@GenreId,@Classification)

