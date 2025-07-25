CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

INSERT INTO rangers (name, region) VALUES
('Mera', 'North Zone'),
('Ravi', 'South Zone'),
('Sita', 'West Zone'),
('Anil', 'Central Zone'),
('Priya', 'North Zone'),
('Raj', 'South Zone'),
('Kiran', 'West Zone'),
('Vikram', 'Central Zone'),
('Anita', 'East Zone');

DELETE FROM rangers;

SELECT * from rangers;

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Shadow Leopard', 'Panthera uncia', '1758-01-01', 'Endangered'),
('Golden Langur', 'Trachypithecus geei', '1953-01-01', 'Vulnerable'),
('Indian Pangolin', 'Manis crassicaudata', '1822-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Endangered');

SELECT * FROM species;



CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location VARCHAR(100),
    notes TEXT
);

-- problem 1
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 46, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 47, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 48, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 49, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

SELECT * FROM sightings;

-- problem 2
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;

-- problem 3
SELECT * FROM sightings WHERE location ILIKE '%Pass%';

--problem 4
SELECT r.name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name;

-- problem 5
SELECT common_name FROM species
WHERE species_id NOT IN (SELECT DISTINCT species_id FROM sightings);

-- problem 6
SELECT sp.common_name, s.sighting_time, r.name 
FROM sightings s
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC
LIMIT 2;

-- problem 7
UPDATE species
SET conservation_status = 'Endangered'
WHERE discovery_date < '1800-01-01';

-- problem 8
SELECT sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

-- problem 9
DELETE FROM rangers
WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings);