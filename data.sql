/* Populate database with sample data. */

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered,weight_kg) values(DEFAULT, 'Agumon', '2020-03-02', 0, true, 10.23);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) values(DEFAULT, 'Gabumon', '2018-11-15', 2, true, 8),(DEFAULT, 'Pikachu', '2021-01-07', 1, false, 15.04),(DEFAULT, 'Devimon', '2017-05-12', 5, true,11);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (DEFAULT ,'Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (DEFAULT ,'Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (DEFAULT ,'Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (DEFAULT ,'Angemon', '2005-06-12', 3, true, -45);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (DEFAULT ,'Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (DEFAULT ,'Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (DEFAULT ,'Ditto', '2022-05-14', 4, true, 22);

-- Insering data in owners table
INSERT INTO
 owners (id, full_name, age)
 VALUES
 (DEFAULT, 'Sam Smith', 34),
 (DEFAULT, 'Jennifer Orwell', 19),
 (DEFAULT, 'Melody Pond', 45),
 (DEFAULT, 'Dean Winchester', 14),
 (DEFAULT, 'Jodie Whittaker', 38),
 (DEFAULT, 'Bob', 45);

 -- Inserting data into species table
 INSERT INTO
species (id, name)
 VALUES
 (DEFAULT, 'Pokemon'),
 (DEFAULT, 'Digimon');

-- Modify your inserted animals so it includes the species_id value:
  --If the name ends in "mon" it will be Digimon
  UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
  -- All other animals are Pokemon
  UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

-- Modify your inserted animals to include owner information (owner_id):
  -- Sam Smith owns Agumon.
  UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
  -- Jennifer Orwell owns Gabumon and Pikachu.
  UPDATE animals SET owner_id = 2 WHERE name = 'Pikachu' OR name = 'Gabumon';
  -- Bob owns Devimon and Plantmon.
  UPDATE animals SET owner_id = 6 WHERE name = 'Devimon' OR name = 'Plantmon';
  -- Melody Pond owns Charmander, Squirtle, and Blossom.
  UPDATE animals SET owner_id = 3 WHERE name = 'Squirtle' OR name = 'Blossom' OR name = 'Charmander';
  -- Dean Winchester owns Angemon and Boarmon.
  UPDATE animals SET owner_id = 4 WHERE name = 'Angemon' OR name = 'Boarmon';
  