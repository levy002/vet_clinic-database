/*Queries that provide answers to the questions from all projects.*/

-- Find all animals whose name ends in "mon".
   select * from animals where name LIKE '%mon';
-- List the name of all animals born between 2016 and 2019.
select name from animals where date_of_birth  BETWEEN '2016-01-01' AND '2019-12-31';
-- List the name of all animals that are neutered and have less than 3 escape attempts.
select name from animals where escape_attempts < 3 AND neutered =true;
-- List date of birth of all animals named either "Agumon" or "Pikachu".
select date_of_birth from animals where name='Agumon' OR name='Pikachu';
-- List name and escape attempts of animals that weigh more than 10.5kg
select name,escape_attempts from animals where weight_kg > 10.5;
-- Find all animals that are neutered.
select * from animals where neutered =true;
-- Find all animals not named Gabumon.
select * from animals where name!='Gabumon' ;
-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
select * from animals where weight_kg>=10.4 AND weight_kg<=17.3;

-- starting a transaction and update animal table by setting the species column to unspecified and rollback.
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals SET species = 'digimon' WHERE species = '';
-- Commit the transaction.
COMMIT;
-- Inside a transaction delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
ROLLBACK;

-- STARTNG A TRANSACTION:
BEGIN;
 -- Delete all animals born after Jan 1st, 2022.
  DELETE FROM animals WHERE date_of_birth > '2022-01-01';
 -- Creating a savepoint for the transaction.
 SAVEPOINT savepoint_1;
 -- Update all animals' weight to be their weight multiplied by -1.
 UPDATE animals SET weight_kg = weight_kg * -1;
 -- Rollback to the savepoint
 ROLLBACK TO SAVEPOINT savepoint_1;
 -- Update all animals' weights that are negative to be their weight multiplied by -1.
 UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 1;
 -- Commit transaction
 COMMIT;


-- How many animals are there?
SELECT count(*) FROM animals;
-- How many animals have never tried to escape?
SELECT count(*) FROM animals WHERE escape_attempts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT neutered,MAX(escape_attempts) FROM animals GROUP BY neutered;
-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-12-31' AND '2000-12-31' GROUP BY species;