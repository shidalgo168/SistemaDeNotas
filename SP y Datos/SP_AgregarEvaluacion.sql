USE [SistemaDeNotas]
GO

/****** Object:  StoredProcedure [dbo].[AgregarEvaluacion]    Script Date: 19/4/2018 11:56:01 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AgregarEvaluacion]
	-- Add the parameters for the stored procedure here
	@idGxR INT, @idGxE INT, @Nombre varchar(100), @Fecha date, @Descripcion varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @GRUPO TABLE (sec int identity(1,1), idGxE int, FK_Estudiante int)
	DECLARE @EVALS TABLE (sec int identity(1,1), idGxE int, ValorIndiv float, NotaObtenida int)
	DECLARE @MAXID INT, @NuevaNota FLOAT, @nota float, @porcentaje float, @Q INT, @LO INT, @idVarGrupo INT, @lastEval INT, @idGrupo INT, @ValorPorc FLOAT, @cantEvaluaciones INT

	INSERT @EVALS
	SELECT ES.FK_GrupoxEst, E.ValorPorcIndiv, ES.Nota FROM Evaluacion E 
	INNER JOIN Eval_x_Est ES ON ES.FK_Evaluacion=E.id
	WHERE E.FK_GrupoxRubro=@idGxR
	ORDER BY FK_GrupoxEst;

	SET @LO=1
	SET @NuevaNota = 0
	SELECT @MAXID = MAX(sec) from @EVALS

	WHILE @LO <= @MAXID
	BEGIN
		SELECT @idVarGrupo =idGxE,@porcentaje=ValorIndiv, @nota = NotaObtenida FROM @EVALS WHERE sec=@LO
		IF @nota=-1
			SET @nota = 0
		SET @NuevaNota = @nota * (@porcentaje/100)
		UPDATE Grupo_x_Estudiante
		SET NotaAcumulada = NotaAcumulada-@NuevaNota
		WHERE id = @idVarGrupo
		SET @LO = @LO + 1
	END

	SELECT @cantEvaluaciones=COUNT(1) FROM Evaluacion WHERE FK_GrupoxRubro=@idGxR
	SELECT @ValorPorc=ValorPorcTotal FROM Grupo_x_Rubro WHERE id=@idGxR
	SET @ValorPorc = @ValorPorc/(@cantEvaluaciones + 1)

	UPDATE Evaluacion
	SET ValorPorcIndiv=@ValorPorc
	WHERE FK_GrupoxRubro=@idGxR

	SELECT @idGrupo = T.id FROM Grupo_x_Estudiante T WHERE T.id=@idGxE
	INSERT @GRUPO(idGxE)
	SELECT id FROM Grupo_x_Estudiante WHERE FK_Grupo=@idGrupo
	ORDER BY id;

	SELECT @lastEval = MAX(id) from Evaluacion
	INSERT Evaluacion
	VALUES(@lastEval+1, @idGxR, @Nombre, @Fecha, @ValorPorc, @Descripcion)

	SET @LO = 1
	SELECT @lastEval = MAX(id) from Evaluacion
	select @MAXID = MAX(id) from Eval_x_Est
	SET @MAXID = @MAXID +1
	SELECT @Q = COUNT(1) FROM @GRUPO
	WHILE @LO <= @Q
	BEGIN
		SELECT @idVarGrupo = idGxE FROM @GRUPO WHERE sec=@LO
		INSERT Eval_x_Est
		VALUES(@MAXID, @idVarGrupo, @lastEval, -1);
		SET @LO = @LO+1
		SET @MAXID = @MAXID+1
	END

	INSERT @EVALS(idGxE, ValorIndiv, NotaObtenida)
	SELECT ES.FK_GrupoxEst, E.ValorPorcIndiv, ES.Nota FROM Evaluacion E 
	INNER JOIN Eval_x_Est ES ON ES.FK_Evaluacion=E.id
	WHERE ES.FK_Evaluacion=@lastEval

	SET @LO=1
	SELECT @MAXID=MAX(sec) FROM @EVALS
	WHILE @LO<=@MAXID
	BEGIN
		SELECT @idVarGrupo = idGxE, @porcentaje=ValorIndiv, @nota = NotaObtenida FROM @EVALS WHERE sec=@LO
		IF @nota=-1
			SET @nota = 0
		SET @NuevaNota = @nota * (@porcentaje/100)
		UPDATE Grupo_x_Estudiante
		SET NotaAcumulada = NotaAcumulada+@NuevaNota
		WHERE id = @idVarGrupo
		SET @LO = @LO+1
	END
END
GO


