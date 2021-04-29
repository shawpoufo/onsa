use onsa

--GET ALL CLIENT
GO
CREATE FUNCTION getClient()
RETURNS TABLE
AS
RETURN (
    SELECT 
        *
    FROM Client
    );
GO

--ADD CLIENT
GO
CREATE OR ALTER PROCEDURE Add_Client(@cin varchar(15), @nom varchar(50),@prenom varchar(50),@tele varchar(50),@email varchar(50))
AS
BEGIN

	IF (NOT EXISTS (SELECT * FROM Client WHERE cin = @cin))
		BEGIN
			INSERT INTO [dbo].Client (cin,nom,prenom,telephone,email) values (@cin,@nom,@prenom,@tele,@email)
			
			print '-------Un Client a été ajouter avec succes'
		END
	ELSE
		Print 'ER:----Oups ce Client exists deja----'

	
END
GO


--FIND FONCTIONNALITE BY NOM OR PRENOM OR EMAIL AND TYPE(start,middle,end)
GO
CREATE OR ALTER PROCEDURE Find_Client_By_All_Columns
(
	@columns varchar(50),
    @v_columns varchar(20),
	@typeSearch varchar(20)
    
) 
AS
BEGIN
	IF @columns = 'cin' 
		BEGIN
			SELECT * FROM Client WHERE cin Like 
			CASE @typeSearch
				WHEN 'start' THEN @v_columns+'%'
				WHEN 'middle' THEN '%'+@v_columns+'%'
				WHEN 'end' THEN '%'+@v_columns
			END
		END
	ELSE IF @columns = 'nom' 
		BEGIN
			SELECT * FROM Client WHERE nom Like 
			CASE @typeSearch
				WHEN 'start' THEN @v_columns+'%'
				WHEN 'middle' THEN '%'+@v_columns+'%'
				WHEN 'end' THEN '%'+@v_columns
			END
		END
	ELSE IF @columns = 'prenom' 
		BEGIN
			SELECT * FROM Client WHERE prenom Like 
			CASE @typeSearch
				WHEN 'start' THEN @v_columns+'%'
				WHEN 'middle' THEN '%'+@v_columns+'%'
				WHEN 'end' THEN '%'+@v_columns
			END
		END
	ELSE
		BEGIN
			SELECT * FROM Client WHERE email Like 
			CASE @typeSearch
				WHEN 'start' THEN @v_columns+'%'
				WHEN 'middle' THEN '%'+@v_columns+'%'
				WHEN 'end' THEN '%'+@v_columns
			END
		END
		
END
GO





exec Find_Client_By_All_Columns 'nom','ch','start'

exec Add_Client '11CV','chikeb','aymen','00000000','aymen@gmail.com'

select * from getClient()