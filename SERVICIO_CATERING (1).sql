drop database if exists catering;
create database catering; 

use catering; 

create table persona(
	dni int, 
    primer_nombre varchar(20),
    segundo_nombre varchar(20),
    apellido_paterno varchar(20),
    apellido_materno varchar(20),
    correo varchar(50),
    telefono integer,
    primary key (dni)
);

create table cliente (
	dni int,
    departamento varchar(20),
    ciudad varchar(20),
    notas_adicionales varchar(100),
    primary key (dni)	
);

create table empleado (
	dni int, 
    fecha_contratacion date,
	puesto varchar(20),
    direccion varchar(50),
    salario int, 
    id_evento int,
    primary key (dni)
);

create table horario_trabajo(
	id_horario int, 
    horario_inicio time, 
    horario_fin time,
    fecha date, 
    dni_empleado int,
    primary key(id_horario)
);

create table feedback_cliente (
	id_feedback int ,
    comentario varchar(100),
    calificacion char(1),
    fecha_feedback date,
    dni_cliente int,
    primary key (id_feedback)
);

create table factura(
	id_factura int, 
    fecha_emision datetime, 
    monto_total int,
    id_pedido int,
    dni_cliente int,
    primary key(id_factura)
);
create table pedido (
	id_pedido int, 
    fecha_pedido datetime,
    precio_total int, 
    cantidad_personas int,
    id_evento int,
    primary key (id_pedido)
);

create table evento(
	id_evento int, 
    nombre_evento varchar(80),
    fecha_evento date,
	hora_inicio time,
    hora_fin time, 
    tipo_evento varchar(40),
    ubicacion_evento varchar(50),
    dni_cliente int,
    metodo_pago varchar(20),
    id_menu int,
    primary key (id_evento)
);
alter table evento add column id_menu int;
create table tipo_contratacion(
	id_tipo_contratacion int, 
    cantidad int,
    fecha_reserva date, 
    tipo_servicio varchar(20),
    id_evento int,
    primary key(id_tipo_contratacion)
);

create table menu(
	id_menu int, 
    precio_persona int, 
    nombre_menu varchar(30),
    id_evento int,
    primary key (id_menu)
);
create table ingredientes(
	id_ingrediente int, 
    precio_unidad decimal(5,2), 
    unidad_medida varchar(20),
    cantidad_requerida int, 
    nombre_ingrediente varchar(20),
    id_menu int,
    id_proveedor int,
    primary key(id_ingrediente)
);
create table proveedor(
	id_proveedor int, 
    nombre_proveedor varchar(50),
    telefono int, 
    correo varchar(50),
    direccion varchar(50),
    departamento varchar(20),
    ciudad varchar(20),
    primary key(id_proveedor)
);
create table inventario(
	id_inventario int, 
    nombre_producto varchar(40),
    cantidad_disponible int, 
    unidad_medida varchar(20), 
    precio_unidad int, 
    id_proveedor int,
    primary key (id_inventario)
);
-- LLAVES FORANEAS 

alter table cliente add foreign key (dni) references persona(dni);
alter table empleado add foreign key (dni) references persona(dni);
alter table empleado add foreign key(id_evento) references evento(id_evento);
alter table horario_trabajo add foreign key (dni_empleado) references empleado (dni);
alter table feedback_cliente  add foreign key (dni_cliente) references cliente(dni);
alter table factura add foreign key (dni_cliente) references cliente(dni);
alter table factura add foreign key (id_pedido) references pedido(id_pedido);
alter table pedido add foreign key (id_evento) references evento(id_evento);
alter table evento add foreign key (dni_cliente) references cliente(dni);
alter table evento add foreign key (id_menu) references menu(id_menu);
alter table tipo_contratacion add foreign key (id_evento) references evento(id_evento);
alter table ingredientes add foreign key (id_menu) references menu(id_menu);
alter table ingredientes add foreign key (id_proveedor) references proveedor(id_proveedor);
alter table inventario add foreign key (id_proveedor) references proveedor(id_proveedor);


