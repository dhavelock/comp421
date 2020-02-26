-- Employees, Waiters and Hostesses
INSERT INTO Employees (ename, wage) VALUES ('Dylan Havelock', 15);
INSERT INTO Employees (ename, wage) VALUES ('Sam Catanni', 16.50);
INSERT INTO Employees (ename, wage) VALUES ('Alanna Ceci', 16.25);
INSERT INTO Employees (ename, wage) VALUES ('Connor Plante', 15.75);
INSERT INTO Employees (ename, wage) VALUES ('John Smith', 16.35);
INSERT INTO Employees (ename, wage) VALUES ('Alice Robinson', 18.35);
INSERT INTO Employees (ename, wage) VALUES ('Michael Jordan', 16.65);
INSERT INTO Employees (ename, wage) VALUES ('Tom Brady', 17.75);

INSERT INTO Waiters VALUES (1);
INSERT INTO Waiters VALUES (2);
INSERT INTO Waiters VALUES (3);
INSERT INTO Waiters VALUES (4);
INSERT INTO Hostesses VALUES (5);
INSERT INTO Hostesses VALUES (6);
INSERT INTO Hostesses VALUES (7);
INSERT INTO Hostesses VALUES (8);

-- Sections
INSERT INTO Sections VALUES (1, 'Front');
INSERT INTO Sections VALUES (2, 'Back');
INSERT INTO Sections VALUES (3, 'Upstairs');
INSERT INTO Sections VALUES (4, 'Private room');

-- Tables
INSERT INTO Tables VALUES (1, 2, 1);
INSERT INTO Tables VALUES (2, 2, 1);
INSERT INTO Tables VALUES (3, 4, 1);
INSERT INTO Tables VALUES (4, 4, 1);
INSERT INTO Tables VALUES (5, 4, 2);
INSERT INTO Tables VALUES (6, 4, 2);
INSERT INTO Tables VALUES (7, 6, 2);
INSERT INTO Tables VALUES (8, 2, 2);
INSERT INTO Tables VALUES (9, 4, 3);
INSERT INTO Tables VALUES (10, 4, 3);
INSERT INTO Tables VALUES (11, 2, 3);
INSERT INTO Tables VALUES (12, 2, 3);
INSERT INTO Tables VALUES (13, 4, 3);
INSERT INTO Tables VALUES (14, 8, 4);

-- Services
INSERT INTO Services VALUES (1, 1, '16:00', '23:00');
INSERT INTO Services VALUES (2, 2, '16:00', '23:00');
INSERT INTO Services VALUES (3, 3, '16:00', '23:00');
INSERT INTO Services VALUES (4, 4, '16:00', '23:00');

-- Reservations
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-06', '18:15');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-06', '19:15');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-07', '18:30');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-07', '20:00');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-08', '20:15');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-12', '18:00');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-13', '19:15');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-13', '19:30');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-14', '18:15');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-14', '18:30');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-14', '19:15');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-14', '19:45');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-15', '19:15');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-15', '20:15');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-16', '18:15');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-20', '20:30');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-21', '20:15');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-21', '21:15');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-22', '19:15');
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-22', '20:15');

