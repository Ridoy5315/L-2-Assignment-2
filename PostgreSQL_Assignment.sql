-- Active: 1749389286230@@127.0.0.1@5432@conservation_db
-- Tables
CREATE TABLE rangers (
     ranger_id SERIAL PRIMARY KEY,
     name TEXT NOT NULL,
     region VARCHAR(30)
);

CREATE TABLE species (
     species_id SERIAL PRIMARY KEY,
     common_name VARCHAR(20) NOT NULL,
     scientific_name VARCHAR(50),
     discovery_date DATE,
     conservation_status VARCHAR(30) 
);

CREATE Table sightings (
     sighting_id SERIAL PRIMARY KEY,
     ranger_id INT,
     species_id INT,
     sighting_time TIMESTAMP,
     location TEXT,
     notes TEXT,
     Foreign Key (ranger_id) REFERENCES rangers(ranger_id),
     Foreign Key (species_id) REFERENCES species(species_id)
)

-- Data
INSERT INTO rangers (name, region) VALUES
('Alice Morgan', 'Yellowstone National'),
('Brian Singh', 'Serengeti Plains'),
('Carlos Ruiz', 'Amazon Rainforest'),
('Diana Chen', 'Banff National'),
('Ethan Patel', 'Kruger Park'),
('Fatima Ahmed', 'Yosemite Valley');

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES 
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('African Elephant', 'Loxodonta africana', '1797-01-01', 'Vulnerable'),
('Giant Panda', 'Ailuropoda melanoleuca', '1869-03-11', 'Vulnerable'),
('Bald Eagle', 'Haliaeetus leucocephalus', '1766-06-20', 'Least Concern'),
('Tasmanian Devil', 'Sarcophilus harrisii', '1807-01-01', 'Endangered'),
('Blue Whale', 'Balaenoptera musculus', '1758-01-01', 'Endangered'),
('Komodo Dragon', 'Varanus komodoensis', '1910-01-01', 'Vulnerable'),
('Green Sea Turtle', 'Chelonia mydas', '1758-01-01', 'Endangered'),
('American Alligator', 'Alligator mississippiensis', '1807-01-01', 'Least Concern'),
('Dodo', 'Raphus cucullatus', '1598-01-01', 'Extinct');

INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes) VALUES 
(1, 1, '2025-06-01 08:30:00', 'Northern Mountains', 'Spotted near the cliffs'),
(2, 3, '2025-06-02 10:00:00', 'Eastern Forest', 'Feeding observed'),
(3, 6, '2025-06-03 14:15:00', 'Riverbank', 'Group of 5 observed'),
(1, 4, '2025-06-04 16:45:00', 'Wetlands', 'Nest nearby'),
(4, 5, '2025-06-05 09:00:00', 'Southern Plains', NULL),
(2, 6, '2025-06-06 11:30:00', 'Coastal Region', 'Single adult spotted'),
(6, 7, '2025-06-07 13:00:00', 'Grasslands', 'Juveniles seen playing'),
(4, 8, '2025-06-08 15:20:00', 'Coral Reefs', 'Healthy population'),
(1, 3, '2025-06-09 07:50:00', 'Swamp Area', 'Tracks found nearby'),
(2, 5, '2025-06-10 12:10:00', 'Island', 'No sightings for a week prior'),
(3, 1, '2025-06-11 09:40:00', 'Mountain Pass', 'Spotted in dense foliage'),
(6, 3, '2025-06-12 14:05:00', 'River Delta', 'Healthy population'),
(1, 2, '2025-06-13 10:25:00', 'Forest Edge', 'Group moving east'),
(2, 4, '2025-06-14 16:00:00', 'Marshlands', 'Nest disturbed'),
(3, 10, '2025-06-15 08:15:00', 'Open Savannah', 'Two adults together'),
(4, 2, '2025-06-16 11:55:00', 'Beachfront', 'Tracks indicate multiple individuals'),
(1, 5, '2025-06-17 13:30:00', 'Grassland Hills', 'One adult seen'),
(2, 8, '2025-06-18 15:45:00', 'Reef Zone', 'Healthy coral sighting'),
(3, 4, '2025-06-19 07:10:00', 'Swamp Area', NULL),
(4, 10, '2025-06-20 12:50:00', 'Island Shore', 'No recent sightings before this');

SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;


-- Problem 1
INSERT INTO rangers (name, region) VALUES ('Darek Fox', 'Costal Plains');


-- Problem 2
SELECT count(DISTINCT species_id) AS unique_species_count  FROM sightings;


-- Problem 3
SELECT * FROM sightings
  WHERE location LIKE '%Pass%';


-- Problem 4
SELECT r.name, count(r.name)AS total_sightings FROM rangers r
 JOIN sightings s ON r.ranger_id = s.ranger_id
  GROUP BY r.name;


-- Problem 5
SELECT sp.common_name FROM species sp
LEFT JOIN sightings s ON sp.species_id = s.species_id
WHERE s.species_id IS NULL;


-- Problem 6
SELECT sp.common_name, s.sighting_time, r.name FROM sightings s
JOIN rangers r ON s.ranger_id = r.ranger_id
JOIN species sp ON s.species_id = sp.species_id
ORDER BY sighting_time DESC LIMIT 2;


-- Problem 7
UPDATE species
SET conservation_status = 'Historic'
WHERE EXTRACT(YEAR FROM discovery_date) < 1800;


-- Problem 8
SELECT sighting_id,
CASE 
     WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN  'Morning'
     WHEN EXTRACT(HOUR FROM sighting_time) < 17 THEN  'Afternoon'
     ELSE  'Evening'
END AS time_of_day FROM sightings;


-- Problem 9
DELETE FROM rangers
WHERE ranger_id NOT IN (
     SELECT ranger_id FROM sightings
);