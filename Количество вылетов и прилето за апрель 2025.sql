-- Подсчет количества вылетов (cnt_out)
SELECT
    t.town_from AS Town,
    COUNT(*) AS cnt_out,
    0 AS cnt_in
INTO #TempOut
FROM
    Trip t
JOIN
    Pass_in_trip p ON t.trip_no = p.trip_no
WHERE
    p.date_trip BETWEEN '2025-04-01' AND '2025-04-30'
GROUP BY
    t.town_from

UNION ALL

-- Подсчет количества прилетов (cnt_in)
SELECT
    t.town_to AS Town,
    0 AS cnt_out,
    COUNT(*) AS cnt_in
FROM
    Trip t
JOIN
    Pass_in_trip p ON t.trip_no = p.trip_no
WHERE
    p.date_trip BETWEEN '2025-04-01' AND '2025-04-30'
GROUP BY
    t.town_to;

-- Объединение данных
SELECT
    Town,
    SUM(cnt_out) AS cnt_out,
    SUM(cnt_in) AS cnt_in
FROM
    #TempOut
GROUP BY
    Town
ORDER BY
    Town;

-- Удаление временной таблицы
DROP TABLE #TempOut;