-- Confirmed Reservations
INSERT INTO ConfirmedReservations VALUES (1, 5, '2020-02-04', '12:15');
INSERT INTO ConfirmedReservations VALUES (2, 5, '2020-02-05', '13:40');
INSERT INTO ConfirmedReservations VALUES (3, 5, '2020-02-05', '14:32');
INSERT INTO ConfirmedReservations VALUES (4, 6, '2020-02-07', '15:51');
INSERT INTO ConfirmedReservations VALUES (5, 6, '2020-02-07', '10:54');
INSERT INTO ConfirmedReservations VALUES (6, 6, '2020-02-07', '16:16');
INSERT INTO ConfirmedReservations VALUES (7, 5, '2020-02-06', '17:45');
INSERT INTO ConfirmedReservations VALUES (8, 7, '2020-02-09', '13:35');
INSERT INTO ConfirmedReservations VALUES (9, 8, '2020-02-11', '13:17');
INSERT INTO ConfirmedReservations VALUES (10, 8, '2020-02-10', '14:29');
INSERT INTO ConfirmedReservations VALUES (11, 5, '2020-02-08', '14:00');
INSERT INTO ConfirmedReservations VALUES (12, 6, '2020-02-12', '12:01');
INSERT INTO ConfirmedReservations VALUES (13, 6, '2020-02-03', '16:02');
INSERT INTO ConfirmedReservations VALUES (14, 5, '2020-02-04', '17:29');
INSERT INTO ConfirmedReservations VALUES (15, 7, '2020-02-12', '15:41');
INSERT INTO ConfirmedReservations VALUES (16, 7, '2020-02-14', '18:38');
INSERT INTO ConfirmedReservations VALUES (17, 5, '2020-02-16', '19:35');
INSERT INTO ConfirmedReservations VALUES (18, 8, '2020-02-17', '21:13');
INSERT INTO ConfirmedReservations VALUES (19, 8, '2020-02-17', '20:21');
INSERT INTO ConfirmedReservations VALUES (20, 5, '2020-02-18', '15:20');

-- Table Reservations
INSERT INTO TableReservations VALUES (1, 3);
INSERT INTO TableReservations VALUES (2, 4);
INSERT INTO TableReservations VALUES (3, 2);
INSERT INTO TableReservations VALUES (4, 6);
INSERT INTO TableReservations VALUES (5, 7);
INSERT INTO TableReservations VALUES (6, 6);
INSERT INTO TableReservations VALUES (7, 12);
INSERT INTO TableReservations VALUES (8, 11);
INSERT INTO TableReservations VALUES (9, 3);
INSERT INTO TableReservations VALUES (10, 2);
INSERT INTO TableReservations VALUES (11, 14);
INSERT INTO TableReservations VALUES (12, 12);
INSERT INTO TableReservations VALUES (13, 3);
INSERT INTO TableReservations VALUES (14, 6);
INSERT INTO TableReservations VALUES (15, 3);
INSERT INTO TableReservations VALUES (16, 1);
INSERT INTO TableReservations VALUES (17, 2);
INSERT INTO TableReservations VALUES (18, 8);
INSERT INTO TableReservations VALUES (19, 9);
INSERT INTO TableReservations VALUES (20, 3);

-- Orders
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-06', '18:32');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-06', '19:28');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-07', '18:49');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-07', '20:12');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-08', '20:29');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-12', '18:09');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-13', '19:30');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-13', '19:48');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-14', '18:31');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-14', '19:02');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-14', '19:19');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-14', '19:58');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-15', '19:19');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-15', '20:44');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-16', '18:39');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-20', '20:34');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-21', '20:19');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-21', '21:21');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-22', '19:18');
INSERT INTO Orders (order_date, order_time) VALUES ('2020-02-22', '20:32');

-- TableOrders
INSERT INTO TableOrders (oid, table_number) VALUES (1, 3);
INSERT INTO TableOrders (oid, table_number) VALUES (2, 4);
INSERT INTO TableOrders (oid, table_number) VALUES (3, 2);
INSERT INTO TableOrders (oid, table_number) VALUES (4, 6);
INSERT INTO TableOrders (oid, table_number) VALUES (5, 7);
INSERT INTO TableOrders (oid, table_number) VALUES (6, 6);
INSERT INTO TableOrders (oid, table_number) VALUES (7, 12);
INSERT INTO TableOrders (oid, table_number) VALUES (8, 11);
INSERT INTO TableOrders (oid, table_number) VALUES (9, 3);
INSERT INTO TableOrders (oid, table_number) VALUES (10, 2);
INSERT INTO TableOrders (oid, table_number) VALUES (11, 14);
INSERT INTO TableOrders (oid, table_number) VALUES (12, 12);
INSERT INTO TableOrders (oid, table_number) VALUES (13, 3);
INSERT INTO TableOrders (oid, table_number) VALUES (14, 6);
INSERT INTO TableOrders (oid, table_number) VALUES (15, 3);
INSERT INTO TableOrders (oid, table_number) VALUES (16, 1);
INSERT INTO TableOrders (oid, table_number) VALUES (17, 2);
INSERT INTO TableOrders (oid, table_number) VALUES (18, 8);
INSERT INTO TableOrders (oid, table_number) VALUES (19, 9);
INSERT INTO TableOrders (oid, table_number) VALUES (20, 3);

