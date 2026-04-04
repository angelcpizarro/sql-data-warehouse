/*
===============================================================================
Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This script loads data into the 'bronze' schema from external CSV files.

    Actions:
    - Truncates bronze tables before loading data
    - Uses \copy to load CSV data into bronze tables

===============================================================================
Prerequisites:

	1. PostgreSQL is running
	2. The 'data_warehouse' database exists
	3. The 'bronze' schema and tables already exist

	4. Open Terminal and connect to PostgreSQL:
   	   psql -h localhost -p 5432 -U postgres -d data_warehouse

	5. Update file paths below to match your local machine

	6. Run this script from psql (NOT from VS Code SQL editor):
   	   \i /Users/angelcpizarro/Desktop/sql_data_warehouse_project/scripts/bronze/load_bronze.sql

	7. (Optional) Verify data load:
   	   SELECT COUNT(*) FROM bronze.crm_cust_info;

	8. Exit psql:
   	   \q

===============================================================================
Usage
    Non-interactive option:
    Connects to PostgreSQL, runs the script, and exits.

    Skips steps 4, 6, and 8 from the prerequisites.
    Must be executed after step 5 (file paths updated).

    psql -h localhost -p 5432 -U postgres -d data_warehouse -f /Users/angelcpizarro/Desktop/sql_data_warehouse_project/scripts/bronze/load_bronze.sql
===============================================================================
*/

-- =========================
-- CRM TABLES
-- =========================

TRUNCATE TABLE bronze.crm_cust_info;
\copy bronze.crm_cust_info FROM '/Users/angelcpizarro/Desktop/sql_data_warehouse_project/datasets/source_crm/cust_info.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',')

TRUNCATE TABLE bronze.crm_prd_info;
\copy bronze.crm_prd_info FROM '/Users/angelcpizarro/Desktop/sql_data_warehouse_project/datasets/source_crm/prd_info.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',')

TRUNCATE TABLE bronze.crm_sales_details;
\copy bronze.crm_sales_details FROM '/Users/angelcpizarro/Desktop/sql_data_warehouse_project/datasets/source_crm/sales_details.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',')

-- =========================
-- ERP TABLES
-- =========================

TRUNCATE TABLE bronze.erp_loc_a101;
\copy bronze.erp_loc_a101 FROM '/Users/angelcpizarro/Desktop/sql_data_warehouse_project/datasets/source_erp/loc_a101.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',')

TRUNCATE TABLE bronze.erp_cust_az12;
\copy bronze.erp_cust_az12 FROM '/Users/angelcpizarro/Desktop/sql_data_warehouse_project/datasets/source_erp/cust_az12.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',')

TRUNCATE TABLE bronze.erp_px_cat_g1v2;
\copy bronze.erp_px_cat_g1v2 FROM '/Users/angelcpizarro/Desktop/sql_data_warehouse_project/datasets/source_erp/px_cat_g1v2.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',')
