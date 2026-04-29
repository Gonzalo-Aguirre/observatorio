-- ── SOL BUS CBA ─────────────────────────────────────────────
SELECT 
	hl.nombre_linea,
	"Sol Bus CBA" AS EmpresaTransporte,
	hlrc.descripcion,
	hlrc.sentido,
	hlrc.kms ,
	hlr.orden,
	hlr.codigo_id,
	lg.parada_nombre
FROM
	solbus.horarioL hl
LEFT JOIN solbus.horarioL_ruta_cabecera hlrc on
	hl.horlinea_id = hlrc.hlrc_linea
LEFT JOIN solbus.horarioL_ruta hlr on
	hlrc.hlrc_id = hlr.hlr_hlrc_id
INNER JOIN solbus.localidad_gps lg ON
	hlr.codigo_id = lg.locgps_id

WHERE
	hl.grupo > 0
	AND hl.jurisdiccion > 0
	AND hl.itinerario = 1
	AND hlr.tipo > 0
	AND (hlrc.sin_ruta_principal = 0
		OR hlrc.sin_ruta_principal is NULL)
	AND hlrc.inactiva is NULL
	AND hlrc.fuera_recorrido is NULL
