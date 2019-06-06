-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-06-04 19:13:28.7

-- tables
-- Table: GR10_ALQUILER
CREATE TABLE GR10_ALQUILER (
    id_alquiler int  NOT NULL,
    id_cliente int  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NULL,
    importe_dia decimal(10,2)  NOT NULL,
    CONSTRAINT PK_GR10_ALQUILER PRIMARY KEY (id_alquiler)
);

-- Table: GR10_ALQUILER_POSICIONES
CREATE TABLE GR10_ALQUILER_POSICIONES (
    id_alquiler int  NOT NULL,
    nro_posicion int  NOT NULL,
    nro_estanteria int  NOT NULL,
    nro_fila int  NOT NULL,
    estado boolean  NOT NULL,
    CONSTRAINT PK_GR10_ALQUILER_POSICIONES PRIMARY KEY (id_alquiler,nro_posicion,nro_estanteria,nro_fila)
);

-- Table: GR10_CLIENTE
CREATE TABLE GR10_CLIENTE (
    cuit_cuil int  NOT NULL,
    apellido varchar(60)  NOT NULL,
    nombre varchar(40)  NOT NULL,
    fecha_alta date  NOT NULL,
    CONSTRAINT PK_GR10_CLIENTE PRIMARY KEY (cuit_cuil)
);

-- Table: GR10_ESTANTERIA
CREATE TABLE GR10_ESTANTERIA (
    nro_estanteria int  NOT NULL,
    nombre_estanteria varchar(80)  NOT NULL,
    CONSTRAINT PK_GR10_ESTANTERIA PRIMARY KEY (nro_estanteria)
);

-- Table: GR10_FILA
CREATE TABLE GR10_FILA (
    nro_estanteria int  NOT NULL,
    nro_fila int  NOT NULL,
    nombre_fila varchar(80)  NOT NULL,
    peso_max_kg decimal(10,2)  NOT NULL,
    CONSTRAINT PK_GR10_FILA PRIMARY KEY (nro_estanteria,nro_fila)
);

-- Table: GR10_MOVIMIENTO
CREATE TABLE GR10_MOVIMIENTO (
    id_movimiento int  NOT NULL,
    fecha timestamp  NOT NULL,
    responsable varchar(80)  NOT NULL,
    tipo char(1)  NOT NULL,
    CONSTRAINT PK_GR10_MOVIMIENTO PRIMARY KEY (id_movimiento)
);

-- Table: GR10_MOV_ENTRADA
CREATE TABLE GR10_MOV_ENTRADA (
    id_movimiento int  NOT NULL,
    transporte varchar(80)  NOT NULL,
    guia varchar(80)  NOT NULL,
    cod_pallet varchar(20)  NOT NULL,
    id_alquiler int  NOT NULL,
    nro_posicion int  NOT NULL,
    nro_estanteria int  NOT NULL,
    nro_fila int  NOT NULL,
    CONSTRAINT PK_GR10_MOV_ENTRADA PRIMARY KEY (id_movimiento)
);

-- Table: GR10_MOV_INTERNO
CREATE TABLE GR10_MOV_INTERNO (
    id_movimiento int  NOT NULL,
    razon varchar(200)  NULL,
    nro_posicion int  NOT NULL,
    nro_estanteria int  NOT NULL,
    nro_fila int  NOT NULL,
    id_movimiento_interno int  NULL,
    id_movimiento_entrada int  NULL,
    CONSTRAINT PK_GR10_MOV_INTERNO PRIMARY KEY (id_movimiento)
);

-- Table: GR10_MOV_SALIDA
CREATE TABLE GR10_MOV_SALIDA (
    id_movimiento int  NOT NULL,
    id_movimiento_entrada int  NOT NULL,
    transporte varchar(80)  NOT NULL,
    guia varchar(80)  NOT NULL,
    CONSTRAINT PK_GR10_MOV_SALIDA PRIMARY KEY (id_movimiento)
);

-- Table: GR10_PALLET
CREATE TABLE GR10_PALLET (
    cod_pallet varchar(20)  NOT NULL,
    descripcion varchar(200)  NOT NULL,
    peso decimal(10,2)  NOT NULL,
    CONSTRAINT PK_GR10_PALLET PRIMARY KEY (cod_pallet)
);

-- Table: GR10_POSICION
CREATE TABLE GR10_POSICION (
    nro_posicion int  NOT NULL,
    nro_estanteria int  NOT NULL,
    nro_fila int  NOT NULL,
    tipo varchar(40)  NOT NULL,
    pos_global int  NOT NULL,
    CONSTRAINT UQ_GR10_POSICION UNIQUE (pos_global) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT PK_GR10_POSICION PRIMARY KEY (nro_posicion,nro_estanteria,nro_fila)
);

