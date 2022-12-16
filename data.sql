/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Devimon', '2017-05-12', 5, TRUE, 11);

/*2ND PULL REQUEST */
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Charmander', '2020-02-08', 0, FALSE, 11);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Plantmon', '2021-11-15', 2, TRUE, 5.7);_
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Squirtle', '1993-04-02', 3, FALSE, 12.13);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Angemon', '2005-06-12', 1, TRUE, 45 );
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Boarmon', '2005-06-07', 7, TRUE, 20.4);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Blossom', '1998-10-13', 3, TRUE, 17);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Ditto', '2022-05-14', 4, TRUE, 22);

/* 3RD PULL REQUEST */

INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES('BOB', 45);
INSERT INTO owners(full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES('Pokemon');
INSERT INTO species (name) VALUES('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals 
SET owner_id=owners.id 
FROM owners 
WHERE owners.full_name='Sam Smith' 
AND animals.name='Agumon';

UPDATE animals 
SET owner_id=owners.id 
FROM owners 
WHERE owners.full_name='Jennifer Orwell' 
AND animals.name='Pikachu'
OR owners.full_name='Jennifr Orwell' AND animals.name='Gabubon';

UPDATE animals 
SET owner_id=owners.id 
FROM owners 
WHERE owners.full_name='BOB' AND animals.name='Plantmon'
OR owners.full_name='BOB' AND animals.name='Devimon';

UPDATE animals 
SET owner_id=owners.id 
FROM owners 
WHERE owners.full_name='Melody Pond' AND animals.name='Blossom'
OR owners.full_name='Melody Pond' AND animals.name='Squirtle'
OR owners.full_name='Melody Pond' AND animals.name='Charmander';

UPDATE animals 
SET owner_id=owners.id 
FROM owners 
WHERE owners.full_name='Dean Winchester' AND animals.name='Angemon' 
OR owners.full_name='Dean Winchester' AND animals.name='Boarmon';

/* QUERIES */

-- What animals belong to Melody Pond?
SELECT animals.name,owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name='Melody Pond';
-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name,species.name AS type,species.id FROM animals JOIN species ON animals.species_id=species.id AND species.id=1;
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name AS name, animals.name AS animal FROM owners LEFT JOIN animals ON owners.id=animals.owner_id;
-- How many animals are there per species?
SELECT species.name, COUNT(animals.species_id) FROM species JOIN animals ON species.id=animals.species_id GROUP BY species.name;
-- List all Digimon owned by Jennifer Orwell.
SELECT full_name, COUNT(animals.name) FROM owners JOIN animals ON owners.id=animals.owner_id WHERE owners.full_name='Jennifer Orwell' GROUP BY full_name;
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT full_name, COUNT(animals.name) FROM owners JOIN animals ON owners.id=animals.owner_id WHERE owners.full_name='Dean Winchester' AND animals.escape_attempts=0 GROUP BY full_name;
-- Who owns the most animals?
SELECT full_name AS name,COUNT(animals.name) AS animal FROM owners LEFT JOIN animals ON owners.id=animals.owner_id GROUP BY full_name ORDER BY COUNT(*) DESC LIMIT 1;

