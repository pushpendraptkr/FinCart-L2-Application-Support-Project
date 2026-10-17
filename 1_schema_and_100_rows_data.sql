-- =========================================================================
-- APPLICATION SUPPORT PROJECT: E-COMMERCE ORDER & PAYMENT TRIAGE DATABASE
-- Tables: Orders (8 Columns, 50 Rows) | Payments (8 Columns, 50 Rows)
-- Total Records: 100 Rows
-- =========================================================================

CREATE DATABASE IF NOT EXISTS fincart_support;

DROP TABLE IF EXISTS fincart_support.customer_payments;
DROP TABLE IF EXISTS fincart_support.customer_orders;

USE fincart_support;

-- 1. Create the two 8-column tables inside fincart_support
CREATE TABLE fincart_support.customer_orders (
    order_id INT PRIMARY KEY,
    customer_id VARCHAR(15),
    customer_name VARCHAR(60),
    customer_email VARCHAR(80),
    product_category VARCHAR(40),
    order_amount DECIMAL(10,2),
    order_status VARCHAR(25),
    created_at DATETIME
);

CREATE TABLE fincart_support.customer_payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    transaction_ref VARCHAR(40),
    payment_method VARCHAR(30),
    payment_gateway VARCHAR(30),
    amount_paid DECIMAL(10,2),
    payment_status VARCHAR(25),
    payment_timestamp DATETIME
);

