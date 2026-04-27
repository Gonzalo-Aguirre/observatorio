WITH 
latlong_solbus AS (
SELECT
	lg.locgps_codigo,
	lg.locgps_latitud,
	lg.locgps_longitud,
	(LEFT(lg.locgps_latitud, 2) + SUBSTRING(lg.locgps_latitud, 3, 10) / 10000 / 60) * -1 AS latitudmaps,
	(LEFT(lg.locgps_longitud, 2) + SUBSTRING(lg.locgps_longitud, 3, 10) / 10000 / 60) * -1 AS longitudmaps
FROM
	megacontrol_solbuscba.localidad_gps lg
	-- ── SOLBUSCBA ─────────────────────────────────────────────
),
latlong_coniferal AS (
SELECT
	lg.locgps_codigo,
	lg.locgps_latitud,
	lg.locgps_longitud,
	(LEFT(lg.locgps_latitud, 2) + SUBSTRING(lg.locgps_latitud, 3, 10) / 10000 / 60) * -1 AS latitudmaps,
	(LEFT(lg.locgps_longitud, 2) + SUBSTRING(lg.locgps_longitud, 3, 10) / 10000 / 60) * -1 AS longitudmaps
FROM
	megacontrol_coniferal.localidad_gps lg
	-- ── CONIFERAL ─────────────────────────────────────────────
),
latlong_sibus AS (
SELECT
	lg.locgps_codigo,
	lg.locgps_latitud,
	lg.locgps_longitud,
	(LEFT(lg.locgps_latitud, 2) + SUBSTRING(lg.locgps_latitud, 3, 10) / 10000 / 60) * -1 AS latitudmaps,
	(LEFT(lg.locgps_longitud, 2) + SUBSTRING(lg.locgps_longitud, 3, 10) / 10000 / 60) * -1 AS longitudmaps
FROM
	megacontrol_sibuscba.localidad_gps lg
	-- ── SIBUSCBA ─────────────────────────────────────────────
),
latlong_tamse AS (
SELECT
	lg.locgps_codigo,
	lg.locgps_latitud,
	lg.locgps_longitud,
	(LEFT(lg.locgps_latitud, 2) + SUBSTRING(lg.locgps_latitud, 3, 10) / 10000 / 60) * -1 AS latitudmaps,
	(LEFT(lg.locgps_longitud, 2) + SUBSTRING(lg.locgps_longitud, 3, 10) / 10000 / 60) * -1 AS longitudmaps
FROM
	megacontrol_tamse.localidad_gps lg
	-- ── TAMSAU ─────────────────────────────────────────────
)
-- ── Sol Bus CBA ─────────────────────────────────────────────
SELECT
	DISTINCT
    hlr.hlr_locgps_codigo,
	'Sol Bus CBA' AS Empresa,
	hl.horlinea_nombre,
	lg.locgps_nombre,
	hlrc.hlrc_sentido,
	lg.locgps_latitud,
	lg.locgps_longitud,
	ll.latitudmaps,
	ll.longitudmaps
FROM
	megacontrol_solbuscba.horario_linea_ruta hlr
LEFT JOIN megacontrol_solbuscba.localidad_gps lg ON
	hlr.hlr_locgps_codigo = lg.locgps_codigo
LEFT JOIN latlong_solbus ll ON
	hlr.hlr_locgps_codigo = ll.locgps_codigo
LEFT JOIN megacontrol_solbuscba.horario_linea_ruta_cabecera hlrc ON
	hlr.hlr_hlrc_id = hlrc.hlrc_id
LEFT JOIN megacontrol_solbuscba.horario_linea hl ON
	hlrc.hlrc_linea = hl.horlinea_id
WHERE
	hl.horlinea_grupo > 0
	AND hl.horlinea_jurisdiccion > 0
	AND hl.horlinea_con_itinerario = 1
	AND hlr.hlr_tipo > 0
	AND (hlrc.hlrc_ruta_principal = 0
		OR hlrc.hlrc_ruta_principal IS NULL)
	AND hlrc.hlrc_inactiva IS NULL
	AND hlrc.hlrc_fuera_recorrido IS NULL
UNION ALL
-- ── Coniferal ────────────────────────────────────────────────
SELECT
	DISTINCT
    hlr.hlr_locgps_codigo,
	'Coniferal' AS Empresa,
	hl.horlinea_nombre,
	lg.locgps_nombre,
	hlrc.hlrc_sentido,
	lg.locgps_latitud,
	lg.locgps_longitud,
	ll.latitudmaps,
	ll.longitudmaps
