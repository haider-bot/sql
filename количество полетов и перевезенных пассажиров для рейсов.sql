SELECT
    t.trip_no AS trip_no,
    c.name AS company_name,
    t.town_from AS town_from,
    t.town_to AS town_to,
    COUNT(DISTINCT p_t.date_trip) AS cnt_flights,
    COUNT(p_t.id_psg) AS cnt_passengers
FROM
    Trip t
JOIN
    Company c ON t.id_comp = c.id_comp
JOIN
    Pass_in_trip p_t ON t.trip_no = p_t.trip_no
GROUP BY
    t.trip_no,
    c.name,
    t.town_from,
    t.town_to
ORDER BY
    t.trip_no;
