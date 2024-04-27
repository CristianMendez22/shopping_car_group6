create database if not exists empresa;

use empresa;

create table if not exists producto (
    codigo int auto_increment primary key,
    nombre varchar(100),
    categoria varchar(50),
    precio_Compra int(10),
    precio_Venta int(10),
    stock int,
    fecha_Registro date
);

insert into producto (nombre, categoria, precio_Compra, precio_Venta, stock, fecha_Registro) values
('Champu', 'Aseo Personal', 18000, 32000, 50, '2024-04-21'),
('Papel higienico', 'Aseo Hogar',12000, 22000, 100, '2024-04-23'),
('Pasta de dientes', 'Aseo Personal', 8000, 15000, 80, '2024-04-24'),
('Detergente liquido', 'Aseo Hogar', 25000, 38000, 40, '2024-04-21'),
('Arroz', 'Granos', 4000, 7000, 120, '2024-04-24'),
('Desodorante', 'Aseo Personal', 12000, 19200, 60, '2024-04-23'),
('Limpiavidrios', 'Aseo Hogar', 9500, 16200, 35, '2024-04-24'),
('Frijoles', 'Granos', 4500, 8000, 90, '2024-04-23'),
('Jabon de baño', 'Aseo Personal', 3000, 5000, 75, '2024-04-22'),
('Detergente en polvo', 'Aseo Hogar', 32000, 45200, 45, '2024-04-24');


-- 1
select sum(precio_Compra) as total_precio_compra
from producto;

-- 2
select sum(precio_Venta) as suma_total_precios_venta
from producto;

-- 3
select codigo, nombre , categoria
from producto
where categoria = 'Aseo Personal';

-- 4
select codigo, nombre, precio_Compra
from producto
where precio_Compra = (
	select min(precio_Compra)
    from producto
);

-- 5
select codigo, nombre, precio_Venta
from producto
where precio_Venta = (
	select min(precio_Venta)
    from producto
);



-- 6
select count(nombre) as total_productos
from producto;

-- 7
select avg (stock) as media_stock
from producto;

-- 8
select codigo, nombre, categoria
from producto
order by nombre asc;

-- 9
select codigo, nombre, categoria
from producto
where fecha_Registro = '2024-04-24';

-- 10
select categoria, sum(stock) as total_existenciasop
from producto
group by categoria;

-- 11
select count(*) as cantidad_productos
from producto
group by fecha_Registro;
