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
UNION ALL
SELECT 
    'Grupo FAM Urbano',
    COUNT(*)
FROM megacontrol_quebrachalurbano.transaccion t
CROSS JOIN fe
WHERE t.trans_fecha BETWEEN fe.feinicio AND fe.fefinal 
    AND t.trans_tipo_comprobante = 69
UNION ALL
SELECT 
    'SiBus CBA',
    COUNT(*)
FROM megacontrol_sibuscba.transaccion t
CROSS JOIN fe
WHERE t.trans_fecha BETWEEN fe.feinicio AND fe.fefinal 
    AND t.trans_tipo_comprobante = 69
UNION ALL
SELECT 
    'Tamsau',
    COUNT(*)
FROM megacontrol_tamse.transaccion t
CROSS JOIN fe
WHERE t.trans_fecha BETWEEN fe.feinicio AND fe.fefinal 
    AND t.trans_tipo_comprobante = 69
;
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
    	CUENTA REGISTROS POR EMPRESA POR COMPROBANTE Y TIPO DE CONTRATOS 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/   
WITH fe AS (
	SELECT 
	DATE("2026-1-1") AS feinicio,
	DATE("2026-1-19") AS fefinal
)
SELECT 
    'Coniferal' AS empresa,
    t.trans_tipo_comprobante,
    CASE 
        WHEN t.trans_tipo_comprobante = 69 THEN 'Tipo 69'
        WHEN t.trans_tipo_comprobante = 113 THEN 'Tipo 113'
    END AS descripcion_comprobante,
    COALESCE(cv.ct_nombre, 'Sin Contrato') AS contrato,
    COUNT(*) AS cantidad
FROM megacontrol_coniferal.transaccion t
LEFT JOIN megacontrol_coniferal.comprobante_venta cv ON t.trans_comp_venta_tipo = cv.ct_id
CROSS JOIN fe
WHERE t.trans_fecha BETWEEN fe.feinicio AND fe.fefinal 
    AND t.trans_tipo_comprobante IN (69, 113)
GROUP BY t.trans_tipo_comprobante, cv.ct_nombre
UNION ALL
SELECT
    'Grupo FAM Urbano' AS empresa,
    t.trans_tipo_comprobante,
    CASE 
        WHEN t.trans_tipo_comprobante = 69 THEN 'Tipo 69'
        WHEN t.trans_tipo_comprobante = 113 THEN 'Tipo 113'
    END AS descripcion_comprobante,
    COALESCE(cv.ct_nombre, 'Sin Contrato') AS contrato,
    COUNT(*) AS cantidad
FROM megacontrol_quebrachalurbano.transaccion t
LEFT JOIN megacontrol_coniferal.comprobante_venta cv ON t.trans_comp_venta_tipo = cv.ct_id
CROSS JOIN fe
WHERE t.trans_fecha BETWEEN fe.feinicio AND fe.fefinal 
    AND t.trans_tipo_comprobante IN (69, 113)
GROUP BY t.trans_tipo_comprobante, cv.ct_nombre
ORDER BY empresa, trans_tipo_comprobante, contrato;