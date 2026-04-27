SELECT * FROM (

    -- ══════════════════════════════════════════════════════════════
    -- EMPRESA: megacontrol_coniferal
    -- ══════════════════════════════════════════════════════════════
    SELECT
        'megacontrol_coniferal' AS empresa,
        COALESCE(a6.infogps_vehiculo, d6.infogps_vehiculo, a9.infogps_vehiculo, d9.infogps_vehiculo) AS infogps_vehiculo,
        a6.marca_antes,    a6.lat_antes,    a6.long_antes,
        d6.marca_despues6, d6.lat_despues6, d6.long_despues6,
        a9.marca_antes9,   a9.lat_antes9,   a9.long_antes9,
        d9.marca_despues9, d9.lat_despues9, d9.long_despues9
    FROM (
        SELECT i.infogps_vehiculo
        FROM megacontrol_coniferal.infogps i
        WHERE i.infogps_fechayhora BETWEEN '2026-03-06 00:00' AND '2026-03-06 23:59'
        GROUP BY i.infogps_vehiculo
    ) fra
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MAX(i.infogps_fechayhora) AS marca_antes,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora DESC), ',', 1) AS lat_antes,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora DESC), ',', 1) AS long_antes
        FROM megacontrol_coniferal.infogps i
        WHERE i.infogps_fechayhora >= '2026-03-05 00:00' AND i.infogps_fechayhora < '2026-03-06 00:00'
        GROUP BY i.infogps_vehiculo
    ) a6 ON fra.infogps_vehiculo = a6.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MIN(i.infogps_fechayhora) AS marca_despues6,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora ASC), ',', 1) AS lat_despues6,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora ASC), ',', 1) AS long_despues6
        FROM megacontrol_coniferal.infogps i
        WHERE i.infogps_fechayhora > '2026-03-06 00:00:00' AND i.infogps_fechayhora <= '2026-03-07 23:59'
        GROUP BY i.infogps_vehiculo
    ) d6 ON fra.infogps_vehiculo = d6.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MAX(i.infogps_fechayhora) AS marca_antes9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora DESC), ',', 1) AS lat_antes9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora DESC), ',', 1) AS long_antes9
        FROM megacontrol_coniferal.infogps i
        WHERE i.infogps_fechayhora >= '2026-03-08 00:00:00' AND i.infogps_fechayhora < '2026-03-09 23:59:59'
        GROUP BY i.infogps_vehiculo
    ) a9 ON fra.infogps_vehiculo = a9.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MIN(i.infogps_fechayhora) AS marca_despues9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora ASC), ',', 1) AS lat_despues9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora ASC), ',', 1) AS long_despues9
        FROM megacontrol_coniferal.infogps i
        WHERE i.infogps_fechayhora > '2026-03-09 23:59:59' AND i.infogps_fechayhora <= '2026-03-10 23:59:59'
        GROUP BY i.infogps_vehiculo
    ) d9 ON fra.infogps_vehiculo = d9.infogps_vehiculo

    UNION ALL

    -- ══════════════════════════════════════════════════════════════
    -- EMPRESA: megacontrol_quebrachalurbano
    -- ══════════════════════════════════════════════════════════════
    SELECT
        'megacontrol_quebrachalurbano' AS empresa,
        COALESCE(a6.infogps_vehiculo, d6.infogps_vehiculo, a9.infogps_vehiculo, d9.infogps_vehiculo) AS infogps_vehiculo,
        a6.marca_antes,    a6.lat_antes,    a6.long_antes,
        d6.marca_despues6, d6.lat_despues6, d6.long_despues6,
        a9.marca_antes9,   a9.lat_antes9,   a9.long_antes9,
        d9.marca_despues9, d9.lat_despues9, d9.long_despues9
    FROM (
        SELECT i.infogps_vehiculo
        FROM megacontrol_quebrachalurbano.infogps i
        WHERE i.infogps_fechayhora BETWEEN '2026-03-06 00:00' AND '2026-03-06 23:59'
        GROUP BY i.infogps_vehiculo
    ) fra
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MAX(i.infogps_fechayhora) AS marca_antes,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora DESC), ',', 1) AS lat_antes,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora DESC), ',', 1) AS long_antes
        FROM megacontrol_quebrachalurbano.infogps i
        WHERE i.infogps_fechayhora >= '2026-03-05 00:00' AND i.infogps_fechayhora < '2026-03-06 00:00'
        GROUP BY i.infogps_vehiculo
    ) a6 ON fra.infogps_vehiculo = a6.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MIN(i.infogps_fechayhora) AS marca_despues6,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora ASC), ',', 1) AS lat_despues6,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora ASC), ',', 1) AS long_despues6
        FROM megacontrol_quebrachalurbano.infogps i
        WHERE i.infogps_fechayhora > '2026-03-06 00:00:00' AND i.infogps_fechayhora <= '2026-03-07 23:59'
        GROUP BY i.infogps_vehiculo
    ) d6 ON fra.infogps_vehiculo = d6.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MAX(i.infogps_fechayhora) AS marca_antes9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora DESC), ',', 1) AS lat_antes9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora DESC), ',', 1) AS long_antes9
        FROM megacontrol_quebrachalurbano.infogps i
        WHERE i.infogps_fechayhora >= '2026-03-08 00:00:00' AND i.infogps_fechayhora < '2026-03-09 23:59:59'
        GROUP BY i.infogps_vehiculo
    ) a9 ON fra.infogps_vehiculo = a9.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MIN(i.infogps_fechayhora) AS marca_despues9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora ASC), ',', 1) AS lat_despues9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora ASC), ',', 1) AS long_despues9
        FROM megacontrol_quebrachalurbano.infogps i
        WHERE i.infogps_fechayhora > '2026-03-09 23:59:59' AND i.infogps_fechayhora <= '2026-03-10 23:59:59'
        GROUP BY i.infogps_vehiculo
    ) d9 ON fra.infogps_vehiculo = d9.infogps_vehiculo

    UNION ALL

    -- ══════════════════════════════════════════════════════════════
    -- EMPRESA: megacontrol_sibuscba
    -- ══════════════════════════════════════════════════════════════
    SELECT
        'megacontrol_sibuscba' AS empresa,
        COALESCE(a6.infogps_vehiculo, d6.infogps_vehiculo, a9.infogps_vehiculo, d9.infogps_vehiculo) AS infogps_vehiculo,
        a6.marca_antes,    a6.lat_antes,    a6.long_antes,
        d6.marca_despues6, d6.lat_despues6, d6.long_despues6,
        a9.marca_antes9,   a9.lat_antes9,   a9.long_antes9,
        d9.marca_despues9, d9.lat_despues9, d9.long_despues9
    FROM (
        SELECT i.infogps_vehiculo
        FROM megacontrol_sibuscba.infogps i
        WHERE i.infogps_fechayhora BETWEEN '2026-03-06 00:00' AND '2026-03-06 23:59'
        GROUP BY i.infogps_vehiculo
    ) fra
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MAX(i.infogps_fechayhora) AS marca_antes,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora DESC), ',', 1) AS lat_antes,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora DESC), ',', 1) AS long_antes
        FROM megacontrol_sibuscba.infogps i
        WHERE i.infogps_fechayhora >= '2026-03-05 00:00' AND i.infogps_fechayhora < '2026-03-06 00:00'
        GROUP BY i.infogps_vehiculo
    ) a6 ON fra.infogps_vehiculo = a6.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MIN(i.infogps_fechayhora) AS marca_despues6,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora ASC), ',', 1) AS lat_despues6,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora ASC), ',', 1) AS long_despues6
        FROM megacontrol_sibuscba.infogps i
        WHERE i.infogps_fechayhora > '2026-03-06 00:00:00' AND i.infogps_fechayhora <= '2026-03-07 23:59'
        GROUP BY i.infogps_vehiculo
    ) d6 ON fra.infogps_vehiculo = d6.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MAX(i.infogps_fechayhora) AS marca_antes9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora DESC), ',', 1) AS lat_antes9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora DESC), ',', 1) AS long_antes9
        FROM megacontrol_sibuscba.infogps i
        WHERE i.infogps_fechayhora >= '2026-03-08 00:00:00' AND i.infogps_fechayhora < '2026-03-09 23:59:59'
        GROUP BY i.infogps_vehiculo
    ) a9 ON fra.infogps_vehiculo = a9.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MIN(i.infogps_fechayhora) AS marca_despues9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora ASC), ',', 1) AS lat_despues9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora ASC), ',', 1) AS long_despues9
        FROM megacontrol_sibuscba.infogps i
        WHERE i.infogps_fechayhora > '2026-03-09 23:59:59' AND i.infogps_fechayhora <= '2026-03-10 23:59:59'
        GROUP BY i.infogps_vehiculo
    ) d9 ON fra.infogps_vehiculo = d9.infogps_vehiculo

    UNION ALL

    -- ══════════════════════════════════════════════════════════════
    -- EMPRESA: megacontrol_solbuscba
    -- ══════════════════════════════════════════════════════════════
    SELECT
        'megacontrol_solbuscba' AS empresa,
        COALESCE(a6.infogps_vehiculo, d6.infogps_vehiculo, a9.infogps_vehiculo, d9.infogps_vehiculo) AS infogps_vehiculo,
        a6.marca_antes,    a6.lat_antes,    a6.long_antes,
        d6.marca_despues6, d6.lat_despues6, d6.long_despues6,
        a9.marca_antes9,   a9.lat_antes9,   a9.long_antes9,
        d9.marca_despues9, d9.lat_despues9, d9.long_despues9
    FROM (
        SELECT i.infogps_vehiculo
        FROM megacontrol_solbuscba.infogps i
        WHERE i.infogps_fechayhora BETWEEN '2026-03-06 00:00' AND '2026-03-06 23:59'
        GROUP BY i.infogps_vehiculo
    ) fra
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MAX(i.infogps_fechayhora) AS marca_antes,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora DESC), ',', 1) AS lat_antes,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora DESC), ',', 1) AS long_antes
        FROM megacontrol_solbuscba.infogps i
        WHERE i.infogps_fechayhora >= '2026-03-05 00:00' AND i.infogps_fechayhora < '2026-03-06 00:00'
        GROUP BY i.infogps_vehiculo
    ) a6 ON fra.infogps_vehiculo = a6.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MIN(i.infogps_fechayhora) AS marca_despues6,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora ASC), ',', 1) AS lat_despues6,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora ASC), ',', 1) AS long_despues6
        FROM megacontrol_solbuscba.infogps i
        WHERE i.infogps_fechayhora > '2026-03-06 00:00:00' AND i.infogps_fechayhora <= '2026-03-07 23:59'
        GROUP BY i.infogps_vehiculo
    ) d6 ON fra.infogps_vehiculo = d6.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MAX(i.infogps_fechayhora) AS marca_antes9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora DESC), ',', 1) AS lat_antes9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora DESC), ',', 1) AS long_antes9
        FROM megacontrol_solbuscba.infogps i
        WHERE i.infogps_fechayhora >= '2026-03-08 00:00:00' AND i.infogps_fechayhora < '2026-03-09 23:59:59'
        GROUP BY i.infogps_vehiculo
    ) a9 ON fra.infogps_vehiculo = a9.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MIN(i.infogps_fechayhora) AS marca_despues9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora ASC), ',', 1) AS lat_despues9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora ASC), ',', 1) AS long_despues9
        FROM megacontrol_solbuscba.infogps i
        WHERE i.infogps_fechayhora > '2026-03-09 23:59:59' AND i.infogps_fechayhora <= '2026-03-10 23:59:59'
        GROUP BY i.infogps_vehiculo
    ) d9 ON fra.infogps_vehiculo = d9.infogps_vehiculo

    UNION ALL

    -- ══════════════════════════════════════════════════════════════
    -- EMPRESA: megacontrol_tamse
    -- ══════════════════════════════════════════════════════════════
    SELECT
        'megacontrol_tamse' AS empresa,
        COALESCE(a6.infogps_vehiculo, d6.infogps_vehiculo, a9.infogps_vehiculo, d9.infogps_vehiculo) AS infogps_vehiculo,
        a6.marca_antes,    a6.lat_antes,    a6.long_antes,
        d6.marca_despues6, d6.lat_despues6, d6.long_despues6,
        a9.marca_antes9,   a9.lat_antes9,   a9.long_antes9,
        d9.marca_despues9, d9.lat_despues9, d9.long_despues9
    FROM (
        SELECT i.infogps_vehiculo
        FROM megacontrol_tamse.infogps i
        WHERE i.infogps_fechayhora BETWEEN '2026-03-06 00:00' AND '2026-03-06 23:59'
        GROUP BY i.infogps_vehiculo
    ) fra
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MAX(i.infogps_fechayhora) AS marca_antes,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora DESC), ',', 1) AS lat_antes,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora DESC), ',', 1) AS long_antes
        FROM megacontrol_tamse.infogps i
        WHERE i.infogps_fechayhora >= '2026-03-05 00:00' AND i.infogps_fechayhora < '2026-03-06 00:00'
        GROUP BY i.infogps_vehiculo
    ) a6 ON fra.infogps_vehiculo = a6.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MIN(i.infogps_fechayhora) AS marca_despues6,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora ASC), ',', 1) AS lat_despues6,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora ASC), ',', 1) AS long_despues6
        FROM megacontrol_tamse.infogps i
        WHERE i.infogps_fechayhora > '2026-03-06 00:00:00' AND i.infogps_fechayhora <= '2026-03-07 23:59'
        GROUP BY i.infogps_vehiculo
    ) d6 ON fra.infogps_vehiculo = d6.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MAX(i.infogps_fechayhora) AS marca_antes9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora DESC), ',', 1) AS lat_antes9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora DESC), ',', 1) AS long_antes9
        FROM megacontrol_tamse.infogps i
        WHERE i.infogps_fechayhora >= '2026-03-08 00:00:00' AND i.infogps_fechayhora < '2026-03-09 23:59:59'
        GROUP BY i.infogps_vehiculo
    ) a9 ON fra.infogps_vehiculo = a9.infogps_vehiculo
    LEFT JOIN (
        SELECT i.infogps_vehiculo,
               MIN(i.infogps_fechayhora) AS marca_despues9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora ASC), ',', 1) AS lat_despues9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora ASC), ',', 1) AS long_despues9
        FROM megacontrol_tamse.infogps i
        WHERE i.infogps_fechayhora > '2026-03-09 23:59:59' AND i.infogps_fechayhora <= '2026-03-10 23:59:59'
        GROUP BY i.infogps_vehiculo
    ) d9 ON fra.infogps_vehiculo = d9.infogps_vehiculo

) resultado
ORDER BY empresa, infogps_vehiculo;