create database Biblioteca

use Biblioteca

Create table Libro(
IdLibro int identity(1,1) primary key not null,
EstadoLibro bit default 1 not null
)

create table Autor(
IdAutor int identity(1,1) primary key not null,
NombreAutor nvarchar(20) not null
)

create table DetalleLibro(
IdLibro int foreign key references Libro(IdLibro),
IdAutor int foreign key references Autor(IdAutor),
NEdicion int not null,
Titulo nvarchar(30) not null,
AñoEdicion date not null,
primary key (IdLibro,IdAutor)
)

create table Bibliotecario(
IdBibliotecario int primary key not null,
EstadoBibliotecario bit default 1 not null
)

create table DetalleBibliotecario(
IdBibliotecario int foreign key references Bibliotecario(IdBibliotecario) not null,
NombreBibliotecario nvarchar(20) not null,
Direccion nvarchar(50) not null,
Telefono int not null,
primary key(IdBibliotecario)
)

create table Lector(
IdLector int identity(1,1) primary key not null,
EstadoLector bit default 1 not null
)

create table DetalleLector(
IdLector int foreign key references Lector(IdLector) not null,
Nombre nvarchar(15) not null,
Apellido nvarchar(15),
Direccion nvarchar(50) not null,
Telefono int not null,
primary key(IdLector)
)

create table PrestamoPre(
IdFichaPrestamoPre int identity(1,1) primary key not null,
EstadoPrestamoPre bit default 1 not null
)

create table DetallePrestamoPre(
IdFichaPrestamoPre int foreign key references PrestamoPre(IdFichaPrestamoPre),
FechaPrestamoPre date not null,
Hora Time not null,
IdBibliotecario int foreign key references Bibliotecario(IdBibliotecario) not null,
IdLibro int foreign key references Libro(IdLibro) not null,
primary key(IdFichaPrestamoPre,IdBibliotecario,IdLibro)
)

create table PrestamoDom(
IdFichaPrestamoDom int identity(1,1) primary key not null,
EstadoPrestamoDom bit default 1 not null
)

create table DetallePrestamoDom(
IdFichaPrestamoDom int foreign key references PrestamoDom(IdFichaPrestamoDom),
FechaDevolucion date not null,
IdLector int foreign key references Lector(IdLector),
IdLibro int foreign key references Libro(IdLibro),
primary key(IdFichaPrestamoDom,IdLector,IdLibro)
)