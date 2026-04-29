    -- ══════════════════════════════════════════════════════════════
    -- EMPRESA: coniferal
    -- ══════════════════════════════════════════════════════════════
    SELECT
        'coniferal' AS empresa,
        COALESCE(a6.gps_veiculo, d6.gps_veiculo, a9.gps_veiculo, d9.gps_veiculo) AS gps_veiculo,
        a6.marca_antes,    a6.lat_antes,    a6.long_antes,
        d6.marca_despues6, d6.lat_despues6, d6.long_despues6,
        a9.marca_antes9,   a9.lat_antes9,   a9.long_antes9,
        d9.marca_despues9, d9.lat_despues9, d9.long_despues9
    FROM (
        SELECT i.gps_veiculo
        FROM coniferal.info_gps i
        WHERE i.infogps_fechayhora BETWEEN '2026-03-06 00:00' AND '2026-03-06 23:59'
        GROUP BY i.gps_veiculo
    ) fra
    LEFT JOIN (
        SELECT i.gps_veiculo,
               MAX(i.infogps_fechayhora) AS marca_antes,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora DESC), ',', 1) AS lat_antes,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora DESC), ',', 1) AS long_antes
        FROM coniferal.info_gps i
        WHERE i.infogps_fechayhora >= '2026-03-05 00:00' AND i.infogps_fechayhora < '2026-03-06 00:00'
        GROUP BY i.gps_veiculo
    ) a6 ON fra.gps_veiculo = a6.gps_veiculo
    LEFT JOIN (
        SELECT i.gps_veiculo,
               MIN(i.infogps_fechayhora) AS marca_despues6,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora ASC), ',', 1) AS lat_despues6,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora ASC), ',', 1) AS long_despues6
        FROM coniferal.info_gps i
        WHERE i.infogps_fechayhora > '2026-03-06 00:00:00' AND i.infogps_fechayhora <= '2026-03-07 23:59'
        GROUP BY i.gps_veiculo
    ) d6 ON fra.gps_veiculo = d6.gps_veiculo
    LEFT JOIN (
        SELECT i.gps_veiculo,
               MAX(i.infogps_fechayhora) AS marca_antes9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora DESC), ',', 1) AS lat_antes9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora DESC), ',', 1) AS long_antes9
        FROM coniferal.info_gps i
        WHERE i.infogps_fechayhora >= '2026-03-08 00:00:00' AND i.infogps_fechayhora < '2026-03-09 23:59:59'
        GROUP BY i.gps_veiculo
    ) a9 ON fra.gps_veiculo = a9.gps_veiculo
    LEFT JOIN (
        SELECT i.gps_veiculo,
               MIN(i.infogps_fechayhora) AS marca_despues9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_lat  ORDER BY i.infogps_fechayhora ASC), ',', 1) AS lat_despues9,
               SUBSTRING_INDEX(GROUP_CONCAT(i.infogps_long ORDER BY i.infogps_fechayhora ASC), ',', 1) AS long_despues9
        FROM coniferal.info_gps i
        WHERE i.infogps_fechayhora > '2026-03-09 23:59:59' AND i.infogps_fechayhora <= '2026-03-10 23:59:59'
        GROUP BY i.gps_veiculo
    ) d9 ON fra.gps_veiculo = d9.gps_veiculo

