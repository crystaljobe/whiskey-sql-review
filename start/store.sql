BEGIN;

-- Drop the table if it exists
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS poster;
DROP TABLE IF EXISTS action_figure;
DROP TABLE IF EXISTS employee;

-- Create Game Table
CREATE TABLE game (
    game_id INT PRIMARY KEY,
    game_title VARCHAR(40),
        NOT NULL
        UNIQUE
        CHECK(game_title ~ '^[A-Z\D][A-Za-z\d'']*(?:(?: |:))*$'),
    quantity INT
        NOT NULL
        CHECK(quantity BETWEEN 1 and 50),
    price DECIMAL(5, 2)
        NOT NULL
        CHECK(price BETWEEN 10 AND 60),
    -- TODO: add engine_id with foreign key
);

CREATE TABLE poster (
    poster_id SERIAL PRIMARY KEY,
    poster_title VARCHAR(30)
        NOT NULL
        UNIQUE
        CHECK(poster_title ~ '^[A-Z][A-Za-z0-9\-]*([A-Z0-9]$'),
    quantity INT
        NOT NULL
        UNIQUE
        CHECK(quantity BETWEEN 1 AND 50),
    price DECIMAL(5,2)
        NOT NULL
        CHECK(price BETWEEN 5 AND 10)
    
);

CREATE TABLE action_figure (
    action_figure_id SERIAL PRIMARY KEY,
    action_figure_title VARCHAR(30)
        NOT NULL
        UNIQUE
        CHECK(action_figure_title ~ '^[A-Z][A-Za-z0-9\-]*([A-Z0-9]$'),
    quantity INT
        NOT NULL
        UNIQUE
        CHECK(quantity BETWEEN 1 AND 31),
    price DECIMAL(4,2)
        NOT NULL
        CHECK(price BETWEEN 1 AND 30)  
);


CREATE TABLE employee(
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(40),
    position VARCHAR(30),
    salary DECIMAL(7,2)
);

-- CREATE TABLE gaming_engine(
--     employee_id SERIAL PRIMARY KEY,
--     employee_name VARCHAR(40),
--     position VARCHAR(30),
--     salary DECIMAL(7,2)
-- );
-- CREATE TABLE genre(
--     employee_id SERIAL PRIMARY KEY,
--     employee_name VARCHAR(40),
--     position VARCHAR(30),
--     salary DECIMAL(7,2)
-- );
-- CREATE TABLE employee(
--     employee_id SERIAL PRIMARY KEY,
--     employee_name VARCHAR(40),
--     position VARCHAR(30),
--     salary DECIMAL(7,2)
-- );


-- Insert Sample Data into Game Table
\COPY game FROM './data/game.csv' WITH CSV HEADER;
\COPY poster FROM './data/poster.csv' WITH CSV HEADER;
\COPY action_figure FROM './data/action_figure.csv' WITH CSV HEADER;
\COPY employee FROM './data/employee.csv' WITH CSV HEADER;

COMMIT;


