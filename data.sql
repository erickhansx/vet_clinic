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


/* 4th PULL REQUEST */
INSERT INTO vets(name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');
=======
INSERT INTO visits (id_animals, id_vet, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';





INSERT INTO specializations(id_vet, id_species) VALUES (1, 1);
INSERT INTO specializations(id_vet, id_species) VALUES (3, 1);
INSERT INTO specializations(id_vet, id_species) VALUES (3, 2);
INSERT INTO specializations(id_vet, id_species) VALUES (4, 2);

INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(1,1, '2020-05-24');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(1,3, '2020-07-22');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(2,4, '2021-02-02');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(3,2, '2020-01-05');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(3,2, '2020-03-08');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(3,2, '2020-05-14');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(4,3, '2021-05-04');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(5,4, '2021-02-24');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(6,2, '2019-12-21');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(6,1, '2020-08-10');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(6,2, '2021-04-07');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(7,3, '2019-09-29');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(8,4, '2020-10-03');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(8,4, '2020-11-04');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(9,2, '2019-01-24');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(9,2, '2019-05-15');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(9,2, '2020-02-27');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(9,2, '2020-08-03');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(10,3,'2020-05-24');
INSERT INTO visits(id_animals, id_vet, visit_date) VALUES(10,1,'2021-01-11');