-- INSERTANDO VALORES 
-- 1)
insert into persona (dni,primer_nombre,segundo_nombre,apellido_paterno,apellido_materno,correo,telefono) 
values 
	(74863840,'kerin','sebastian','larico','huillca','klaricoh@gmail.com',988860462),
    (76543210,'miguel','arturo','quispe','perez','quispep@gmail.com',987654321),
    (76543211,'juan','jose','mamani','villasante','mamanivi@gmail.com',987654322),
    (76543212,'Andre','Joarquin','torrico','medina','torricomed@gmail.com',987654323),
    (76543213,'Camilo','Esuardo','medina','paredes','medinapar@gmail.com',987654324),
    (76543214,'Pablo','Esteban','morales','sierra','moraless@gmail.com',987654325),
    (76543215,'Edwin','Claudio','benavides','muñante','benavidesmun@gmail.com',987654326),
    (76543216,'Romina','Alessa','rodriguez','lopez','rodlopez@gmail.com',987654327),
    (76543217,'Gabriel','Mariano','perez','gomez','perezgom@gmail.com',987654328),
    (76543218,'Jose','eduardo','ponce','mendoza','poncemend@gmail.com',987654329),
    (76543219,'Gonzalo','Aldair','diaz','mercado','diazmercado@gmail.com',987654320),
    (76543220,'Leonardo','fabian','diez','peso','dpeso@gmail.com',987654330),
    
    (12345678,'estaban','dido','bustamante','mora','bustamantem@gmail.com',987654331),
    (12345677,'jose','arturo','llerena','paz','llerenap@gmail.com',987654332),
    (12345676,'juan','pablo','gutierrez','perez','gutierrezp@gmail.com',987654333),
    (12345675,'jesus','fernando','condori','mendoza','conmed@gmail.com',987654334),
    (12345674,'adrian','edinson','calla','mercado','callam@gmail.com',987654335),
    (12345673,'kevin','rodrigo','holanda','diaz','holandadiaz@gmail.com',987654336),
    (12345672,'leonardo','jesus','ponze','bellido','ponzebellido@gmail.com',987654337),
    (12345668,'kristopher','augusto','rospigliosi','gonzales','rospigonz@gmail.com',987654338),
    (12345667,'salim','renato','jorge','rodriguez','jorger@gmail.com',987654339),
    (12345666,'rolando','jesus','cardenas','talavera','cardenast@gmail.com',987654340),
    (12345665,'daniel','frank','olgado','salas','olgados@gmail.com',987654341),
    (29614137,'marco','sandro','sifuentes','lopez','tdcoatibb@gmail.com',987654342);
    
select * from persona;

-- 2)
insert into cliente(dni,departamento,ciudad,notas_adicionales) 
values 
	(74863840,'arequipa','arequipa','solo pido que sean puntuales nada mas gracias'),
    (76543210,'arequipa','arequipa','buen trato'),
    (76543211,'arequipa','arequipa','saludar a todos los invitados'),
    (76543212,'arequipa','arequipa','puntualidad'),
    (76543213,'arequipa','arequipa','-'),
    (76543214,'arequipa','arequipa','un buen trato por favor'),
    (76543215,'arequipa','arequipa','pido puntualidad y responsabilidad'),
    (76543216,'arequipa','arequipa','-'),
    (76543217,'arequipa','arequipa','todo limpio por favor'),
    (76543218,'arequipa','arequipa','-'),
    (76543219,'arequipa','arequipa','incluir la movilidad'),
    (76543220,'arequipa','arequipa','decoracion discreta');
    
select * from cliente ;

-- 3)
insert into feedback_cliente(id_feedback,comentario,calificacion,fecha_feedback,dni_cliente)
values
	(100,'el servicio fue estupendo, la comida estaba buena y fueron puntuales',5,'2024-09-29',74863840),
    (101,'Casi perfecto',4,'2024-10-22',76543210),
    (102,'Me encantó el servicio',5,'2024-11-21',76543211),
    (103,'No me gustó el animador',3,'2024-12-12',76543212),
    (104,'Cumplieron con lo que prometieron',5,'2024-07-15',76543213),
    (105,'Buen servicio',5,'2024-07-01',76543214),
    (106,'Todo bien pero me faltaron unos bocaditos',4,'2024-08-23',76543215),
    (107,'Cumplió mis expectativas',5,'2024-09-09',76543216),
    (108,'Me pareceió espectacular',5,'2024-10-10',76543217),
    (109,'Se domoraron un poco',3,'2024-12-23',76543218),
    (110,'Me encantó, buen trato',5,'2024-01-11',76543219),
    (111,'Excelente servicio',5,'2024-11-02',76543220);
    
