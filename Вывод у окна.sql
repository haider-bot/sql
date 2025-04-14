SELECT
    p.name AS Name_psg,
    c.name AS Name_comp,
    CONVERT(VARCHAR, t.time_out, 120) + ' ' + CONVERT(VARCHAR, p_t.date_trip, 120) AS dt_out,
    t.town_from,
    t.town_to
FROM
    Passenger p
JOIN
    Pass_in_trip p_t ON p.id_psg = p_t.id_psg
JOIN
    Trip t ON p_t.trip_no = t.trip_no
JOIN
    Company c ON t.id_comp = c.id_comp
WHERE
    p_t.place LIKE '%a' OR p_t.place LIKE '%d';
