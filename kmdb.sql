-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS topcast;

-- Create new tables, according to your domain model
-- TODO!
CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    year INTEGER,
    MPAA_Rating TEXT,
    director_id INTEGER
);

CREATE TABLE people (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    full_name TEXT
);

CREATE TABLE topcast  (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    movie_id INTEGER,
    actor_id INTEGER,
    zzzz TEXT 
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
INSERT INTO movies
values (1,'Batman Begins', 2005, 'PG-13', 14),
(2, 'The Dark Knight',    2008,  'PG-13', 14),
(3, 'The Dark Knight Rises',  2012, 'PG-13', 14);

INSERT INTO people 
values (1,  'Christian Bale'),  
(2, 'Michael Caine'),  
(3, 'Liam Neeson '),          
(4, 'Katie Holmes' ),        
(5, 'Gary Oldman' ),          
(6, 'Heath Ledger'),          
(7, 'Aaron Eckhart' ),        
(8, 'Maggie Gyllenhaal'),          
(10, 'Gary Oldman' ),          
(11, 'Tom Hardy'  ),           
(12, 'Joseph Gordon-Levitt '),
(13, 'Anne Hathaway'),
(14, 'Christopher Nolan');

INSERT INTO topcast
values (1, 1, 1, 'Bruce Wayne'),
(2, 1, 2, 'Alfred'),
(3, 1, 3, "Ra's Al Ghul"),
(4, 1, 4, 'Rachel Dawes'),
(5, 1, 5, 'Commissioner Gordon'),
(6, 2, 1, 'Bruce Wayne'),
(7, 2, 6, 'Joker'),
(8, 2, 7, 'Harvy Dent'),
(9, 2, 2, 'Alfred'),
(10, 2, 8, 'Rachel Dawes'),
(11, 3, 1, 'Bruce Wayne'),
(12, 3, 5, 'Commissioner Gordon'),
(13, 3, 11, 'Bane'),
(14, 3, 12, 'John Blake'),
(15, 3, 13, 'Selina Kyle');

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!
select title, year, MPAA_Rating, full_name from movies
INNER JOIN people ON movies.director_id = people.id;


-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


-- The SQL statement for the cast output
-- TODO!
 
select movies.title, people.full_name, topcast.zzzz
from topcast
INNER JOIN movies ON movies.id = topcast.movie_id
INNER JOIN people ON people.id = topcast.actor_id;