-- Menu
INSERT INTO Menus VALUES ('Brunch', TRUE);
INSERT INTO Menus VALUES ('Mains', TRUE);
INSERT INTO Menus VALUES ('Desserts', TRUE);

-- Menu Items
INSERT INTO MenuItems VALUES ('Scallops', 'Beluga lentils, green curry-coconut sauce, 
					   tamarind braised savoy cabbage, buttermilk fried cauliflower, 
					   roasted parsnips, spicy peanuts', 36);
INSERT INTO MenuItems VALUES ('72-Hour Short Ribs', 'Quebéc beef boneless short ribs, sunchokes, 
					   celeriac, collard greens, king oyster mushrooms, spent grain 
					   crumble, kakiage tempura, stout jus', 40);
INSERT INTO MenuItems VALUES ('Woodland Mushroom Arancini', 'Breaded arancini stuffed with 
					   mozzarella, arugula pesto, caponata agrodolce, bomba calabrese, 
					   green zucchini, cherry tomatoes, grated Perigord Truffle', 28);
INSERT INTO MenuItems VALUES ('Wild Boar Loin', 'Sous vide boar loin, mini tourtière, rutabaga 
					   pavé, roasted chestnuts, romanesco, cranberry mostarda', 38);
INSERT INTO MenuItems VALUES ('Carrot and Garam Masala Ravioli', 'Lamb belly bacon, Brussels 
					   sprouts, honey mushrooms, pickled raisins, walnuts, lamb jus, 
					   mustard greens', 28);
INSERT INTO MenuItems VALUES ('Catfish & Andouille Sausage', 'Honey-lime glazed catfish filet, 
					   grilled & smoked Andouille sausages, gumbo, green beans with crushed 
					   almonds, remoulade, chayote, green onion and nigella seed hush 
					   puppies', 32);
INSERT INTO MenuItems VALUES ('Blind Tasting Menu', '$135 with pairings. Participation of the entire 
					   table is required. Modifications to the “Tasting Menu” can not be 
					   accommodated.', 90);
INSERT INTO MenuItems VALUES ('Chocolate Pudding', 'Marbled rye bread pudding, toasted meringue cookies, 
				       maple sponge toffee, port pearls, chocolate sauce, fresh figs', 13);
INSERT INTO MenuItems VALUES ('Pineapple Sour Cream Cake', 'Pina colada sorbet, tapioca pearls in ginger 
					   syrup, mango curd, ground cherries, cashew tuille, powdered curry, lemon balm', 12);
INSERT INTO MenuItems VALUES ('Apple Cider-Cranberry Soufflé', 'Cinnamon and butterscotch chip ice cream, 
					   pie crust crumble', 15);
					   
-- Menu to menu items
INSERT INTO MenutoMenuItems VALUES ('Mains', 'Scallops');
INSERT INTO MenutoMenuItems VALUES ('Mains', '72-Hour Short Ribs');
INSERT INTO MenutoMenuItems VALUES ('Mains', 'Woodland Mushroom Arancini');
INSERT INTO MenutoMenuItems VALUES ('Mains', 'Wild Boar Loin');
INSERT INTO MenutoMenuItems VALUES ('Mains', 'Carrot and Garam Masala Ravioli');
INSERT INTO MenutoMenuItems VALUES ('Mains', 'Catfish & Andouille Sausage');
INSERT INTO MenutoMenuItems VALUES ('Mains', 'Blind Tasting Menu');
INSERT INTO MenutoMenuItems VALUES ('Desserts', 'Chocolate Pudding');
INSERT INTO MenutoMenuItems VALUES ('Desserts', 'Pineapple Sour Cream Cake');
INSERT INTO MenutoMenuItems VALUES ('Desserts', 'Apple Cider-Cranberry Soufflé');

-- Order Menu Items
INSERT INTO OrderMenuItems VALUES (1, 'Scallops', 2);
INSERT INTO OrderMenuItems VALUES (1, 'Woodland Mushroom Arancini', 1);
INSERT INTO OrderMenuItems VALUES (1, 'Carrot and Garam Masala Ravioli', 1);
INSERT INTO OrderMenuItems VALUES (1, 'Chocolate Pudding', 2);
INSERT INTO OrderMenuItems VALUES (2, 'Wild Boar Loin', 1);
INSERT INTO OrderMenuItems VALUES (2, 'Catfish & Andouille Sausage', 1);
INSERT INTO OrderMenuItems VALUES (2, 'Carrot and Garam Masala Ravioli', 1);
INSERT INTO OrderMenuItems VALUES (2, '72-Hour Short Ribs', 1);
INSERT INTO OrderMenuItems VALUES (2, 'Pineapple Sour Cream Cake', 1);
INSERT INTO OrderMenuItems VALUES (2, 'Chocolate Pudding', 1);
INSERT INTO OrderMenuItems VALUES (3, 'Scallops', 1);
INSERT INTO OrderMenuItems VALUES (3, 'Wild Boar Loin', 1);
INSERT INTO OrderMenuItems VALUES (3, 'Chocolate Pudding', 1);
INSERT INTO OrderMenuItems VALUES (4, 'Blind Tasting Menu', 4);
INSERT INTO OrderMenuItems VALUES (5, 'Woodland Mushroom Arancini', 1);
INSERT INTO OrderMenuItems VALUES (5, 'Carrot and Garam Masala Ravioli', 2);
INSERT INTO OrderMenuItems VALUES (5, '72-Hour Short Ribs', 3);
INSERT INTO OrderMenuItems VALUES (5, 'Chocolate Pudding', 3);
INSERT INTO OrderMenuItems VALUES (6, 'Carrot and Garam Masala Ravioli', 1);
INSERT INTO OrderMenuItems VALUES (6, '72-Hour Short Ribs', 1);
INSERT INTO OrderMenuItems VALUES (6, 'Woodland Mushroom Arancini', 2);
INSERT INTO OrderMenuItems VALUES (7, 'Scallops', 2);
INSERT INTO OrderMenuItems VALUES (7, 'Apple Cider-Cranberry Soufflé', 1);
INSERT INTO OrderMenuItems VALUES (8, 'Catfish & Andouille Sausage', 1);
INSERT INTO OrderMenuItems VALUES (8, 'Wild Boar Loin', 1);
INSERT INTO OrderMenuItems VALUES (9, 'Woodland Mushroom Arancini', 1);
INSERT INTO OrderMenuItems VALUES (9, 'Carrot and Garam Masala Ravioli', 1);
INSERT INTO OrderMenuItems VALUES (9, 'Wild Boar Loin', 1);
INSERT INTO OrderMenuItems VALUES (9, 'Scallops', 1);
INSERT INTO OrderMenuItems VALUES (10, 'Blind Tasting Menu', 2);
INSERT INTO OrderMenuItems VALUES (11, 'Blind Tasting Menu', 8);
INSERT INTO OrderMenuItems VALUES (12, 'Carrot and Garam Masala Ravioli', 1);
INSERT INTO OrderMenuItems VALUES (12, '72-Hour Short Ribs', 1);
INSERT INTO OrderMenuItems VALUES (12, 'Pineapple Sour Cream Cake', 1);
INSERT INTO OrderMenuItems VALUES (13, 'Carrot and Garam Masala Ravioli', 1);
INSERT INTO OrderMenuItems VALUES (13, '72-Hour Short Ribs', 1);
INSERT INTO OrderMenuItems VALUES (13, 'Scallops', 1);
INSERT INTO OrderMenuItems VALUES (13, 'Pineapple Sour Cream Cake', 1);
INSERT INTO OrderMenuItems VALUES (14, 'Catfish & Andouille Sausage', 1);
INSERT INTO OrderMenuItems VALUES (14, 'Wild Boar Loin', 1);
INSERT INTO OrderMenuItems VALUES (14, 'Woodland Mushroom Arancini', 1);
INSERT INTO OrderMenuItems VALUES (14, 'Carrot and Garam Masala Ravioli', 1);
INSERT INTO OrderMenuItems VALUES (15, 'Woodland Mushroom Arancini', 3);
INSERT INTO OrderMenuItems VALUES (15, 'Wild Boar Loin', 1);
INSERT INTO OrderMenuItems VALUES (15, 'Chocolate Pudding', 1);
INSERT INTO OrderMenuItems VALUES (16, 'Blind Tasting Menu', 2);
INSERT INTO OrderMenuItems VALUES (17, 'Wild Boar Loin', 1);
INSERT INTO OrderMenuItems VALUES (17, 'Scallops', 1);
INSERT INTO OrderMenuItems VALUES (18, 'Blind Tasting Menu', 2);
INSERT INTO OrderMenuItems VALUES (19, 'Catfish & Andouille Sausage', 1);
INSERT INTO OrderMenuItems VALUES (19, 'Woodland Mushroom Arancini', 1);
INSERT INTO OrderMenuItems VALUES (19, 'Carrot and Garam Masala Ravioli', 2);
INSERT INTO OrderMenuItems VALUES (20, 'Blind Tasting Menu', 4);

-- Bills
INSERT INTO Bills (oid, total) 
SELECT oid, sum ( MenuItems.price * OrderMenuItems.quantity) as item_total
FROM OrderMenuItems INNER JOIN MenuItems
ON OrderMenuItems.item_name = MenuItems.item_name
GROUP BY OrderMenuItems.oid ORDER BY OrderMenuItems.oid
;

-- Payments
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (1, '2020-02-06', '19:34', 'visa', 177.10, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (2, '2020-02-06', '20:36', 'amex', 195.40, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (3, '2020-02-07', '19:54', 'visa', 102.90, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (4, '2020-02-07', '21:34', 'visa', 421.92, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (5, '2020-02-08', '21:45', 'cash', 290.12, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (6, '2020-02-12', '19:34', 'visa', 177.10, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (7, '2020-02-13', '20:55', 'amex', 122.39, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (8, '2020-02-13', '21:24', 'mastercard', 93.91, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (9, '2020-02-14', '21:34', 'visa', 186.73, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (10, '2020-02-14', '22:45', 'mastercard', 234.12, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (11, '2020-02-14', '21:54', 'visa', 864.00, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (12, '2020-02-14', '21:25', 'visa', 100.39, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (13, '2020-02-15', '20:24', 'mastercard', 208.80, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (14, '2020-02-15', '21:34', 'visa', 231.73, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (15, '2020-02-16', '22:45', 'mastercard', 251.12, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (16, '2020-02-20', '21:54', 'visa', 264.00, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (17, '2020-02-21', '21:25', 'visa', 105.21, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (18, '2020-02-21', '22:43', 'mastercard', 218.80, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (19, '2020-02-22', '20:29', 'visa', 135.73, TRUE);
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful)
VALUES (20, '2020-02-22', '22:45', 'mastercard', 456.32, TRUE);
