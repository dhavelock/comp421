-- update wage of all hostesses by 10% 
UPDATE Employees
SET wage = Employees.wage *1.1
FROM Hostesses
WHERE Employees.eid = Hostesses.eid;

-- update prices of mains by 2%
UPDATE MenuItems
SET price = MenuItems.price * 1.02 
FROM MenutoMenuItems 
WHERE MenuItems.item_name = MenutoMenuItems.item_name 
AND MenutoMenuItems.menu_name = 'Mains';

-- delete all reservations on 02-06-2020 
DELETE FROM TableReservations 
USING Reservations 
WHERE TableReservations.res_id = Reservations.res_id 
AND Reservations.res_date = '2020-02-06';

DELETE FROM ConfirmedReservations 
USING Reservations 
WHERE ConfirmedReservations.res_id = Reservations.res_id
AND Reservations.res_date = '2020-02-06';

DELETE FROM Reservations WHERE res_date = '2020-02-06';

-- update bill total on 02-14-2020 to reflect discount 
UPDATE Bills 
SET total = total * 0.75 
FROM Orders 
WHERE Bills.oid = Orders.oid 
AND Orders.order_date = '02-14-2020'
