-- Drop database Veterinaria;
create database Veterinaria;
use Veterinaria;

create table Producto (
	ID_Producto int primary key,
    Nombre_producto varchar(35),
    Tipo_producto varchar(35),
    Precio_producto float,
    Unidades_producto int
)engine = InnoDB;

create table Proveedor(
	ID_Proveedor int primary key,
    Nombre_proveedor varchar(35),
    Direccion varchar(80),
    Telefono int
)engine = InnoDB;

create table Inventario(
	ID_Inventario int primary key,
    Stock int,
    ID_Producto int,
    
    foreign key (ID_Producto) references Producto(ID_Producto)
)engine= InnoDB;

create table CompraEncabezado(
	ID_CompraE int primary key,
    Fecha_Compra date,
    TotalCompra float,
    ID_Proveedor int,
    
    foreign key	(ID_Proveedor) references Proveedor(ID_Proveedor)
)engine=InnoDB;

create table CompraDetalle(
	ID_CompraE int, -- foranea
    Orden_Compra int,
    
    primary key (ID_CompraE, Orden_Compra),
    
    Cantidad_Compra int,
    Compra_Costo float,
    ID_Inventario int, -- foranea
    
    foreign key (ID_CompraE) references CompraEncabezado(ID_CompraE),
    foreign key (ID_Inventario) references Inventario(ID_Inventario)
)engine=InnoDB;

create table CuentasCorrientes(
	ID_Cuenta int primary key,
    Tipo_Cuenta varchar(35),
    Monto float,
    Cuota float,
    ID_CompraE int,
    
    foreign key(ID_CompraE) references CompraEncabezado(ID_CompraE)
)engine=InnoDB;

create table Informes(
	ID_Informe int primary key,
    Impuesto float,
    Descripcion varchar(80),
    ID_CompraE int, -- foranea
    ID_Cuenta int, -- foranea
    
    foreign key (ID_CompraE) references CompraEncabezado (ID_CompraE),
    foreign key (ID_Cuenta) references CuentasCorrientes(ID_Cuenta)
)engine=InnoDB;

create table Seguridad(
	Usuario varchar(60),
    Password_usuario varchar(60)
)engine=InnoDB;
