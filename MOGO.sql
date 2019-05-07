#chose what database to use
use movies;

#to allow ascii characters
ALTER DATABASE movies CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

#select and view the following tables 
select*from movielist;
select*from cast;
select*from ratings;

#remove extra blank spaces before and after the title name in ratings table in order for
#the title to match up with the titles in the parent table(movielist)
Update ratings
set title = RTRIM(title);
Update ratings
set title = LTRIM(title);

#populate the foreign key in the ratings table 
UPDATE movielist, ratings
SET ratings.movie_id = movielist.movie_id
WHERE ratings.title = movielist.title;

#populate the foreign key in the cast table 
UPDATE movielist, cast
SET cast.movie_id = movielist.movie_id
WHERE cast.title = movielist.title;


