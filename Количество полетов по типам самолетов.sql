SELECT
    p.name AS name,
    t.plane AS plane,
    COUNT(p_t.trip_no) AS cnt_trip
FROM
    Passenger p
JOIN
    Pass_in_trip p_t ON p.id_psg = p_t.id_psg
JOIN
    Trip t ON p_t.trip_no = t.trip_no
GROUP BY
    p.id_psg,
    p.name,
    t.plane
ORDER BY
    p.name,
    cnt_trip DESC;
