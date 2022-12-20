CREATE TABLE animals (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg REAL,
);

ALTER TABLE animals ADD COLUMN species TEXT; 


CREATE TABLE owners (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name TEXT,
    age INTEGER
);

 CREATE TABLE species(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT
 );


/* SET ID AS PRIMARY KEY */
ALTER TABLE animals ADD PRIMARY KEY (id);

ALTER TABLE animals DROP species;

ALTER TABLE animals ADD species_id INTEGER;

ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD owner_id INTEGER;

ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX visits_id_animals_id_vet_idx ON visits(id_animals,id_vet);

CREATE INDEX owners_email_idx ON owners(email);