-- Drop All Tables
DO $$ DECLARE
  r RECORD;
BEGIN
  FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = current_schema()) LOOP
    EXECUTE 'DROP TABLE ' || quote_ident(r.tablename) || ' CASCADE';
  END LOOP;
END $$;

-- Create Entity Tables
CREATE TABLE Employees (
	eid SERIAL PRIMARY KEY,
	ename VARCHAR (255) NOT NULL,
	wage NUMERIC(10, 2) DEFAULT 0.00 NOT NULL CHECK (wage >= 0.00)
);

CREATE TABLE Waiters (
	eid INTEGER PRIMARY KEY REFERENCES Employees (eid)
);

CREATE TABLE Hostesses (
	eid INTEGER PRIMARY KEY REFERENCES Employees (eid)
);

CREATE TABLE Sections (
	section_id INTEGER PRIMARY KEY,
	section_name VARCHAR (255) NOT NULL
);

CREATE TABLE Tables (
	table_number INTEGER PRIMARY KEY,
	number_seats INTEGER CHECK (number_seats > 0),
	section_id INTEGER REFERENCES Sections (section_id)
);

CREATE TABLE Reservations (
	res_id SERIAL PRIMARY KEY,
	res_date DATE NOT NULL,
	res_time TIME NOT NULL
);

CREATE TABLE Orders (
	oid SERIAL PRIMARY KEY,
	order_date DATE NOT NULL DEFAULT CURRENT_DATE,
	order_time TIME NOT NULL DEFAULT CURRENT_TIME
);

CREATE TABLE Bills (
	bid SERIAL PRIMARY KEY,
	oid INTEGER REFERENCES Orders (oid),
	total NUMERIC(10, 2) NOT NULL CHECK (total >= 0.00)
);

CREATE TABLE Payments (
	pid SERIAL PRIMARY KEY,
	bid INTEGER REFERENCES Bills (bid),
	payment_date DATE NOT NULL DEFAULT CURRENT_DATE,
	payment_time TIME NOT NULL DEFAULT CURRENT_TIME,
	payment_type VARCHAR(63) NOT NULL,
	amount NUMERIC(10, 2) NOT NULL CHECK (amount >= 0.00),
	is_successful BOOLEAN NOT NULL
);

CREATE TABLE Menus (
	menu_name VARCHAR (255) PRIMARY KEY UNIQUE NOT NULL,
	is_active BOOLEAN NOT NULL
);

CREATE TABLE MenuItems (
	item_name VARCHAR (255) PRIMARY KEY UNIQUE NOT NULL,
	description VARCHAR (1023) NOT NULL,
	price NUMERIC(10, 2) NOT NULL CHECK (price >= 0.00)
);

-- Create Relationship Tables
CREATE TABLE MenutoMenuItems (
	menu_name VARCHAR (255) REFERENCES Menus (menu_name),
	item_name VARCHAR (255) REFERENCES MenuItems (item_name),
	PRIMARY KEY (menu_name, item_name)
);

CREATE TABLE Services (
	eid INTEGER PRIMARY KEY REFERENCES Waiters (eid),
	section_id INTEGER REFERENCES Sections (section_id),
	begin_time TIME NOT NULL,
	end_time TIME NOT NULL
);

CREATE TABLE ConfirmedReservations (
	res_id INTEGER PRIMARY KEY REFERENCES Reservations (res_id),
	eid INTEGER REFERENCES Hostesses (eid),
	confirmed_date DATE NOT NULL DEFAULT CURRENT_DATE,
	confirmed_time TIME NOT NULL DEFAULT CURRENT_TIME
);

CREATE TABLE TableReservations (
	res_id INTEGER,
	table_number INTEGER,
	FOREIGN KEY (res_id) REFERENCES Reservations (res_id),
	FOREIGN KEY (table_number) REFERENCES Tables (table_number),
	PRIMARY KEY (res_id, table_number)
);

CREATE TABLE OrderMenuItems (
	oid INTEGER REFERENCES Orders (oid),
	item_name VARCHAR(255),
	quantity INTEGER CHECK (quantity >= 0),
	FOREIGN KEY (item_name) REFERENCES MenuItems (item_name),
	PRIMARY KEY (oid, item_name)
);

CREATE TABLE TableOrders (
	oid INTEGER REFERENCES Orders (oid),
	table_number INTEGER,
	FOREIGN KEY (table_number) REFERENCES Tables (table_number),
	PRIMARY KEY (oid, table_number)
);
