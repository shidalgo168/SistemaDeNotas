USE [SistemaDeNotas]
GO

/****** Object:  StoredProcedure [dbo].[ModificarEval]    Script Date: 19/4/2018 11:59:39 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ModificarEval]
	-- Add the parameters for the stored procedure here
	@idEval int, @Nota float, @Nombre varchar(100),
	@FechaNueva Date, @Descripcion varchar(50),
	@idGxE int, @idGxR int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @ValorAntiguo FLOAT, @ValorNuevo FLOAT, @Eval float, @divisor int, @porcentaje float;

	WITH T AS (SELECT sum(Nota) as Nota FROM Evaluacion E 
	INNER JOIN Eval_x_Est EV ON E.id=EV.FK_Evaluacion 
	WHERE E.FK_GrupoxRubro=@idGxR and EV.FK_GrupoxEst=@idGxE)
	SELECT @Eval = T.Nota FROM T;

	WITH DIV AS(SELECT Cont, ValorPorcTotal FROM Grupo_x_Rubro WHERE id=@idGxR)
	SELECT @divisor = DIV.Cont, @porcentaje=DIV.ValorPorcTotal from DIV;

	SET @ValorAntiguo = (@Eval/@divisor)*(@porcentaje/100);

	BEGIN TRY
	IF @@TRANCOUNT = 0
	BEGIN TRANSACTION

	UPDATE Evaluacion
	SET Nombre=@Nombre, FechaAplicacion=@FechaNueva, Descripcion=@Descripcion
	WHERE id=@idEval;

	UPDATE Eval_x_Est
	SET Nota=@Nota
	WHERE FK_Evaluacion=@idEval and FK_GrupoxEst=@idGxE;

	IF @@TRANCOUNT = 1
		COMMIT;

	WITH Y AS (SELECT sum(Nota) as Nota FROM Evaluacion E 
	INNER JOIN Eval_x_Est EV ON E.id=EV.FK_Evaluacion 
	WHERE E.FK_GrupoxRubro=@idGxR and EV.FK_GrupoxEst=@idGxE)
	SELECT @Eval = Y.Nota FROM Y;

	SET @ValorNuevo = (@Eval/@divisor)*(@porcentaje/100);

	IF @@TRANCOUNT = 0
		BEGIN TRANSACTION

	UPDATE Grupo_x_Estudiante
	SET NotaAcumulada = NotaAcumulada + (@ValorAntiguo - @ValorNuevo)
	WHERE id = @idGxE;

	IF @@TRANCOUNT = 1
		COMMIT
	RETURN 3

	END TRY
	BEGIN CATCH

		IF @@TRANCOUNT > 0
		ROLLBACK
		RETURN @@ERROR * -1

	END CATCH

END
GO


