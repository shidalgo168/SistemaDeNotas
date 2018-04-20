USE [SistemaDeNotas]
GO

/****** Object:  StoredProcedure [dbo].[VerificarUsuario]    Script Date: 20/4/2018 12:00:00 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VerificarUsuario] 
	-- Add the parameters for the stored procedure here
	@Usuario varchar(100), @Password varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Profesor
	WHERE correo=@Usuario AND Password=@Password
END
GO


