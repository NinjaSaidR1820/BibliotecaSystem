
Create database Biblioteca
go
Create login AdminBiblioteca with password = 'Biblioteca123'
go
Use Biblioteca
go
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

 ----------------------------------------
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