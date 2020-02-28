-- create a view to see all information about all menu items --

CREATE OR REPLACE VIEW all_menu_info AS
SELECT menuitems.item_name, description, price, menu_name
FROM menuitems
LEFT JOIN menutomenuitems
ON menuitems.item_name = menutomenuitems.item_name
ORDER BY price DESC;

-- create a view to see most popular menu items and their price and total sales --
CREATE OR REPLACE VIEW most_popular_items AS
SELECT OrderMenuItems.item_name, MenuItems.price, SUM(OrderMenuItems.quantity) AS quantity, SUM(OrderMenuItems.quantity * MenuItems.price) AS total
FROM ordermenuitems 
LEFT JOIN menuitems
ON ordermenuitems.item_name = menuitems.item_name
LEFT JOIN menutomenuitems
ON ordermenuitems.item_name = menutomenuitems.item_name
GROUP BY ordermenuitems.item_name, menuitems.price ORDER BY quantity DESC;
