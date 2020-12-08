--PARA el XML
DROP TABLE IF EXISTS dbo.XMLwithOpenXML
--Tabla para guardar el xml
CREATE TABLE XMLwithOpenXML(Id INT IDENTITY PRIMARY KEY, XMLData XML)

	--Se abre el archivo y se inserta el contenido en la tabla
    INSERT INTO XMLwithOpenXML(XMLData)
    SELECT CONVERT(XML, BulkColumn) AS BulkColumn
    FROM OPENROWSET(BULK 'C:\Users\Allison\Documents\Semestre IV\Bases I\Datos_Tarea_2.xml', SINGLE_BLOB) AS x;


	--Para poder parsear el xml
    DECLARE @XML AS XML, @hDoc AS INT, @SQL NVARCHAR (MAX)
    SELECT @XML = XMLData FROM XMLwithOpenXML
    EXEC sp_xml_preparedocument @hDoc OUTPUT, @XML

	
--Intento #3--

--Para parsear el fecha=x
DECLARE @Fecha varchar(30)
SET @Fecha = '2020-07-01'

--Selecciona todos los subnodos del fecha x

---------------------------PARA PARSEAR PERSONAS---------------------------
DECLARE @Personas AS XML
SELECT @Personas =  @XML.query('Operaciones/FechaOperacion[@Fecha=sql:variable("@Fecha")]//Persona')


 ------------------------------
 --Tabla variable
 DECLARE @TablaPersonas TABLE(TipoDocuIdentidad int, 
							  Nombre nchar(30), 
							  ValorDocumentoIdentidad nchar(30), 
							  FechaNacimiento date, 
							  Email nchar(30), 
							  Telefono1 int, 
							  Telefono2 int)
 ---
 DECLARE @TipoDocuIdentidad TABLE(ID INT IDENTITY,TipoID int)
 DECLARE @Nombre TABLE(ID INT IDENTITY,nombre nchar(30))
 DECLARE @ValorDocumentoIdentidad TABLE(ID INT IDENTITY,valorID int)
 DECLARE @FechaNacimiento TABLE(ID INT IDENTITY,fecha date)
 DECLARE @Email TABLE(ID INT IDENTITY, email nchar(30))
 DECLARE @Telefono1 TABLE(ID INT IDENTITY, telefono1 int)
 DECLARE @Telefono2 TABLE(ID INT IDENTITY, telefono2 int)


 --Insertar en la tabla 
 INSERT INTO @TipoDocuIdentidad (TipoID)
	SELECT 	xmlData.A.value('.', 'int') AS Tipo 
	FROM	@Personas.nodes('/Persona/@TipoDocuIdentidad') xmlData(A)

 INSERT INTO @Nombre (nombre)
	SELECT 	xmlData.A.value('.', 'nchar(30)') AS CodigoCuenta 
	FROM	@Personas.nodes('/Persona/@Nombre') xmlData(A)

 INSERT INTO @ValorDocumentoIdentidad (valorID)
	SELECT 	xmlData.A.value('.', 'int') AS Monto 
	FROM	@Personas.nodes('/Persona/@ValorDocumentoIdentidad') xmlData(A)

 INSERT INTO @FechaNacimiento (fecha)
	SELECT 	xmlData.A.value('.', 'date') AS Descripcion 
	FROM	@Personas.nodes('/Persona/@FechaNacimiento') xmlData(A)

INSERT INTO @Email (email)
	SELECT 	xmlData.A.value('.', 'nchar(30)') AS Descripcion 
	FROM	@Personas.nodes('/Persona/@Email') xmlData(A)

INSERT INTO @Telefono1 (telefono1)
	SELECT 	xmlData.A.value('.', 'int') AS Descripcion 
	FROM	@Personas.nodes('/Persona/@Telefono1') xmlData(A)

INSERT INTO @Telefono2 (telefono2)
	SELECT 	xmlData.A.value('.', 'int') AS Descripcion 
	FROM	@Personas.nodes('/Persona/@Telefono2') xmlData(A)

INSERT INTO @TablaPersonas(TipoDocuIdentidad, Nombre, ValorDocumentoIdentidad, Email, FechaNacimiento, Telefono1, Telefono2)
SELECT T.TipoID, N.nombre, V.valorID, E.email, Fecha.fecha, T1.telefono1, T2.telefono2
from @TipoDocuIdentidad as T
LEFT JOIN @Nombre as N on N.ID = T.ID
LEFT JOIN @ValorDocumentoIdentidad as V on V.ID = T.ID
LEFT JOIN @Email as E on E.ID = T.ID
LEFT JOIN @FechaNacimiento as Fecha on Fecha.ID = T.ID
LEFT JOIN @Telefono1 as T1 on T1.ID = T.ID
LEFT JOIN @Telefono2 as T2 on T2.ID = T.ID

