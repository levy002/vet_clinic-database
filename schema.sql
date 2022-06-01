/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic ;

CREATE TABLE animals(id BIGSERIAL NOT NULL PRIMARY KEY, name VARCHAR UNIQUE NOT NULL, date_of_birth DATE, escape_attempts INTEGER, neutered BOOLEAN, weight_kg DECIMAL);

  --Adding new colum to the table
  ALTER TABLE animals
  ADD COLUMN species VARCHAR;

-- creating owners table
CREATE TABLE owners (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    full_name VARCHAR,
    age INT
);

-- creating species table 
CREATE TABLE species (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR
);

-- Updating animals tables:
  -- Removing column species
   ALTER TABLE animals
   DROP COLUMN species;
  -- Add column species_id which is a foreign key referencing species table
  ALTER TABLE animals
  ADD COLUMN species_id BIGINT REFERENCES species (id);
  -- Add column owner_id which is a foreign key referencing the owners table
  ALTER TABLE animals
  ADD COLUMN owner_id BIGINT REFERENCES owners (id);
