create database holding

use holding

--Crear tabla Pais
create table Pais
(
    idPais      int primary key ,
    Nombre      varchar(20) not null,
    Capital     varchar(20) not null,
    Habitantes  int not null
)

--Creacion de la tabla Ciudad
create table Ciudad
( 
    idCiudad    varchar(6) not null,
    Nombre      varchar(20) not null,
    Habitantes  int not null,
    Pais        int not null,
    Estado      char(1) not null,
    primary key (idCiudad),
    foreign key(Pais) references Pais(idPais)
)

--crear tabla asesor
create table asesor
(
    IdAsesor    int primary key,
    Nombres     varchar(30) not null,
    Apellidos   varchar(30) not null,
    Telefono    varchar(12) not null,
    Direccion   varchar(50) not null,
    Titulo      varchar(30) not null,
    Estado  char(1) not null
);

create table Area
(
    IdArea int primary key,
    Nombre varchar(20) not null,
    Descripcion varchar(20) null,
    Estado char(1) not null
);

create table Empresa
(
    IdEmpresa int primary key,
    Nombre  varchar(30) unique not null,
    FechaIngreso date not null,
    ObjVenta int check(ObjVenta>5000000 AND ObjVenta<=100000000) not null,
    Sede     varchar(6) not null,
    Estado char(1) not null,
    foreign key (Sede) references Ciudad(idCiudad)
)

Create table Asesoria
(
    IdAsesoria int identity(1,1) primary key,
    asesor  int not null,
    Empresa int not null,
    Area    int not null,
    FechaInicio date not null,
    foreign key (Asesor) references asesor(IdAsesor),
    foreign key (Empresa) references Empresa(IdEmpresa),
    foreign key  (Area) references Area(IdArea)
);

--Creacion de la tabla vendedor
create table vendedor
(
    idVendedor int not null primary key,
    Nombres    varchar(30) not null,
    Apellidos  varchar(30) not null,
    Telefono    varchar(12) not null,
    Direccion  varchar(50) not null,
    VentaMin    real check(VentaMin>=1000000) not null,
    FechaCaptacion  date not null,
    Captador    int not null,
    Empresa     int not null,
    Estado     char(1) not null,
    foreign key (Captador) references vendedor(idVendedor),
    foreign key (Empresa) references Empresa(IdEmpresa)
)

--Creacion de la tabla operacio
Create table Operacion
(
    idOperacion int identity(1,1) primary key,
    Empresa int not null,
    Pais  int   not null,
    FechaInicio date not null,
    FechaFin    date null,
    foreign key (Empresa) references Empresa(IdEmpresa),
    foreign key (Pais) references Pais(idPais)
)

--******************** REGISTRAR DATOS EN TABLA PAIS *********************
	INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (57, 'Colombia', 'Bogota', 40000);
    INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (55, 'Brasil', 'Saopablo', 90000);
    INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (56, 'Chile', 'Santiago', 50000);
    INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (58, 'Venezuela', 'Caracas', 60000);
    INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (593, 'Ecuador', 'Quito', 35000);
    INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (34, 'España', 'Madrid', 70000);
    INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (54, 'Argentina', 'Buenos Aires', 65000);

	INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (86, 'Peru', 'Lima', 35000);
	INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (99, 'Uruguay', 'Montevideo', 85000);
	INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (77, 'Panama', 'C Panama', 60000);
	INSERT INTO PAIS (IDPAIS, NOMBRE, CAPITAL, HABITANTES) VALUES (66, 'Bolivia', 'La Paz', 40000);
