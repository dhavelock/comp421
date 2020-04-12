CREATE OR REPLACE PROCEDURE issue_all_outstanding_bills()
   AS $$

DECLARE 
	rec_order RECORD;

	cursor_outstanding_order CURSOR FOR SELECT Orders.oid FROM Orders WHERE Orders.oid NOT IN (SELECT Bills.oid FROM Bills);
BEGIN
    OPEN cursor_outstanding_order;
	
    LOOP
        FETCH cursor_outstanding_order INTO rec_order;
        EXIT WHEN NOT FOUND;

        INSERT INTO Bills (oid, total) 
        SELECT oid, sum ( MenuItems.price * OrderMenuItems.quantity) as item_total
        FROM OrderMenuItems INNER JOIN MenuItems
        ON OrderMenuItems.item_name = MenuItems.item_name AND OrderMenuItems.oid = rec_order.oid
        GROUP BY OrderMenuItems.oid ORDER BY OrderMenuItems.oid
  
  END LOOP;

CLOSE cursor_outstanding_order;

END; 

$$

LANGUAGE plpgsql;
