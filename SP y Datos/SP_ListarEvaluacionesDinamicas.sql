USE [SistemaDeNotas]
GO

/****** Object:  StoredProcedure [dbo].[ListarEvalDinamicas]    Script Date: 19/4/2018 11:57:33 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListarEvalDinamicas] 
	-- Add the parameters for the stored procedure here
	@idGrupo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT GE.id, r.Nombre
	FROM Rubro R
	INNER JOIN Grupo_x_Rubro GE ON R.id = GE.FK_Rubro and GE.EsFijo=0 AND GE.FK_Grupo=@idGrupo
END
GO


