ALTER TABLE GR10_ALQUILER ADD CONSTRAINT CHK_FECHA_ALQUILER
CHECK ( (fecha_hasta IS NULL)  OR fecha_desde <= fecha_hasta)

-- UPDATE "unc_248823"."gr10_alquiler" SET "id_alquiler"='5', "id_cliente"='3096332', "fecha_desde"='2020-05-25', "fecha_hasta"='2020-02-22', "importe_dia"='939.25' WHERE "id_alquiler"='5'

CREATE DOMAIN posicion_valida
AS varchar NOT NULL
CHECK (VALUE LIKE 'general' OR VALUE LIKE 'vidrio'
            OR VALUE LIKE 'insecticidas'
            OR VALUE LIKE 'inflamable' AND VALUE IS NOT NULL);

ALTER TABLE GR10_POSICION
ALTER COLUMN tipo
SET DATA TYPE posicion_valida


-- INSERT INTO GR10_POSICION (nro_posicion, nro_estanteria, nro_fila, pos_global, tipo) VALUES
-- (1, 1, 1, 1, 'General')

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

-- CHEQUEADO---------------------------------------------------------------



CREATE TRIGGER TRFN_GR10_PESO_VALIDO
AFTER INSERT OR UPDATE OF peso ON GR10_PALLET
FOR EACH ROW
EXECUTE PROCEDURE FN_GR10_VERIFICAR_PESO();

CREATE OR REPLACE FUNCTION FN_GR10_VERIFICAR_PESO() RETURNS TRIGGER AS $$
BEGIN
  IF (EXISTS (SELECT 1
                FROM GR10_FILA f
                JOIN GR10_POSICION po ON (f.nro_fila = po.nro_fila)
                JOIN GR10_ALQUILER_POSICIONES ap ON (po.nro_fila = ap.nro_fila)
                JOIN GR10_MOV_ENTRADA e ON (ap.nro_fila = e.nro_fila)
                JOIN GR10_PALLET p ON (e.cod_pallet = p.cod_pallet)
                WHERE f.peso_max_kg > (
                  SELECT SUM(p.peso)
                  FROM GR10_PALLET p
                  GROUP BY ap.nro_fila
                )
              ))
      THEN
      RAISE EXCEPTION 'El peso de los pallet de la fila supera el maximo de la fila';
  END IF;
RETURN NEW;
END;$$
LANGUAGE plpgsql;
