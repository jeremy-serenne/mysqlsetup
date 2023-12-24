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
    SELECT DISTINCT
        B.passenger_id
    FROM
        booking B
    WHERE EXISTS ( -- all the flights from or to France
        SELECT
            F.flight_id
        FROM
            flight F
        WHERE EXISTS (
            SELECT
                A.airport_id
            FROM
                airport_geo A
            WHERE
                A.country = 'FRANCE'
        ) AND F.`to` = B.flight_id
        UNION DISTINCT -- better than using: F.`to` = B.flight_id or F.`from` = B.flight_id
        SELECT
            F.flight_id
        FROM
            flight F
        WHERE EXISTS (
            SELECT
                A.airport_id
            FROM
                airport_geo A
            WHERE
                    A.country = 'FRANCE'
        ) AND F.`from` = B.flight_id
    )
) AS S
RIGHT JOIN
    V_passenger_details AS p
ON
    S.passenger_id = p.passenger_id;
