# What is PostgreSQL?

``PostgreSQL`` is a **powerful, open-source** relational database system that helps us store, organize, and manage data using ``SQL (Structured Query Language).``
It supports many useful features like advanced **data types,** complex searches, ``foreign keys`` (to link tables), ``triggers`` (to run actions automatically), and ``views`` (to simplify data access). ``PostgreSQL`` also lets us write custom functions using different **programming languages.** Because it follows ``SQL`` standards well and supports important database rules like **ACID (Atomicity, Consistency, Isolation, Durability),** it's a great choice for developers and companies who need a database that's fast, secure, and easy to scale.

### To understand PostgreSQL simply, let’s get acquainted with a real-world example –
Our university library contains various of data that we need to keep track of:

- Books
- Authors
- Members
- Loans
  
We could use ``PostgreSQL`` to create tables for each of those and easily **search,** **update,** or **remove** information using ``SQL`` commands.

**We want to store a list of books in a library**
1. At first we have to create table
<pre><code>PostgreSQL 

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    author VARCHAR(50),
    published_year INT
);</code> </pre>
2. Insert table
<pre><code>PostgreSQL 

INSERT INTO books (title, author, published_year) 
VALUES
('Harry Potter', 'J.K. Rowling', 1997),
('The Hobbit', 'J.R.R. Tolkien', 1937),
('1984', 'George Orwell', 1949);</code> </pre>

### Why use ``PostgreSQL``?
``PostgreSQL`` is a **powerful** and **flexible** database system. It lets us add new features like custom functions and data types. It also supports **advanced** tools such as ``JSON,`` ``indexing,`` and ``full-text`` search. ``PostgreSQL`` is known for its strong **performance,** **reliability,** and **ability** to handle large amounts of data.

### What are the benefits of ``PostgreSQL``?
``PostgreSQL`` offers many **powerful** features that make it a top choice for **developers** and **database administrators.** Let’s break down its main benefits in a simple way:
1. **Flexible and Easy to Customize**
``PostgreSQL`` is very flexible. We can adjust it to fit almost any project. It supports many **programming languages,** allows custom data types, and lets us create our own functions. This means we can build **powerful** solutions directly in the database without needing extra tools or workarounds.
2. **High Performance and Scalable**
``PostgreSQL`` is built for speed and can handle large amounts of data and many users at the same time. It uses smart **techniques** to store and find data quickly, making it perfect for **websites.**
1. **Smart Query Optimization**
``PostgreSQL`` is great at running **complex** queries fast. It uses advanced methods like index-only scans and bitmap scans to reduce the time it takes to get results. This makes it ideal for tasks like **data analysis,** **reporting,** and **business** **intelligence.**
1. **Strong Community and Support**
PostgreSQL has been around for over 20 years and has a large, active community. Developers and users from all over the world help improve it by sharing tools, extensions, and advice. This means we’ll always have access to updates, plugins, documentation, and forums if we need help.


# Explain the ``Primary Key`` and ``Foreign Key`` concepts in PostgreSQL.
``Keys`` are a very important part of a **relational database.** They help connect different tables and also make sure each piece of data can be **uniquely** identified.A ``Primary Key`` is a special column (or group of columns) in a table that uniquely identifies each row. No two rows can have the same value for the ``primary key.`` A ``Foreign Key`` is used to link two tables together. It is a column in one table that refers to the ``primary key`` in another table. This helps create a **relationship** between the two tables.
### Primary Key
A ``Primary Key`` is one or more columns in a table that uniquely identify each row. It makes sure that every row is different and it cannot contain **null** values.

**Example:** 

<pre><code>PostgreSQL 

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INT
);</code> </pre>

- student_id is the primary key of the table.
- It automatically gets a unique number for each student.
- No two students can have the same student_id.
  
### Foreign Key
A ``foreign key`` is a column in one table that **connects** to the ``primary key`` in another table. This creates a **relationship** between the two tables. In ``PostgreSQL,`` we can add a ``foreign key`` when creating a table or even after the table is already created.A ``foreign key`` makes sure that the value in one table must match a value in the other table — helping to keep our data consistent.

**Example:**
<pre><code>PostgreSQL 

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name TEXT NOT NULL,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);</code></pre>

- Here, student_id in the courses table is the foreign key.
- It points to student_id in the students table.
- This means a course can only be linked to a student that already exists in the students table.
  
**Simple Visualization:** 

**Table: students**

|  student_id  |   name   |  age  |
|--------------|----------|-------|
|     1        |   Ridoy  |   21  |
|     2        |   Shohag |   22  |

