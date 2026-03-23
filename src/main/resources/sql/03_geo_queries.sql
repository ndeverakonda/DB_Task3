--1

--a
SELECT id, name
FROM countries
ORDER BY population DESC
    LIMIT 1;

--b
SELECT name
FROM countries
ORDER BY (population::numeric / area) ASC
    LIMIT 10;

--c
SELECT id, name, population, area
FROM countries
WHERE (population::numeric / area) > (
    SELECT AVG(population::numeric / area)
    FROM countries
)
ORDER BY (population::numeric / area) DESC;

--d
SELECT id, name, population, area
FROM countries
WHERE LENGTH(name) = (
    SELECT MAX(LENGTH(name))
    FROM countries
);

--e
SELECT id, name
FROM countries
WHERE name ILIKE '%f%'
ORDER BY name ASC;

--f
SELECT name, id
FROM countries
ORDER BY ABS(
                 (SELECT AVG(population)
                  FROM countries) - population
         ) ASC
    LIMIT 1;


--4

--a
SELECT c.id, c.name AS continent_name, COUNT(co.id) AS country_count
FROM continents c
         LEFT JOIN countries co ON c.id = co.continent_id
GROUP BY c.id, c.name
ORDER BY c.name;

--b
SELECT c.name, SUM(co.area) AS total_area
FROM continents c
         LEFT JOIN countries co ON c.id = co.continent_id
GROUP BY c.name
ORDER BY total_area DESC;

--c
SELECT c.name, AVG(co.population::numeric / co.area) AS density
FROM continents c
         LEFT JOIN countries co ON c.id = co.continent_id
GROUP BY c.name
ORDER BY c.name;

--d
SELECT c.name, co.name, co.area
FROM continents c
         LEFT JOIN countries co ON c.id = co.continent_id
WHERE co.area = (
    SELECT MIN(c2.area)
    FROM countries c2
    WHERE c2.continent_id = c.id
)
ORDER BY c.name;

--e
SELECT c.name, AVG(co.population) AS average_pop
FROM continents c
         LEFT JOIN countries co ON c.id = co.continent_id
GROUP BY c.name
HAVING AVG(co.population) < 20000000
ORDER BY average_pop ASC;

--5

--a
SELECT p.id, p.name, COUNT(pc.country_id) AS citizenship_count
FROM people p
         JOIN person_country pc
              ON p.id = pc.person_id
GROUP BY p.id, p.name
ORDER BY citizenship_count DESC
    LIMIT 1;

--b
SELECT p.id, p.name
FROM people p
         LEFT JOIN person_country pc
                   ON p.id = pc.person_id
WHERE pc.person_id IS NULL;

--c
SELECT c.id, c.name, COUNT(pc.person_id) AS people_count
FROM countries c
         LEFT JOIN person_country pc
                   ON c.id = pc.country_id
GROUP BY c.id, c.name
ORDER BY people_count ASC
    LIMIT 1;

--d
SELECT ct.id, ct.name, COUNT(DISTINCT pc.person_id) AS people_count
FROM continents ct
         JOIN countries c
              ON ct.id = c.continent_id
         LEFT JOIN person_country pc
                   ON c.id = pc.country_id
GROUP BY ct.id, ct.name
ORDER BY people_count DESC
    LIMIT 1;

--e
SELECT p1.id AS person_id_1,
       p2.id AS person_id_2,
       p1.name
FROM people p1
         JOIN people p2
              ON p1.name = p2.name
                  AND p1.id < p2.id;