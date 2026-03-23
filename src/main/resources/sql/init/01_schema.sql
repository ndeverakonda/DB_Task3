CREATE TABLE continents(
                           id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                           name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE countries(
                          id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                          name VARCHAR(100) NOT NULL UNIQUE,
                          area NUMERIC(15,2),
                          population INT,
                          continent_id INT,
                          FOREIGN KEY(continent_id) REFERENCES continents(id)
);

CREATE TABLE people(
                       id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                       name VARCHAR(100) NOT NULL
);

CREATE TABLE person_country(
                               person_id INT,
                               country_id INT,
                               FOREIGN KEY(person_id) REFERENCES people(id),
                               FOREIGN KEY(country_id) REFERENCES countries(id),
                               PRIMARY KEY(person_id,country_id)
);