select * from feedback_cliente;
-- 4)
insert into evento(id_evento, nombre_evento, fecha_evento, hora_inicio, hora_fin, tipo_evento, ubicacion_evento, dni_cliente,metodo_pago,id_menu)
values 
	(200,'boda de miguel y maria','2024-09-28','08:00:00','14:00:00','boda','av dolores 123',74863840,'tarjeta de credito',500 ),
    (201,'baby shower Emilia','2024-01-27','09:00:00','15:00:00','baby shower','av pizarro 665',76543210,'tarjeta de debito',501),
    (202,'quinceaños Lucia','2024-02-28','10:00:00','16:00:00','quinceaños','av progreso 150',76543211,'tarjeta de credito',502),
    (203,'fiesta de promocion La Salle','2024-03-28','08:00:00','14:00:00','promo','av dolores 123',76543212,'tarjeta de debito',503),
    (204,'cumpleaños Eduardo','2024-04-28','11:00:00','17:00:00','cumpleaños','av aviacion 512',76543213,'transferencia bancaria',504),
    (205,'baby shower Pablo','2024-05-28','08:00:00','14:00:00','baby shower','av progreso 150',76543214,'tarjeta de credito',505),
    (206,'Bodas de Oro San Jose','2024-06-28','11:00:00','17:00:00','bodas de oro','av dolores 123',76543215,'tarjeta de debito',506),
    (207,'Aniversario de Pablo y Romina','2024-07-28','09:00:00','15:00:00','aniversario','av pizarro 665',76543216,'transferencia bancaria',507),
    (208,'boda de Gabriel y Maria','2024-08-28','10:00:00','16:00:00','boda','av aviacion 512',76543217,'tarjeta de credito',508),
    (209,'boda de jose y juana','2024-09-28','10:00:00','16:00:00','boda','av dolores 123',76543218,'tarjeta de debito',509),
    (210,'quinceaños Camila','2024-10-28','08:00:00','14:00:00','quinceaños','av progreso 150',76543219,'transferencia bancaria',510),
    (211,'boda de leonardo y Adriana','2024-11-28','10:00:00','16:00:00','boda','av pizarro 665',76543220,'tarjeta de credito',511);
    
select * from evento;

-- 5)
insert into empleado(dni,fecha_contratacion,puesto,direccion,salario,id_evento)
values 
	(29614137,'2024-05-01','mozo','av bolognesi 1003',2000,200),
	(12345678,'2024-04-02','bartender','av cayma 504',1500,201),
    (12345677,'2024-03-02','animador','la molina 321',1800,202),
    (12345676,'2024-02-03','maestro de ceremonia','av ee.uu 200',1000,203),
    (12345675,'2024-01-04','mozo','proceres 450',2000,204),
    (12345674,'2024-06-05','cocinero','mariano melgar 500',3000,205),
    (12345673,'2024-05-06','animador','alamos 430',1800,206),
    (12345672,'2024-05-05','cocinero','paucarpata 200',3000,207),
    (12345668,'2024-04-15','mozo','umacollo 250',1900,207),
    (12345667,'2024-04-12','maestro de ceremonia','av tronchadero 201',1500,207),
    (12345666,'2024-01-05','cocinero','dijkstra 666',3000,207),
    (12345665,'2024-02-07','bartender','hurtley 120',2200,207);
    
select * from empleado;

-- 6)
insert into horario_trabajo(id_horario,horario_inicio,horario_fin,fecha,dni_empleado)
values 
	(300,'08:00:00','14:00:00','2024-09-28',29614137),
    (301,'09:00:00','15:00:00','2024-01-27',12345678),
    (302,'10:00:00','16:00:00','2024-02-28',12345677),
    (303,'08:00:00','14:00:00','2024-03-28',12345676),
    (304,'11:00:00','17:00:00','2024-04-28',12345675),
    (305,'08:00:00','14:00:00','2024-05-28',12345674),
    (306,'11:00:00','17:00:00','2024-06-28',12345673),
    (307,'09:00:00','15:00:00','2024-07-28',12345672),
    (308,'10:00:00','16:00:00','2024-08-28',29614137),
    (309,'10:00:00','16:00:00','2024-09-28',12345668),
    (310,'08:00:00','14:00:00','2024-09-28',12345667),
    (311,'10:00:00','16:00:00','2024-10-28',12345666),
    (312,'09:00:00','15:00:00','2024-11-28',12345665),
    (313,'08:00:00','14:00:00','2024-12-28',12345674),
    (314,'10:00:00','16:00:00','2024-02-28',12345673),
    (315,'09:00:00','15:00:00','2024-04-28',12345672),
    (316,'08:00:00','14:00:00','2024-06-28',29614137),
    (317,'11:00:00','17:00:00','2024-08-28',12345678),
    (318,'09:00:00','15:00:00','2024-10-28',12345677),
    (319,'08:00:00','14:00:00','2024-12-28',12345676);
