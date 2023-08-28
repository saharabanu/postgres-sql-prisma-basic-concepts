
--  database CREATE

CREATE DATABASE practice_sql;

-- change  DATABASE name
ALTER DATABASE practice_sql RENAME to sql_practice;

-- delete DATABASE
DROP DATABASE test_sql;

--  create TABLE
CREATE TABLE learner(
    name VARCHAR(50),
    id INT
    
)

--  update table name
ALTER TABLE learner RENAME to student;
--  delete table
drop TABLE student;

--  some constraints  not null, unique, primari key(null hote parbena, unique hote hobe, index optimization) foreign key(), check (condition check kor e)

CREATE TABLE users (
    user_id SERIAL PRIMARY key,
    user_name VARCHAR(245) UNIQUE NOT NULL,
    email  VARCHAR(50) UNIQUE NOT NULL
);
--  if we need composite primary key then we use this pattern

CREATE TABLE products (
    product_id SERIAL,
    product_name VARCHAR(300) NOT NULL,
    category VARCHAR(70) NOT NULL,
    description VARCHAR(500),
    price INT NOT NULL,
    rating INT DEFAULT 3,
    PRIMARY KEY(product_id, product_name),
    UNIQUE(product_name, description)
);
drop TABLE products;

--  delete all rows from table  not table
TRUNCATE TABLE users;
--  insert table ADD

INSERT INTO products (product_id, product_name, category, price, description)
VALUES (2, 'hand watch1', 'ronsl', 35, 'dsfdsfggg');


--  get TABLES pg_identify_object

SELECT * FROM products;



--  use ALTER, add COLUMN, drop column,  change datatype of a column, rename column, set default value for a column,  add constraint to a column, drop constraint for  a column, table rename




--  add column ADD

ALTER TABLE products
ADD COLUMN stock INT DEFAULT 0 NOT NULL;
ALTER TABLE products
ADD COLUMN brand VARCHAR(400) DEFAULT 'apple' NOT NULL;


--  remove COLUMN
ALTER TABLE products
DROP COLUMN brand;
--  change column data TYPE
ALTER TABLE products 
  ALTER COLUMN stock type TEXT;

-- set default VALUES
ALTER TABLE products
ALTER COLUMN description SET DEFAULT 'HIHIHIHI';
--  drop cloumn default VALUES

ALTER TABLE products
ALTER COLUMN description DROP DEFAULT;

--  rename COLUMN
ALTER TABLE products
  RENAME COLUMN description TO product_desc;


--  add contraint ADD
ALTER TABLE products
ALTER COLUMN description SET NOT NULL ;
--  drop contraint ADD
ALTER TABLE products
ALTER COLUMN description DROP NOT NULL ;
SELECT * FROM products;