FROM
	megacontrol_coniferal.horario_linea_ruta hlr
LEFT JOIN megacontrol_coniferal.localidad_gps lg ON
	hlr.hlr_locgps_codigo = lg.locgps_codigo
LEFT JOIN latlong_coniferal ll ON
	hlr.hlr_locgps_codigo = ll.locgps_codigo
LEFT JOIN megacontrol_coniferal.horario_linea_ruta_cabecera hlrc ON
	hlr.hlr_hlrc_id = hlrc.hlrc_id
LEFT JOIN megacontrol_coniferal.horario_linea hl ON
	hlrc.hlrc_linea = hl.horlinea_id
WHERE
	hl.horlinea_grupo > 0
	AND hl.horlinea_jurisdiccion > 0
	AND hl.horlinea_con_itinerario = 1
	AND hlr.hlr_tipo > 0
	AND (hlrc.hlrc_ruta_principal = 0
		OR hlrc.hlrc_ruta_principal IS NULL)
	AND hlrc.hlrc_inactiva IS NULL
	AND hlrc.hlrc_fuera_recorrido IS NULL
UNION ALL
-- ── SiBus CBA ────────────────────────────────────────────────
SELECT
	DISTINCT
    hlr.hlr_locgps_codigo,
	'SiBus CBA' AS Empresa,
	hl.horlinea_nombre,
	lg.locgps_nombre,
	hlrc.hlrc_sentido,
	lg.locgps_latitud,
	lg.locgps_longitud,
	ll.latitudmaps,
	ll.longitudmaps
FROM
	megacontrol_sibuscba.horario_linea_ruta hlr
LEFT JOIN megacontrol_sibuscba.localidad_gps lg ON
	hlr.hlr_locgps_codigo = lg.locgps_codigo
LEFT JOIN latlong_sibus ll ON
	hlr.hlr_locgps_codigo = ll.locgps_codigo
LEFT JOIN megacontrol_sibuscba.horario_linea_ruta_cabecera hlrc ON
	hlr.hlr_hlrc_id = hlrc.hlrc_id
LEFT JOIN megacontrol_sibuscba.horario_linea hl ON
	hlrc.hlrc_linea = hl.horlinea_id
WHERE
	hl.horlinea_grupo > 0
	AND hl.horlinea_jurisdiccion > 0
	AND hl.horlinea_con_itinerario = 1
	AND hlr.hlr_tipo > 0
	AND (hlrc.hlrc_ruta_principal = 0
		OR hlrc.hlrc_ruta_principal IS NULL)
	AND hlrc.hlrc_inactiva IS NULL
	AND hlrc.hlrc_fuera_recorrido IS NULL
UNION ALL
-- ── Tamsau ────────────────────────────────────────────────────
SELECT
	DISTINCT
    hlr.hlr_locgps_codigo,
	'Tamsau' AS Empresa,
	hl.horlinea_nombre,
	lg.locgps_nombre,
	hlrc.hlrc_sentido,
	lg.locgps_latitud,
	lg.locgps_longitud,
	ll.latitudmaps,
	ll.longitudmaps
FROM
	megacontrol_tamse.horario_linea_ruta hlr
LEFT JOIN megacontrol_tamse.localidad_gps lg ON
	hlr.hlr_locgps_codigo = lg.locgps_codigo
LEFT JOIN latlong_tamse ll ON
	hlr.hlr_locgps_codigo = ll.locgps_codigo
LEFT JOIN megacontrol_tamse.horario_linea_ruta_cabecera hlrc ON
	hlr.hlr_hlrc_id = hlrc.hlrc_id
LEFT JOIN megacontrol_tamse.horario_linea hl ON
	hlrc.hlrc_linea = hl.horlinea_id
WHERE
	hl.horlinea_grupo > 0
	AND hl.horlinea_jurisdiccion > 0
	AND hl.horlinea_con_itinerario = 1
	AND hlr.hlr_tipo > 0
	AND (hlrc.hlrc_ruta_principal = 0
		OR hlrc.hlrc_ruta_principal IS NULL)
	AND hlrc.hlrc_inactiva IS NULL
	AND hlrc.hlrc_fuera_recorrido IS NULL;