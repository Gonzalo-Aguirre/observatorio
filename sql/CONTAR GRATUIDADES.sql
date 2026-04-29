WITH fe AS (
	SELECT 
	DATE("2026-1-1") AS feinicio,
	DATE("2026-1-19") AS fefinal
)
	-- registros por empresa
SELECT 
    'Coniferal' AS empresa,
    COUNT(*) AS total
FROM megacontrol_coniferal.transaccion t
CROSS JOIN fe
WHERE t.trans_fecha BETWEEN fe.feinicio AND fe.fefinal 
    AND t.trans_tipo_comprobante = 69
