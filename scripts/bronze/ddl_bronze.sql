/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
    Run this script to re-define the DDL structure of 'bronze' tables.
===============================================================================
*/

-- ========================
-- CRM Tables
-- ========================

DROP TABLE IF EXISTS bronze.crm_cust_info CASCADE;
CREATE TABLE bronze.crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr VARCHAR(50),
    cst_create_date DATE
);

DROP TABLE IF EXISTS bronze.crm_prd_info CASCADE;
CREATE TABLE bronze.crm_prd_info (
    prd_id INT,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(50),
    prd_cost INT,
    prd_line VARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt DATE
);

DROP TABLE IF EXISTS bronze.crm_sales_details CASCADE;
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);

-- ========================
-- ERP Tables
-- ========================


DROP TABLE IF EXISTS bronze.erp_cust_az12 CASCADE;
CREATE TABLE bronze.erp_cust_az12 (
    CID VARCHAR(50),
    BDATE DATE,
    GEN VARCHAR(50)
);

DROP TABLE IF EXISTS bronze.erp_loc_a101 CASCADE;
CREATE TABLE bronze.erp_loc_a101 (
    CID VARCHAR(50),
    CNTRY VARCHAR(50)
);

DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2 CASCADE;
CREATE TABLE bronze.erp_px_cat_g1v2 (
    ID VARCHAR(50),
    CAT VARCHAR(50),
    SUBCAT VARCHAR(50),
    MAINTENANCE VARCHAR(50)
);
