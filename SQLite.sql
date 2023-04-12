SELECT * FROM demo;CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT NOT NULL,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

INSERT INTO customers (customer_id, first_name, last_name, email, phone, city, country)
VALUES
  (1, 'John', 'Doe', 'johndoe@example.com', '555-555-1212', 'New York', 'USA'),
  (2, 'Jane', 'Doe', 'janedoe@example.com', '555-555-1213', 'Los Angeles', 'USA'),
  (3, 'Bob', 'Smith', 'bobsmith@example.com', '555-555-1214', 'London', 'UK'),
  (4, 'Alice', 'Johnson', 'alicejohnson@example.com', '555-555-1215', 'Paris', 'France');

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  order_date DATE NOT NULL,
  total_amount REAL NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
  (1, 1, '2022-01-01', 100.00),
  (2, 1, '2022-02-01', 200.00),
  (3, 2, '2022-03-01', 150.00),
  (4, 3, '2022-04-01', 75.00),
  (5, 4, '2022-05-01', 125.00);