select * from horario_trabajo;
-- 7) 
insert into tipo_contratacion(id_tipo_contratacion,cantidad,fecha_reserva,tipo_servicio,id_evento)
values 
	(400,2,'2024-03-01','movilidad',200),
    (401,2,'2024-04-02','comida',201),
    (402,2,'2024-05-02','musica',202),
    (403,2,'2024-06-03','decoracion',203),
    (404,2,'2024-07-04','bebida',204),
    (405,2,'2024-08-04','animacion',205),
    (406,2,'2024-09-05','bebida',206),
    (407,2,'2024-10-06','musica',207),
    (408,2,'2024-11-07','decoracion',208),
    (409,2,'2024-12-08','bebida',209),
    (410,2,'2024-01-09','hora loca',210),
    (411,2,'2024-02-10','comida',211),
    (412,2,'2024-03-10','musica',202),
    (413,2,'2024-04-05','hora loca',203),
    (414,2,'2024-05-06','comida',204),
    (415,2,'2024-06-08','movilidad',205),
    (416,2,'2024-07-09','hora loca',206),
    (417,2,'2024-08-07','animacuin',207),
    (418,2,'2024-09-07','movilidad',208),
    (419,2,'2024-10-04','bebida',209);
    
select * from tipo_contratacion;

-- 8)
insert into menu(id_menu, precio_persona, nombre_menu,id_evento)
values 
	(500,20,'Sabor peruano'),
    (501,23,'Del ajo y aji'),
    (502,25,'Come rico'),
    (503,25,'La casa del sabor'),
    (504,30,'Sazon Peruana'),
    (505,18,'Sazon Casera'),
    (506,22,'Las tres ollitas'),
    (507,25,'Cucharita cucharon'),
    (508,28,'Sal y pimienta'),
    (509,25,'Papas y camotes'),
    (510,40,'Orgullo peruano'),
    (511,22,'Mixtura de sabor'),
    (512,26,'El Nene'),
    (513,23,'Kndela'),
    (514,20,'La zambita'),
    (515,40,'Los Rodriguez'),
    (516,25,'Hermanos Ayar'),
    (517,30,'Pica rico'),
    (518,30,'Magia al paladar'),
    (519,21,'Menu perucho');
    
select * from menu;

-- 9)
insert into ingredientes(id_ingrediente, precio_unidad, unidad_medida, cantidad_requerida, nombre_ingrediente, id_menu)
values 
	(600,03.50,'kilogramos',20,'cebolla',500),
    (601,02.80,'kilogramos',20,'papa',501),
    (602,02.50,'gramos',500,'maní',502),
    (603,02.00,'kilogramos',20,'arroz',503),
    (604,13.50,'kilogramos',20,'pollo',504),
    (605,15.50,'kilogramos',20,'carne',505),
    (606,17.50,'kilogramos',15,'cerdo',506),
    (607,02.30,'kilogramos',8,'rocoto',507),
    (608,06.50,'kilogramos',7,'ajo',508),
    (609,04.70,'kilogramos',8,'zanahoria',509),
    (610,01.80,'kilogramos',10,'tomate',510),
    (611,03.20,'kilogramos',3,'yuca',511),
    (612,07.50,'kilogramos',3,'alverja',512),
    (613,07.50,'kilogramos',8,'palta',513),
    (614,02.50,'kilogramos',3,'beterraga',514),
    (615,03.50,'kilogramos',4,'camote',515),
    (616,05.50,'kilogramos',7,'limon',516),
    (617,17.50,'kilogramos',7,'pescado',517),
    (618,10.50,'kilogramos',4,'maiz',518),
    (619,19.50,'kilogramos',2,'sal',519);
    
select * from ingredientes;

-- 10)
insert into pedido(id_pedido, fecha_pedido, precio_total, cantidad_personas, id_evento)
values 
	(700, '2024-09-28',800,20,200),
    (701, '2024-01-27',850,35,201),
    (702, '2024-02-26',700,30,202),
    (703, '2024-03-24',600,20,203),
    (704, '2024-04-25',580,25,204),
    (705, '2024-05-23',870,30,205),
    (706, '2024-06-22',760,20,206),
    (707, '2024-07-21',920,35,207),
    (708, '2024-08-20',900,30,208),
    (709, '2024-09-19',630,20,209),
    (710, '2024-09-18',820,25,210),
    (711, '2024-10-15',710,30,211),
    (712, '2024-11-14',910,40,202),
    (713, '2024-12-13',730,25,203),
    (714, '2024-02-12',590,30,204),
    (715, '2024-04-11',630,20,205),
    (716, '2024-06-08',740,25,206),
    (717, '2024-08-07',820,30,207),
    (718, '2024-10-06',840,35,208),
    (719, '2024-12-01',770,30,209);
    
