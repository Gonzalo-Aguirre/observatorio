-- ── SOL BUS CBA ─────────────────────────────────────────────
SELECT 
	hl.horlinea_nombre,
	"Sol Bus CBA" AS EmpresaTransporte,
	hlrc.hlrc_descripcion,
	hlrc.hlrc_sentido,
	hlrc.hlrc_kms ,
	hlr.hlr_orden,
	hlr.hlr_locgps_codigo,
	lg.locgps_nombre
FROM
	megacontrol_solbuscba.horario_linea hl
LEFT JOIN megacontrol_solbuscba.horario_linea_ruta_cabecera hlrc on
	hl.horlinea_id = hlrc.hlrc_linea
LEFT JOIN megacontrol_solbuscba.horario_linea_ruta hlr on
	hlrc.hlrc_id = hlr.hlr_hlrc_id
INNER JOIN megacontrol_solbuscba.localidad_gps lg ON
	hlr.hlr_locgps_codigo = lg.locgps_codigo
WHERE
	hl.horlinea_grupo > 0
	AND hl.horlinea_jurisdiccion > 0
	AND hl.horlinea_con_itinerario = 1
	AND hlr.hlr_tipo > 0
	AND (hlrc.hlrc_ruta_principal = 0
		OR hlrc.hlrc_ruta_principal is NULL)
	AND hlrc.hlrc_inactiva is NULL
	AND hlrc.hlrc_fuera_recorrido is NULL
UNION ALL
-- ── CONIFERAL ─────────────────────────────────────────────
 SELECT 
	hl.horlinea_nombre,
	"Coniferal" AS EmpresaTransporte,
	hlrc.hlrc_descripcion,
	hlrc.hlrc_sentido,
	hlrc.hlrc_kms ,
	hlr.hlr_orden,
	hlr.hlr_locgps_codigo,
	lg.locgps_nombre
FROM
	megacontrol_coniferal.horario_linea hl
LEFT JOIN megacontrol_coniferal.horario_linea_ruta_cabecera hlrc on
	hl.horlinea_id = hlrc.hlrc_linea
LEFT JOIN megacontrol_coniferal.horario_linea_ruta hlr on
	hlrc.hlrc_id = hlr.hlr_hlrc_id
INNER JOIN megacontrol_coniferal.localidad_gps lg ON
	hlr.hlr_locgps_codigo = lg.locgps_codigo
WHERE
	hl.horlinea_grupo > 0
	AND hl.horlinea_jurisdiccion > 0
	AND hl.horlinea_con_itinerario = 1
	AND hlr.hlr_tipo > 0
	AND (hlrc.hlrc_ruta_principal = 0
		OR hlrc.hlrc_ruta_principal is NULL)
	AND hlrc.hlrc_inactiva is NULL
	AND hlrc.hlrc_fuera_recorrido is NULL
UNION ALL
-- ── GRUPO FAM URBANO ───────────────────────────────────────────── (NO USAR)
/*SELECT 
	hl.horlinea_nombre, "Grupo FAM Urbano" AS EmpresaTransporte, hlrc.hlrc_descripcion, hlrc.hlrc_sentido, hlr.hlr_orden, hlr.hlr_locgps_codigo, lg.locgps_nombre 
FROM megacontrol_quebrachalurbano.horario_linea hl 
LEFT JOIN megacontrol_quebrachalurbano.horario_linea_ruta_cabecera hlrc on hl.horlinea_id = hlrc.hlrc_linea 
LEFT JOIN megacontrol_quebrachalurbano.horario_linea_ruta hlr on hlrc.hlrc_id = hlr.hlr_hlrc_id 
INNER  JOIN megacontrol_quebrachalurbano.localidad_gps lg ON hlr.hlr_locgps_codigo = lg.locgps_codigo 
	WHERE
    hl.horlinea_grupo > 0
    AND hl.horlinea_jurisdiccion > 0
    AND hl.horlinea_con_itinerario = 1
    AND hlr.hlr_tipo > 0
    AND (hlrc.hlrc_ruta_principal = 0 OR hlrc.hlrc_ruta_principal is NULL)
    AND hlrc.hlrc_inactiva is NULL 
    AND hlrc.hlrc_fuera_recorrido is NULL
    
UNION ALL*/
-- ── SI BUS CBA─────────────────────────────────────────────
SELECT 
	hl.horlinea_nombre,
	"SiBus CBA" AS EmpresaTransporte,
	hlrc.hlrc_descripcion,
	hlrc.hlrc_sentido,
	hlrc.hlrc_kms ,
	hlr.hlr_orden,
	hlr.hlr_locgps_codigo,
	lg.locgps_nombre
FROM
	megacontrol_sibuscba.horario_linea hl
LEFT JOIN megacontrol_sibuscba.horario_linea_ruta_cabecera hlrc on
	hl.horlinea_id = hlrc.hlrc_linea
LEFT JOIN megacontrol_sibuscba.horario_linea_ruta hlr on
	hlrc.hlrc_id = hlr.hlr_hlrc_id
INNER JOIN megacontrol_sibuscba.localidad_gps lg ON
	hlr.hlr_locgps_codigo = lg.locgps_codigo
WHERE
	hl.horlinea_grupo > 0
	AND hl.horlinea_jurisdiccion > 0
	AND hl.horlinea_con_itinerario = 1
	AND hlr.hlr_tipo > 0
	AND (hlrc.hlrc_ruta_principal = 0
		OR hlrc.hlrc_ruta_principal is NULL)
	AND hlrc.hlrc_inactiva is NULL
	AND hlrc.hlrc_fuera_recorrido is NULL
UNION ALL
-- ── TAMSAU ─────────────────────────────────────────────
SELECT 
	hl.horlinea_nombre,
	"Tamsau" AS EmpresaTransporte,
	hlrc.hlrc_descripcion,
	hlrc.hlrc_sentido,
	hlrc.hlrc_kms ,
	hlr.hlr_orden,
	hlr.hlr_locgps_codigo,
	lg.locgps_nombre
FROM
	megacontrol_tamse.horario_linea hl
LEFT JOIN megacontrol_tamse.horario_linea_ruta_cabecera hlrc on
	hl.horlinea_id = hlrc.hlrc_linea
LEFT JOIN megacontrol_tamse.horario_linea_ruta hlr on
	hlrc.hlrc_id = hlr.hlr_hlrc_id
INNER JOIN megacontrol_tamse.localidad_gps lg ON
	hlr.hlr_locgps_codigo = lg.locgps_codigo
WHERE
	hl.horlinea_grupo > 0
	AND hl.horlinea_jurisdiccion > 0
	AND hl.horlinea_con_itinerario = 1
	AND hlr.hlr_tipo > 0
	AND (hlrc.hlrc_ruta_principal = 0
		OR hlrc.hlrc_ruta_principal is NULL)
	AND hlrc.hlrc_inactiva is NULL
	AND hlrc.hlrc_fuera_recorrido is NULL