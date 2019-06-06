----------------------------------------------------------------------------------------------
-------------------------------------ELABORACION DE RESTRICCIONES-----------------------------
--PUNTO B- INCISO A
ALTER TABLE GR10_ALQUILER ADD CONSTRAINT CHK_FECHA_ALQUILER
CHECK ( (fecha_hasta IS NULL)  OR fecha_desde <= fecha_hasta);

-- INSERT INTO "unc_248823"."gr10_alquiler" ("id_alquiler","id_cliente","fecha_desde","fecha_hasta","importe_dia") VALUES ('6','2519589','2018-06-05','2017-06-05','100')

--PUNTO B- INCISO B

CREATE OR REPLACE FUNCTION FN_GR10_VERIFICAR_PESO() RETURNS TRIGGER AS $$
BEGIN
  IF (EXISTS (SELECT *
    FROM GR10_FILA fi
    WHERE fi.peso_max_kg < (SELECT SUM(p.peso) as suma
                FROM GR10_FILA f
                JOIN GR10_POSICION po ON (f.nro_fila = po.nro_fila)
                JOIN GR10_ALQUILER_POSICIONES ap ON (po.nro_fila = ap.nro_fila)
                JOIN GR10_MOV_ENTRADA e ON (ap.nro_fila = e.nro_fila)
                JOIN GR10_PALLET p ON (e.cod_pallet = p.cod_pallet)
                WHERE fi.nro_fila = f.nro_fila
                GROUP BY f.nro_fila
              )
              ))
      THEN
      RAISE EXCEPTION 'El peso de los pallet de la fila supera el maximo de la fila';
  END IF;
RETURN NEW;
END;$$
LANGUAGE plpgsql;


CREATE TRIGGER TRFN_GR10_PESO_VALIDO
AFTER UPDATE OF peso ON GR10_PALLET
FOR EACH ROW
EXECUTE PROCEDURE FN_GR10_VERIFICAR_PESO();

-- UPDATE "unc_248823"."gr10_pallet" SET "cod_pallet"='GH21', "descripcion"=' Brain Stem using Heavy ', "peso"='2000' WHERE "cod_pallet"='GH21'

CREATE TRIGGER TRFN_GR10_PESO_VALIDO_FILA
AFTER UPDATE OF peso_max_kg ON GR10_FILA
FOR EACH ROW
EXECUTE PROCEDURE FN_GR10_VERIFICAR_PESO();

-- UPDATE "unc_248823"."gr10_fila" SET "nro_estanteria"='2', "nro_fila"='2', "nombre_fila"='B', "peso_max_kg"='150' WHERE "nro_estanteria"='2' AND "nro_fila"='2'


CREATE TRIGGER TRFN_GR10_MOVIMIENTO_ENTRADA
AFTER INSERT OR UPDATE OF nro_fila ON GR10_MOV_ENTRADA
FOR EACH ROW
EXECUTE PROCEDURE FN_GR10_VERIFICAR_PESO();

-- INSERT INTO GR10_MOV_ENTRADA (id_movimiento, transporte, guia, cod_pallet, id_alquiler, nro_posicion, nro_estanteria, nro_fila) VALUES (4, 'ANDREANI', '630030060052', 'GH20', 4, 4, 4, 4);


--PUNTO B- INCISO C

CREATE DOMAIN posicion_valida
AS varchar NOT NULL
CHECK (VALUE LIKE 'general' OR VALUE LIKE 'vidrio'
            OR VALUE LIKE 'insecticidas'
            OR VALUE LIKE 'inflamable' AND VALUE IS NOT NULL);

ALTER TABLE GR10_POSICION
ALTER COLUMN tipo
SET DATA TYPE posicion_valida;

-- INSERT INTO GR10_POSICION (nro_posicion, nro_estanteria, nro_fila, pos_global, tipo) VALUES (1, 1, 1, 1, 'Medicamentos')


----------------------------------------------------------------------------------------------
-------------------------------------SERVICIOS------------------------------------------------

--PUNTO C- INCISO 1

