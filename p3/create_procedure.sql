CREATE OR REPLACE PROCEDURE delete_item_if_not_sold()
   AS $$

DECLARE 
	 rec_item   RECORD;

	 cursor_item_quantity CURSOR FOR SELECT SUM(OrderMenuItems.quantity) AS quantity, ordermenuitems.item_name
      FROM ordermenuitems
      LEFT JOIN menuitems
      ON ordermenuitems.item_name = menuitems.item_name
      LEFT JOIN menutomenuitems
      ON ordermenuitems.item_name = menutomenuitems.item_name
      GROUP BY ordermenuitems.item_name;

BEGIN
   OPEN cursor_item_quantity;
	
   LOOP
      FETCH cursor_item_quantity INTO rec_item;
      EXIT WHEN NOT FOUND;

   IF rec_item.quantity = 0 THEN
      DELETE FROM OrderMenuItems
      WHERE OrderMenuItems.item_name = rec_item.item_name;
      DELETE FROM MenuToMenuItems
      WHERE MenuToMenuItems.item_name = rec_item.item_name;
      DELETE FROM MenuItems
      WHERE MenuItems.item_name = rec_item.item_name;
  END IF;
  
  END LOOP;

CLOSE cursor_item_quantity;

END; 

$$

LANGUAGE plpgsql;
