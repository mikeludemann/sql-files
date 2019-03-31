-- SQL Dump

-- SET Parameter

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET TIME_ZONE = "+00:00";

-- Making a Backup DB (Current)

--- Windows / Linux
BACKUP DATABASE contact TO DISK = 'C:\Backups\contact.bak' WITH DIFFERENTIAL;

--- Mac
BACKUP DATABASE contact TO DISK = '/Users/xxx/Backups/contact.bak' WITH DIFFERENTIAL;

-- Delete all data and infrastructure (New Setup)

--- Delete Database

DROP DATABASE IF EXISTS contact;

--- Delete Data in Tables and removing Tables

TRUNCATE TABLE name;
DROP TABLE name;

TRUNCATE TABLE address;
DROP TABLE address;

--- Remove CONSTRAINT

ALTER TABLE name DROP CONSTRAINT valid_number;
ALTER TABLE address DROP CONSTRAINT valid_number;

-- Create Database

CREATE DATABASE IF NOT EXISTS contact;

-- Use Database

USE contact;

-- Create Tables

CREATE TABLE name (
    Name_ID int NOT NULL AUTO_INCREMENT,
    firstName varchar(50) NOT NULL,
    lastName varchar(50) NOT NULL,
    CONSTRAINT valid_number CHECK (ID > 0) ON DELETE CASCADE,
    UNIQUE (ID)
);

CREATE TABLE address (
    Address_ID int NOT NULL AUTO_INCREMENT,
    street varchar(50) NOT NULL,
    streetnumber varchar(50) NOT NULL,
    postalcode varchar(50) NOT NULL,
    cities varchar(50) NOT NULL,
    country varchar(50) NOT NULL,
    Name_ID int,
    FOREIGN KEY (Name_ID) REFERENCES name(Name_ID),
    CONSTRAINT valid_number CHECK (ID > 0) ON DELETE CASCADE,
    UNIQUE (ID)
);

-- Alter Tables - Adding Condition

--- Setting PRIMARY KEY
ALTER TABLE name ADD PRIMARY KEY (ID);
ALTER TABLE address ADD PRIMARY KEY (ID);

--- Setting FOREIGN KEY 
--- ALTER TABLE address ADD FOREIGN KEY (Name_ID) REFERENCES name(Name_ID);

-- Insert Into - Some data and information

INSERT INTO name (firstName, lastName) VALUES ('John','Doe');
INSERT INTO name (firstName, lastName) VALUES ('Max','Mustermann');

INSERT INTO address (street, streetnumber, postalcode, cities, country, Name_ID) VALUES ('First Avenue','12a','10009','New York','USA', '1');

-- Select - Example

SELECT * FROM name INNER JOIN address ON name.Name_ID = address.Name_ID;