use onsa
--GET ALL STATION
/*
CREATE FUNCTION getCompagnie()
    RETURNS TABLE
AS
RETURN (
    SELECT 
        *
    FROM Compagnie
    );
GO

select * from getCompagnie()
*/


/*
CREATE OR ALTER PROCEDURE Add_Compagnie(@id int, @nom varchar(20))
AS
BEGIN

	IF (NOT EXISTS (SELECT * FROM Compagnie WHERE nom = @nom))
		BEGIN
			INSERT INTO [dbo].[Compagnie] (id,nom) values (@id,@nom)
			print '-------Une Compagnie a été ajouter------'
		END
	ELSE
		Print 'ER:----Oups nom de votre nom de Compagnie exists deja----'

	
END
*/

/*CREATE OR ALTER PROCEDURE Delete_Compagnie(@nom varchar(20))
AS
BEGIN

	IF (NOT EXISTS (SELECT * FROM Compagnie WHERE nom = @nom))

			print 'ER:----Compagnie Introuvable----'

	ELSE
		BEGIN
			DELETE FROM Compagnie WHERE nom Like @nom
			Print '-------------------------------------------'
			Print '-------Compagnie Supprimer avec succes-------'
			Print '-------------------------------------------'
		END
	
END*/


/*
--FIND COMPAGNIE
GO
CREATE OR ALTER FUNCTION Find_Compagnie
(
    @nom varchar(20)
    
) 
RETURNS int
BEGIN
	IF (NOT EXISTS (SELECT * FROM Compagnie WHERE nom = @nom))
		RETURN 1
	ELSE
		RETURN 0
	
	RETURN 0
END
GO
*/

GO
CREATE OR ALTER FUNCTION Search_Compagnie
(
	@nom varchar(20),
	@typeSearch varchar(20)
)
RETURNS  TABLE
AS
RETURN (
	SELECT * FROM Compagnie WHERE  nom Like 
		CASE @typeSearch
			WHEN 'start' THEN @nom+'%'
			WHEN 'middle' THEN '%'+@nom+'%'
			WHEN 'end' THEN '%'+@nom
		END
)
GO