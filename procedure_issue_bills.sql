CREATE OR REPLACE PROCEDURE issue_all_outstanding_bills()
   AS $$

DECLARE 

	rec_order RECORD;
	amount_owed NUMERIC(10,2);
	cursor_outstanding_order CURSOR FOR SELECT Orders.oid FROM Orders WHERE Orders.oid NOT IN (SELECT Bills.oid FROM Bills);

BEGIN

    OPEN cursor_outstanding_order;

    LOOP

        FETCH cursor_outstanding_order INTO rec_order;
        EXIT WHEN NOT FOUND;


	SELECT sum ( MenuItems.price * OrderMenuItems.quantity) as item_total INTO amount_owed 
		FROM OrderMenuItems INNER JOIN MenuItems
		ON OrderMenuItems.item_name = MenuItems.item_name 
		AND OrderMenuItems.oid = rec_order.oid
		GROUP BY OrderMenuItems.oid ORDER BY OrderMenuItems.oid;
	
	INSERT INTO Bills(oid, total) VALUES (rec_order.oid, amount_owed);
  

     END LOOP;

     CLOSE cursor_outstanding_order;

END; 

$$

LANGUAGE plpgsql;
