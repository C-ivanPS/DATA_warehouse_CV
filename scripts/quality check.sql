
-- Check for Nulls  or duplicats in Primary key
-- Expectation: No results
SELECT 
prd_id,
COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id 
HAVING COUNT(*) > 1 OR prd_id IS NULL


-- Check for unwanted spaces

SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);


-- Check for Standarization and Consistency

SELECT DISTINCT prd_line
FROM silver.crm_prd_info


--Check for NULLs or negative Numbers
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

--Check invalid dates 
SELECT * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt
