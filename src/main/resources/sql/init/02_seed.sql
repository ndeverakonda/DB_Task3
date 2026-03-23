
-- INSERT CONTINENTS

INSERT INTO continents (name) VALUES
                                  ('Asia'),
                                  ('Europe'),
                                  ('Africa'),
                                  ('North America'),
                                  ('South America'),
                                  ('Australia'),
                                  ('Antarctica')
    ON CONFLICT (name) DO NOTHING;



-- INSERT COUNTRIES

INSERT INTO countries (name, area, population, continent_id) VALUES
                                                                 ('India', 3287263, 1400000000, 1),
                                                                 ('China', 9596961, 1402000000, 1),
                                                                 ('Japan', 377975, 125000000, 1),
                                                                 ('France', 551695, 68000000, 2),
                                                                 ('Germany', 357022, 83000000, 2),
                                                                 ('Finland', 338455, 5500000, 2),
                                                                 ('Egypt', 1002450, 110000000, 3),
                                                                 ('Nigeria', 923768, 220000000, 3),
                                                                 ('Canada', 9984670, 38000000, 4),
                                                                 ('USA', 9833517, 331000000, 4),
                                                                 ('Brazil', 8515767, 213000000, 5),
                                                                 ('Argentina', 2780400, 46000000, 5),
                                                                 ('Australia', 7692024, 26000000, 6)
    ON CONFLICT (name) DO NOTHING;



-- INSERT PEOPLE

INSERT INTO people (name) VALUES
                              ('Alice'),
                              ('Bob'),
                              ('Charlie'),
                              ('David'),
                              ('Eve'),
                              ('Frank'),
                              ('Grace'),
                              ('Alice'),      -- duplicate name
                              ('Bob'),        -- duplicate name
                              ('Henry'),
                              ('Ivy'),
                              ('Jack')
    ON CONFLICT DO NOTHING;



INSERT INTO person_country (person_id, country_id) VALUES
-- Alice (id 1) has 2 citizenships
(1, 1),
(1, 4),

-- Bob (id 2) has 1
(2, 1),

-- Charlie has 3
(3, 2),
(3, 4),
(3, 9),

-- David has 1
(4, 5),

-- Eve has none

-- Frank has 2
(6, 6),
(6, 7),

-- Grace has 1
(7, 10),

-- Alice (duplicate id 8) has 1
(8, 11),

-- Bob (duplicate id 9) has none

-- Henry has 2
(10, 3),
(10, 12),

-- Ivy has 1
(11, 13)
    ON CONFLICT DO NOTHING;