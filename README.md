# EER_Diagram_Design_and_SQL_Queries
Design EER diagram based on requirements and practice on SQL queries

-- EER diagram design

A movie has a title, release date, rating, running time, director, and one or more actors.
Movies are split between domestic and foreign movies. A foreign movie uses a language other
than English and may provide English subtitles. Domestic movies are further categorized into
comedy, drama, action and horror movies. A comedy movie has a degree of “funniness” which
ranges between 1 and 5. A drama movie has a short description such as “love story”,
“documentary”, “humanity”, etc.
Each movie can be reviewed by one or more critics, each of whom gives an evaluation that
ranges from zero to five stars. A critic has a name and a phone number. He or she might review
one or more movies.
Each movie can be supplied by only one distributor. One distributor might provide several
movies. For each distributor, we keep track of information about its name, address, and phone
number. A distributor’s address can be accessed as street address, city, state, and zip code
individually and the entire address of a distributor can also be retrieved as a unit.

-- Populate each table with a handful of instances.

1. Find the names of all distributors whose addresses are in Los Angeles.

2. Find the directors of all horror movies distributed by Troma Films.

3. Find the names of all one-star comedies (i.e. all movies with a “funniness” of one star) that
Pauly Shore has acted in.

4. Find the name of every action film directed by John Woo that has been reviewed by Roger
Ebert.

5. Find the names of all movies that have more than 4 actors.

6. Find the total number of movies whose average rating is five stars.

