/* 
===============================================================================
Quality Checks: Silver Layer - Detailed Validation
===============================================================================
Script Purpose:
    Perform validation checks on all Silver Layer tables to ensure:
        - No duplicate or null primary keys
        - No unwanted spaces in text fields
        - Standardized categorical fields
        - Valid and clean date formats
        - Logical consistency between related fields
===============================================================================
*/


/* =============================================================================
   Testing: silver.crm_cust_info
   ============================================================================= */

--- Check cst_id for duplicates or null values
--- Expectation: No result
SELECT 
    cst_id,
    COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*)>1 OR cst_id IS NULL;

--- Check for unwanted spaces in last names
--- Expectation: No result
SELECT 
    cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname);

--- Data Standardization & Consistency (Marital Status)
SELECT DISTINCT
    cst_marital_status
FROM silver.crm_cust_info;

--- Data Standardization & Consistency (Gender)
SELECT DISTINCT
    cst_gndr
FROM silver.crm_cust_info;





/* =============================================================================
   Testing: silver.crm_prd_info
   ============================================================================= */

--- Check prd_id for duplicates or null values
--- Expectation: No result
SELECT 
    prd_id,
    COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*)>1 OR prd_id IS NULL;

--- Check for unwanted spaces in product names
--- Expectation: No result
SELECT 
    prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

--- Check for negative or null product cost
--- Expectation: No result
SELECT 
    prd_cost
FROM silver.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost < 0;

--- Data Standardization & Consistency (Product Line)
SELECT DISTINCT
    prd_line
FROM silver.crm_prd_info;





/* =============================================================================
   Testing: silver.crm_sales_details
   ============================================================================= */

--- Check for invalid date ordering:
--- sls_order_dt should NOT be greater than ship/due dates
SELECT * 
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;

--- Check invalid order dates (less than 8-digit YYYYMMDD)
SELECT * 
FROM silver.crm_sales_details
WHERE LENGTH(sls_order_dt::VARCHAR) < 8;

--- Check invalid ship dates
SELECT * 
FROM silver.crm_sales_details
WHERE LENGTH(sls_ship_dt::VARCHAR) < 8;

--- Check invalid due dates
SELECT * 
FROM silver.crm_sales_details
WHERE LENGTH(sls_due_dt::VARCHAR) < 8;

--- Check data consistency:
--- Sales must equal Quantity * Price
--- Sales/Quantity/Price must not be negative or null
SELECT 
    sls_sales,
    sls_quantity,
    sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_price * sls_quantity 
   OR sls_price IS NULL 
   OR sls_quantity IS NULL 
   OR sls_sales IS NULL 
   OR sls_price < 0 
   OR sls_quantity < 0 
   OR sls_sales < 0;





/* =============================================================================
   Testing: silver.erp_cust_az12
   ============================================================================= */

--- Check CID for unwanted spaces or nulls
SELECT 
    cid 
FROM silver.erp_cust_az12
WHERE cid IS NULL OR cid != TRIM(cid);

--- Check for invalid future birthdates
SELECT 
    bdate
FROM silver.erp_cust_az12
WHERE bdate > CURRENT_DATE;

--- Gender standardization check
SELECT DISTINCT 
    gen
FROM silver.erp_cust_az12;





/* =============================================================================
   Testing: silver.erp_loc_a101
   ============================================================================= */

--- Country standardization check
SELECT DISTINCT
    cntry
FROM silver.erp_loc_a101;





/* =============================================================================
   Testing: silver.erp_px_cat_g1v2
   ============================================================================= */

--- Check for null ID values
--- Expectation: No result
SELECT *
FROM silver.erp_px_cat_g1v2
WHERE id IS NULL;

--- Category standardization
SELECT DISTINCT
    cat
FROM silver.erp_px_cat_g1v2;

--- Check unwanted spaces in subcategory
SELECT 
    subcat
FROM silver.erp_px_cat_g1v2
WHERE subcat != TRIM(subcat);

--- Maintenance field standardization
SELECT DISTINCT
    maintenance
FROM silver.erp_px_cat_g1v2;
