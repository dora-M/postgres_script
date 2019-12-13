--distance between two places


CREATE DATABASE route;
\c route

CREATE TABLE route(
route_id varchar(20),
route_name varchar(20)
);

CREATE TABLE route_mailstone(
route_id varchar(20),
place varchar(50),
mailstone int
);

CREATE TABLE distance(
departure_place varchar(50),
arrival_place varchar(50)
);

INSERT INTO route VALUES
 ('1a','route_1a')
,('1b','route_1b');

INSERT INTO route_mailstone VALUES
 ('1a','place_1', 0)
,('1a','place_2', 20);

INSERT INTO distance VALUES
 ('place_1', 'place_2');

--distance between two places
SELECT 
 departure_place
,arrival_place
,departure_place || ' - ' || arrival_place as distance_name
,CASE WHEN route_mailstone_arrival.route_id = route_mailstone_departure.route_id
THEN @(route_mailstone_arrival.mailstone - route_mailstone_departure.mailstone)
END AS distance_mail
FROM distance 
	JOIN route_mailstone AS route_mailstone_departure
		ON distance.departure_place = route_mailstone_departure.place
	JOIN route_mailstone AS route_mailstone_arrival
		ON   distance.arrival_place =   route_mailstone_arrival.place;

