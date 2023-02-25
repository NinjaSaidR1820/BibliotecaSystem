Create database Biblioteca

Go
Create login AdminBiblioteca with password = 'Biblioteca123'

Go
Use Biblioteca
Go
sp_adduser AdminBiblioteca, AdminBiblioteca


Create table Cliente(id int)


Revoke select on Cliente to adminGranHotel


Grant execute on Validar_Acceso to AdminBiblioteca

Create table Usuario (IdUsuario int primary key identity(1,1),
usuario varchar(80),
contraseña varchar(80),
rol varchar(80),
estado varchar(80))

--- Procedimiento almacenado para insertar el usuario

Create procedure [dbo].[Insertar_Usuario]
 @usuario varchar(50), @contraseña varchar(50), @rol varchar(50)
 as
 insert into Usuario(usuario, contraseña, rol, Estado) values
 (@usuario, ENCRYPTBYPASSPHRASE( @contraseña,  @contraseña), @rol, 'Habilitado')

 insert into Usuario(usuario, contraseña, rol, estado)
 values ('Biblioteca', '123', 'Administrador')

 Execute dbo.Insertar_Usuario 'Biblioteca', 'Biblioteca2023', 'Administrador'



 Select * from Usuario



 update Usuario set estado = 'Habilitado' where IdUsuario = 1

 -------------------------------------------------
create procedure [dbo].[Validar_Acceso]
@usuario varchar(50),
@contraseña varchar(50)
as
if exists (Select usuario from Usuario
            where  cast (DECRYPTBYPASSPHRASE(@contraseña, contraseña) as Varchar(100)) = @contraseña
			 and usuario = @Usuario and Estado = 'Habilitado' )
			 select 'Acceso Exitoso' as Resultado, c.primernombre +' '+ c.primerapellido as Colaborador, rol
			 from Usuario u
			 inner join Colaborador c
			 on c.IdColaborador = u.IdColaborador
			  where  cast (DECRYPTBYPASSPHRASE(@contraseña, u.contraseña) as Varchar(100)) = @contraseña
			 and u.usuario = @Usuario and u.Estado = 'Habilitado'

			 else
			 Select 'Acceso Denegado' as Resultado


			 Execute dbo.Validar_Acceso 'Biblioteca', 'Biblioteca2023'

			 Select @@SERVERNAME

Create table Colaborador
(IdColaborador int primary key identity(1,1),
 primernombre varchar(60),
 primerapellido varchar(60))

 insert into Colaborador values ('Ana', 'Mendoza')
 Select * from Colaborador
 Alter table Usuario
 add IdColaborador int

 Select * from Usuario
 update Usuario set IdColaborador = 1


-------------------------------------------------

--Procedimientos para agregar, actualizar y eliminar.

--Autor:
--Agregar
Alter procedure [AutorA]
@NombreAutor nvarchar(30)
AS
BEGIN
Insert into Autor(NombreAutor)
values (@NombreAutor)
END

Execute AutorA 'Miguel de Cervantes'
Execute AutorA 'Gabriel García Márquez'
Execute AutorA 'Franz Kafka'
Execute AutorA 'Pablo Neruda'
Execute AutorA 'Antoine de Saint-Exupery'


Select * From Autor

--Actualizar
--DECLARE @Error int
--BEGIN TRAN
--  UPDATE Autor SET NombreAutor = 'Miguel de Cervantes Saavedra '
--	WHERE NombreAutor = 'Miguel de Cervantes fdsgsdf'
--		SET @Error=@@ERROR
--			PRINT @Error
--IF (@Error<>0) GOTO TratarError
--	UPDATE Autor SET NombreAutor = 'Miguel de Cervantes Saavedra'
--	WHERE NombreAutor = 'Miguel de Cervantes fdsgsdf'
--	SET @Error=@@ERROR
--IF (@Error<>0) GOTO TratarError
--COMMIT TRAN 
--TratarError:
--  If (@@Error<>0) 
--    BEGIN
--      PRINT 'Ha ecorrido un error.'
--     ROLLBACK TRAN
--   END 

--Eliminar
--DELETE FROM Autor
--where IdAutor = 1


--Libro:
--Agregar
Create procedure [ALibro]
@EstadoLibro bit
AS
BEGIN
Insert into Libro(EstadoLibro)
values (@EstadoLibro)
END

Execute ALibro 2

Select * From Libro

Alter procedure [ADetalleLibro]
@IdLibro int, @IdAutor int, @NEdicion int, @Titulo nvarchar(30), @Editorial nvarchar(30), @AñoEdicion Date
AS
BEGIN
Insert into DetalleLibro(IdLibro, IdAutor, NEdicion, Titulo, Editorial, AñoEdicion)
values (@IdLibro, @IdAutor, @NEdicion, @Titulo, @Editorial, @AñoEdicion)
END

