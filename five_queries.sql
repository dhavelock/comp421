-- Get the subtotal of orders, order by subtotal
SELECT oid, sum ( MenuItems.price * OrderMenuItems.quantity) as item_total
FROM OrderMenuItems INNER JOIN MenuItems
ON OrderMenuItems.item_name = MenuItems.item_name
GROUP BY OrderMenuItems.oid ORDER BY item_total DESC
;

-- List the busiesst dates (by number of reservations)
SELECT res_date, count(*)
FROM Reservations
GROUP BY res_date ORDER BY count(*) DESC
;

-- List the most popular menu items
SELECT 
	OrderMenuItems.item_name, 
	sum(OrderMenuItems.quantity) as quantity, 
	sum(OrderMenuItems.quantity * MenuItems.price) as total
FROM OrderMenuItems LEFT JOIN MenuItems
ON OrderMenuItems.item_name = MenuItems.item_name 
GROUP BY OrderMenuItems.item_name ORDER BY quantity DESC
;

-- Number of reservations by day of the week
SELECT
	COUNT(EXTRACT(dow FROM res_date) = 0 OR null) AS Sunday,
    COUNT(EXTRACT(dow FROM res_date) = 1 OR null) AS Monday,
    COUNT(EXTRACT(dow FROM res_date) = 2 OR null) AS Tuesday,
    COUNT(EXTRACT(dow FROM res_date) = 3 OR null) AS Wednesday,
    COUNT(EXTRACT(dow FROM res_date) = 4 OR null) AS Thursday,
    COUNT(EXTRACT(dow FROM res_date) = 5 OR null) AS Friday,
	COUNT(EXTRACT(dow FROM res_date) = 6 OR null) AS Saturday
FROM Reservations
;

-- List Revenue and number of orders by Section
SELECT Sections.section_name, SUM(MenuItems.price * OrderMenuItems.quantity) AS total, COUNT(DISTINCT Orders.oid) AS num_orders
FROM MenuItems
RIGHT JOIN OrderMenuItems
ON MenuItems.item_name = OrderMenuItems.item_name
LEFT JOIN Orders
on Orders.oid = OrderMenuItems.oid
LEFT JOIN TableOrders
ON Orders.oid = TableOrders.oid
LEFT JOIN Tables
ON TableOrders.table_number = Tables.table_number
LEFT JOIN Sections
ON Tables.section_id = Sections.section_id
GROUP BY Sections.section_name ORDER BY total DESC
;







