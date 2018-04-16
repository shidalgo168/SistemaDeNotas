
USE [SistemaDeNotas]
GO

CREATE TABLE XMLwithOpenXML
(
Id INT IDENTITY PRIMARY KEY,
XMLData XML,
LoadedDateTime DATETIME
)



INSERT INTO dbo.XMLwithOpenXML(XMLData, LoadedDateTime)
SELECT CONVERT(XML, BulkColumn) AS BulkColumn, GETDATE() 
FROM OPENROWSET(BULK 'C:\Users\MSI GT683\Dropbox\TEC\2018 I\Franco Quiros\randomData8.xml', SINGLE_BLOB) AS x;

DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
SELECT @XML = XMLData FROM XMLwithOpenXML
EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML


-----------------------------------------
--PERIODO
INSERT INTO dbo.Periodo
SELECT ID,fechaI,fechaF,activo
FROM OPENXML (@hdoc,'XML/termData/term')
WITH
(
ID int '@ID',
fechaI [varchar](50) '@start',
fechaF [varchar](50) '@end',
activo bit '@active'
)

-------------------------------------
--ESTUDIANTE
INSERT INTO  dbo.Estudiante
SELECT Id, name, lastname, email,carnet,phone
From OPENXML(@hDoc,'XML/studentData/student')
WITH
(
Id int '@ID',
name [varchar](50) '@name',
lastname [varchar](1000) '@lastName',
email [varchar](1000) '@email',
carnet[varchar](1000) '@carnet',
phone[varchar](1000) '@phone'
)

-----------------------------------
--Profesor
INSERT INTO  dbo.Profesor
SELECT Id, name, lastname, email,password
From OPENXML(@hDoc,'XML/teacherData/teacher')
WITH 
(
Id int '@ID',
name [varchar](50) '@name',
lastname [varchar](100) '@lastName',
email [varchar](100) '@email',
password[varchar](100) '@password'
)


-------------------------------------
--EstadoGrupo
INSERT INTO dbo.EstadoGrupo
SELECT ID,nombre
FROM OPENXML (@hdoc,'XML/groupStateData/groupState')
WITH
(
ID int '@ID',
nombre [varchar](50) '@name'
)

-------------------------------------
--EstadoEstudiante
INSERT INTO dbo.EstadoEst
SELECT ID,nombre
FROM OPENXML (@hdoc,'XML/studentGroupStateData/studentGroupState')
WITH
(
ID int '@ID',
nombre [varchar](50) '@name'
)
-------------------------------------
--RUBROS
INSERT INTO dbo.Rubro
SELECT ID,nombre
FROM OPENXML (@hdoc,'XML/itemData/item')
WITH
(
ID int '@ID',
nombre [varchar](50) '@name'
)

-------------------------------------
--GRUPOS 
INSERT INTO dbo.Grupo
SELECT Id, Estado, FK_Profesor, FK_Periodo, NombreCurso, CodigoCurso
FROM OPENXML(@hDoc,'XML/groupData/group')
WITH
(
 ID int '@ID',
Estado int '@groupStateID',
FK_Profesor int '@teacherID',
FK_Periodo int '@termID',
NombreCurso [varchar](100)  '@courseName',
CodigoCurso [varchar](100) '@code'
)

---------------------------------------
--GRUPOSxRubro
INSERT INTO dbo.Grupo_x_Rubro
SELECT Id, FK_Rubro, FK_Grupo, ValorPorcentual,Cont, constantCount
FROM OPENXML(@hDoc,'XML/groupItemData/groupItem')
WITH
(
 ID int '@ID',
FK_Rubro int '@itemID',
FK_Grupo int '@groupID',
ValorPorcentual float '@percentage',
Cont int  '@count',
constantCount bit '@constantCount'
)
---------------------------------------
--GrupoxEstudiante
INSERT INTO dbo.Grupo_x_Estudiante
SELECT Id, Nota , FK_Grupo, FK_Estudiante, FK_EstadoEst
FROM OPENXML(@hDoc,'XML/studentGroupData/studentGroup')
WITH
(
 Id int '@ID',
 Nota float  '@totalGrade',
 FK_Grupo int '@groupID',
 FK_Estudiante int '@studentID',
 FK_EstadoEst int '@studentGroupStateID'
 )
-------------------------------------------
--Evaluacion
INSERT INTO dbo.Evaluacion
SELECT Id, FK_GrupoxRubro, Nombre, FechaApp, ValorPorcentual,Descripcion
FROM OPENXML(@hDoc,'XML/evaluationData/evaluation')
WITH
(
 ID int '@ID',
FK_GrupoxRubro int '@groupItemID',
Nombre [varchar](50) '@name',
FechaApp date  '@date',
ValorPorcentual float '@percentage',
Descripcion [varchar](50) '@description'
)
-----------------------------------------
--EvaluacionxEstudiante
INSERT INTO dbo.Eval_x_Est
SELECT Id, FK_GrupoxEst, FK_Evaluacion, Nota
FROM OPENXML(@hDoc,'XML/studentEvaluationData/studentEvaluation')
WITH
(
 Id int '@ID',
 FK_GrupoxEst int '@studentGroupID',
 FK_Evaluacion int '@evaluationID',
 Nota float  '@grade'
 )

EXEC sp_xml_removedocument @hDoc
GO


