-- foreign keys
-- Reference: FK_GR10_ALQUILER_CLIENTE (table: GR10_ALQUILER)
ALTER TABLE GR10_ALQUILER ADD CONSTRAINT FK_GR10_ALQUILER_CLIENTE
    FOREIGN KEY (id_cliente)
    REFERENCES GR10_CLIENTE (cuit_cuil)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR10_ALQUILER_POSICIONES_ALQUILER (table: GR10_ALQUILER_POSICIONES)
ALTER TABLE GR10_ALQUILER_POSICIONES ADD CONSTRAINT FK_GR10_ALQUILER_POSICIONES_ALQUILER
    FOREIGN KEY (id_alquiler)
    REFERENCES GR10_ALQUILER (id_alquiler)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR10_ALQUILER_POSICIONES_POSICION (table: GR10_ALQUILER_POSICIONES)
ALTER TABLE GR10_ALQUILER_POSICIONES ADD CONSTRAINT FK_GR10_ALQUILER_POSICIONES_POSICION
    FOREIGN KEY (nro_posicion, nro_estanteria, nro_fila)
    REFERENCES GR10_POSICION (nro_posicion, nro_estanteria, nro_fila)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR10_FILA_ESTANTERIA (table: GR10_FILA)
ALTER TABLE GR10_FILA ADD CONSTRAINT FK_GR10_FILA_ESTANTERIA
    FOREIGN KEY (nro_estanteria)
    REFERENCES GR10_ESTANTERIA (nro_estanteria)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR10_MOV_ENTRADA_ALQUILER_POSICIONES (table: GR10_MOV_ENTRADA)
ALTER TABLE GR10_MOV_ENTRADA ADD CONSTRAINT FK_GR10_MOV_ENTRADA_ALQUILER_POSICIONES
    FOREIGN KEY (id_alquiler, nro_posicion, nro_estanteria, nro_fila)
    REFERENCES GR10_ALQUILER_POSICIONES (id_alquiler, nro_posicion, nro_estanteria, nro_fila)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR10_MOV_ENTRADA_MOVIMIENTO (table: GR10_MOV_ENTRADA)
ALTER TABLE GR10_MOV_ENTRADA ADD CONSTRAINT FK_GR10_MOV_ENTRADA_MOVIMIENTO
    FOREIGN KEY (id_movimiento)
    REFERENCES GR10_MOVIMIENTO (id_movimiento)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR10_MOV_ENTRADA_PALLET (table: GR10_MOV_ENTRADA)
ALTER TABLE GR10_MOV_ENTRADA ADD CONSTRAINT FK_GR10_MOV_ENTRADA_PALLET
    FOREIGN KEY (cod_pallet)
    REFERENCES GR10_PALLET (cod_pallet)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR10_MOV_INTERNO_MOVIMIENTO (table: GR10_MOV_INTERNO)
ALTER TABLE GR10_MOV_INTERNO ADD CONSTRAINT FK_GR10_MOV_INTERNO_MOVIMIENTO
    FOREIGN KEY (id_movimiento)
    REFERENCES GR10_MOVIMIENTO (id_movimiento)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR10_MOV_INTERNO_POSICION (table: GR10_MOV_INTERNO)
ALTER TABLE GR10_MOV_INTERNO ADD CONSTRAINT FK_GR10_MOV_INTERNO_POSICION
    FOREIGN KEY (nro_posicion, nro_estanteria, nro_fila)
    REFERENCES GR10_POSICION (nro_posicion, nro_estanteria, nro_fila)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR10_MOV_SALIDA_MOVIMIENTO (table: GR10_MOV_SALIDA)
ALTER TABLE GR10_MOV_SALIDA ADD CONSTRAINT FK_GR10_MOV_SALIDA_MOVIMIENTO
    FOREIGN KEY (id_movimiento)
    REFERENCES GR10_MOVIMIENTO (id_movimiento)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR10_MOV_SALIDA_MOVIMIENTO_ENTRADA (table: GR10_MOV_SALIDA)
ALTER TABLE GR10_MOV_SALIDA ADD CONSTRAINT FK_GR10_MOV_SALIDA_MOVIMIENTO_ENTRADA
    FOREIGN KEY (id_movimiento_entrada)
    REFERENCES GR10_MOV_ENTRADA (id_movimiento)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR10_POSICION_FILA (table: GR10_POSICION)
ALTER TABLE GR10_POSICION ADD CONSTRAINT FK_GR10_POSICION_FILA
    FOREIGN KEY (nro_estanteria, nro_fila)
    REFERENCES GR10_FILA (nro_estanteria, nro_fila)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: GR10_MOV_INTERNO_GR10_MOV_ENTRADA (table: GR10_MOV_INTERNO)
ALTER TABLE GR10_MOV_INTERNO ADD CONSTRAINT GR10_MOV_INTERNO_GR10_MOV_ENTRADA
    FOREIGN KEY (id_movimiento_entrada)
    REFERENCES GR10_MOV_ENTRADA (id_movimiento)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: GR10_MOV_INTERNO_GR10_MOV_INTERNO (table: GR10_MOV_INTERNO)
