--------------BORRADO DE TRIGGER------------------------

-- DROP TRIGGER nombre ON tabla


-----------------------------------------------------------
------------ BORRADO DE FUNCIONES--------------------------

-- DROP FUNCTION [ IF EXISTS ] name ( [ [ argmode ] [ argname ] argtype [, ...] ] )
--     [ CASCADE | RESTRICT ]


-----------------------------------------------------------
--------------------BORRADO DE TABLAS----------------------

DROP TABLE 	GR10_ALQUILER, GR10_ALQUILER_POSICIONES, GR10_CLIENTE, GR10_ESTANTERIA,
			GR10_FILA, GR10_MOVIMIENTO, GR10_MOV_ENTRADA, GR10_MOV_INTERNO, GR10_MOV_SALIDA,
			GR10_PALLET, GR10_POSICION CASCADE;
