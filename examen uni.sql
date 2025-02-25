-- Ordenar tablas y renombrarlas
SELECT 
    Código,
    nombres,
    modalidad,
    puntaje_final_arq AS examen_arquitectura,
    Prueba_1 AS examen_humanidades,
    Prueba_2 AS examen_matematica,
    puntaje_e3 AS examen_fisica_quimica,
    Puntaje_Final,
    resultado AS alcanzo_vacante,
    obs AS observacion,
    Examen
INTO dbo.Resultados_Ordenados
FROM dbo.Sheet1$;

-- Transformacion de datos y limpieza

UPDATE dbo.Resultados_Ordenados
SET examen_arquitectura = 0.000
WHERE examen_arquitectura IS NULL;

UPDATE dbo.Resultados_Ordenados
SET alcanzo_vacante = 'NO ALCANZO VACANTE'
WHERE alcanzo_vacante IS NULL;

UPDATE dbo.Resultados_Ordenados
SET observacion = 'SIN OBSERVACION'
WHERE observacion IS NULL;

-- Creamos columna

UPDATE dbo.Resultados_Ordenados
SET examen_arquitectura = REPLACE(examen_arquitectura, ',', '.')
WHERE ISNUMERIC(examen_arquitectura) = 1;

ALTER TABLE dbo.Resultados_Ordenados
ALTER COLUMN examen_arquitectura NUMERIC(10,3);

ALTER TABLE dbo.Resultados_Ordenados
ADD postula_arquitectura NVARCHAR(50);

UPDATE dbo.Resultados_Ordenados
SET postula_arquitectura = 
    CASE 
        WHEN examen_arquitectura > 0 THEN 'POSTULA A ARQUITECTURA'
        ELSE 'NO POSTULA A ARQUITECTURA'
    END;

-- Completar null

UPDATE dbo.Resultados_Ordenados
SET examen_arquitectura = 'NO POSTULA A ARQUITECTURA'
WHERE examen_arquitectura IS NULL;

UPDATE dbo.Resultados_Ordenados
SET alcanzo_vacante = 'NO ALCANZO VACANTE'
WHERE alcanzo_vacante IS NULL;

UPDATE dbo.Resultados_Ordenados
SET observacion = 'SIN OBSERVACION'
WHERE observacion IS NULL;


