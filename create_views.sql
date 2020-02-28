-- create a view to see all information about all menu items --

CREATE OR REPLACE VIEW all_menu_info AS
SELECT menuitems.item_name, description, price, menu_name
FROM menuitems
LEFT JOIN menutomenuitems
ON menuitems.item_name = menutomenuitems.item_name
ORDER BY price DESC;

-- create a view to see all payments and the order that they correspond to --
