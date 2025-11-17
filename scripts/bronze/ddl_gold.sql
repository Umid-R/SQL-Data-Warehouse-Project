/*
===============================================================================
DDL Script: Create Gold Layer Views
===============================================================================
Script Purpose:
    This script creates the gold layer views in the 'gold' schema, dropping 
    existing views if they already exist.
    The views include:
        - dim_customers: unique, enriched customer data
        - dim_products: active products with attributes
        - fact_sales: sales transactions with foreign keys to dimensions
===============================================================================
*/

-- ========================
-- dim_customers
-- Purpose:
--     Contains unique customers with enriched demographic information.
--     Used for analytics, segmentation, and reporting.
--     Grain: One record per customer.
-- ========================
DROP VIEW IF EXISTS gold.dim_customers;
CREATE VIEW gold.dim_customers AS 
SELECT
    ROW_NUMBER() OVER(ORDER BY cst_key) AS customer_key,
    ci.cst_id AS customer_id,
    ci.cst_key AS customer_number,
    ci.cst_firstname AS first_name, 
    ci.cst_lastname AS last_name,
    la.cntry AS country,
    CASE
        WHEN ci.cst_gndr='n/a' THEN COALESCE(ca.gen,'n/a')
        ELSE ci.cst_gndr
    END AS gender,
    ci.cst_marital_status AS maritial_status,
    ca.bdate AS birthdate,
    ci.cst_create_date AS create_date
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la ON ci.cst_key = la.cid;


-- ========================
-- dim_products
-- Purpose:
--     Stores all active products with enriched attributes.
--     Used for product-level and category-level analytics.
--     Grain: One record per active product.
-- ========================
DROP VIEW IF EXISTS gold.dim_products;
CREATE VIEW gold.dim_products AS 
SELECT 
    ROW_NUMBER() OVER(ORDER BY prd_start_dt, prd_key) AS product_key,
    pi.prd_id AS product_id,
    pi.prd_key AS product_number,
    pi.cat_id AS category_id,
    pi.prd_nm AS product_name, 
    px.cat AS category,
    px.subcat AS subcategory,
    px.maintenance,
    pi.prd_cost AS cost,
    pi.prd_line AS product_line,
    pi.prd_start_dt AS start_day
FROM silver.crm_prd_info pi
LEFT JOIN silver.erp_px_cat_g1v2 px ON pi.cat_id = px.id
WHERE pi.prd_end_dt IS NULL;


-- ========================
-- fact_sales
-- Purpose:
--     Central sales fact table capturing all sales transactions.
--     Used for revenue reporting, KPI calculations, and analytics.
--     Grain: One record per sales order line.
-- ========================
DROP VIEW IF EXISTS gold.fact_sales;
CREATE VIEW gold.fact_sales AS
SELECT 
    sd.sls_ord_num AS order_number,
    pr.product_key,
    cu.customer_key,
    sd.sls_order_dt AS order_date,
    sd.sls_ship_dt AS shipping_date,
    sd.sls_due_dt AS due_date,
    sd.sls_sales AS sales_amount,
    sd.sls_quantity AS sales_quantity,
    sd.sls_price AS price
FROM silver.crm_sales_details sd
LEFT JOIN gold.dim_products pr ON sd.sls_prd_key = pr.product_number
LEFT JOIN gold.dim_customers cu ON sd.sls_cust_id = cu.customer_id;