INSERT INTO dbo.Persona(TipoDocID, Nombre, ValorDocIdentidad, FechaNacimiento, email, Telefono1, Telefono2)
SELECT TipoDocuIdentidad, Nombre, ValorDocumentoIdentidad, FechaNacimiento, Email, Telefono1, Telefono2 FROM @TablaPersonas
---------------------------PARA PARSEAR CUENTAS---------------------------
DECLARE @Cuentas AS XML
SELECT @Cuentas =  @XML.query('Operaciones/FechaOperacion[@Fecha=sql:variable("@Fecha")]//Cuenta')


 ------------------------------
 --Para poder parsear el xml
    DECLARE @XMLCuentas AS XML, @hDoc1 AS INT, @SQL1 NVARCHAR (MAX)
    SELECT @XMLCuentas = @Cuentas
    EXEC sp_xml_preparedocument @hDoc1 OUTPUT, @XMLCuentas

--Tabla variable para ingresar los datos
DROP TABLE IF EXISTS #TablaCuentas
CREATE TABLE #TablaCuentas (ValorDocumentoIdentidadDelCliente int, TipoCuentaId int, NumeroCuenta int, FechaCreacion date, Saldo float)

ALTER TABLE #TablaCuentas 
ADD CONSTRAINT modifica_fecha
DEFAULT '2020-07-01' FOR FechaCreacion

ALTER TABLE #TablaCuentas 
ADD CONSTRAINT modifica_saldo
DEFAULT 0.0 FOR Saldo

	--Saca los datos de los nodos
	INSERT INTO #TablaCuentas (ValorDocumentoIdentidadDelCliente, TipoCuentaId, NumeroCuenta)
	SELECT * 
    FROM OPENXML(@hDoc1, 'Cuenta')
    WITH (ValorDocumentoIdentidadDelCliente NCHAR(30),
		  TipoCuentaId NCHAR(30),
		  NumeroCuenta NCHAR(30)) 


INSERT INTO dbo.CuentadeAhorro(TipoCuentaAhorroID, NumerodeCuenta, ValorDocIdentidadCliente, FechaConstitucion, Saldo)
SELECT TipoCuentaId, NumeroCuenta, ValorDocumentoIdentidadDelCliente, FechaCreacion, Saldo FROM #TablaCuentas

SELECT * FROM CuentadeAhorro
---------------------------PARA PARSEAR Beneficiarios---------------------------
DECLARE @Beneficiarios AS XML
SELECT @Beneficiarios =  @XML.query('Operaciones/FechaOperacion[@Fecha=sql:variable("@Fecha")]//Beneficiario')


 ------------------------------
 --Para poder parsear el xml
    DECLARE @XMLBeneficiarios AS XML, @hDoc2 AS INT, @SQL2 NVARCHAR (MAX)
    SELECT @XMLBeneficiarios = @Beneficiarios
    EXEC sp_xml_preparedocument @hDoc2 OUTPUT, @XMLBeneficiarios

	--Saca los datos de los nodos
	SELECT *
    FROM OPENXML(@hDoc2, 'Beneficiario')
    WITH (NumeroCuenta NCHAR(30),
		  ValorDocumentoIdentidadBeneficiario NCHAR(30),
		  ParentezcoId NCHAR(30),
		  Porcentaje NCHAR(30))


 ---------------------------PARA PARSEAR MOVIMIENTOS---------------------------
DECLARE @Movimientos AS XML
SELECT @Movimientos =  @XML.query('Operaciones/FechaOperacion[@Fecha=sql:variable("@Fecha")]//Movimientos')

 ------------------------------
 --Tabla variable
 DECLARE @TablaMovimientos TABLE(Tipo int, CodigoCuenta int, Monto float, Descripcion nchar(30))
 ---
 DECLARE @Tipo TABLE(ID INT IDENTITY,Tipo int)
 DECLARE @CodigoCuenta TABLE(ID INT IDENTITY,codigo int)
 DECLARE @Monto TABLE(ID INT IDENTITY,monto float)
 DECLARE @Descripcion TABLE(ID INT IDENTITY,descripcion nchar(30))


 --Insertar en la tabla 
 INSERT INTO @Tipo (Tipo)
	SELECT 	xmlData.A.value('.', 'int') AS Tipo 
	FROM	@Movimientos.nodes('/Movimientos/@Tipo') xmlData(A)

 INSERT INTO @CodigoCuenta (codigo)
	SELECT 	xmlData.A.value('.', 'int') AS CodigoCuenta 
	FROM	@Movimientos.nodes('/Movimientos/@CodigoCuenta') xmlData(A)

 INSERT INTO @Monto (monto)
	SELECT 	xmlData.A.value('.', 'float') AS Monto 
	FROM	@Movimientos.nodes('/Movimientos/@Monto') xmlData(A)

 INSERT INTO @Descripcion (descripcion)
	SELECT 	xmlData.A.value('.', 'nchar(30)') AS Descripcion 
	FROM	@Movimientos.nodes('/Movimientos/@Descripcion') xmlData(A)

INSERT INTO @TablaMovimientos(Tipo, CodigoCuenta, Monto, Descripcion)
SELECT T.Tipo, CC.codigo, M.monto, D.descripcion
from @Tipo as T
LEFT JOIN @CodigoCuenta as CC on CC.ID = T.ID
LEFT JOIN @Monto as M on M.ID = T.ID
LEFT JOIN @Descripcion as D on D.ID = T.ID


