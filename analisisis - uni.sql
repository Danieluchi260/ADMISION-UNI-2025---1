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