Execute ADetalleLibro 2, 2,'2', 'Cien años de soledad', 'Editorial Sudamericana', '1967-03-05'

Select * From DetalleLibro

--Actualizar
--DECLARE @Error int
--BEGIN TRAN
-- --UPDATE DetalleLibro SET  = ''
--	--WHERE  = ''
--		SET @Error=@@ERROR
--			PRINT @Error
--IF (@Error<>0) GOTO TratarError
--	 --UPDATE DetalleLibro SET  = ''
--	--WHERE  = ''
--	SET @Error=@@ERROR
--IF (@Error<>0) GOTO TratarError
--COMMIT TRAN 
--TratarError:
--  If (@@Error<>0) 
--    BEGIN
--      PRINT 'Ha ecorrido un error.'
--     ROLLBACK TRAN
--   END 

--Eliminar
DELETE FROM DetalleLibro
where IdLibro = 1


--Bibliotecario:
--Agregar
Alter procedure [ABibliotecario]
@IdBibliotecario int, @EstadoBibliotecario bit
AS
BEGIN
Insert into Bibliotecario(IdBibliotecario, EstadoBibliotecario)
values (@IdBibliotecario, @EstadoBibliotecario)
END

Execute ABibliotecario 1, 1

Select * From Bibliotecario

Create procedure [ADetalleBibliotecario]
@IdBibliotecario int, @NombreBibliotecario nvarchar(20), @Direccion nvarchar(50), @Telefono int
AS
BEGIN
Insert into DetalleBibliotecario(IdBibliotecario, NombreBibliotecario, Direccion, Telefono)
values (@IdBibliotecario, @NombreBibliotecario, @Direccion, @Telefono )
END

Execute ADetalleBibliotecario 1,'Jose Hernandez', 'Barrio Loma Linda', '85758662'

Select * From DetalleBibliotecario

--Actualizar
--DECLARE @Error int
--BEGIN TRAN
-- --UPDATE DetalleBibliotecario SET  =  ''
--	--WHERE  = ''
--		SET @Error=@@ERROR
--			PRINT @Error
--IF (@Error<>0) GOTO TratarError
--	 --UPDATE DetalleBibliotecario SET  = ''
--	--WHERE  = ''
--	SET @Error=@@ERROR
--IF (@Error<>0) GOTO TratarError
--COMMIT TRAN 
--TratarError:
--  If (@@Error<>0) 
--    BEGIN
--      PRINT 'Ha ecorrido un error.'
--     ROLLBACK TRAN
--   END 

--Eliminar
DELETE FROM DetalleBibliotecario
where IdBibliotecario = 1


--Lector:
--Agregar
Alter procedure [ALector]
@EstadoLector bit
AS
BEGIN
Insert into Lector(EstadoLector)
values (@EstadoLector)
END

Execute ALector 1

Select * From Lector

Create procedure [ADetalleLector]
@IdLector int, @Nombre nvarchar(15), @Apellido nvarchar(15), @Direccion nvarchar(50), @Telefono int
AS
BEGIN
Insert into DetalleLector(IdLector, Nombre, Apellido, Direccion, Telefono)
values (@IdLector, @Nombre, @Apellido, @Direccion, @Telefono)
END

Execute ADetalleLector 1,'Ana Maria', 'Lopez', 'Barrio Simon Bolivar', '85656559'

Select * From DetalleLector

--Actualizar
--DECLARE @Error int
--BEGIN TRAN
-- --UPDATE DetalleLector SET  =  ''
--	--WHERE  = ''
--		SET @Error=@@ERROR
--			PRINT @Error
--IF (@Error<>0) GOTO TratarError
--	 --UPDATE DetalleLector SET  = ''
--	--WHERE  = ''
--	SET @Error=@@ERROR
--IF (@Error<>0) GOTO TratarError
--COMMIT TRAN 
--TratarError:
--  If (@@Error<>0) 
--    BEGIN
--      PRINT 'Ha ecorrido un error.'
--     ROLLBACK TRAN
--   END 

--Eliminar
DELETE FROM DetalleLector
where IdLector = 1


--Consultas

--Lista de libros en sala por fecha.

--Lista de libros a domicilio en rango de fecha.

--Lista de libros que aún no han sido entregados y están fuera del plazo estipulado.


--Vistas
Alter view LibroAutor
AS
Select DetalleLibro.IdLibro, DetalleLibro.Titulo, Autor.NombreAutor, DetalleLibro.NEdicion
From DetalleLibro, Autor
Where DetalleLibro.IdAutor = Autor.IdAutor

Select * From LibroAutor

Create view
