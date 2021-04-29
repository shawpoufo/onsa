use onsa
--GET ALL AUTOCAR
GO
CREATE FUNCTION getAutoCar()
    RETURNS TABLE
AS
RETURN (
    SELECT 
        *
    FROM AutoCar
    );
GO

--ADD AUTOCAR
CREATE OR ALTER PROCEDURE Add_AutoCar(@matricule nvarchar(20), @nbr_place_max int,@capacite_stockage int, @compagnie int)
AS
BEGIN
	DECLARE @nom_comp varchar(20)

	IF (NOT EXISTS (SELECT * FROM AutoCar WHERE matricule = @matricule))
		BEGIN
			INSERT INTO [dbo].AutoCar (matricule,nbr_place_max,capacite_stockage,id_compagnie) 
			values (@matricule,@nbr_place_max, @capacite_stockage,@compagnie)
			SELECT @nom_comp = nom FROM Compagnie WHERE id = @compagnie
			print '-------Un AutoCar a été ajouter a la compagnie '+@nom_comp+'------'
		END
	ELSE
		Print 'ER:----Oups le matricule de AutoCar exists deja----'

	
END
GO


--GET ALL AUTOCAR BY COMPAGNIE
GO
CREATE OR ALTER PROCEDURE get_AutoCar_By_Companie(@nom varchar(20))
AS
BEGIN
	DECLARE @id_comp int

	SELECT @id_comp = id FROM Compagnie Where nom = @nom

	IF (EXISTS (SELECT * FROM Compagnie Where nom = @nom))
		BEGIN
			
			print '-------Les AutoCar qui appartient a la compagnie '+@nom+'------'
			SELECT * FROM AutoCar Where id_compagnie = @id_comp

		END
	ELSE
		Print 'ER:----Oups la Compagnie n exists pas----'

END
GO



--FIND AUTOCAR BY MATRICULE AND TYPE(start,middle,end)
GO
CREATE OR ALTER FUNCTION Find_AutoCar
(
    @v_matricule varchar(20),
	@typeSearch varchar(20)
    
) 
RETURNS  TABLE
AS
RETURN (
	SELECT * FROM AutoCar WHERE matricule Like 
		CASE @typeSearch
			WHEN 'start' THEN @v_matricule+'%'
			WHEN 'middle' THEN '%'+@v_matricule+'%'
			WHEN 'end' THEN '%'+@v_matricule
		END
)
GO

--FIND AUTOCAR BY MATRICULE AND TYPE(sup,between,inf)
GO
CREATE OR ALTER PROCEDURE Find_AutoCar_By_Capacite
(
    @capacite int,
	@typeSearch varchar(20)
    
) 
AS
BEGIN
	IF @typeSearch = 'sup'
		SELECT * FROM AutoCar WHERE capacite_stockage > @capacite
	ELSE IF @typeSearch = 'between'
		SELECT * FROM AutoCar WHERE capacite_stockage between 0 and  @capacite
	ELSE
		SELECT * FROM AutoCar WHERE capacite_stockage < @capacite

END
GO

--FIND AUTOCAR BY PLACE
GO
CREATE OR ALTER FUNCTION Find_AutoCar_BY_PLACE
(
    @max_place int
    
) 
RETURNS  TABLE
AS
RETURN (
	SELECT * FROM AutoCar WHERE nbr_place_max = @max_place
)
GO




SELECT * FROM Find_AutoCar_BY_PLACE(60)

exec get_AutoCar_By_Companie 'CTM'
select * from getAutoCar
exec Add_AutoCar 'M5',60,50,1
exec Add_Compagnie 1,'CTM'

select * from getCompagnie()
