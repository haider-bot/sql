SELECT
    c.name AS name,
    MONTH(p_t.date_trip) AS month_trip,
    YEAR(p_t.date_trip) AS year_trip,
    COUNT(p_t.id_psg) AS cnt_trip
FROM
    Company c
JOIN
    Trip t ON c.id_comp = t.id_comp
JOIN
    Pass_in_trip p_t ON t.trip_no = p_t.trip_no
GROUP BY
    c.name,
    MONTH(p_t.date_trip),
    YEAR(p_t.date_trip)
ORDER BY
    year_trip ASC,
    month_trip ASC,
    cnt_trip DESC;
