USE [SistemaDeNotas]
GO

/****** Object:  StoredProcedure [dbo].[ListarEvaluaciones]    Script Date: 15/4/2018 8:13:16 p. m. ******/
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
	SELECT * FROM Eval_x_Est E WHERE E.FK_GrupoxEst=@idGxE
END
GO


