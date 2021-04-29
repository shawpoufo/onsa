use onsa
--GET ALL GUICHET
/*GO
CREATE FUNCTION getGuichet()
    RETURNS TABLE
AS
RETURN (
    SELECT 
        *
    FROM Guichet
    );
GO

select * from getGuichet()
*/

/*
--ADD GUICHET
GO
CREATE OR ALTER PROCEDURE Add_Guichet(@id int, @numero int)
AS
BEGIN

	IF (NOT EXISTS (SELECT * FROM Guichet WHERE numero = @numero))
		BEGIN
			INSERT INTO [dbo].Guichet (id,numero) values (@id,@numero)
			print '-------Un Guichet a été ajouter------'
		END
	ELSE
		Print 'ER:----Oups nom de votre numero de Guichet exists deja----'

	
END
GO
*/

/*
--DELETE GUICHET
GO
CREATE OR ALTER PROCEDURE Delete_Guichet(@id int)
AS
BEGIN

	IF (NOT EXISTS (SELECT * FROM Guichet WHERE id = @id))

			print 'ER:----Guichet Introuvable----'

	ELSE
		BEGIN
			DELETE FROM Guichet WHERE id Like @id
			Print '-------------------------------------------'
			Print '-------Guichet Supprimer avec succes-------'
			Print '-------------------------------------------'
		END
	
END
*/



--FIND GUICHET
GO
CREATE OR ALTER FUNCTION Find_Guichet
(
    @id int
    
) 
RETURNS int
BEGIN
	IF (NOT EXISTS (SELECT * FROM Guichet WHERE id = @id))
		RETURN 1
	ELSE
		RETURN 0
	
	RETURN 0
END
GO
