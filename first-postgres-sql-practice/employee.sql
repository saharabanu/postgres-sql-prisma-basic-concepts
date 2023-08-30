CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

CREATE TABLE department(
  deptId SERIAL PRIMARY key,
  deptName VARCHAR(50)
);
TRUNCATE TABLE department;
INSERT INTO department VALUES(1, 'IT');


SELECT * FROM department;
CREATE TABLE employee (
    empId SERIAL PRIMARY KEY,
    empName VARCHAR(50) NOT NULL,
    departmentId INT,
    CONSTRAINT fk_department_id
      FOREIGN KEY(departmentId)
      REFERENCES department(deptId)
);
DROP TABLE employee;



TRUNCATE TABLE employee;
INSERT INTO employee VALUES(1, 'sahara', 1);
SELECT * FROM employee;

CREATE TABLE courses (
    courseId SERIAL PRIMARY KEY,
    courseName VARCHAR(50) NOT NULL,
    description VARCHAR(500),
    published_date DATE
    
);

INSERT INTO courses (courseName, description, published_date) VALUES
    ('postgresql', 'Emmet is great for that. With it installed in the code editor you are using, you can type “lorem” and then tab and it will expand into a paragraph of Lorem Ipsum placeholder text. But it can do more! You can control how much you get, place it within HTML structure as it expands, and get different bits of it in repeated elements.', '2020-07-01'),
    ('fullstack web development', 'With it installed in the code editor you are using, you can type “lorem” and then tab and it will expand into a paragraph of Lorem Ipsum placeholder text. But it can do more! You can control how much you get, place it within HTML structure as it expands, and get different bits of it in repeated elements.', '2022-07-12'),
    ('redux', 'Emmet is great for that. With it installed in the code editor you are using, you can type “lorem” and then tab and it will expand into a paragraph of Lorem Ipsum placeholder text. But it can do more! You can control how much you get.', '2010-07-01'),
    ('web development', 'Emmet is great for that. With it installed in the code editor you are using, you can type “lorem” and expand into a paragraph of Lorem Ipsum placeholder text. But it can do more! You can control how much you get, place it within HTML structure as it expands, and get different bits of it in repeated elements.', '2012-07-01'),
    ('mongoose', 'Emmet is great for that. With it installed in the code editor you are using, you can type “lorem” and then tab and it will expand into a paragraph of Lorem Ipsum placeholder text. But it can do more! You can control how much you get, place it within HTML structure as it expands, and get different bits of it in repeated elements.', '2001-07-01');



--  update database table row

UPDATE courses
SET 
    courseName = 'postgresql',
    description = 'hurray dummy text'
WHERE courseId = 1;

--  update database table multiple column  row

UPDATE courses
SET 
courseName = 'postgresql',
description = 'hurray dummy text'
WHERE courseId = 36;
 

 DELETE FROM courses;
SELECT * FROM courses;

CREATE TABLE IF NOT EXISTS departments (
    deptId SERIAL PRIMARY KEY,
    deptName TEXT NOT NULL
);

INSERT INTO departments (deptName) VALUES
    ('Marketing'),
    ('Sales'),
    ('Finance'),
    ('Human Resources'),
    ('Engineering'),
    ('Research and Development'),
    ('Customer Support'),
    ('Quality Assurance'),
    ('Product Management'),
    ('Design'),
    ('Operations'),
    ('Information Technology'),
    ('Legal'),
    ('Supply Chain'),
    ('Business Development'),
    ('Public Relations'),
    ('Administration'),
    ('Training'),
    ('Security'),
    ('Data Science');


CREATE TABLE IF NOT EXISTS employeeone (
    empId SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    salary INTEGER NOT NULL,
    joining_data DATE,
    deptId INTEGER NOT NULL,
    CONSTRAINT fk_dept_id
        FOREIGN KEY (deptId)
        REFERENCES departments (deptId) 
);
INSERT INTO employeeone (name, email, salary, joining_data, deptId) VALUES
    ('John Doe', 'john.doe@example.com', 60000, '2020-01-15', 1),
    ('Jane Smith', 'jane.smith@example.com', 55000, '2019-08-22', 2),
    ('Michael Johnson', 'michael.johnson@example.com', 70000, '2021-03-10', 3),
    ('Emily Brown', 'emily.brown@example.com', 65000, '2018-06-05', 1),
    ('Robert Williams', 'robert.williams@example.com', 75000, '2022-02-20', 4),
    ('Jessica Davis', 'jessica.davis@example.com', 60000, '2021-11-12', 5),
    ('Christopher Martinez', 'christopher.martinez@example.com', 80000, '2019-04-30', 2),
    ('Amanda Wilson', 'amanda.wilson@example.com', 70000, '2020-07-18', 3),
    ('David Anderson', 'david.anderson@example.com', 65000, '2022-05-08', 4),
    ('Jennifer Thomas', 'jennifer.thomas@example.com', 75000, '2018-10-25', 5),
    ('William Johnson', 'william.johnson@example.com', 70000, '2021-09-01', 1),
    ('Elizabeth Martinez', 'elizabeth.martinez@example.com', 60000, '2017-12-14', 2),
    ('James Smith', 'james.smith@example.com', 80000, '2019-06-03', 3),
    ('Sarah Davis', 'sarah.davis@example.com', 75000, '2020-03-28', 4),
    ('Daniel Brown', 'daniel.brown@example.com', 70000, '2021-08-09', 5),
    ('Olivia Williams', 'olivia.williams@example.com', 60000, '2018-11-19', 1),
    ('Matthew Johnson', 'matthew.johnson@example.com', 85000, '2022-04-02', 2),
    ('Sophia Martinez', 'sophia.martinez@example.com', 70000, '2020-09-14', 3),
    ('Andrew Smith', 'andrew.smith@example.com', 75000, '2019-02-27', 4),
    ('Isabella Davis', 'isabella.davis@example.com', 65000, '2021-01-07', 5);


SELECT * FROM departments;
SELECT joining_data FROM employeeone;
SELECT * FROM employeeone
WHERE salary < 700000 and salary > 80000 ;
SELECT * FROM employeeone
WHERE joining_data >= '2021-06-01';



-- limit and OFFSET
SELECT * FROM employeeone 
ORDER BY name
desc;

SELECT * FROM employeeone 
ORDER BY name
ASC LIMIT 10 OFFSET 2;

-- heist salary
SELECT * FROM employeeone 
ORDER BY salary
DESC LIMIT 1;

SELECT * FROM employeeone 
ORDER BY salary
desc LIMIT 1 OFFSET 3;


SELECT * FROM employeeone 
WHERE empId NOT IN(2,7,9);


SELECT * FROM employeeone 
WHERE salary BETWEEN 1000 AND 60000;
--  all h diye nam case sensitive
SELECT * FROM employeeone 
WHERE name LIKE '%h%'; 
--  last h diye nam
SELECT * FROM employeeone 
WHERE name LIKE '%h%'; 
--  first two caracter port n diye nam
SELECT * FROM employeeone 
WHERE name LIKE '__n%'; 
--  deptid null
SELECT * FROM employeeone 
WHERE name LIKE '__n%'; 



--  inner JOIN
SELECT employeeone.name, employeeone.salary, deptName 
FROM employeeone 
INNER JOIN departments ON departments.deptId = employeeone.deptId
;
SELECT * FROM employeeone;


-- practise baki ase 31 er (7-15)