--******************** REGISTRAR DATOS EN TABLA CIUDAD *********************
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('C571', 'Medellin', 20000, 57, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('B551', 'RioJaneiro', 45000, 55, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('E5931', 'Quito', 12000, 593, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('C561', 'Santiago', 10000, 56, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('C572', 'Cartagena', 8000, 57, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('E341', 'Madrid', 15000, 34, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('B573', 'Tachira', 20000, 58, 'I');

INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('P861', 'Chimbote', 20000, 86, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('U991', 'Montevideo', 25000, 99, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('P971', 'Lima', 15000, 86, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('C863', 'La Serena', 20000, 56, 'I');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('C927', 'Cali', 10000, 57, 'A');
INSERT INTO CIUDAD (IDCIUDAD, NOMBRE, HABITANTES, PAIS, ESTADO) VALUES ('C720', 'Sucre', 30000, 66, 'A');
--******************** REGISTRAR DATOS EN TABLA EMPRESA *********************
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (2010, 'EPM', '1980/02/10', 80000000, 'C571', 'A');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (3020, 'Une','1965/06/20', 40000000, 'C572', 'I');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO)
VALUES (4030, 'Exito','1970/01/12', 30000000, 'E341', 'A');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (5040, 'Metro', '1965/06/20', 40000000, 'E5931', 'A');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (6050, 'Jumbo', '1950/06/30', 20000000, 'B551', 'A');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (7060, 'Claro', '1975/06/15', 70000000, 'C561', 'A');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (5030, 'Easy', '1985/02/10', 65000000, 'P861', 'A');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (5050, 'BBVBA', '1995/05/15', 54000000, 'P861', 'I');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (6060, 'Movistar', '1995/10/15', 24000000, 'C571', 'I');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (7070, 'Colpatria', '1975/06/15', 5100000, 'E341', 'A');
INSERT INTO EMPRESA (IDEMPRESA, NOMBRE, FECHAINGRESO, OBJVENTA, SEDE, ESTADO) 
VALUES (8080, 'SurtiGas', '1975/06/15', 5100000, 'P971', 'A');

--******************** REGISTRAR DATOS EN TABLA VENDEDOR *********************
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (2222, 'Victor', 'Mora Paez', '3448906', 'C43A#10', 5200000, '1985/12/10', 2222, 4030, 'A');
INSERT INTO VENDEDOR(IDVENDEDOR,NOMBRES,APELLIDOS,TELEFONO,DIRECCION,VENTAMIN,FECHACAPTACION,CAPTADOR,EMPRESA,ESTADO) 
VALUES (4444, 'Mery', 'Brand Per', '2345789', 'C34A#14', 7655000,'1990/01/01', 4444, 2010, 'A');
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (1111, 'Edinson', 'Martinez ', '3412058', 'C82A#10', 9500000, '1980/07/15', 4444, 2010, 'A');
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (3333, 'Lucia', 'Dia Dasa', '5678943', 'C67A#13', 5450000, '1995/12/10', 4444, 2010, 'A');
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (5555, 'Ana', 'Andrades', '234567', 'C52A#14', 3500000, '1995/12/10', 2222, 4030, 'A');
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (6666, 'Mateo', 'Vera Vega', '3457689', 'C52A#14', 5200000, '2010/12/31', 6666, 3020, 'I');

INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (7777, 'Manuel', 'Perea', '6677898', 'C34A#10', 1650000, '1990/12/10', 7777, 5030, 'A');
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (9999, 'Maria', 'Dia', '4545789', 'C54A#14', 2655000, '1990/01/19', 9999, 5030, 'A');
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (2908, 'Rubiela', 'Paternina', '9875780', 'C75B#74', 9655000, '1980/06/16', 2908, 6060, 'A');
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (1027, 'Felipe', 'Martinez', '3412088', 'C75A#45', 1500000, '1980/06/16', 2222, 5050, 'I');
INSERT INTO VENDEDOR (IDVENDEDOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, VENTAMIN, FECHACAPTACION, CAPTADOR, EMPRESA, ESTADO) 
VALUES (3388, 'Marcela', 'Vega', '6457889', 'C 52A#14', 1650000, '2011/12/31', 6666, 3020, 'A');
--******************** REGISTRAR DATOS EN TABLA OPERACION *********************
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (2010, 57, '1990/07/15', NULL);
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (3020, 54, '1970/06/20', NULL);
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (7060, 593,'1975/10/15', '2012/10/15');
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (4030, 57, '1980/01/12', NULL);
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (5040, 55, '1970/06/20', NULL);
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (6050, 57, '1965/06/30', '2010/06/30');
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (2010, 593, '1995/07/15', NULL);

INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (5030, 86, '1986/05/20', '1989/02/15');
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (5030, 86,'1990/08/15', NULL);
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (5030, 57, '1990/07/10','1998/07/17');
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (5030, 57, '2002/07/10', NULL);
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (6060, 99,'1996/10/15', NULL);
INSERT INTO OPERACION (EMPRESA, PAIS, FECHAINICIO, FECHAFIN) 
VALUES (7060, 593,'1985/10/15', '2015/10/15');

--******************** REGISTRAR DATOS EN TABLA ASESOR *********************
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (1111, 'Edinson', 'Martinez', '3412058', 'C82A#10', 'Ingeniero', 'A');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (7030, 'Juan', 'Mu�oz Dia', '4546567', 'C32A#15', 'Contador', 'A');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (7040, 'Elvis', 'Flores Dia', '1703572', 'C82A#10', 'Abogado', 'A');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (7050, 'Claudia', 'Vera Mora', '3526981', 'C52A#13', 'Ingeniero', 'A');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (7060, 'Ana Luz', 'Rios Paez', '3257902', 'C82A#14', 'Publicista', 'I');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (7070, 'Luisa', 'Martinez', '5678931', 'C72A#15', 'Arquitecto', 'A');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (7080, 'Carlos', 'Ruiz Solis', '5422572', 'C92A#16', 'Admin', 'A');

INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (8888, 'Andrea', 'Lopez', '3452058', 'C85A#34', 'Ingeniera', 'I');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (1027, 'Andres', 'Martinez', '5765606', 'C71#70', 'Ingeniero', 'A');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (7052, 'Perla', 'Meneses', '3567821', 'C16#70', 'Docente', 'A');
INSERT INTO ASESOR (IDASESOR, NOMBRES, APELLIDOS, TELEFONO, DIRECCION, TITULO, ESTADO) 
VALUES (9388, 'Felipe', 'Marulanda', '2547851', 'C16#15', 'Abogado', 'I');

--******************** REGISTRAR DATOS EN TABLA AREA *********************
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (10, 'Norte', 'Fria', 'A');
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (20, 'Sur', 'Caliente', 'A');
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (30, 'Oriente', null, 'A');
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (40, 'Este', 'Fria', 'A');
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (50, 'Central', null, 'A');
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (60, 'Oeste', 'Tropical', 'I');
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (70, 'Occidente', null, 'A');

INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (90, 'Noroeste', 'Caliente', 'A');
INSERT INTO AREA (IDAREA, NOMBRE, DESCRIPCION, ESTADO) 
VALUES (100, 'SurOccidente', 'Clima frio', 'I');

--******************** REGISTRAR DATOS EN TABLA ASESORIA *********************
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (1111, 2010, 40, '1992/07/15');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (7030, 3020, 20, '1975/06/20');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (7040, 4030, 60,'1985/01/12');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (7070, 2010, 30, '1995/07/15');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (7080, 5040, 50, '1975/07/20');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (7050, 6050, 40, '1967/08/30');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (1111, 4030, 10, '1995/07/15');

INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (8888, 5030, 90, '1995/07/15');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (1111, 5030, 40, '1996/07/10');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (1111, 2010, 40, '1995/07/15');
INSERT INTO ASESORIA (ASESOR, EMPRESA, AREA, FECHAINICIO) 
VALUES (7030, 3020, 40, '1985/01/12');

--actividad 2 
--2:
select empresa as 'codigo empresa', nombre, COUNT(*) AS Empleados 
from Empresa inner join vendedor on Idempresa=Empresa
group by Empresa, Nombre

--3:Realice consulta que muestre el nombre y la cantidad de asesorias realizada por cada acesor
select max (ventamin) as ventamaximo 
from vendedor

--4:realice consulta me muestre el nombre y la cantidad de asesorias realizadas por cada asesor.
select asesor,Nombres, COUNT(*) as 'asesoria'
from asesor inner join Asesoria on idasesor=asesor
group by asesor,Nombres

--5:Realice consulta que muestre informacion de los primeros 5 paises con el menor numero de habitantes. Moatrar los resultados ordenados ascendentemente por el numero de habitantes.*/
select top 5*
from pais 
order by habitantes asc

--6:realice consulta me muestre por cada pais la suma y el promedio de los habitantes en las ciudades que hacen parte de este parte de este pais*/
select pais.idpais,pais.Nombre, sum(ciudad.habitantes) as 'suma habitantes', avg (ciudad.habitantes) as 'promedio'
from ciudad inner join pais on pais=idpais
group by pais.idpais, pais.Nombre

--7:realice consulta que me muestre la cantidad de asesorias realizada por cada asesor en cada un de las areas. Ordene descendentemente los asesores por su nombre */
select Nombres, asesor, nombre, COUNT (asesor) as total_asesoria
from asesor inner join Asesoria on IdAsesor=asesor  inner join Area on IdArea=Area
group by asesor, Nombres, nombre
order by asesor, Nombres, nombre DESC

--8.Realice sentencia SQL que permita habilitar (Estado = A) el asesor identificado con el código 8888
select * from asesor
where idasesor = 8888
update asesor set estado = 'A' where idasesor=8888

--9:Realice sentencia SQL que permita cambiar la sede de la empresa identificada con código 5050. La nueva sede de la empresa será la ciudad identificada con el código C571
select * from Empresa
update Empresa set sede='C571' where idempresa=5050

--10:Realice sentencia SQL que permita actualizar el código de la empresa BBVA por el código 6090
select*from Empresa
insert into Empresa (idempresa , nombre, fechaingreso, objventa, sede, estado)
select '6090', 'BBVA' , fechaingreso, objventa, sede, estado from Empresa where Nombre='BBVBA'
update Empresa set idempresa='6090' where idempresa='6090'
--11:Realice sentencia SQL que permita eliminar la empresa BBVA
select* from Empresa
delete Empresa where idempresa='6090'
--12. Realice sentencia SQL que permita actualizar la fecha de inicio de la asesoría realizada por el asesor
--1111 a la empresa 5030 en el área 40. La nueva fecha a establecer es 20/10/1998
select * from Asesoria
update Asesoria set FechaInicio = '20/10/1998' where asesor = '1111' and Empresa = '5030' and Area = '40'



--13. Realice sentencias que permita cambia la ciudad sede de la empresa Jumbo, la nueva sede será la ciudad de Madrid
select* from Empresa
update Empresa set sede='P971' where sede='C572'


--14. Realice sentencia SQL que permita obtener la cantidad de operaciones que ha realizado la empresa Easy en Colombia.

select * from Operacion inner join Empresa on Empresa = idEmpresa where nombre = 'Easy' and pais = '57'

--15. Realice sentencia SQL que permita cambiar el código del asesor identificado con código 8888 por el código 9999

insert into asesor(IdAsesor, Nombres, Apellidos, Telefono, Direccion, Titulo, Estado)
select 9999, Nombres, Apellidos, Telefono, Direccion, Titulo, Estado from asesor where IdAsesor = 8888;

update Asesoria set asesor = 9999 where asesor = (select IdAsesor from asesor where IdAsesor = 8888);

delete from asesor where IdAsesor = 8888;
select*from asesor

--16. Realice sentencia SQL que permita eliminar las asesorías realizadas por el asesor 1111 a la empresa 5030

delete from Asesoria where Empresa = '5030'

--17. Realice sentencia SQL que permita cambiar el captador de vendedor 9999, es decir el nuevo captador
--será el vendedor identificado con el código 2222

update vendedor set captador = '2222' where idVendedor = '9999'

--18. Que solución ofrecería usted, si por alguna razón hubiera la necesidad de reducir en 10000 el número
--de habitante de la ciudad de Medellín, lo cual también implicaría reducir en 10000 el número de
--habitantes del país a la cual pertenece la ciudad.

select pais.nombre, pais.habitantes -10000 as Menos ,Ciudad.habitantes -10000 as Menos
from Pais inner join Ciudad on idPais = Pais

--19. Realice sentencia SQL que permita obtener la sumatoria de las venta mínima (VentaMin) de losempleados de EP

Select sum(ventaMin) as Suma_Epm from vendedor inner join Empresa on idEmpresa = Empresa where Empresa.Nombre = 'EPM'
group by Empresa.Nombre

---20. Realice sentencia SQL que permita finalizar las operaciones que realiza la empresa 5030 en el país
--cuyo código es 86. La fecha de finalización de operación de la empresa es “15/07/1992”

update Operacion set FechaFin = '15/07/1992' where Empresa = '5030' and Pais = '86'

--21. Realice sentencia SQL que permita cambiar el vendedor 9999 a la empresa Jumbo. Para realizar esta
--operación, usted debe crear sentencia que consulte el código de la empresa Jumbo

update Empresa set = (select idCiudad from Empresa)

--22. Realice sentencia SQL que permita eliminar el vendedor 9999

delete from vendedor where idvendedor = '9999'

--23. Realice sentencia SQL que permita finalizar hoy las operaciones que está realizando la empresa
--identificada con código 4030 en el país identificado con código 57. Para realizar esta operación, usted
--debe obtener la fecha del sistema, la cual será la fecha de Finalización de operación.

update Operacion set FechaFin = getdate() where Empresa = '4030' and Pais = '57' and FechaFin is null

select * from Operacion order by FechaFin desc

--24. Realice sentencia SQL que permita eliminar las operaciones realizadas (finalizadas) por la empresa
--5030 en Colombia. Para realizar esta operación, usted debe crear sentencia que consulte si la
--empresa 5030 realizo operación en Colombia y devolver el código de Colombia.

DELETE FROM Operacion WHERE Pais = (SELECT idPais FROM Pais WHERE Nombre = 'Colombia')
AND Empresa = 5030
AND FechaFin is not null;

--25. Realice sentencia SQL que permita finalizar hoy todas las operaciones que se iniciaron en 1990 y que
--aún no se han finalizado. Para realizar esta operación, usted debe obtener la fecha del sistema, la cual
--será la fecha de Finalización de operación.

UPDATE Operacion SET FechaFin = GETDATE()
WHERE FechaInicio BETWEEN '1990-01-01' AND '1990-12-31' AND FechaFin IS NULL;

select * from Operacion

--26. Realice sentencia SQL que permita activar (Estado = A) todas las empresas que estén inactivas y que
--aun estén realizando operación en algún país.

update Empresa set Estado = 'A' where Estado = 'I' and IdEmpresa in (select distinct Empresa from  operacion)


--27. Realice sentencia SQL que permita desactivar (Estado = I) todas las ciudades que no sean sede de
--alguna empresa.

update Ciudad set Estado = 'I' where IdCiudad not in (select sede from Empresa) and Estado = 'A'


--28. Realice sentencia SQL que permita eliminar los asesores que no han realizado asesoría.


delete from asesor where IdAsesor not in (select distinct asesor from Asesoria)
--29. Realice sentencia SQL que permita cambiar el código de la empresa 5030 por el código 4070.

insert into Empresa (IdEmpresa, Nombre, FechaIngreso, ObjVenta, Sede, Estado)
select 4070, Nombre+'1', FechaIngreso, ObjVenta, Sede, Estado from Empresa where idempresa = 5030;

update Vendedor set Empresa = 4070 where Empresa = (select IdEmpresa from Empresa where idempresa = 5030);
update Operacion set Empresa = 4070 where Empresa = (select IdEmpresa from Empresa where idempresa = 5030);
update Asesoria set Empresa = 4070 where Empresa = (select IdEmpresa from Empresa where idempresa = 5030);

delete from Empresa where idempresa = 5030;
update Empresa set Nombre = REPLACE(nombre, '1', '') where idempresa = 4070;

select * from Empresa where idempresa = 4070;


--30. Que solución ofrecería usted si por alguna orden de judicial hubiera la necesidad de eliminar el Área
--identificada con el código 90. Tenga presente que la información de las asesorías realizadas por el
--asesor es de suma importancia para el holding.

insert into area (idarea, nombre, descripcion, estado)
values (0, 'NoExite', null,  'N');
update Asesoria set Area = 0 where Area = 90;

delete from Area where IdArea = 90;

--31. Realice sentencia SQL que permita registrar el vendedor Andrés Martínez identificado con código
--7020, teléfono 3405030, ubicado en la dirección C 75B#74 y VentaMin de 6000000; captado en la
--fecha de hoy por el vendedor identificado con código 2908. Por política del grupo holding, un vendedor
--solo podrá captar vendedores para la misma empresa para la que él trabaja; razón por la cual usted
--debe crear sentencia SQL que consulte el código de la empresa para la que trabaja el captador.

insert into vendedor (idvendedor, nombres, apellidos, telefono, direccion, ventamin, fechacaptacion, captador, empresa, estado)
values (7020, 'Andrés', 'Martínez', '3405030', 'C 75B#74', 6000000, GETDATE(), 2908, (select empresa from vendedor where idvendedor = 2908), 'A')


