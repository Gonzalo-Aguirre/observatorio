WITH 
latlong_solbus AS (
-- ── solbus ────────────────────────────────────────────────────
SELECT
	lg.gps_codigo,
	lg.gps_latitud,
	lg.gps_longitud,
	-- ── Convertir a formato decimal para Google Maps ───────────────────────────────────────────────
	(LEFT(lg.gps_latitud, 2) + SUBSTRING(lg.gps_latitud, 3, 10) / 10000 / 60) * -1 AS latitudmaps,
	(LEFT(lg.gps_longitud, 2) + SUBSTRING(lg.gps_longitud, 3, 10) / 10000 / 60) * -1 AS longitudmaps
FROM
	solbus.localidad_gps lg

SELECT
	DISTINCT
    hlr.gps_codigo,
	'solbus' AS Empresa,
	hl.linea_nombre,
	lg.gps_nombre,
	hlrc.sentido,
	lg.gps_latitud,
	lg.gps_longitud,
	ll.latitudmaps,
	ll.longitudmaps
FROM
	solbus.horario_linea_ruta hlr
LEFT JOIN solbus.localidad_gps lg ON
	hlr.gps_codigo = lg.gps_codigo
LEFT JOIN latlong_tamse ll ON
	hlr.gps_codigo = ll.gps_codigo
LEFT JOIN solbus.horario_linea_ruta_cabecera hlrc ON
	hlr.hlr_hlrc_id = hlrc.hlrc_id
LEFT JOIN solbus.horario_linea hl ON
	hlrc.linea = hl.horlinea_id
WHERE
	hl.grupo > 0
	AND hl.jurisdiccion > 0
	AND hl.con_itinerario = 1
	AND hlr.tipo > 0
	AND (hlrc.sin_ruta_principal = 0
		OR hlrc.sin_ruta_principal IS NULL)
	AND hlrc.inactiva IS NULL
	AND hlrc.fuera_recorrido IS NULL;