-- 2. Insert 50 Rows into fincart_support.customer_orders
INSERT INTO fincart_support.customer_orders VALUES
(1001, 'CUST01', 'Amit Sharma', 'amit.sharma@email.com', 'Electronics', 1500.00, 'CONFIRMED', '2026-10-01 09:10:00'),
(1002, 'CUST02', 'Priya Verma', 'priya.verma@email.com', 'Apparel', 2400.00, 'PENDING', '2026-10-01 09:25:00'),
(1003, 'CUST03', 'Rahul Nair', 'rahul.nair@email.com', 'Groceries', 850.00, 'CONFIRMED', '2026-10-01 09:40:00'),
(1004, 'CUST04', 'Sneha Gupta', 'sneha.gupta@email.com', 'Electronics', 3200.00, 'CONFIRMED', '2026-10-01 10:05:00'),
(1005, 'CUST05', 'Vikram Singh', 'vikram.s@email.com', 'Footwear', 1200.00, 'CONFIRMED', '2026-10-01 10:15:00'),
(1006, 'CUST06', 'Neha Patel', 'neha.patel@email.com', 'Home Decor', 4500.00, 'FAILED', '2026-10-01 10:30:00'),
(1007, 'CUST07', 'Rohan Das', 'rohan.das@email.com', 'Electronics', 5600.00, 'CONFIRMED', '2026-10-01 11:00:00'),
(1008, 'CUST08', 'Anjali Mehta', 'anjali.m@email.com', 'Books', 499.00, 'PENDING', '2026-10-01 11:20:00'),
(1009, 'CUST09', 'Karan Malhotra', 'karan.m@email.com', 'Apparel', 1899.00, 'CONFIRMED', '2026-10-01 11:45:00'),
(1010, 'CUST10', 'Pooja Joshi', 'pooja.j@email.com', 'Beauty', 999.00, 'CONFIRMED', '2026-10-01 12:10:00'),
(1011, 'CUST11', 'Suresh Raina', 'suresh.r@email.com', 'Sports', 2750.00, 'CONFIRMED', '2026-10-01 12:30:00'),
(1012, 'CUST12', 'Divya Tiwari', 'divya.t@email.com', 'Electronics', 8900.00, 'FAILED', '2026-10-01 13:00:00'),
(1013, 'CUST13', 'Manish Pandey', 'manish.p@email.com', 'Groceries', 640.00, 'CONFIRMED', '2026-10-01 13:15:00'),
(1014, 'CUST14', 'Kavita Rao', 'kavita.r@email.com', 'Home Decor', 3100.00, 'PENDING', '2026-10-01 13:40:00'),
(1015, 'CUST15', 'Deepak Chahar', 'deepak.c@email.com', 'Accessories', 750.00, 'CONFIRMED', '2026-10-01 14:05:00'),
(1016, 'CUST16', 'Meera Krishnan', 'meera.k@email.com', 'Apparel', 2150.00, 'CONFIRMED', '2026-10-01 14:20:00'),
(1017, 'CUST17', 'Arjun Kapoor', 'arjun.k@email.com', 'Electronics', 12400.00, 'CONFIRMED', '2026-10-01 14:50:00'),
(1018, 'CUST18', 'Nisha Agarwal', 'nisha.a@email.com', 'Footwear', 1650.00, 'CONFIRMED', '2026-10-01 15:10:00'),
(1019, 'CUST19', 'Sanjay Mishra', 'sanjay.m@email.com', 'Books', 350.00, 'CONFIRMED', '2026-10-01 15:30:00'),
(1020, 'CUST20', 'Ritu Saxena', 'ritu.s@email.com', 'Beauty', 1420.00, 'FAILED', '2026-10-01 16:00:00'),
(1021, 'CUST21', 'Abhishek Jain', 'abhishek.j@email.com', 'Electronics', 4999.00, 'CONFIRMED', '2026-10-02 09:15:00'),
(1022, 'CUST22', 'Swati Deshmukh', 'swati.d@email.com', 'Groceries', 1120.00, 'PENDING', '2026-10-02 09:45:00'),
(1023, 'CUST23', 'Pranav Kulkarni', 'pranav.k@email.com', 'Sports', 3400.00, 'CONFIRMED', '2026-10-02 10:10:00'),
(1024, 'CUST24', 'Shweta Tripathi', 'shweta.t@email.com', 'Apparel', 2890.00, 'CONFIRMED', '2026-10-02 10:35:00'),
(1025, 'CUST25', 'Yashwardhan Chauhan', 'yash.c@email.com', 'Electronics', 6200.00, 'CONFIRMED', '2026-10-02 11:00:00'),
(1026, 'CUST26', 'Bhavna Reddy', 'bhavna.r@email.com', 'Home Decor', 1950.00, 'CONFIRMED', '2026-10-02 11:25:00'),
(1027, 'CUST27', 'Gaurav Khanna', 'gaurav.k@email.com', 'Accessories', 890.00, 'FAILED', '2026-10-02 11:50:00'),
(1028, 'CUST28', 'Tanvi Azmi', 'tanvi.a@email.com', 'Beauty', 2300.00, 'CONFIRMED', '2026-10-02 12:15:00'),
(1029, 'CUST29', 'Harshvardhan Rane', 'harsh.r@email.com', 'Footwear', 3150.00, 'PENDING', '2026-10-02 12:40:00'),
(1030, 'CUST30', 'Kritika Kamra', 'kritika.k@email.com', 'Books', 590.00, 'CONFIRMED', '2026-10-02 13:05:00'),
(1031, 'CUST31', 'Naveen Polishetty', 'naveen.p@email.com', 'Electronics', 7800.00, 'CONFIRMED', '2026-10-02 13:30:00'),
(1032, 'CUST32', 'Pallavi Sharda', 'pallavi.s@email.com', 'Groceries', 940.00, 'CONFIRMED', '2026-10-02 14:00:00'),
(1033, 'CUST33', 'Rajeev Khandelwal', 'rajeev.k@email.com', 'Apparel', 4100.00, 'CONFIRMED', '2026-10-02 14:25:00'),
(1034, 'CUST34', 'Sonali Bendre', 'sonali.b@email.com', 'Home Decor', 5300.00, 'FAILED', '2026-10-02 14:50:00'),
(1035, 'CUST35', 'Tushar Dalvi', 'tushar.d@email.com', 'Sports', 1750.00, 'CONFIRMED', '2026-10-02 15:15:00'),
(1036, 'CUST36', 'Urmila Matondkar', 'urmila.m@email.com', 'Beauty', 1290.00, 'CONFIRMED', '2026-10-02 15:40:00'),
(1037, 'CUST37', 'Varun Badola', 'varun.b@email.com', 'Electronics', 9500.00, 'PENDING', '2026-10-02 16:05:00'),
(1038, 'CUST38', 'Zoya Hussain', 'zoya.h@email.com', 'Accessories', 620.00, 'CONFIRMED', '2026-10-02 16:30:00'),
(1039, 'CUST39', 'Aditya Seal', 'aditya.s@email.com', 'Footwear', 2450.00, 'CONFIRMED', '2026-10-03 09:00:00'),
(1040, 'CUST40', 'Barkha Singh', 'barkha.s@email.com', 'Apparel', 3600.00, 'CONFIRMED', '2026-10-03 09:30:00'),
(1041, 'CUST41', 'Chirag Paswan', 'chirag.p@email.com', 'Groceries', 780.00, 'FAILED', '2026-10-03 10:00:00'),
(1042, 'CUST42', 'Disha Parmar', 'disha.p@email.com', 'Books', 430.00, 'CONFIRMED', '2026-10-03 10:30:00'),
(1043, 'CUST43', 'Eijaz Khan', 'eijaz.k@email.com', 'Electronics', 11200.00, 'CONFIRMED', '2026-10-03 11:00:00'),
(1044, 'CUST44', 'Fatima Sana', 'fatima.s@email.com', 'Beauty', 1850.00, 'CONFIRMED', '2026-10-03 11:30:00'),
(1045, 'CUST45', 'Gautam Rode', 'gautam.r@email.com', 'Sports', 2900.00, 'CONFIRMED', '2026-10-03 12:00:00'),
(1046, 'CUST46', 'Hina Khan', 'hina.k@email.com', 'Apparel', 3300.00, 'PENDING', '2026-10-03 12:30:00'),
(1047, 'CUST47', 'Iqbal Khan', 'iqbal.k@email.com', 'Home Decor', 4700.00, 'PENDING', '2026-10-03 13:00:00'),
(1048, 'CUST48', 'Jigyasa Singh', 'jigyasa.s@email.com', 'Footwear', 1550.00, 'PENDING', '2026-10-03 13:30:00'),
(1049, 'CUST49', 'Karanvir Bohra', 'karanvir.b@email.com', 'Electronics', 6800.00, 'PENDING', '2026-10-03 14:00:00'),
(1050, 'CUST50', 'Lavanya Tripathi', 'lavanya.t@email.com', 'Accessories', 920.00, 'PENDING', '2026-10-03 14:30:00');

