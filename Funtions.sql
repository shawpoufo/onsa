--use onsa


--GET ALL STATION
/*
CREATE FUNCTION getStation()
    RETURNS TABLE
AS
RETURN (
    SELECT 
        *
    FROM Station
    );
GO

select * from getStation()
*/


/*
CREATE OR ALTER PROCEDURE Add_Station(@id int, @nom varchar(20), @capacity int, @ville varchar(20))
AS
BEGIN

	IF (NOT EXISTS (SELECT * FROM Station WHERE nom = @nom))
		BEGIN
			INSERT INTO [dbo].[Station] (id,nom,capacite,ville) values (@id,@nom,@capacity,@ville)
			print '-------Une Station a été ajouter------'
		END
	ELSE
		Print 'ER:----Oups nom de votre station exists deja----'

	
END
*/


/*CREATE OR ALTER PROCEDURE Delete_Station(@nom varchar(20))
AS
BEGIN

	IF (NOT EXISTS (SELECT * FROM Station WHERE nom = @nom))

			print 'ER:----Station Introuvable----'

	ELSE
		BEGIN
			DELETE FROM Station WHERE nom Like @nom
			Print '-------------------------------------------'
			Print '-------Station Supprimer avec succes-------'
			Print '-------------------------------------------'
		END
	
END*/

/*
GO
CREATE OR ALTER FUNCTION Find_Station
(
    @nom varchar(20)
    
) 
RETURNS int
BEGIN
	IF (NOT EXISTS (SELECT * FROM Station WHERE nom = @nom))
		RETURN 1
	ELSE
		RETURN 0
	
	RETURN 0
END
GO*/



/*
CREATE OR ALTER FUNCTION Search_Station
(
	@nom varchar(20),
	@typeSearch varchar(20)
)
RETURNS  TABLE
AS
RETURN (
	SELECT * FROM Station WHERE  nom Like 
		CASE @typeSearch
			WHEN 'start' THEN @nom+'%'
			WHEN 'middle' THEN '%'+@nom+'%'
			WHEN 'end' THEN '%'+@nom
		END
)

SELECT *
FROM Search_Station('aa','middle')
*/



/*
GO
CREATE OR ALTER FUNCTION Search_Station_Between_Capacity
(
	@first_capacity int,
	@second_capacity int
)
RETURNS  TABLE
AS
+
GO

SELECT *
FROM Search_Station_Between_Capacity(5,10)
*/


select * from getStation()


exec Delete_Station 'aaa'