use onsa

--GET ALL FONCTIONNALITE
GO
CREATE FUNCTION getBagage()
RETURNS TABLE
AS
RETURN (
    SELECT 
        *
    FROM Bagage
    );
GO



--ADD BAGAGE
GO
CREATE OR ALTER PROCEDURE Add_Bagage(@id int, @poid float,@frais_stock decimal,@mat nvarchar(15),@cin nvarchar(15))
AS
BEGIN

	IF (EXISTS (SELECT * FROM Client WHERE cin = @cin))
		BEGIN
			IF (EXISTS (SELECT * FROM AutoCar WHERE matricule = @mat))
			BEGIN
				
				INSERT INTO [dbo].Bagage (id,poid,frais_stockage,mat_autocar,cin) values (@id,@poid,@frais_stock,@mat,@cin)
			
			END
			ELSE
				Print 'ER:----AutoCar '+@mat+' Not Found----'

		END
	ELSE
		Print 'ER:----Client '+@cin+' Not Found----'

END
GO



--DELETE BAGAGE
GO
CREATE OR ALTER PROCEDURE Delete_Bagage(@id int)
AS
BEGIN

	IF (EXISTS (SELECT * FROM Bagage WHERE id = @id))
		DELETE FROM Bagage Where id = @id
	ELSE
		Print 'ER:----Bagage '+@id+' Not Found----'

END
GO



--GET BAGAGE BY AUTOCAR
GO
CREATE OR ALTER PROCEDURE get_Bagage_By_Autocar(@matricule varchar(20))
AS
BEGIN

	DECLARE @mat nvarchar(20)
	IF (EXISTS (SELECT * FROM Autocar Where matricule = @matricule))
		BEGIN
			
			print '-------Les Fonctionnalite qui appartient a autocar '+@matricule+'------'
			SELECT matricule as Autocar, id as BagageId, c.cin as ClientCin FROM Autocar o 
			INNER JOIN Bagage b  On o.matricule = b.mat_autocar
			INNER JOIN Client c  On c.cin = b.cin
			Where matricule = @matricule

		END
	ELSE
		Print 'ER:----Oups Autocar '+@matricule+' na pas de Bagage----'

END
GO




--FIND BAGAGE BY POID AND TYPE(sup,inf,equal)
GO
CREATE OR ALTER PROCEDURE Find_Bagage_By_Poid
(
    @v_poid float,
	@typeSearch varchar(20)
    
) 
AS
BEGIN
	IF @typeSearch = 'sup'	
		SELECT * FROM Bagage WHERE poid > @v_poid
	ELSE IF @typeSearch = 'inf'	
		SELECT * FROM Bagage WHERE poid < @v_poid
	ELSE IF @typeSearch = 'equal'	
		SELECT * FROM Bagage WHERE poid = @v_poid


END
GO




get_Bagage_By_Autocar '11M5'
exec Add_Bagage 2,11.5,10.00,'11M5','11CV'
select * from getAutoCar()
select * from getBagage()