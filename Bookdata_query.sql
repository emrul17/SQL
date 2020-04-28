# For this practice i used library database that contains tables: Books, customers and orders. Different queries are searched and answered 
# business questions

USE library; 

# Find the Full name of the authors and the title. CONCAT or CONCAT_WS is used to merge the two columns
SELECT 
    author_fname,
    author_lname,
    CONCAT(author_fname, ' ', author_lname) AS Full_Name,
    title
FROM
    books;
    
SELECT 
    author_fname,
    author_lname,
    CONCAT_WS(' ', author_fname, author_lname) AS Full_Name,
    title
FROM
    books;    

# Read the title in short form. To do this substring can be used.

SELECT 
    CONCAT(SUBSTRING(title, 1, 10), '...') AS Short_title
FROM
    books;
    
    -- select replace('Hello world','Hello', '123');
    
-- How to replace the text? REPLACE is used to replace the text. Let's replace the title of the books with "OOO" where title has letter m.

SELECT 
    REPLACE(title, 'm', 'OOO') AS Wierd
FROM
    books; 
    
SELECT 
    SUBSTRING(REPLACE(title, 'm', 'OOO**OO'),
        1,
        10) AS wierd_title
FROM
    books;
    
# Can you reverse the first name of the author?

SELECT 
    (CONCAT(author_fname, ' ', REVERSE(author_fname))) As reversed_name
FROM
    books;
    
# Find the length of the title of each books.alter
SELECT author_lname,
    CONCAT('The length of the title : ',
            substring(title, 1,6),
            ' is ',
            CHAR_LENGTH(title),
            ' character long') AS length
FROM
    books;
    
# Find the top 5 books with longest title

SELECT 
    title, CHAR_LENGTH(title) AS Char_length
FROM
    books
order by Char_length 
DESC limit 5;

# Make upper case for all author last name and lower case for first name.alter

SELECT 
    UPPER(author_fname), LOWER(author_lname)
FROM
    books;
    
    
# Reverse and upper cass the following sentence: sql is very important language to become a data scientist.

SELECT REVERSE('mysql is very important language to become a data scientist');
SELECT UPPER('mysql is very important language to become a data scientist');

# Replace all the "spaces" in the book title with **.

SELECT 
    REPLACE(title, ' ', '**')
FROM
    books;
    
# Print the author full name and make them upper case.

select author_fname, author_lname, upper(concat_WS(' ', author_fname, author_lname)) as full_name from books;

# Print the short title(10 characters) of the books and the author last name and quantity in stock.

SELECT 
    CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
    author_lname,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;
    
# Insert the following new books into the table

    INSERT INTO books
        (title, author_fname, author_lname, released_year, stock_quantity, pages)
        VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
               ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
               ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
     
     
# select the distinct author     
SELECT DISTINCT
    author_lname, author_fname
FROM
    books;
    
# Find 10 lastest boks

SELECT 
    title, author_lname, released_year
FROM
    books
ORDER BY released_year DESC
LIMIT 5;


# More example of order by
SELECT title, pages FROM books ORDER BY released_year;
 
SELECT title, author_fname, author_lname 
FROM books ORDER BY 2;
 
SELECT title, author_fname, author_lname 
FROM books ORDER BY 3;
 
SELECT title, author_fname, author_lname 
FROM books ORDER BY 1;
 
SELECT title, author_fname, author_lname 
FROM books ORDER BY 1 DESC;
 
SELECT author_lname, title
FROM books ORDER BY 2;
 
SELECT author_fname, author_lname FROM books 
ORDER BY author_lname, author_fname;

# Find the books that starts with alter

SELECT 
    title
FROM
    books
WHERE
    title LIKE 'A%';
    
# Find the book that has da in the first name.

select author_fname, title from books where author_fname like "%da%";

# More example

SELECT title FROM books WHERE title LIKE '%the%' ;

# Find the books with title that has % in it

SELECT 
    title
FROM
    books
WHERE
    title LIKE '%\%%';

# Find the all the books with quantity of upt to 2 digits.
select title, stock_quantity from books where stock_quantity like '___';
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '__';

# Find all books with the title contains stories;

SELECT 
    title
FROM
    books
WHERE
    title LIKE '%stories%';
    
# Find the longest books

SELECT 
    title, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;

# Find the books that conatin space in the author_lname

SELECT 
    *
FROM
    books
WHERE
    author_lname LIKE '% %';
    
# Count
# How many books are there in the table?
SELECT 
    COUNT(*)
FROM
    books;
    
# How many distinct books are there?

select count(distinct title) as quantity from books;

# Many authors are there?
 SELECT 
    COUNT(DISTINCT author_fname, author_lname)
FROM
    books;

 # Group by 
 
 select title, author_lname, count(*) from books group by author_lname;
 
 SELECT 
    CONCAT('In ',
            released_year,
            ' ',
            COUNT(*),
            ' book(s) released') AS year
FROM
    books
GROUP BY released_year;

# MIN, Max function

SELECT MIN(released_year) 
    FROM books;
   
SELECT MIN(pages) FROM books;
     
SELECT MAX(pages) 
    FROM books;
     
SELECT MAX(released_year) 
    FROM books;
     
SELECT MAX(pages), title
    FROM books;
    
# Max
SELECT * FROM books 
    WHERE pages = (SELECT Min(pages) 
                    FROM books); 
     
SELECT title, pages FROM books 
    WHERE pages = (SELECT Max(pages) 
                    FROM books); 
     
SELECT title, pages FROM books 
    WHERE pages = (SELECT Min(pages) 
                    FROM books); 
     
SELECT * FROM books 
    ORDER BY pages ASC LIMIT 1;
     
SELECT title, pages FROM books 
    ORDER BY pages ASC LIMIT 1;
     
