-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-05-31 19:51:20.812

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
    id_movmiento_entrada int  NOT NULL,
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
    FOREIGN KEY (id_movmiento_entrada)
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