select * from pedido;

-- 11) 
insert into proveedor(id_proveedor, nombre_proveedor, telefono, correo, direccion, departamento, ciudad)
values 
	(800,'Sabores Andinos Distribuciones Gastronómicas',973154648,'sabores.andinos.distribuciones@gmail.com','los incas 220','arequipa','arequipa'),
    (801,'Pekplast',955555555,'pekplast@gmail.com','los proceres 120','arequipa','arequipa'),
    (802,'Dekora',966666666,'dkora@gmail.com','av cayma 210','arequipa','arequipa'),
    (803,'Globolandia',977777777,'globolandia@gmail.com','av ee.uu 130','arequipa','arequipa'),
    (804,'Mercado Porvenir',988888888,'mercado.por.venir2@gmail.com','los alamos 24','arequipa','arequipa'),
    (805,'Textileria El Chavito',999999999,'chavito.textil@gmail.com','kennedy 480','arequipa','arequipa'),
    (806,'Florever',944444444,'florever@gmail.com','lambramani 280','arequipa','arequipa'),
    (807,'Eventos y música',933333333,'eventos.musica@gmail.com','camino real 320','arequipa','arequipa'),
    (808,'Dj Asto',922222222,'djasto.musica@gmail.com','yanahuara 450','arequipa','arequipa'),
    (809,'Grupo 6',911111111,'grupo6oficial@gmail.com','av progreso 820','arequipa','arequipa'),
    (810,'Manos peruanas Distribuciones gastronomicas',900000000,'manos.peruanas@gmail.com','magnopata 220','arequipa','arequipa'),
    (811,'Aceros Arequipa',912345678,'acerosaqp@gmail.com','la molina 300','arequipa','arequipa'),
    (812,'Luciernagas y Bulla',987654321,'lucesybulla@gmail.com','avelino 510','arequipa','arequipa'),
    (813,'Zaperoco Banda',977666555,'zaperoco.oficial@gmail.com','siglo xx 310','arequipa','arequipa'),
    (814,'Glotástico',999888777,'glotastico@gmail.com','santa rosa 120','arequipa','arequipa'),
    (815,'Payasería el Tribilin',966333222,'stribilin.payasos@gmail.com','pizarro 560','arequipa','arequipa'),
    (816,'Vinoteca Vino Tinto',911222333,'vino.tinto@gmail.com','porongoche 130','arequipa','arequipa'),
    (817,'Bebedero Anonimo Licoreria',900888777,'bebedero.licoria.anonimo@gmail.com','la barraca 610','arequipa','arequipa'),
    (818,'Finuras Utencilios',959595959,'finuras.utencilios@gmail.com','umacollo 240','arequipa','arequipa'),
    (819,'Rosatel',921345987,'rosatel@gmail.com','av ee.uu 192','arequipa','arequipa');
    
select * from proveedor;
alter table proveedor modify column id_proveedor int auto_increment;

-- 12) 
insert into inventario(id_inventario, nombre_producto, cantidad_disponible, unidad_medida, precio_unidad, id_proveedor)
values 
	(900,'cebolla', 120,'kilogramos',03.50,800),
    (901,'tuppers', 60,'unidades',00.50,801),
    (902,'manteles', 10,'unidades',20.00,802),
    (903,'globos largos', 100,'unidades',00.20,803),
    (904,'papa', 120,'kilogramos',02.80,804),
    (905,'funda de sillas', 60,'unidades',13.50,805),
    (906,'centro de mesa', 15,'unidades',33.50,806),
    (907,'parlantes', 2,'unidades',80.00,807),
    (908,'servicio de musica', 6,'horas',100.50,808),
    (909,'servicio de musica', 4,'horas',3300.00,809),
    (910,'cerdo', 10,'kilogramos',17.50,810),
    (911,'soportes metalicos', 4,'unidades',200.00,811),
    (912,'luces', 20,'unidades',50.00,812),
    (913,'servicio de musica', 4,'horas',800.00,813),
    (914,'silbatos', 120,'unidades',01.50,814),
    (915,'servivio de hora loca', 2,'horas',120.00,815),
    (916,'whiskey', 8,'botellas',110.00,816),
    (917,'pisco', 12,'botellas',035.50,817),
    (918,'juego de cubiertos', 600,'unidades',07.50,818),
    (919,'centro de mesa', 20,'unidades',48.00,819);
    
select * from inventario; 

-- 13) 

