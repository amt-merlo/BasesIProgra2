CREATE PROCEDURE movPatron5
@ID int,
@numCuenta int,
@patron nchar(30)


AS
BEGIN
	--Variables a usar
	DECLARE @matches int, @descripcion as nchar(60), @lo as int, @hi as int

	--variables del while
	SELECT @hi = COUNT(*) FROM dbo.MovimientoCA WHERE EstadodeCuentaID=@ID AND numCuentaID =@numCuenta
	SET @lo = 1
	
	--tabla variable para movimientos que hagan match con el patrón
	DECLARE @TablaMatches TABLE(Fecha date, Monto float, NuevoSaldo float, Descripcion nchar(30))

	WHILE @lo <= @hi
	begin
	
		SELECT @descripcion = Descripcion FROM dbo.MovimientoCA WHERE ID = @lo
		SET @matches = PATINDEX('%'+'Central'+'%', @descripcion)
		
		if @matches > 0
		begin
		SELECT @matches
			INSERT INTO @TablaMatches(Fecha, Monto, NuevoSaldo, Descripcion)
			SELECT Fecha, Monto, NuevoSaldo, Descripcion FROM dbo.MovimientoCA WHERE ID = @lo
		end

		SET @lo = @lo + 1
		SELECT Fecha, Monto, NuevoSaldo, Descripcion FROM dbo.MovimientoCA WHERE ID = @lo
	end
	
	SELECT Fecha, Monto, NuevoSaldo, Descripcion FROM @TablaMatches
END 
