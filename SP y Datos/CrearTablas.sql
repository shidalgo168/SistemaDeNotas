/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/

USE [SistemaDeNotas]
GO

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.EstadoEst
    (
    id int NOT NULL,
    Estado varchar(20) NOT NULL
    )  ON [PRIMARY]
GO
ALTER TABLE dbo.EstadoEst ADD CONSTRAINT
    PK_EstadoEst PRIMARY KEY CLUSTERED
    (
    id
    ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.EstadoEst SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Estudiante
    (
    id int NOT NULL,
    Nombre varchar(100) NOT NULL,
    Apellido varchar(100) NOT NULL,
    Email varchar(50) NOT NULL,
    carnet int NOT NULL,
    Telefono int NOT NULL
    )  ON [PRIMARY]
GO
ALTER TABLE dbo.Estudiante ADD CONSTRAINT
    PK_Estudiante PRIMARY KEY CLUSTERED
    (
    id
    ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Estudiante SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Rubro
    (
    id int NOT NULL,
    Nombre varchar(20) NOT NULL
    )  ON [PRIMARY]
GO
ALTER TABLE dbo.Rubro ADD CONSTRAINT
    PK_Rubro PRIMARY KEY CLUSTERED
    (
    id
    ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Rubro SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.EstadoGrupo
    (
    id int NOT NULL,
    Estado varchar(20) NOT NULL
    )  ON [PRIMARY]
GO
ALTER TABLE dbo.EstadoGrupo ADD CONSTRAINT
    PK_EstadoGrupo PRIMARY KEY CLUSTERED
    (
    id
    ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.EstadoGrupo SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Periodo
    (
    id int NOT NULL,
    FechaInicio date NOT NULL,
    FechaFin date NOT NULL,
    Activo bit NOT NULL
    )  ON [PRIMARY]
GO
ALTER TABLE dbo.Periodo ADD CONSTRAINT
    PK_Periodo PRIMARY KEY CLUSTERED
    (
    id
    ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Periodo SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Grupo
    (
    id int NOT NULL,
    FK_EstadoG int NOT NULL,   
    ProfersorID int NOT NULL,
    FK_Periodo int NOT NULL,   
    NombreCurso varchar(100) NOT NULL,
    CodigoCurso varchar(100) NOT NULL
    )  ON [PRIMARY]
GO
ALTER TABLE dbo.Grupo ADD CONSTRAINT
    PK_Grupo PRIMARY KEY CLUSTERED
    (
    id
    ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Grupo ADD CONSTRAINT
    FK_Periodo FOREIGN KEY
    (
    FK_Periodo
    ) REFERENCES dbo.Periodo
    (
    id
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
ALTER TABLE dbo.Grupo ADD CONSTRAINT
    FK_EstadoGrupo FOREIGN KEY
    (
    FK_EstadoG
    ) REFERENCES dbo.EstadoGrupo
    (
    id
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
ALTER TABLE dbo.Grupo SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Grupo_x_Estudiante
    (
    id int NOT NULL,
	NotaAcumulada float NOT NULL,
    FK_Grupo int NOT NULL,
    FK_Estudiante int NOT NULL,
    FK_EstadoEst int NOT NULL    
    )  ON [PRIMARY]
GO
ALTER TABLE dbo.Grupo_x_Estudiante ADD CONSTRAINT
    PK_Grupo_x_Estudiante PRIMARY KEY CLUSTERED
    (
    id
    ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Grupo_x_Estudiante ADD CONSTRAINT
    FK_Grupo_x_Estudiante_Grupo FOREIGN KEY
    (
    FK_Grupo
    ) REFERENCES dbo.Grupo
    (
    id
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
ALTER TABLE dbo.Grupo_x_Estudiante ADD CONSTRAINT
    FK_Grupo_x_Estudiante_Estudiante FOREIGN KEY
    (
    FK_Estudiante
    ) REFERENCES dbo.Estudiante
    (
    id
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
ALTER TABLE dbo.Grupo_x_Estudiante ADD CONSTRAINT
    FK_Grupo_x_Estudiante_EstadoEst FOREIGN KEY
    (
    FK_EstadoEst
    ) REFERENCES dbo.EstadoEst
    (
    id
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
ALTER TABLE dbo.Grupo_x_Estudiante SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Grupo_x_Rubro
    (
    id int NOT NULL,
    FK_Rubro int NOT NULL,
    FK_Grupo int NOT NULL,
    ValorPorcTotal float NOT NULL,   
    Cont int NOT NULL,
    EsFijo bit NOT NULL
    )  ON [PRIMARY]
GO
ALTER TABLE dbo.Grupo_x_Rubro ADD CONSTRAINT
    PK_Grupo_x_Rubro PRIMARY KEY CLUSTERED
    (
    id
    ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Grupo_x_Rubro ADD CONSTRAINT
    FK_Grupo_x_Rubro FOREIGN KEY
    (
    FK_Grupo
    ) REFERENCES dbo.Grupo
    (
    id
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
ALTER TABLE dbo.Grupo_x_Rubro ADD CONSTRAINT
    FK_Rubro FOREIGN KEY
    (
    FK_Rubro
    ) REFERENCES dbo.Rubro
    (
    id
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
ALTER TABLE dbo.Grupo_x_Rubro SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Evaluacion
    (
    id int NOT NULL,
    FK_GrupoxRubro int NOT NULL,
    Nombre varchar(100) NOT NULL,
    FechaAplicacion date NOT NULL,
    ValorPorcIndiv float NOT NULL,
    Descripcion varchar(50) NOT NULL
    )  ON [PRIMARY]
GO
ALTER TABLE dbo.Evaluacion ADD CONSTRAINT
    PK_Evaluacion PRIMARY KEY CLUSTERED
    (
    id
    ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Evaluacion ADD CONSTRAINT
    FK_Evaluacion_Grupo_x_Rubro FOREIGN KEY
    (
    FK_GrupoxRubro
    ) REFERENCES dbo.Grupo_x_Rubro
    (
    id
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
ALTER TABLE dbo.Evaluacion SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Eval_x_Est
    (
    id int NOT NULL,
    FK_GrupoxEst int NOT NULL,
    FK_Evaluacion int NOT NULL,
    Nota float NOT NULL
    )  ON [PRIMARY]
GO
ALTER TABLE dbo.Eval_x_Est ADD CONSTRAINT
    PK_Eval_x_Est PRIMARY KEY CLUSTERED
    (
    id
    ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Eval_x_Est ADD CONSTRAINT
    FK_Eval_x_Est_Evaluacion FOREIGN KEY
    (
    FK_Evaluacion
    ) REFERENCES dbo.Evaluacion
    (
    id
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
ALTER TABLE dbo.Eval_x_Est ADD CONSTRAINT
    FK_Eval_x_Est_Grupo_x_Estudiante FOREIGN KEY
    (
    FK_GrupoxEst
    ) REFERENCES dbo.Grupo_x_Estudiante
    (
    id
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
ALTER TABLE dbo.Eval_x_Est SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
-------------------------------------
--CREATE TABLE dbo.Profesor
--    (
--    id int NOT NULL,
--    Nombre varchar(100) NOT NULL,
--    Apellido varchar(100) NOT NULL,
--    correo varchar(100) NOT NULL,
--    contraseña varchar(100) NOT NULL,

--    )  ON [PRIMARY]
--GO

--ALTER TABLE dbo.Profesor SET (LOCK_ESCALATION = TABLE)
--GO
--COMMIT

/*
   11 April, 201810:21:14 PM
   User:
   Server: DESKTOP-JPH72PI
   Database: Bases3
   Application:
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Grupo
    DROP CONSTRAINT FK_EstadoGrupo
GO
ALTER TABLE dbo.EstadoGrupo SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Grupo
    DROP CONSTRAINT FK_Periodo
GO
ALTER TABLE dbo.Periodo SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Profesor
    (
    ID int NOT NULL,
    Nombre varchar(100) NULL,
    Apellido varchar(100) NULL,
    correo varchar(100) NULL,
    Password varchar(100) NULL
    )  ON [PRIMARY]
GO
ALTER TABLE dbo.Profesor ADD CONSTRAINT
    PK_Profesor PRIMARY KEY CLUSTERED
    (
    ID
    ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Profesor SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Grupo
    (
    id int NOT NULL,
    FK_EstadoG int NOT NULL,
    FK_Profesor int NULL,
    FK_Periodo int NOT NULL,
    NombreCurso varchar(100) NOT NULL,
    CodigoCurso varchar(100) NOT NULL
    )  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Grupo SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.Grupo)
     EXEC('INSERT INTO dbo.Tmp_Grupo (id, FK_EstadoG, FK_Periodo, NombreCurso, CodigoCurso)
        SELECT id, FK_EstadoG, FK_Periodo, NombreCurso, CodigoCurso FROM dbo.Grupo WITH (HOLDLOCK TABLOCKX)')
GO
ALTER TABLE dbo.Grupo_x_Estudiante
    DROP CONSTRAINT FK_Grupo_x_Estudiante_Grupo
GO
ALTER TABLE dbo.Grupo_x_Rubro
    DROP CONSTRAINT FK_Grupo_x_Rubro
GO
DROP TABLE dbo.Grupo
GO
EXECUTE sp_rename N'dbo.Tmp_Grupo', N'Grupo', 'OBJECT'
GO
ALTER TABLE dbo.Grupo ADD CONSTRAINT
    PK_Grupo PRIMARY KEY CLUSTERED
    (
    id
    ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Grupo ADD CONSTRAINT
    FK_Periodo FOREIGN KEY
    (
    FK_Periodo
    ) REFERENCES dbo.Periodo
    (
    id
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
ALTER TABLE dbo.Grupo ADD CONSTRAINT
    FK_EstadoGrupo FOREIGN KEY
    (
    FK_EstadoG
    ) REFERENCES dbo.EstadoGrupo
    (
    id
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
ALTER TABLE dbo.Grupo ADD CONSTRAINT
    FK_Grupo_Profesor FOREIGN KEY
    (
    FK_Profesor
    ) REFERENCES dbo.Profesor
    (
    ID
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Grupo_x_Rubro ADD CONSTRAINT
    FK_Grupo_x_Rubro FOREIGN KEY
    (
    FK_Grupo
    ) REFERENCES dbo.Grupo
    (
    id
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
ALTER TABLE dbo.Grupo_x_Rubro SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Grupo_x_Estudiante ADD CONSTRAINT
    FK_Grupo_x_Estudiante_Grupo FOREIGN KEY
    (
    FK_Grupo
    ) REFERENCES dbo.Grupo
    (
    id
    ) ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
   
GO
ALTER TABLE dbo.Grupo_x_Estudiante SET (LOCK_ESCALATION = TABLE)
GO
COMMIT