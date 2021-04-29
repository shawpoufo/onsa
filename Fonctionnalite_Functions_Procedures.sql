use onsa

--GET ALL FONCTIONNALITE
GO
CREATE FUNCTION getFonctionnalite()
RETURNS TABLE
AS
RETURN (
    SELECT 
        *
    FROM Fonctionnalite
    );
GO



--ADD FONCTIONNALITE
GO
CREATE OR ALTER PROCEDURE Add_Fonctionnalite(@id int, @label varchar(20))
AS
BEGIN

	IF (NOT EXISTS (SELECT * FROM Fonctionnalite WHERE label = @label))
		BEGIN
			INSERT INTO [dbo].Fonctionnalite (id,label) values (@id,@label)
			
			print '-------Une Fonctionnalite a été ajouter avec succes'
		END
	ELSE
		Print 'ER:----Oups cette Fonctionnalite exists deja----'

	
END
GO



--GET ALL FONCTIONNALITE BY AUTOCAR
GO
CREATE OR ALTER PROCEDURE get_Fonctionnalite_By_Autocar(@matricule varchar(20))
AS
BEGIN

	DECLARE @mat nvarchar(20)
	IF (EXISTS (SELECT * FROM Offre Where mat_autocar = @matricule))
		BEGIN
			
			print '-------Les Fonctionnalite qui appartient a autocar '+@matricule+'------'
			SELECT mat_autocar as Autocar, label as Fonctionnalite FROM Offre o 
			INNER JOIN Fonctionnalite f  On o.id_fonctionnalite = f.id
			Where mat_autocar = @matricule

		END
	ELSE
		BEGIN
			IF (NOT EXISTS (SELECT * FROM AutoCar Where matricule = @matricule))
				Print 'ER:----Oups Autocar '+@matricule+' nexiste pas----'
			ELSE
				Print 'ER:----Oups Autocar '+@matricule+' na pas de Fonctionnalite----'
		END

END
GO



--FIND FONCTIONNALITE BY LABEL AND TYPE(start,middle,end)
GO
CREATE OR ALTER FUNCTION Find_Fonctionnalite
(
    @v_label varchar(20),
	@typeSearch varchar(20)
    
) 
RETURNS  TABLE
AS
RETURN (
	SELECT * FROM Fonctionnalite WHERE label Like 
		CASE @typeSearch
			WHEN 'start' THEN @v_label+'%'
			WHEN 'middle' THEN '%'+@v_label+'%'
			WHEN 'end' THEN '%'+@v_label
		END
)
GO





--Fonctionnalite
exec get_Fonctionnalite_By_Autocar '11M5'
exec Add_Fonctionnalite 1,'wifi'
SELECT * from Fonctionnalite