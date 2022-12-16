/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;
SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE NOT name='Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/*2ND PULL REQUEST */

BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

UPDATE animals SET SPECIES = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;
BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg= weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg= weight_kg * -1 WHERE weight_kg < 0;
COMMIT;


/* ANSWER QUESTIONS */

/*HOW MANY ANIMALS ARE THERE?*/
SELECT COUNT(*) FROM animals;

/*HOW MANY ANIMALS HAVE NEVER TRIED TO ESCAPE*/
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
/* WHAT IS THE AVG WEIGHT OF THE ANIMALS */
SELECT AVG(weight_kg) FROM animals;
/*WHO ESCAPES THE MOST, NEUTURED OR NOT NEUTERED ANIMALS*/
/*RESPONSE 1: */
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
/*RESPONSE 2: */
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
/*WHAT IS THE MINIMUM AND MAXIMUM WEIGHT OF EACH TYPE OF ANIMAL*/
SELECT species, MIN(weight_kg) as minWeight, MAX(weight_kg) as maxWeight FROM animals GROUP BY species;
/*WHAT IS THE AVERAGE NUMBER OF ESCAPE ATTEMPTS PER ANIMAL TYPE OF THOSE BORN BETWEEN 1990 AND 2000?*/
SELECT species, ROUND(AVG(escape_attempts),0) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;



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