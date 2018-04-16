USE [SistemaDeNotas]
GO

/****** Object:  StoredProcedure [dbo].[ListarGrupos]    Script Date: 15/4/2018 8:13:42 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListarGrupos]
	-- Add the parameters for the stored procedure here
	@idProfesor int, @idPeriodo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Grupo WHERE FK_Profesor=@idProfesor and FK_Periodo=@idPeriodo
END
GO


