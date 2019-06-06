-----------------------------------------------------------
--------------BORRADO DE TRIGGER------------------------

DROP TRIGGER IF EXISTS TRFN_GR10_PESO_VALIDO ON GR10_PALLET;

DROP TRIGGER IF EXISTS TRFN_GR10_PESO_VALIDO_FILA  ON GR10_FILA;

DROP TRIGGER IF EXISTS TRFN_GR10_MOVIMIENTO_ENTRADA ON GR10_MOV_ENTRADA;

-----------------------------------------------------------
------------ BORRADO DE FUNCIONES--------------------------

DROP FUNCTION IF EXISTS FN_GR10_VERIFICAR_PESO;
DROP FUNCTION IF EXISTS FN_GR10_posLibres;
DROP FUNCTION IF EXISTS FN_GR10_LISTAR_CLIENTES;
DROP FUNCTION IF EXISTS FN_GR10_LISTAR_POS_OCUP_CLIENTE;

-- DROP FUNCTION [ IF EXISTS ] name ( [ [ argmode ] [ argname ] argtype [, ...] ] )
--     [ CASCADE | RESTRICT ]

-----------------------------------------------------------
------------ BORRADO DE VISTAS--------------------------
DROP VIEW IF EXISTS GR10_VISTA_ALQUILER_POSICIONES;
DROP VIEW IF EXISTS GR10_VISTA_CLIENTES_INVERSION;
-----------------------------------------------------------
--------------------BORRADO DE DOMAIN----------------------
DROP DOMAIN IF EXISTS posicion_valida;

-----------------------------------------------------------
--------------------BORRADO DE TABLAS----------------------

DROP TABLE IF EXISTS	GR10_ALQUILER, GR10_ALQUILER_POSICIONES, GR10_CLIENTE, GR10_ESTANTERIA,
			GR10_FILA, GR10_MOVIMIENTO, GR10_MOV_ENTRADA, GR10_MOV_INTERNO, GR10_MOV_SALIDA,
			GR10_PALLET, GR10_POSICION CASCADE;
