--  on veut la liste des passagers (nom, email, genre, etc.) qui ont transité par un aéroport de France
--  on veut donc:
--  --  les vols partant ou arrivant d'un aéroport français
--  --  les bookings pour chaque passager

--       p2.birthdate, p2.sex, p2.street, p2.city, p2.zip, p2.country, p2.emailaddress, p2.telephoneno

SET SESSION profiling = 1;

SELECT
    p.firstname, p.lastname, p.birthdate, p.sex, p.street,
    p.city, p.zip, p.country, p.emailaddress, p.telephoneno
FROM (
    SELECT
        B.passenger_id
    FROM
        booking B
    LEFT JOIN ( -- all the flights from or to France
        SELECT
            F.flight_id
        FROM
            flight F
        LEFT JOIN (
            SELECT
                A.airport_id
            FROM
                airport_geo A
            WHERE
                A.country = 'FRANCE'
        ) AS S1
        ON
            F.`to` = S1.airport_id
        UNION DISTINCT
        SELECT
            F.flight_id
        FROM
            flight F
            LEFT JOIN (
            SELECT
            A.airport_id
            FROM
            airport_geo A
            WHERE
            A.country = 'FRANCE'
            ) AS S1
        ON
            F.`from` = S1.airport_id
    ) AS S2
    ON
        B.flight_id = S2.flight_id
) AS S
LEFT JOIN
     V_passenger_details p
ON
    S.passenger_id = p.passenger_id;
