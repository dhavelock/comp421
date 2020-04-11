// Wrap these in "\COPY (<query>) TO file.csv WITH CSV" to export 

//Overall sales/day:

select orders.order_date, sum(bills.total) as daily_total from bills inner join orders on bills.oid = orders.oid group by orders.order_date order by orders.order_date;

//Sum of items sold per day by item:

select distinct item_name, sum(quantity) as units_sold, order_date from ordermenuitems inner join orders on ordermenuitems.oid = orders.oid group by item_name, order_date order by order_date;