ALTER TABLE GR10_MOV_INTERNO ADD CONSTRAINT GR10_MOV_INTERNO_GR10_MOV_INTERNO
    FOREIGN KEY (id_movimiento_interno)
    REFERENCES GR10_MOV_INTERNO (id_movimiento)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- End of file.




INSERT INTO GR10_CLIENTE (cuit_cuil, nombre, apellido, fecha_alta) VALUES
(3022249, 'Norbie', 'Jeffryes', '2018-10-30 23:54:12'),
(3218717, 'Tersina', 'Van Giffen', '2019-05-11 17:16:22'),
(2519589, 'Jefferson', 'Helks', '2018-12-24 03:48:54'),
(3096332, 'Quinlan', 'Leyson', '2019-05-16 03:25:50'),
(2859710, 'Yelena', 'Menco', '2019-02-27 03:38:53');

INSERT INTO GR10_ALQUILER (id_alquiler, id_cliente, fecha_desde, fecha_hasta, importe_dia) VALUES
( 1, 2859710, '2019-05-25', '2020-02-22', 191.52),
( 2, 3022249, '2019-05-25', '2020-02-22', 406.85),
( 3, 3218717, '2019-05-25', '2020-02-22', 438.38),
( 4, 2519589, '2019-05-25', '2020-02-22', 760.51),
( 5, 3096332, '2019-05-25', '2020-02-22', 939.25);


INSERT INTO GR10_ESTANTERIA (nro_estanteria, nombre_estanteria) VALUES
(1, 'EMPRESAS'),
(2, 'PYMES'),
(3, 'HOGARES'),
(4, 'INSTITUCIONES'),
(5, 'HOSPITALES');

INSERT INTO GR10_FILA (nro_estanteria, nro_fila, nombre_fila, peso_max_kg) VALUES
(1, 1, 'A', 1000),
(2, 2, 'B', 1500),
(3, 3, 'C', 3000),
(4, 4, 'D', 1250),
(5, 5, 'E', 1750);

INSERT INTO GR10_POSICION (nro_posicion, nro_estanteria, nro_fila, pos_global, tipo) VALUES
(1, 1, 1, 1, 'general'),
(2, 2, 2, 2, 'general'),
(3, 3, 3, 3, 'general'),
(4, 4, 4, 4, 'general'),
(5, 5, 5, 5, 'general'),
(6, 2, 2, 6, 'general');

INSERT INTO GR10_ALQUILER_POSICIONES (id_alquiler, nro_posicion, nro_estanteria, nro_fila, estado) VALUES
(1,1,1,1, true),
(2,2,2,2, true),
(3,3,3,3, true),
(4,4,4,4, true),
(5,5,5,5, true);

INSERT INTO GR10_PALLET (cod_pallet, descripcion, peso) VALUES
('GH22', ' Brain Stem using Heavy ', 150),
('GH23', ' Brain Stem using Heavy ', 250),
('GH25', ' Brain Stem using Heavy ', 550),
('GH20', ' Brain Stem using Heavy ', 160),
('GH21', ' Brain Stem using Heavy ', 580);

INSERT INTO GR10_MOVIMIENTO (id_movimiento, fecha, responsable, tipo) VALUES
(1, '2019-02-13', 'ENCARGADO', 'e'),
(2, '2019-05-12', 'ENCARGADO', 'e'),
(3, '2019-04-10', 'ENCARGADO', 'e'),
(4, '2019-06-19', 'ENCARGADO', 'e'),
(5, '2019-08-25', 'ENCARGADO', 'e'),
(6, '2019-10-25', 'ENCARGADO', 's'),
(7, '2019-11-25', 'ENCARGADO', 's'),
(8, '2019-10-25', 'ENCARGADO', 'i'),
(9, '2019-11-25', 'ENCARGADO', 'i');

INSERT INTO GR10_MOV_ENTRADA (id_movimiento, transporte, guia, cod_pallet, id_alquiler, nro_posicion, nro_estanteria, nro_fila) VALUES
(1, 'PROPIO', '630000000022', 'GH22', 1, 1, 1, 1),
(2, 'OCA', '630000020222', 'GH21', 2, 2, 2, 2),
(3, 'CORREO_ARGENTINO', '630030040022', 'GH23', 3, 3, 3, 3),
(4, 'ANDREANI', '630030060052', 'GH20', 4, 4, 4, 4);

INSERT INTO GR10_MOV_SALIDA (id_movimiento, id_movimiento_entrada, transporte, guia) VALUES
(6, 1,'OCA', '2334232ASD'),
(7, 2, 'ANDREANI', '2334232ASD');

INSERT INTO GR10_MOV_INTERNO (id_movimiento, razon, nro_posicion, nro_estanteria, nro_fila, id_movimiento_interno, id_movimiento_entrada) VALUES
(8, 'LIMPIEZA', 2, 2 ,2, NULL, 1);
