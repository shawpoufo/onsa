/*CREATE FUNCTION getParking()
    RETURNS TABLE
AS
RETURN (
    SELECT 
        *
    FROM Parking
    );
GO

select * from getParking()
*/


/*
--ADD PARKING
GO
CREATE OR ALTER PROCEDURE Add_Parking(@id int, @capacity int, @id_station int, @prix float)
AS
BEGIN

	DECLARE @nom varchar(20)

	IF (NOT EXISTS (SELECT * FROM Parking WHERE id_station = @id_station))
		BEGIN
			INSERT INTO [dbo].[Parking] (id,capacite,id_station,prix_heure) values (@id,@capacity,@id_station,@prix)
			SELECT @nom = nom FROM Station WHERE id = @id_station
			print '-------Un Parking a été Ajouter à une La Station '+@nom+'------'
		END
	ELSE
		Print 'ER:----Oups nom de votre station exists deja----'

	
END
GO
exec Add_Parking 1,10,1,30
*/


/*
--DELETE PARKING BY STATION
GO
CREATE OR ALTER PROCEDURE Delete_Parking(@id_station int)
AS
BEGIN
	DECLARE @nom varchar(20)

	IF (NOT EXISTS (SELECT * FROM Parking WHERE id_station = @id_station))

			print 'ER:----Parking Station Introuvable----'

	ELSE
		BEGIN
			SELECT @nom = nom FROM Station WHERE id = @id_station
			DELETE FROM Parking WHERE id_station Like @id_station
			Print '------------------------------------------------------------------------'
			Print '-------Parking de la station '+@nom+' a été Supprimer avec succes-------'
			Print '------------------------------------------------------------------------'
		END
	
END
GO
exec Delete_Parking 1
*/

/*
--FIND PARKING BY STATION
GO
CREATE OR ALTER FUNCTION Find_Parking
(
    @id_station int
    
) 
RETURNS int
BEGIN
	IF (NOT EXISTS (SELECT * FROM Parking WHERE id_station = @id_station))
		RETURN 1
	ELSE
		RETURN 0
	
	RETURN 0
END
GO
*/


/*
--SEARCH PARKING BY CAPACITY
GO
CREATE OR ALTER FUNCTION Search_Parking_By_Capacity
(
	@first_capacity int,
	@second_capacity int
)
RETURNS  TABLE
AS
RETURN (
	SELECT * FROM Parking WHERE capacite Between @first_capacity and @second_capacity
)
GO

SELECT *
FROM Search_Parking_By_Capacity(2,20)
*/


/*
--SEARCH PARKING BY PRICE
GO
CREATE OR ALTER FUNCTION Search_Parking_By_Price
(
	@first_price int,
	@second_price int
)
RETURNS  TABLE
AS
RETURN (
	SELECT * FROM Parking WHERE prix_heure Between @first_price and @second_price
)
GO
*/

/*
--UPDATE PARKING
GO
CREATE OR ALTER PROCEDURE Update_Parking(@id int, @capacity int, @id_station int, @prix float)
AS
BEGIN

	DECLARE @nom varchar(20)

	IF (EXISTS (SELECT * FROM Parking WHERE id_station = @id_station))
		BEGIN
			UPDATE Parking SET capacite = @capacity , id_station = @id_station, prix_heure = @prix WHERE id = @id

			SELECT @nom = nom FROM Station WHERE id = @id_station
			print '-------Un Parking a été Modifié : '
			print '-------Station : '+@nom
			print '-------Capacite : '+CONVERT(varchar,@capacity)
			print '-------Prix / Heure : '++CONVERT(varchar,@prix)
		END
	ELSE
		Print 'ER:----Oups votre parking nexiste pas----'

END
GO
exec Update_Parking 1,20,1,200

*/

select * from getParking()
select * from getStation()
