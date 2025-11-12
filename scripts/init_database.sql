/*
=============================================================
Create Database and Schemas (PostgreSQL)
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse'. 
    Additionally, it sets up three schemas within the database: 
    'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the 'DataWarehouse' database 
    if it already exists. All data will be permanently deleted.
*/

-- Drop database if it exists
DROP DATABASE IF EXISTS datawarehouse;

-- Create the database
CREATE DATABASE datawarehouse;

-- After creating the database, connect to it manually:
-- \c datawarehouse    (in psql)
-- or select 'datawarehouse' from the database list (in pgAdmin)

-- Create Schemas (run these inside the DataWarehouse database)
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;
