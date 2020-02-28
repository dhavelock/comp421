-- Attempt to make employees wage negative
UPDATE Employees
SET wage = -1.00
WHERE Employees.eid = 4;

-- Add Table #20 to Section 1 with 0 seats
INSERT INTO Tables VALUES (20, 0, 1);

-- Insert a payment that has a negative amount value
INSERT INTO Payments (bid, payment_date, payment_time, payment_type, amount, is_successful) VALUES (1, '2020-02-06', '19:34', 'visa', -177.10, TRUE);

-- Attempt to update the price of Ravioli to a negative value
UPDATE MenuItems
SET price = -17.99
WHERE MenuItems.item_name = 'Carrot and Garam Masala Ravioli';

-- Add a reservation at a time that's already passed
INSERT INTO Reservations (res_date, res_time) VALUES ('2020-02-06', '18:15');