**Table: courses**

| course_id | course_name | student_id |
|-----------|-------------|------------|
|     1     |     Math    |      1     |
|     2     |    Physics  |      2     |

- The **student_id** in the **courses** table points to the **student_id** in the **students** table.
- If we try to add a course with **student_id** = 3 (but no student has student_id = 3), ``PostgreSQL`` will show an error.

### Why Are ``Primary Key`` and ``Foreign Key`` Important?
- ``Primary Keys`` make sure that each row in a table is unique and can be **clearly identified.**
- ``Foreign Keys`` link one table to another, helping maintain correct **relationships** between data.
- Using multiple tables connected by keys helps us avoid repeating the same data in different places.
- Keys also help us easily combine data from different tables using queries.

# What is the difference between the ``VARCHAR`` and ``CHAR`` data types?

``CHAR`` and ``VARCHAR`` are two commonly used data types in ``SQL`` for storing text. While both serve the same general purpose, they differ in how they manage **storage.** ``CHAR`` is a fixed-length data type, which means it always **allocates** the full defined length of space, regardless of the actual size of the stored data. On the other hand, ``VARCHAR`` is a **variable-length** type that adjusts its storage based on the actual size of the input, making it more space-efficient when dealing with strings of different lengths. Although ``VARCHAR`` is generally better in terms of storage efficiency, ``CHAR`` can offer **better** **performance** in some situations due to its fixed size. 
### Let’s try to analyze through an example: 
### <u>CHAR</u>
| B | o | y |  |  |  |  |  |  |  |
|---|---|---|--|--|--|--|--|--|--|

| H | e | l | l | o |  |  |  |  |  |
|---|---|---|---|---|--|--|--|--|--|

A ``CHAR(10)`` column will use 10 characters of storage regardless of whether we store **''Boy''** (3 characters) or **''Hello''** (5 characters). The remaining space is padded with blank characters. 

``VARCHAR`` is variable-length, **allocating** only the space needed for the actual data plus a small overhead (usually 1-2 bytes) to track the length. A ``VARCHAR(10)`` column storing **''Boy''** uses approximately 4 bytes (3 characters + 1 byte for length), making it more **space-efficient** for shorter or variable-length data.

### <u>VARHAR</u>
| B | o | y |
|---|---|---|

| H | e | l | l | o |
|---|---|---|---|---|

### Lets try to understand the difference through other example
**Performance:**  
``CHAR`` typically offers better performance than ``VARCHAR,`` especially in scenarios where the text length is consistent, because it uses fixed-length storage. This fixed size allows the database engine to access and process the data more **quickly** and **efficiently.** We can use the ID number of our university's bachelor student as an example. My ID number is ``223190020``. The ID numbers of all past and present bachelor students of our university are 9 characters long. For example:- ``223190018``, ``203192276``, ``163076676``, ``...``. 

**student_id** ``CHAR(6)``
- Great for performance, especially if we frequently query or filter using this field.

``VARCHAR,`` on the other hand, may result in slightly **slower** performance since it must handle variable-length data. The **database** needs to track the actual length of each entry, which can add a small amount of overhead during data retrieval and processing. For Example Imagine we’re designing a database to store user comments on a website. Comments can be very short ``("Nice!")`` or quite long ``("I really enjoyed this product because...")``.

**comment** ``VARCHAR(200)``
- Some users may write just 5 characters, others may use up to 200.
- When retrieving data, the database engine must calculate where each record starts and ends, adding a bit of processing time.


# What are the ``LIMIT`` and ``OFFSET`` clauses used for?
The ``LIMIT`` and ``OFFSET`` clauses in ``PostgreSQL`` are **helpful** tools for controlling how much data we get from a query. When working with large tables, it's often not practical to **display** all the data at once. That’s where ``LIMIT`` and ``OFFSET`` come in — they let us choose exactly how many rows to show and where to start. These clauses are commonly used in **web applications**, **reports**, and **dashboards** to improve performance and provide a better user experience.

### <u>LIMIT</u>
This clause is used to limit the number of results returned. For example, if we only want to see 10 **rows** from a table, we can use ``LIMIT 10``. It's **helpful** for **improving** performance, saving resources, and showing only the needed data to users.
### <u>OFFSET</u>
This clause is used to **skip** a number of rows before showing the results. For example, ``OFFSET 10`` **skips** the first 10 rows and starts showing from the 11th row. It’s commonly used with ``LIMIT`` to create **pagination**, such as showing results page by page.

