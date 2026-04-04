/*
=============================================================
Create Schemas
=============================================================
Script Purpose:
    This script creates the bronze, silver, and gold schemas
    inside the 'data_warehouse' database.

Prerequisites:
    - PostgreSQL is installed and running.
    - A database named 'data_warehouse' already exists.
    - In VS Code / SQLTools, connect to the 'data_warehouse'
      database before running this script.

Notes:
    The database and VS Code connection were created manually
    during the initial environment setup.
=============================================================
*/

CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;
