SELECT
    c.name AS name,
    t.plane AS plane,
    COUNT(p_t.id_psg) AS cnt_pass
FROM
    Company c
JOIN
    Trip t ON c.id_comp = t.id_comp
JOIN
    Pass_in_trip p_t ON t.trip_no = p_t.trip_no
GROUP BY
    c.name,
    t.plane
ORDER BY
    c.name,
    t.plane;