CREATE FUNCTION FN_GR10_posLibres(fecha DATE)
   RETURNS TABLE (
      nro_estanteria int,
      nro_fila int,
      nro_posicion int
)
AS $$
BEGIN
   RETURN QUERY
   SELECT p.nro_estanteria, p.nro_fila, p.nro_posicion
   FROM GR10_ESTANTERIA e
      INNER JOIN GR10_FILA f ON e.nro_estanteria = f.nro_estanteria
      INNER JOIN GR10_POSICION p ON p.nro_estanteria = f.nro_estanteria and p.nro_fila = f.nro_fila
   WHERE NOT EXISTS (SELECT 1
                    FROM GR10_ALQUILER_POSICIONES ap
                    INNER JOIN GR10_ALQUILER a ON ap.id_alquiler = a.id_alquiler
                    WHERE ap.nro_posicion = p.nro_posicion
                      and ap.nro_estanteria = p.nro_estanteria
                      and ap.nro_fila = p.nro_fila
                      and fecha NOT BETWEEN a.fecha_desde and a.fecha_hasta);
END; $$ LANGUAGE plpgsql;

--PUNTO C- INCISO 2

CREATE OR REPLACE FUNCTION FN_GR10_LISTAR_CLIENTES(dias int) RETURNS TABLE (
  cuit_cuil int,
  apellido varchar,
  nombre varchar
)
AS $$
BEGIN
  RETURN QUERY
  SELECT c.cuit_cuil, c.apellido, c.nombre
  FROM GR10_CLIENTE c
  JOIN GR10_ALQUILER a ON(c.cuit_cuil = a.id_cliente)
  WHERE (a.fecha_hasta::DATE - NOW()::DATE) = dias;
END; $$ LANGUAGE plpgsql;

----------------------------------------------------------------------------------------------
-------------------------------------DEFINICION DE VISTAS-------------------------------------

--PUNTO D- INCISO 1

CREATE VIEW GR10_VISTA_ALQUILER_POSICIONES
AS SELECT ap.nro_posicion, ap.nro_fila, ap.nro_estanteria,
CASE WHEN ap.estado = '1' THEN (a.fecha_hasta::DATE - NOW()::DATE)
ELSE '0'
END AS "dias_restantes",
CASE WHEN ap.estado = '1' THEN 'OCUPADO'
  ELSE 'LIBRE'
END AS "estado"
FROM GR10_ALQUILER_POSICIONES ap
JOIN GR10_ALQUILER a ON(ap.id_alquiler = a.id_alquiler);

--PUNTO D- INCISO 2

CREATE VIEW GR10_VISTA_CLIENTES_INVERSION
AS SELECT a.id_cliente, SUM(a.importe_dia) AS Importe_total
FROM GR10_CLIENTE c
JOIN GR10_ALQUILER a ON(c.cuit_cuil = a.id_cliente)
WHERE (NOW()::DATE - INTERVAL '1 year') BETWEEN a.fecha_desde AND a.fecha_hasta
GROUP BY a.id_cliente
ORDER BY Importe_total DESC
LIMIT 10;



----------------------------------------------------------------------------------------------
-------------------------------TUDAI - SITIO A REALIZAR---------------------------------------

CREATE OR REPLACE FUNCTION FN_GR10_LISTAR_POS_OCUP_CLIENTE(cliente int)
  RETURNS TABLE (
    nro_estanteria int,
    nro_fila int,
    nro_posicion int,
    estado boolean
  )
  AS $$
  BEGIN
    RETURN QUERY
    SELECT ap.nro_estanteria, ap.nro_fila, ap.nro_posicion, ap.estado
    FROM GR10_ALQUILER_POSICIONES ap
    INNER JOIN GR10_ALQUILER a ON (ap.id_alquiler = a.id_alquiler)
    WHERE cliente = a.id_cliente AND ap.estado = '1';
  END; $$ LANGUAGE plpgsql;



ALTER TABLE GR10_MOV_INTERNO
ADD CHECK ( (id_movimiento_entrada IS NOT NULL AND id_movimiento_interno IS NULL)
OR (id_movimiento_entrada IS NULL AND id_movimiento_interno IS NOT NULL));
