-- Create index on oid for Bills 
CREATE INDEX oid_index ON Bills(oid);

-- Drop index 
DROP INDEX oid_index;

-- Create index on 
CREATE INDEX date_index ON Reservations(res_date);
CLUSTER Reservations USING date_index;

-- Drop index 
DROP INDEX date_index;
