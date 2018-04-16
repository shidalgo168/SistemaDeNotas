USE [SistemaDeNotas]
GO

/****** Object:  StoredProcedure [dbo].[ListarEstDelGrupo]    Script Date: 15/4/2018 8:12:12 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListarEstDelGrupo]
	-- Add the parameters for the stored procedure here
	@idGrupo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT G.id, G.NotaAcumulada, G.FK_EstadoEst, G.FK_Estudiante, G.FK_Grupo ,E.id AS idEst, E.Nombre, E.Apellido, E.Email, E.carnet, E.Telefono, GR.FK_Periodo, GR.FK_Profesor
	FROM Estudiante E
	INNER JOIN Grupo_x_Estudiante G ON (E.id=G.FK_Estudiante)
	INNER JOIN Grupo GR ON G.FK_Grupo=GR.id
	WHERE G.FK_Grupo = 3
END
GO


