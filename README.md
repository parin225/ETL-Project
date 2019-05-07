# ETL-Project

### Open the "Master - Combined Notebooks" to view the final code of the project in Jupyter notebook.

# Data Engineering and Visualization ETL Project
## Abear Awadallah, Brandon Wright, Parin Mody, Sajani Menon

## Summary:
Our ETL pipeline enables media-service analysts at the newly start-up "MoGo" (Movie on the Go) to determine what popular movies to select for their website. We are using information such as ratings, votings, and other additional information such as languages, genres, directors, actors, and the length of the movies from IMDB, TMDB and Director/Actor CSV's both derived from Kaggle. We provide our data into a SQL database to determine which movies should be selected based on ratings (movie critics) and votings (non-affiliated users) and could provide the most value for the website based on other information such as how current or old the movie is, the genre of the movies, languages of the movies, length of movies and etc.

##### Example Step to Run the Pipeline:
  1. Open the notebook.
  2. Input your username and password in the connection string where it says "username" and "password".
  3. Run the connection string variable "username:password@127.0.0.01/movies>charset=utf8mb4" and run the create engine variable "create_engine(f'mysql+pymysql://{connection_string}', pool_size=10, max_overflow=50)" to connect the SQL and the databse. 
  4. Run "tmdb_movies_df.to_sql(name='movielist', con=engine, if_exists='append', index=False)" to load the tmdb dataframe into the database and to create a table named movielist within the database.
  5. Run "imdb_movies_df.to_sql(name='ratings', con=engine, if_exists='append', index=False)" to load the imdb dataframe into the database and to create a table named ratings within the database.
  6. Run "cast_df.to_sql(name='cast', con=engine, if_exists='append', index=False)" to load the case dataframe into the database and to create a table named cast within the databse. 
  7. Open up SQL and view the "movies" database and do a "select * from" to view each table.
  
## Narrative:
We're a newly started International media-service provider named MoGo ("Movie on the Go") focusing on a movie streaming service that will show a wide variety collection of the top rated/most popular movies. The premise of our website targets movies only with the exclusion of TV series, Sports, Etc. We are working closely with the media-service analysts to select the most popular movies from the selected two datasets (IBDB/TMDB) to derive these movies and compare information such as ratings, votings and revenue of the movies as determinant factors. In all, our website is built on a collection of top-rated movies from the most recently released to the most classic that allows users to find a movie they'd like to watch. We will create multiple categories to allow users to pick a movie of their choice based on a movies corresponding information such as on: year, ratings, votings, genres, overviews, production companies, etc. In our final visualization, users will be able to access a website of a collection of movies and locate a drop down button of lists that displays multiple options such as:
  - Genres-Comedy, Action, Horror, etc.
  - Length - Short, Medium, Long
  - Ratings (Movie Critics) - High/Low
  - Votings (Independent Users) - High/Low
  
## Data Sources:
We extracted our data from the following 3 sources:
  1. IMDB (HTML Table): Which we used to derive movie information such as title, rank, year and IMDB ratings.
  2. TMDB (CSV File): Which we used to acquire aditional information such as overview of the movie, languages of the movie, genres of the movie, "run time" or length of the movie, voter average, voter count, production and home page of the movie.
  3. CAST (CSV File): Which we used to acquire director, title, star and the writer
  
 ## Transformation:
 After extracting the data, we used Pandas (Jupyter Notebook) as our tool to analyze our data for this ETL process and within Jupyter notebook is where we cleaned our data from the sources above.
 
 #### IMDB URL
 Using the Ratings table we created a dataframe with the original data and then displayed the table to determine what needed to be cleaned. After deciding on the inclusions, exclusions, and additional cleaning from the printed table, we created new dataframes to only include 2 columns with the headers ("Rank and Title" & "IMDB Rating") from the original table to include relative data. Within the column "Rank and Title," we split the column into two strings and one integer into three separate columns with its' respective data using hte delimiter (.), thus creating the following 3 columns: "rank", "title", and "year" along with the "IMDB" rating column. We then reordered the columns and renamed the column "Title" to "title" to match the "title" within the csv file.
 
#### TMDB CSV File
Similarly, we created a dataframe to display the data within the csv file to determine what needed to be cleaned. We then created a new dataframe to modify the "Genres" column to split the genre "name" from the rest of the strings. We dropped additional columns that were not related to the information we needed on the movies. Within the TMDB dataframe, we dropped all rows within the "runtime" column that were 0. Within the "overview" column within the csv file, we had to filter out the ascii characters to remove them from the descriptions.

#### CAST CSV File
Similarly, we created a dataframe to display the data within the csv file. The data included director, title, start and writer information. The csv file was already cleaned and required to make no further changes after uploading it Jupyter notebook.

## Final Schema/ Data Model:
The final data model consists of the main branch being the Movielist dataset. Within the dataset, we have a ton of information on thousands of movies. The Movielist contains: the movie title, genre, homepage, original language, overview, runtime, voter average and voter count. From that dataset comes two other branches. The first is the Ratings branch, which consists of the movie title, rank, year and IMDB rating. The second branch is the Cast branch, which includes the movies title, writer, director and a star in the film. All of the datasets are connected with each other through the movie_id. The decision on making this the final model stemmed from wanting to search on our media service to be smooth sailing. We want consumers to find exactly what they would like to watch within minutes. Consumers would be able to search up a movie through various different searches; the most obvious would be to just search the actual title. If they have a specific genre they'd like to watch, they can search that and they will have access to all the movies within that genre. If they have a favorite actor/actress, they'll be able to search the star's name and films that the star starred in will be at their fingertips. In addition, if they're indecisive and would like to see films with the highest ratings, they're able to search those as well. All in all, the final data model will contribute nothing but success to our new media service MoGo.


![MoGo Relationship Entity Diagram](https://github.com/parin225/ETL-Project/blob/master/MOGO%20Entity%20Relationship%20Diagram.png)
