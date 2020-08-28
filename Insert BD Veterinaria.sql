use Veterinaria;

-- Inserts de Base de datos
insert into Producto values ("1", "A", "Medicamento", "15", "5");
insert into Proveedor values ("1", "Juan", "Ciudad", "123450");
insert into Inventario values ("1", "100", "1");

select * from  Producto;
select * from  Proveedor;
select * from Inventario;

select * from CompraEncabezado;
select * from CompraDetalle;