insert into factura(id_factura, fecha_emision,  monto_total, id_pedido, dni_cliente)
values	
	(1000, '2024-09-28', 800, 700, 74863840),
    (1001, '2024-01-27',850,701,'76543210'),
    (1002, '2024-02-26',700,702,'76543211'),
    (1003, '2024-03-24',600,703,'76543212'),
    (1004, '2024-04-25',580,704,'76543213'),
    (1005, '2024-05-23',870,705,'76543214'),
    (1006, '2024-06-22',760,706,'76543215'),
    (1007, '2024-07-21',920,707,'76543216'),
    (1008, '2024-08-20',900,708,'76543217'),
    (1009, '2024-09-19',630,709,'76543218'),
    (1010, '2024-09-18',820,710,'76543219'),
    (1011, '2024-10-15',710,711,'76543220'),
    (1012, '2024-11-14',910,712,'76543211'),
    (1013, '2024-12-13',730,713,'76543212'),
    (1014, '2024-02-12',590,714,'76543213'),
    (1015, '2024-04-11',630,715,'76543214'),
    (1016, '2024-06-08',740,716,'76543215'),
    (1017, '2024-08-07',820,717,'76543216'),
    (1018, '2024-10-06',840,718,'76543217'),
    (1019, '2024-12-01',770,719,'76543218');
    
select * from factura;


-- funcion para agregar persona a la tabla persona 
delimiter //
DROP PROCEDURE IF EXISTS insertar //
CREATE PROCEDURE insertar(
-- persona
IN dni int, 
IN primer_nombre VARCHAR(20), 
IN segundo_nombre VARCHAR(20), 
IN apellido_paterno VARCHAR(20),
IN apellido_materno VARCHAR(20),
in correo varchar(50),
in telefono int,
-- cliente
in departamento varchar(20),
in ciudad varchar(20),
in notas_adicionales varchar(100),
-- evento 
in nombre_evento varchaR(80),
in fecha_evento date,
in hora_inicio time,
in hora_fin time, 
in tipo_evento varchar(40),
in ubicacion_evento varchaR(50),
-- tipo contratacion
in cantidad int,
in tipo_servicio varchaR(20),
-- pedido
in cantidad_personas int,
-- menu
in nombre_menu varchar(30),
in metodo_pago varchar(30)

)
BEGIN
	DECLARE id_del_evento INT;
	declare id_de_contratacion int;
    declare id_del_pedido int;
    declare fecha_actual datetime;
    declare precio_total int;
    declare id_menu int;
	set id_del_evento=id_evento()+1;
    set id_de_contratacion=id_contratacion() +1;
	set id_del_pedido=id_pedido()+1;	
    set fecha_actual=now();
    set precio_total=precio(nombre_menu) * cantidad_personas;
    select m.id_menu into id_menu
    from evento e
    inner join menu m on e.id_menu=m.id_menu
    where m.nombre_menu= nombre_menu;
	
	INSERT INTO persona (dni, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, correo, telefono)
    VALUES (dni, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, correo, telefono);
    
    INSERT INTO cliente (dni, departamento,ciudad,notas_adicionales)
    VALUES (dni, departamento, ciudad, notas_adicionales);
    
    insert into evento(id_evento, nombre_evento, fecha_evento, hora_inicio, hora_fin, tipo_evento, ubicacion_evento, dni_cliente,metodo_pago,id_menu)
    values (id_del_evento,nombre_evento, fecha_evento, hora_inicio, hora_fin, tipo_evento, ubicacion_evento, dni,metodo_pago,id_menu);
    
    insert into tipo_contratacion(id_tipo_contratacion,cantidad,fecha_reserva,tipo_servicio,id_evento)
    values (id_de_contratacion,cantidad,fecha_evento,tipo_servicio,id_del_evento);
    
    insert into pedido(id_pedido, fecha_pedido, precio_total, cantidad_personas,id_evento)
    values(id_del_pedido,fecha_actual,precio_total,cantidad_personas,id_del_evento);
END
// delimiter ;
call insertar(29614136,'a','b','c','d','e@gmail.com',1234,'f','g','h','i','2024-02-14','22:00:00','03:00:00','boda','av cayma 123',1,'equipo sonido',20,'Sabor peruano','tarjeta credito');
select * from persona ;
select * from cliente;
select * from evento;
select * from tipo_contratacion;
select * from pedido;
select * from empleado;