-- 3. Insert 50 Rows into fincart_support.customer_payments
INSERT INTO fincart_support.customer_payments VALUES
(5001, 1001, 'TXN_RZP_9001', 'UPI', 'Razorpay', 1500.00, 'SUCCESS', '2026-10-01 09:10:45'),
(5002, 1002, 'TXN_PTM_9002', 'Credit Card', 'Paytm', 2400.00, 'SUCCESS', '2026-10-01 09:26:10'),
(5003, 1003, 'TXN_RZP_9003', 'UPI', 'Razorpay', 850.00, 'SUCCESS', '2026-10-01 09:40:30'),
(5004, 1004, 'TXN_BDK_9004', 'NetBanking', 'BillDesk', 3200.00, 'SUCCESS', '2026-10-01 10:06:00'),
(5005, 1005, 'TXN_RZP_9005', 'UPI', 'Razorpay', 1200.00, 'SUCCESS', '2026-10-01 10:15:20'),
(5006, 1005, 'TXN_RZP_9006', 'UPI', 'Razorpay', 1200.00, 'SUCCESS', '2026-10-01 10:15:23'),
(5007, 1006, 'TXN_STR_9007', 'Credit Card', 'Stripe', 4500.00, 'FAILED', '2026-10-01 10:31:00'),
(5008, 1007, 'TXN_PTM_9008', 'Debit Card', 'Paytm', 5600.00, 'SUCCESS', '2026-10-01 11:01:15'),
(5009, 1008, 'TXN_RZP_9009', 'UPI', 'Razorpay', 499.00, 'SUCCESS', '2026-10-01 11:20:50'),
(5010, 1009, 'TXN_BDK_9010', 'NetBanking', 'BillDesk', 1899.00, 'SUCCESS', '2026-10-01 11:46:10'),
(5011, 1010, 'TXN_RZP_9011', 'UPI', 'Razorpay', 999.00, 'SUCCESS', '2026-10-01 12:10:40'),
(5012, 1011, 'TXN_PTM_9012', 'Credit Card', 'Paytm', 2750.00, 'SUCCESS', '2026-10-01 12:31:05'),
(5013, 1012, 'TXN_STR_9013', 'Credit Card', 'Stripe', 8900.00, 'FAILED', '2026-10-01 13:01:20'),
(5014, 1013, 'TXN_RZP_9014', 'UPI', 'Razorpay', 640.00, 'SUCCESS', '2026-10-01 13:15:35'),
(5015, 1014, 'TXN_BDK_9015', 'Debit Card', 'BillDesk', 3100.00, 'SUCCESS', '2026-10-01 13:41:00'),
(5016, 1015, 'TXN_RZP_9016', 'UPI', 'Razorpay', 750.00, 'SUCCESS', '2026-10-01 14:05:12'),
(5017, 1015, 'TXN_RZP_9017', 'UPI', 'Razorpay', 750.00, 'SUCCESS', '2026-10-01 14:05:14'),
(5018, 1016, 'TXN_PTM_9018', 'UPI', 'Paytm', 2150.00, 'SUCCESS', '2026-10-01 14:20:55'),
(5019, 1017, 'TXN_STR_9019', 'Credit Card', 'Stripe', 12400.00, 'SUCCESS', '2026-10-01 14:51:30'),
(5020, 1018, 'TXN_RZP_9020', 'Debit Card', 'Razorpay', 1500.00, 'SUCCESS', '2026-10-01 15:11:00'),
(5021, 1019, 'TXN_PTM_9021', 'UPI', 'Paytm', 350.00, 'SUCCESS', '2026-10-01 15:30:25'),
(5022, 1020, 'TXN_BDK_9022', 'NetBanking', 'BillDesk', 1420.00, 'FAILED', '2026-10-01 16:01:40'),
(5023, 1021, 'TXN_RZP_9023', 'Credit Card', 'Razorpay', 4999.00, 'SUCCESS', '2026-10-02 09:16:00'),
(5024, 1022, 'TXN_PTM_9024', 'UPI', 'Paytm', 1120.00, 'SUCCESS', '2026-10-02 09:45:50'),
(5025, 1023, 'TXN_STR_9025', 'Debit Card', 'Stripe', 3400.00, 'SUCCESS', '2026-10-02 10:11:10'),
(5026, 1024, 'TXN_RZP_9026', 'UPI', 'Razorpay', 2890.00, 'SUCCESS', '2026-10-02 10:35:45'),
(5027, 1025, 'TXN_BDK_9027', 'NetBanking', 'BillDesk', 6200.00, 'SUCCESS', '2026-10-02 11:01:00'),
(5028, 1025, 'TXN_BDK_9028', 'NetBanking', 'BillDesk', 6200.00, 'SUCCESS', '2026-10-02 11:01:04'),
(5029, 1026, 'TXN_RZP_9029', 'UPI', 'Razorpay', 1950.00, 'SUCCESS', '2026-10-02 11:25:30'),
(5030, 1027, 'TXN_PTM_9030', 'Debit Card', 'Paytm', 890.00, 'FAILED', '2026-10-02 11:51:15'),
(5031, 1028, 'TXN_STR_9031', 'Credit Card', 'Stripe', 2300.00, 'SUCCESS', '2026-10-02 12:16:05'),
(5032, 1029, 'TXN_RZP_9032', 'UPI', 'Razorpay', 3150.00, 'SUCCESS', '2026-10-02 12:40:40'),
(5033, 1030, 'TXN_PTM_9033', 'UPI', 'Paytm', 590.00, 'SUCCESS', '2026-10-02 13:05:20'),
(5034, 1031, 'TXN_BDK_9034', 'NetBanking', 'BillDesk', 7800.00, 'SUCCESS', '2026-10-02 13:31:10'),
(5035, 1032, 'TXN_RZP_9035', 'UPI', 'Razorpay', 940.00, 'SUCCESS', '2026-10-02 14:00:35'),
(5036, 1033, 'TXN_STR_9036', 'Credit Card', 'Stripe', 3700.00, 'SUCCESS', '2026-10-02 14:26:00'),
(5037, 1034, 'TXN_PTM_9037', 'Debit Card', 'Paytm', 5300.00, 'FAILED', '2026-10-02 14:51:25'),
(5038, 1035, 'TXN_RZP_9038', 'UPI', 'Razorpay', 1750.00, 'SUCCESS', '2026-10-02 15:15:50'),
(5039, 1036, 'TXN_PTM_9039', 'UPI', 'Paytm', 1290.00, 'SUCCESS', '2026-10-02 15:40:30'),
(5040, 1037, 'TXN_BDK_9040', 'NetBanking', 'BillDesk', 9500.00, 'SUCCESS', '2026-10-02 16:06:15'),
(5041, 1038, 'TXN_RZP_9041', 'UPI', 'Razorpay', 620.00, 'SUCCESS', '2026-10-02 16:30:40'),
(5042, 1039, 'TXN_STR_9042', 'Credit Card', 'Stripe', 2450.00, 'SUCCESS', '2026-10-03 09:01:05'),
(5043, 1040, 'TXN_PTM_9043', 'Debit Card', 'Paytm', 3600.00, 'SUCCESS', '2026-10-03 09:30:55'),
(5044, 1041, 'TXN_RZP_9044', 'UPI', 'Razorpay', 780.00, 'FAILED', '2026-10-03 10:01:10'),
(5045, 1042, 'TXN_PTM_9045', 'UPI', 'Paytm', 430.00, 'SUCCESS', '2026-10-03 10:30:25'),
(5046, 1043, 'TXN_BDK_9046', 'NetBanking', 'BillDesk', 11200.00, 'SUCCESS', '2026-10-03 11:01:30'),
(5047, 1044, 'TXN_RZP_9047', 'UPI', 'Razorpay', 1850.00, 'SUCCESS', '2026-10-03 11:30:45'),
(5048, 1045, 'TXN_STR_9048', 'Credit Card', 'Stripe', 2900.00, 'SUCCESS', '2026-10-03 12:01:00'),
(5049, 1006, 'TXN_STR_9049', 'UPI', 'Razorpay', 4500.00, 'FAILED', '2026-10-01 10:35:00'),
(5050, 1012, 'TXN_STR_9050', 'UPI', 'Razorpay', 8900.00, 'FAILED', '2026-10-01 13:05:00');