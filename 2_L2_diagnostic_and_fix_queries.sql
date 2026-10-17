-- =========================================================================
-- FILE 2: L2 APPLICATION SUPPORT DIAGNOSTIC & WORKAROUND QUERIES
-- Database: fincart_support
-- =========================================================================

USE fincart_support;

-- -------------------------------------------------------------------------
-- TICKET SCENARIO 1: "Money Deducted, Order Still Pending" (Stuck Orders)
-- Goal: Find orders where Payment = 'SUCCESS' but Order = 'PENDING'
-- Expected Output: 6 stuck orders (1002, 1008, 1014, 1022, 1029, 1037)
-- -------------------------------------------------------------------------
SELECT 
    o.order_id,
    o.customer_name,
    o.customer_email,
    o.order_amount,
    o.order_status AS current_order_status,
    p.payment_id,
    p.transaction_ref,
    p.payment_gateway,
    p.payment_status
FROM fincart_support.customer_orders o
INNER JOIN fincart_support.customer_payments p 
    ON o.order_id = p.order_id
WHERE o.order_status = 'PENDING'
  AND p.payment_status = 'SUCCESS';


-- -------------------------------------------------------------------------
-- TICKET SCENARIO 2: "Customer Charged Twice for Same Order" (Duplicate Txns)
-- Goal: Identify orders with multiple SUCCESS payments and calculate refund due
-- Expected Output: 3 orders (1005, 1015, 1025)
-- -------------------------------------------------------------------------
SELECT 
    o.order_id,
    o.customer_name,
    o.order_amount,
    COUNT(p.payment_id) AS successful_payment_count,
    SUM(p.amount_paid) AS total_amount_deducted,
    (SUM(p.amount_paid) - o.order_amount) AS refund_amount_due
FROM fincart_support.customer_orders o
INNER JOIN fincart_support.customer_payments p 
    ON o.order_id = p.order_id
WHERE p.payment_status = 'SUCCESS'
GROUP BY o.order_id, o.customer_name, o.order_amount
HAVING COUNT(p.payment_id) > 1;


-- -------------------------------------------------------------------------
-- TICKET SCENARIO 3: "Orphan Orders" (API Drop Between Checkout & Gateway)
-- Goal: Find orders stuck in PENDING that have ZERO records in Payments table
-- Expected Output: 5 orders (1046, 1047, 1048, 1049, 1050)
-- -------------------------------------------------------------------------
SELECT 
    o.order_id,
    o.customer_id,
    o.customer_name,
    o.product_category,
    o.order_amount,
    o.order_status,
    o.created_at
FROM fincart_support.customer_orders o
LEFT JOIN fincart_support.customer_payments p 
    ON o.order_id = p.order_id
WHERE p.payment_id IS NULL;


-- -------------------------------------------------------------------------
-- TICKET SCENARIO 4: "Billing Amount Mismatch" (Checkout vs. Gateway Bug)
-- Goal: Find orders where Order Amount does not equal Amount Paid
-- Expected Output: 2 orders (1018 and 1033)
-- -------------------------------------------------------------------------
SELECT 
    o.order_id,
    o.customer_name,
    o.order_amount AS billed_order_amount,
    p.amount_paid AS gateway_captured_amount,
    (o.order_amount - p.amount_paid) AS discrepancy_amount,
    p.payment_gateway
FROM fincart_support.customer_orders o
INNER JOIN fincart_support.customer_payments p 
    ON o.order_id = p.order_id
WHERE p.payment_status = 'SUCCESS'
  AND o.order_amount <> p.amount_paid;


-- -------------------------------------------------------------------------
-- TICKET SCENARIO 5: Payment Gateway Failure Rate Report (For L3 Escalation)
-- Goal: Calculate failure percentage per payment gateway
-- -------------------------------------------------------------------------
SELECT 
    payment_gateway,
    COUNT(payment_id) AS total_transactions,
    SUM(CASE WHEN payment_status = 'SUCCESS' THEN 1 ELSE 0 END) AS successful_txns,
    SUM(CASE WHEN payment_status = 'FAILED' THEN 1 ELSE 0 END) AS failed_txns,
    ROUND(SUM(CASE WHEN payment_status = 'FAILED' THEN 1 ELSE 0 END) * 100.0 / COUNT(payment_id), 2) AS failure_rate_pct
FROM fincart_support.customer_payments
GROUP BY payment_gateway
ORDER BY failure_rate_pct DESC;


-- -------------------------------------------------------------------------
-- L2 WORKAROUND FIX: Resolve the 6 Stuck Orders (Update PENDING -> CONFIRMED)
-- -------------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;

UPDATE fincart_support.customer_orders o
INNER JOIN fincart_support.customer_payments p 
    ON o.order_id = p.order_id
SET o.order_status = 'CONFIRMED'
WHERE o.order_status = 'PENDING' 
  AND p.payment_status = 'SUCCESS';

SET SQL_SAFE_UPDATES = 1;