delimiter //
drop procedure if exists facturar//
create procedure facturar()
begin 
	declare fecha datetime;
    declare monto_total int;
    declare pedido_id int;
    declare factura_id int;
    declare dni_cliente int;
    set factura_id=id_factura()+1;
    set fecha = now();
    set pedido_id= id_pedido();
    
    select p.precio_total into monto_total
    from pedido p 
    where p.id_pedido= pedido_id;
    
    select c.dni into dni_cliente
    from pedido p
    inner join evento e on p.id_evento=e.id_evento
    inner join cliente c on c.dni= e.dni_cliente
    where p.id_pedido= pedido_id;
    insert into factura(id_factura, fecha_emision, monto_total, id_pedido, dni_cliente)
    values (factura_id,fecha,monto_total,pedido_id,dni_cliente);
end
// delimiter ;
call facturar();
select * from factura;

delimiter //
drop procedure if exists mostrar_factura//
create procedure mostrar_factura()
begin
	DECLARE factura_id INT;
    SELECT MAX(id_factura) INTO factura_id FROM factura;

    SELECT f.id_factura AS 'ID de la factura',
           f.dni_cliente AS 'DNI del cliente',
           f.fecha_emision AS 'Fecha de emisión',
           m.nombre_menu AS 'Nombre del menú',
           f.monto_total AS 'Monto Total'
    from factura f
    inner join pedido p on p.id_pedido= f.id_pedido
    inner join evento e on p.id_evento= e.id_evento
    inner join menu m on e.id_menu=m.id_menu
    where f.id_factura = factura_id;
end
// delimiter ;
call mostrar_factura();

delimiter //
drop procedure if exists ingresar_servicio//
create procedure ingresar_servicio(in precio_persona int, in nombre_menu varchar(30))
begin
	declare menu_id int;
    set menu_id = id_menu()+1;
    insert into menu (id_menu, precio_persona, nombre_menu)
    values (menu_id, precio_persona, nombre_menu);
end
// delimiter ; 
call ingresar_servicio(40, 'Sabor peruano');
select * from menu;

delimiter // 
drop procedure if exists mostrar_servicios1//
create procedure mostrar_servicios1()
begin
	select distinct m.nombre_menu as 'Menus que disponemos'
	from menu m;
    
end
// delimiter ;
call mostrar_servicios1();

delimiter // 
drop procedure if exists mostrar_servicios2//
create procedure mostrar_servicios2()
begin 
	select distinct e.tipo_evento as 'Tipo de eventos'
    from evento e;
end
// delimiter ; 
call mostrar_servicios2();

delimiter //
drop procedure if exists ingresar_empleados//
create procedure ingresar_empleados(
-- persona
IN dni int, 
IN primer_nombre VARCHAR(20), 
IN segundo_nombre VARCHAR(20), 
IN apellido_paterno VARCHAR(20),
IN apellido_materno VARCHAR(20),
in correo varchar(50),
in telefono int,
-- empleado
in fecha_contratacion date,
in puesto varchar(20),
in direccion varchar(50),
in salario int, 
in id_evento int,
-- horario de trabajo
in horario_inicio time, 
in horario_fin time, 
in fecha date
)
begin 
	declare horario_id int;
    set horario_id = id_horario()+1;
	INSERT INTO persona (dni, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, correo, telefono)
    VALUES (dni, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, correo, telefono);
    
    insert into empleado (dni,fecha_contratacion,puesto,direccion, salario, id_evento)
    values (dni,fecha_contratacion, puesto , direccion , salario, id_evento);
    
    insert into horario_trabajo(id_horario,horario_inicio,horario_fin, fecha,dni_empleado)
    values(horario_id,horario_inicio,horario_fin,fecha, dni);
end
// delimiter ;  
call ingresar_empleados(1,'a','b','c','d','e','1','2024-02-16','mozo','f',2000,211,'20:00:00','03:00:00','2024-11-28');
select * from persona;
select  *from empleado;
select * from horario_trabajo;


delimiter // 
drop function if exists id_horario//
create function id_horario()returns int deterministic
begin 
	declare horario_id int;
    select max(h.id_horario) into horario_id
    from horario_trabajo h;
    return horario_id;
end
// delimiter ;
select  id_horario() as 'id';



delimiter // 
drop function if exists id_menu//
create function id_menu() returns int deterministic
begin 
	declare menu_id int;
    select max(m.id_menu) into menu_id
    from menu m;
    return menu_id;
end
// delimiter ; 
select id_menu() as 'id maximo de menu';

delimiter //
drop function if exists id_evento//
create function id_evento() returns int deterministic
begin 
	declare evento_id int;
    select max(e.id_evento) into evento_id
	from evento e;
    return evento_id;
end
//delimiter ;
-- select id_evento() as 'id mas grande de la tabla evento';

delimiter //
drop function if exists id_contatacion//
create function id_contratacion() returns int deterministic
begin 
	declare contratacion_id int;
    select max(t.id_tipo_contratacion) into contratacion_id
	from tipo_contratacion t;
    return contratacion_id;
end
//delimiter ;
-- select id_contratacion() as 'id de contratacion';

delimiter //
drop function if exists id_pedido//
create function id_pedido() returns int deterministic
begin 
	declare pedido_id int;
    select max(p.id_pedido) into pedido_id
	from pedido p;
    return pedido_id;
end
//delimiter ;
select id_pedido() as 'pedido';

delimiter //
drop function if exists id_factura//
create function id_factura() returns int deterministic
begin 
	declare factura_id int;
    select max(f.id_factura) into factura_id
	from factura f;
    return factura_id;
end
//delimiter ;
select id_factura() as 'factura';

delimiter //
drop function if exists precio//
create function precio(nombre_del_menu varchar(30)) returns int deterministic
begin 
	declare precio int;
    select m.precio_persona into precio
    from menu m
    where m.nombre_menu = nombre_del_menu;
    return precio;
end
//delimiter ;
select precio('Sabor peruano') as 'precio por persona';

DELIMITER //
drop procedure if exists borrar_datos //
CREATE PROCEDURE borrar_datos(IN dni_usuario INT)
BEGIN
    DECLARE cliente_id INT;
    declare evento_id int;
    set evento_id= id_evento();
    
    DELETE FROM pedido WHERE id_evento = evento_id;
    DELETE FROM tipo_contratacion WHERE id_evento = evento_id;
    delete from evento where id_evento=evento_id;
    
	SELECT dni INTO cliente_id FROM cliente WHERE dni = dni_usuario;
    DELETE FROM cliente WHERE dni = dni_usuario;
    DELETE FROM persona WHERE dni = dni_usuario;
END //
DELIMITER ;
CALL borrar_datos(1);

DROP PROCEDURE IF EXISTS actualizar_datos;
DELIMITER //
CREATE PROCEDURE actualizar_datos(
    IN dni_param INT,
    IN fecha_contratacion_param DATE,
    IN puesto_param VARCHAR(20),
    IN direccion_param VARCHAR(50),
    IN salario_param INT,
    IN id_evento_param INT
)
BEGIN
    UPDATE empleado
    SET
        fecha_contratacion = fecha_contratacion_param,
        puesto = puesto_param,
        direccion = direccion_param,
        salario = salario_param,
        id_evento = id_evento_param
    WHERE
        dni = dni_param;
END
// DELIMITER ;
select * from empleado;

DROP PROCEDURE IF EXISTS mostrar_venta;
DELIMITER //

CREATE PROCEDURE mostrar_venta()
BEGIN
    SELECT
        f.id_factura,
        f.fecha_emision,
        f.monto_total,
        f.id_pedido,
        c.dni AS dni_cliente,
        CONCAT(p.primer_nombre, ' ', p.segundo_nombre) AS nombres_cliente,
        CONCAT(p.apellido_paterno, ' ', p.apellido_materno) AS apellidos_cliente,
        c.departamento,
        c.ciudad,
        c.notas_adicionales
    FROM factura f
    JOIN cliente c ON f.dni_cliente = c.dni
    JOIN persona p ON c.dni = p.dni;
END //

DELIMITER ;
CALL mostrar_venta();

delimiter //
drop function if exists id_feedback_cliente//
create function id_feedback_cliente()returns int deterministic
begin 
	declare feedback_cliente_id int;
    select max(f.id_feedback) into feedback_cliente_id
    from feedback_cliente f;
    return feedback_cliente_id;
end
// delimiter ;
select id_feedback_cliente() as 'id';


delimiter // 
drop procedure if exists comentario//
create procedure comentario (in comentario varchar(100),in calificacion int, in dni_cliente int )
begin 
	declare id_comentario int;
    declare fecha date;
    set id_comentario=id_feedback_cliente() +1;
    set fecha=now();
    insert into feedback_cliente (id_feedback, comentario, calificacion, fecha_feedback, dni_cliente)
    values(id_comentario,comentario,calificacion,fecha,dni_cliente);
end
// delimiter ; 
call comentario ('si',2,74863840);

select * from feedback_cliente;

drop procedure if exists Insertar_Proveedor;
delimiter //
create procedure Insertar_Proveedor(in nom_prv varchar(50), in tel int, in cor varchar(50), in dir varchar(50), in dep varchar(30), in ciu varchar(30))
begin
	insert into proveedor(nombre_proveedor, telefono, correo, direccion, departamento, ciudad) 
    values (nom_prv, tel, cor, dir, dep, ciu);
end;
//
delimiter ;
