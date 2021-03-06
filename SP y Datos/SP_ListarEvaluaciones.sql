USE [SistemaDeNotas]
GO

/****** Object:  StoredProcedure [dbo].[ListarEvaluaciones]    Script Date: 19/4/2018 11:58:10 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListarEvaluaciones]
	-- Add the parameters for the stored procedure here
	@idGxE int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SELECT SE.FK_GrupoxEst, SE.Nota, E.id, E.Nombre, E.FechaAplicacion,E.ValorPorcIndiv, E.Descripcion
	FROM Eval_x_Est SE        
	INNER JOIN Evaluacion E ON (E.id = SE.FK_Evaluacion)
	WHERE SE.FK_GrupoxEst =@idGxE

END
GO


