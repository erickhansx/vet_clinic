CREATE TABLE animals (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg REAL,
);

ALTER TABLE animals ADD COLUMN species TEXT; 