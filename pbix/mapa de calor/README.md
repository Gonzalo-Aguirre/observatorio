# mapa de calor
→ Descripción:
Este proyecto tiene como objetivo analizar el comportamiento y uso de distintas paradas mediante la integración de múltiples fuentes de datos. Se desarrollan visualizaciones y métricas que permiten entender patrones de uso, distribución geográfica y variaciones horarias.

→ Objetivos:
Analizar el volumen de uso por parada
Identificar la distribución por barrios (sectorización)
Generar mapas de calor según franjas horarias
Comparar el rendimiento entre distintas paradas

→ Fuentes de datos
Los datos fueron obtenidos a partir de distintas fuentes:

Base de datos consultada mediante SQL
Reportes de boletos provenientes de otra empresa
Validación cruzada con una tercera fuente independiente

Dado que las fuentes pertenecen a distintos sistemas, se realizó un proceso de validación y consistencia de datos.

→ Procesamiento de datos
Las principales tareas de procesamiento incluyeron:

Extracción de datos mediante consultas SQL
Normalización de columnas y tipos de datos
Estandarización de formatos
Integración de archivos provenientes de Excel y CSV
Cruce y validación de información entre múltiples fuentes
Asignación de paradas basada en proximidad GPS

→ Tecnologías utilizadas
SQL: extracción y consulta de datos
Power Query: transformación, limpieza e integración de datos
Excel: análisis exploratorio inicial
Python: procesamiento geoespacial y asignación de paradas por proximidad
Power BI: modelado de datos, relaciones (joins) y visualización final

→ Visualizaciones
Las visualizaciones fueron desarrolladas en Power BI e incluyen:

Mapas geográficos de paradas
Mapas de calor de volumen por hora
Tablas comparativas e informativas

→ Resultados
El proyecto permite:

Identificar patrones de uso por ubicación y horario
Detectar paradas con mayor y menor demanda
Facilitar la toma de decisiones basada en datos
Mejorar la comprensión del comportamiento de los usuarios