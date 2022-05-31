/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic ;

CREATE TABLE animals(id BIGSERIAL NOT NULL PRIMARY KEY, name VARCHAR UNIQUE NOT NULL, date_of_birth DATE, escape_attempts INTEGER, neutered BOOLEAN, weight_kg DECIMAL);