### Lets say I have a students table like this:

|  id  |   name   |
|------|----------|
|   1  |   Ridoy  |
|   2  |   Shohag |
|   3  |   Fatema |
|   4  |   Daniel |
|   5  |   Emma   |
|   6  |  Mojibur |
|   7  |   Asif   |

**If I use LIMIT only:**
<pre><code>PostgreSQL 

SELECT * FROM students
LIMIT 3;</code></pre>
|  id  |   name   |
|------|----------|
|   1  |   Ridoy  |
|   2  |   Shohag |
|   3  |   Fatema |

👉 It just shows the first 3 rows.

**If I Use LIMMIT with OFFSET:**
<pre><code>PostgreSQL 

SELECT * FROM students
LIMIT 2 OFFSET 2;;</code></pre>
|  id  |   name   |
|------|----------|
|   3  |   Fatema |
|   4  |   Daniel |

👉 It skips the first 2 rows, and then shows the next 2 rows.

### Key Points where ``LIMIT`` and ``OFFSET`` used:
``LIMIT`` and ``OFFSET`` are useful ``SQL`` clauses that help control the amount and starting point of data returned from a **query.**

- ``LIMIT`` and ``OFFSET`` can be used to **paginate results**, **improving usability** and **performance.**
- ``LIMIT`` can be used for data **sampling**, **performance optimization**, and enforcing **security** and privacy policies.
- ``OFFSET`` changes the starting point of results, allowing for more flexible data retrieval.


# How can you modify data using ``UPDATE`` statements?
The ``UPDATE`` **statement** plays an **important** role in modifying the data that already exists in a table. This command allows users to update one or more columns based on **specific conditions**, making it essential for **maintaining** and **managing** dynamic data in a database. We can apply changes to specific rows based on conditions provided in the ``WHERE`` clause, making it a **flexible** and **powerful** tool for managing dynamic data.
### The basic syntax of the Postgres ``UPDATE`` statement
<pre><code>PostgreSQL 

UPDATE table_name
SET column1 = new_value1,
    column2 = new_value2,
    .....
WHERE condition
</code> </pre>
**In this syntax:**  
1. Specify the name of the table that we want to update data in after the ``UPDATE`` keyword. 
2. Specify columns and their new values after ``SET`` keyword. The columns that do not appear in the ``SET`` clause retain their original values. 
3. Determine which rows to update in the condition of the ``WHERE`` clause. 
   
The ``WHERE`` clause is optional. If we omit the ``WHERE`` clause, the ``UPDATE`` **statement** will **update** all rows in the table.
### Let’s take examples of using the ``PostgreSQL`` ``UPDATE`` statement
**<u>Setting up a sample table:</u>**

**The following statements create a table called  marks:**
<pre><code>PostgreSQL 

CREATE TABLE marks (
  id SERIAL PRIMARY KEY,
  name TEXT,
  course TEXT,
  mark  INT
);</code> </pre>


**And the table has some data:**
|  student_id  |   name   |  course  |  mark  |
|--------------|----------|----------|--------|
|     1        |   Ridoy  |   Math   |   87   |
|     2        |   Shohag | Physics  |   90   |
|     3        |   Fatema |   Math   |   93   |


**``PostgreSQL`` ``UPDATE`` example**
<u>Example 1:  ``Update`` a Single Record With a New Value</u>
The following statement uses the ``UPDATE`` statement to update the marks with id 2 by changing the mark to 94.

<pre><code>PostgreSQL 

UPDATE marks 
SET mark = 94
WHERE id = 2;</code> </pre>

After update:
|  student_id  |   name   |  course  |  mark  |
|--------------|----------|----------|--------|
|     1        |   Ridoy  |   Math   |   87   |
|     2        |   Shohag | Physics  |   94   |
|     3        |   Fatema |   Math   |   93   |

This will update the row where id= 2 and set the mark to 94

<u>Example 2: Update All Records</u>
Consider another update scenario where we want to change the value of a column in all records of a table. The following statement uses an ``UPDATE`` statement to increase the mark of all the courses by 5.

<pre><code>PostgreSQL 

UPDATE marks
SET mark = mark + 5;</code> </pre>

After update
|  student_id  |   name   |  course  |  mark  |
|--------------|----------|----------|--------|
|     1        |   Ridoy  |   Math   |   92   |
|     2        |   Shohag | Physics  |   99   |
|     3        |   Fatema |   Math   |   98   |

we did not use a ``WHERE`` clause, the ``UPDATE statement updates all the rows in the marks table
