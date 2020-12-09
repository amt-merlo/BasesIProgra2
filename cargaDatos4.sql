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


--Intento #5--
DECLARE @FECHASPROCESO TABLE(ID INT IDENTITY PRIMARY KEY, Fecha varchar(30))
--Cargar las fechas en una tabla
DECLARE @Fechas1 AS XML
SELECT @Fechas1 =  @XML.query('Operaciones//FechaOperacion')


INSERT INTO @FECHASPROCESO (Fecha)
		SELECT 	xmlData.A.value('.', 'nchar(30)') AS Tipo 
		FROM	@Fechas1.nodes('/FechaOperacion/@Fecha') xmlData(A)




	--Para parsear el fecha=x
	DECLARE @Fecha nchar(30)
	SET @Fecha = '2020-07-111'


---------------------------PARA PARSEAR PERSONAS---------------------------
	DECLARE @Personas AS XML
	SELECT @Personas =  @XML.query('Operaciones/FechaOperacion[@Fecha=sql:variable("@Fecha")]//Persona')
	
	 --Tabla variable
	 DECLARE @TablaPersonas TABLE(TipoDocuIdentidad int, 
								  Nombre nchar(30), 
								  ValorDocumentoIdentidad nchar(30), 
								  FechaNacimiento date, 
								  Email nchar(30), 
								  Telefono1 int, 
								  Telefono2 int)
	
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
	
	INSERT INTO dbo.Persona(TipoDocID, 
						    Nombre, 
							ValorDocIdentidad, 
							FechaNacimiento, 
							email, 
							Telefono1, 
							Telefono2)

					SELECT TipoDocuIdentidad, 
						   Nombre, 
						   ValorDocumentoIdentidad, 
						   FechaNacimiento, 
						   Email, 
						   Telefono1, 
						   Telefono2 FROM @TablaPersonas



	---------------------------PARA PARSEAR CUENTAS---------------------------
	DECLARE @Cuentas AS XML
	SELECT @Cuentas =  @XML.query('Operaciones/FechaOperacion[@Fecha=sql:variable("@Fecha")]//Cuenta')

	--Crear tabla para todos los datos
	DROP TABLE IF EXISTS #TablaCuentas
	CREATE TABLE #TablaCuentas (TipoCuentaID int, NumeroCuenta int, ValorDocID int, FechaConstitucion date, Saldo float)

	--Tabla variable para ingresar los datos individuales
	DROP TABLE IF EXISTS #ValorDocID, #TipoCuentaID, #NumeroCuenta, #FechaConstitucion, #Saldo
	CREATE TABLE #ValorDocID (ID INT IDENTITY, valorDocID int)
	CREATE TABLE #TipoCuentaID (ID INT IDENTITY, TipoCuentaID int)
	CREATE TABLE #NumeroCuenta (ID INT IDENTITY, NumCuenta int)
	CREATE TABLE #FechaConstitucion (ID INT IDENTITY, FechaConstitucion date)
	CREATE TABLE #Saldo (ID INT IDENTITY, Saldo float)

	

	ALTER TABLE #TablaCuentas 
	ADD CONSTRAINT modificar_saldo2
	DEFAULT 0.0 FOR Saldo

	INSERT INTO #ValorDocID (valorDocID)
		SELECT 	xmlData.A.value('.', 'int') AS Descripcion 
		FROM	@Cuentas.nodes('/Cuenta/@ValorDocumentoIdentidadDelCliente') xmlData(A)

	INSERT INTO #TipoCuentaID (TipoCuentaID)
		SELECT 	xmlData.A.value('.', 'int') AS Descripcion 
		FROM	@Cuentas.nodes('/Cuenta/@TipoCuentaId') xmlData(A)

	INSERT INTO #NumeroCuenta (NumCuenta)
		SELECT 	xmlData.A.value('.', 'int') AS Descripcion 
		FROM	@Cuentas.nodes('/Cuenta/@NumeroCuenta') xmlData(A)

	INSERT INTO #TablaCuentas(TipoCuentaID, NumeroCuenta, ValorDocID)
	SELECT T.TipoCuentaID, N.NumCuenta, V.ValorDocID
	FROM #TipoCuentaID AS T
	LEFT JOIN #NumeroCuenta AS N ON N.ID = T.ID
	LEFT JOIN #ValorDocID AS V ON V.ID = T.ID

	 UPDATE #TablaCuentas
	 SET FechaConstitucion = @Fecha
	

	INSERT INTO dbo.CuentadeAhorro(TipoCuentaAhorroID, 
								   NumerodeCuenta, 
								   ValorDocIdentidadCliente, 
								   FechaConstitucion,
								   Saldo)

							SELECT TipoCuentaId, 
								   NumeroCuenta, 
								   ValorDocID, 
								   FechaConstitucion, 
								   Saldo FROM #TablaCuentas

	SELECT * FROM #TablaCuentas
	---------------------------PARA PARSEAR Beneficiarios---------------------------
	DECLARE @Beneficiarios AS XML
	SELECT @Beneficiarios =  @XML.query('Operaciones/FechaOperacion[@Fecha=sql:variable("@Fecha")]//Beneficiario')

	--Tablas variable 
	DROP TABLE IF EXISTS #TablaBeneficiarios
	CREATE TABLE #TablaBeneficiarios(NumeroCuenta int, ValorDocID int, ParentescoID int, Porcentaje int)
	DECLARE @NumeroCuenta TABLE (ID INT IDENTITY, numCuenta int)
	DECLARE @ValorDocID TABLE (ID INT IDENTITY, valorDocID int)
	DECLARE @ParentescoID TABLE (ID INT IDENTITY, parentescoID int)
	DECLARE @Porcentaje TABLE (ID INT IDENTITY, porcentaje int)
	
	INSERT INTO @NumeroCuenta (numCuenta)
		SELECT 	xmlData.A.value('.', 'int') AS Tipo 
		FROM	@Beneficiarios.nodes('/Beneficiario/@NumeroCuenta') xmlData(A)

	INSERT INTO @ValorDocID (valorDocID)
		SELECT 	xmlData.A.value('.', 'int') AS Tipo 
		FROM	@Beneficiarios.nodes('/Beneficiario/@ValorDocumentoIdentidadBeneficiario') xmlData(A)

	INSERT INTO @ParentescoID (parentescoID)
		SELECT 	xmlData.A.value('.', 'int') AS Tipo 
		FROM	@Beneficiarios.nodes('/Beneficiario/@ParentezcoId') xmlData(A)

	INSERT INTO @Porcentaje (porcentaje)
		SELECT 	xmlData.A.value('.', 'int') AS Tipo 
		FROM	@Beneficiarios.nodes('/Beneficiario/@Porcentaje') xmlData(A)

	INSERT INTO #TablaBeneficiarios (NumeroCuenta, ValorDocID, ParentescoID, Porcentaje)
	SELECT N.numCuenta, V.valorDocID, P.parentescoID, P2.Porcentaje
	From @NumeroCuenta AS N
	LEFT JOIN @ValorDocID AS V ON V.ID = N.ID
	LEFT JOIN @ParentescoID AS P ON P.ID = N.ID
	LEFT JOIN @Porcentaje AS P2 ON P2.ID = N.ID

	INSERT INTO dbo.Beneficiario(CuentadeAhorroID, PersonaID, ParentescoID, Porcentaje)
	SELECT NumeroCuenta, ValorDocID, ParentescoID, Porcentaje FROM #TablaBeneficiarios


	 ---------------------------PARA PARSEAR MOVIMIENTOS---------------------------
	DECLARE @Movimientos AS XML
	SELECT @Movimientos =  @XML.query('Operaciones/FechaOperacion[@Fecha=sql:variable("@Fecha")]//Movimientos')
	
	 ------------------------------
	 --Tabla variable
	 DROP TABLE IF EXISTS #TablaMovimientos
	 CREATE TABLE #TablaMovimientos(ID INT IDENTITY, Tipo int, CodigoCuenta int, Monto float, Descripcion nchar(30), Fecha date, Visible bit, EstadodeCuenta int)
	 
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

		
			

	INSERT INTO #TablaMovimientos(Tipo, CodigoCuenta, Monto, Descripcion)
	SELECT T.Tipo, CC.codigo, M.monto, D.descripcion
	from @Tipo as T
	LEFT JOIN @CodigoCuenta as CC on CC.ID = T.ID
	LEFT JOIN @Monto as M on M.ID = T.ID
	LEFT JOIN @Descripcion as D on D.ID = T.ID
	
	--Recorremos la tabla de movimientos creada para asignar un estado de cuenta
	Declare @lo int, @hi int
	SELECT @lo = 1
	SELECT @hi = COUNT(ID) from #TablaMovimientos
	
	WHILE @lo <= @hi
	BEGIN
		--SACAMOS EL NÚMERO DE CUENTA ASOCIADO AL MOVIMIENTO
		DECLARE @CodigoCuentaActual as int
		SELECT @CodigoCuentaActual = CodigoCuenta FROM #TablaMovimientos WHERE ID = @lo
		
		--ver si la fecha del movimiento coincide con un estado de cuenta
		DECLARE @cantEstadosCuenta as int
		SELECT @cantEstadosCuenta = COUNT (ID)
		FROM dbo.EstadodeCuenta
		WHERE @Fecha BETWEEN FechaInicio and FechaFin AND CuentadeAhorroID = @CodigoCuentaActual

		IF @cantEstadosCuenta > 0
		BEGIN
			--TOMAMOS EL ID DEL ESTADO DE CUENTA ENCONTRADO
			DECLARE @EstadodeCuentaID as int
			Select @EstadodeCuentaID = ID FROM dbo.EstadodeCuenta 
			WHERE @Fecha BETWEEN FechaInicio AND FechaFin --verificamos que la fecha del movimiento esté dentro del rango del movimiento

			--buscamos el nuevo saldo
			DECLARE @nuevoSaldo as float
			DECLARE @SaldoFinalEC as float
			DECLARE @MontoMovimiento as float
			DECLARE @TipoMovID as int

			SELECT @SaldoFinalEC = SaldoFinal FROM dbo.EstadodeCuenta 
			WHERE ID = @EstadodeCuentaID

			SELECT @MontoMovimiento = Monto FROM #TablaMovimientos WHERE ID = @lo
			SELECT @TipoMovID = Tipo FROM #TablaMovimientos WHERE ID = @lo

			--Dependiendo del tipo de movimiento, establecemos el nuevo saldo
			IF @TipoMovID = 1 OR @TipoMovID = 2 OR @TipoMovID = 3
				SET @nuevoSaldo = @SaldoFinalEC - @MontoMovimiento
			ELSE 
				SET @nuevoSaldo = @SaldoFinalEC + @MontoMovimiento

			--CAMBIAMOS LOS SALDOS DEL ESTADO DE CUENTA CON UN UPDATE
			UPDATE dbo.EstadodeCuenta
			SET SaldoInicial = SaldoFinal
			WHERE ID = @EstadodeCuentaID

			UPDATE dbo.EstadodeCuenta
			SET SaldoFinal = @nuevoSaldo
			WHERE ID = @EstadodeCuentaID

			--INGRESAMOS EL MOVIMIENTO A LOS REGISTROS
			DECLARE @TipoFinal as int
			DECLARE @MontoFinal as float
			DECLARE @DescripcionFinal as nchar(30)

			SELECT @TipoFinal = Tipo FROM #TablaMovimientos WHERE ID = @lo
			SELECT @MontoFinal = Monto FROM #TablaMovimientos WHERE ID = @lo
			SELECT @DescripcionFinal = Descripcion FROM #TablaMovimientos WHERE ID = @lo

			INSERT INTO dbo.MovimientoCA(EstadodeCuentaID, TipoMovCAID, Fecha, Monto, NuevoSaldo, Descripcion, Visible)
			SELECT @EstadodeCuentaID, @TipoFinal, @Fecha, @MontoFinal, @nuevoSaldo, @DescripcionFinal, 1
			SET @lo = @lo+1
		END
	
	END

