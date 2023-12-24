CREATE OR REPLACE VIEW V_passenger_details
AS SELECT passenger.passenger_id, passenger.firstname, passenger.lastname,
          passengerdetails.birthdate, passengerdetails.sex, passengerdetails.street, passengerdetails.city, passengerdetails.zip,
          passengerdetails.country, passengerdetails.emailaddress, passengerdetails.telephoneno
   FROM passenger
            INNER JOIN passengerdetails ON passenger.passenger_id = passengerdetails.passenger_id;

SELECT * FROM V_passenger_details;

ALTER TABLE `airport_geo` ADD INDEX `airport_geo_idx_country` (`country`);
ALTER TABLE `booking` ADD INDEX `booking_idx_passenger_id` (`passenger_id`);
ALTER TABLE `flight` ADD INDEX `flight_idx_to` (`to`);
ALTER TABLE `flight` ADD INDEX `flight_idx_from` (`from`);

