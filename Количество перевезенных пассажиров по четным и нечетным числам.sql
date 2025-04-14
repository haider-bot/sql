SELECT
    c.name AS name,
    SUM(CASE WHEN DAY(p_t.date_trip) % 2 = 0 THEN 1 ELSE 0 END) AS cnt_even,
    SUM(CASE WHEN DAY(p_t.date_trip) % 2 = 1 THEN 1 ELSE 0 END) AS cnt_odd
FROM
    Company c
JOIN
    Trip t ON c.id_comp = t.id_comp
JOIN
    Pass_in_trip p_t ON t.trip_no = p_t.trip_no
GROUP BY
    c.name
ORDER BY
    c.name;