SELECT * FROM books 
    ORDER BY pages DESC LIMIT 1;
    
# Find the year that each author published their first book.
SELECT 
    author_fname, 
    author_lname, min(released_year) FROM
    books group by author_fname, author_lname;
    
# Find the longest page count for each author.

SELECT 
    author_lname, author_fname, MAX(pages)
FROM
    books
GROUP BY author_fname , author_lname;

SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
         author_fname;
# Sum all pages in the entire database.
SELECT 
    SUM(pages)
FROM
    books;

# Find all pages each author has written.
SELECT 
    author_fname, author_lname, SUM(pages)
FROM
    books
GROUP BY author_fname , author_lname;

# Calculate the average pages each author has written.
SELECT 
    author_fname, author_lname, round(AVG(pages),2)
FROM
    books
GROUP BY author_fname , author_lname;

# Calculate the average stock quantity for the books released in the same year.
SELECT 
    released_year, ROUND(AVG(stock_quantity), 2)
FROM
    books
GROUP BY released_year;

# Print the number of books in the database
SELECT 
    COUNT(*)
FROM
    books;

# Print how many books were released each year
SELECT 
    released_year, COUNT(*)
FROM
    books
GROUP BY released_year;

# print total number of books in stock

SELECT 
    SUM(stock_quantity)
FROM
    books;
    
# Find the full name of the author who wrote the longest book

SELECT 
    CONCAT(author_fname, ' ', author_lname) as full_name, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;

SELECT 
    pages, CONCAT(author_fname, ' ', author_lname) as full_name
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);
select now();
select curtime();

# Not equal
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year = 2017;
     
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year != 2017;
SELECT 
    title, released_year author_lname
FROM
    books;
SELECT 
    title, author_lname, released_year
FROM
    books
WHERE
    author_lname = 'Harris';     
SELECT 
    title, author_lname, released_year
FROM
    books
WHERE
    author_lname != 'Harris';

# Find all the books that starts with letter W.
SELECT 
    title
FROM
    books
WHERE
    title LIKE 'w%';
    
# Find the all the books that does not start with
select title from books where title not like 'A%';
     
    SELECT 
        title, 
        author_lname 
    FROM books
    WHERE author_lname='Carver' OR
          author_lname='Lahiri' OR
          author_lname='Smith';
     
    SELECT title, author_lname FROM books
    WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
     
    SELECT title, released_year FROM books
    WHERE released_year IN (2017, 1985);
     
    SELECT title, released_year FROM books
    WHERE released_year != 2000 AND
          released_year != 2002 AND
          released_year != 2004 AND
          released_year != 2006 AND
          released_year != 2008 AND
          released_year != 2010 AND
          released_year != 2012 AND
          released_year != 2014 AND
          released_year != 2016;
     
    SELECT title, released_year FROM books
    WHERE released_year NOT IN 
    (2000,2002,2004,2006,2008,2010,2012,2014,2016);
     
    SELECT title, released_year FROM books
    WHERE released_year >= 2000
    AND released_year NOT IN 
    (2000,2002,2004,2006,2008,2010,2012,2014,2016);
     
    SELECT title, released_year FROM books
    WHERE released_year >= 2000 AND
    released_year % 2 != 0;
     
    SELECT title, released_year FROM books
    WHERE released_year >= 2000 AND
    released_year % 2 != 0 ORDER BY released_year;
    
# Find all the books that were released after 2000 and in odd year.alter
    
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year >= 2000
        AND released_year % 2 != 0
ORDER BY released_year DESC;

# Case
SELECT 
    title,
    released_year,
    CASE
        WHEN released_year >= 2000 THEN 'Modern'
        ELSE "Old"
    END AS period
FROM
    books;
    
SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 80 THEN '*'
        WHEN stock_quantity BETWEEN 81 AND 120 THEN '**'
        WHEN stock_quantity BETWEEN 121 AND 150 THEN '***'
        ELSE '****'
    END AS rating
FROM
    books;
    
# Find all books before 1980;
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year < 1980;
    
# Select all books written by Eggers or Chabon
SELECT 
    title
FROM
    books
WHERE
    author_lname = 'Eggers' OR 'Chabon';

# Select all books written by Lahiri published after 2000.
SELECT 
    title
FROM
    books
WHERE
    author_lname = 'Lahiri'
        AND released_year > 2000;

# Find all books page count between 100 and 200.
SELECT 
    title, pages
FROM
    books
WHERE
    pages BETWEEN 100 AND 200;

# Find all where author_lname starts with a 'C'  or 'S'.

SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname LIKE 'C%' OR 'S%';

##########################################
SELECT 
    title, released_year
FROM
    books
WHERE
    released_year < 1980;
 
SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname = 'Eggers'
        OR author_lname = 'Chabon';
 
SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname IN ('Eggers' , 'Chabon');
 
SELECT 
    title, author_lname, released_year
FROM
    books
WHERE
    author_lname = 'Lahiri'
        && released_year > 2000;
 
SELECT 
    title, pages
FROM
    books
WHERE
    pages >= 100 && pages <= 200;
 
SELECT 
    title, pages
FROM
    books
WHERE
    pages BETWEEN 100 AND 200;
 
SELECT 
    title, 
    author_lname 
FROM books 
WHERE 
    author_lname LIKE 'C%' OR 
    author_lname LIKE 'S%';
 
SELECT 
    title, 
    author_lname 
FROM books 
WHERE 
    SUBSTR(author_lname,1,1) = 'C' OR 
    SUBSTR(author_lname,1,1) = 'S';
 
SELECT 
    title, author_lname
FROM
    books
WHERE
    SUBSTR(author_lname, 1, 1) IN ('C' , 'S');
    


