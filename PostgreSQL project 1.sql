/*Create new test_db databases in PostgreSQL and create tables by running all queries on the PostgreSQL_DB file.
After creating the database and tables, perform the following tasks:*/

#1.Display how many users added the book 'Coraline', how many users listened to more than 10%. 

SELECT * 
FROM audiobooks;  -- let's check the tables first

SELECT * 
FROM audio_cards;

SELECT * 
FROM listenings;


SELECT 
    (SELECT COUNT(DISTINCT user_id)  -- selects the number of unique values ​​in the user_id column.
     FROM audio_cards 
     WHERE audiobook_uuid = 'FfE3OnJS') AS users_added,  -- filters the data, leaving only rows where the audiobook ID is 'FfE3OnJS'
    (SELECT COUNT(DISTINCT user_id)  -- counts the number of unique users
FROM listenings 
WHERE audiobook_uuid = 'FfE3OnJS'  -- the same audiobook as in the first subquery
     AND position_to > 1301  -- selects only those recordings where the user has listened to more than a certain position (presumably 1301 corresponds to 10% of the book's duration)
     AND is_test = 0) AS users_listened_more_than_10_percent;  -- excludes test auditions

-- Result: the book 'Coraline' addded 199 users, 49 users listened to more than 10%

/*2.For each operating system and book title, output the number of users, the amount of listening in hours, excluding test listening.*/

SELECT * 
FROM audiobooks;  -- let's check the tables first

SELECT * 
FROM listenings;

SELECT 
    l.os_name,
    a.title,
    COUNT(DISTINCT l.user_id) AS user_count,
    ROUND(SUM(l.position_to - l.position_from) / 3600.0, 2) AS total_hours
FROM listenings l
    JOIN audiobooks a ON l.audiobook_uuid = a.uuid  -- JOIN joins listenings to audiobooks via audiobook_uuid and uuid.
WHERE l.is_test = 0  -- excludes, filters test records
GROUP BY l.os_name, a.title
ORDER BY l.os_name, a.title;

-- Result: 14 rows returned

#3.Find the book that the most people listen to.

SELECT * 
FROM audiobooks;  -- let's check the tables first

SELECT * 
FROM listenings;

SELECT a.title,
    COUNT(DISTINCT l.user_id) AS listener_count  -- Counts the number of unique listeners per book.
FROM listenings l
    JOIN audiobooks a ON l.audiobook_uuid = a.uuid
WHERE l.is_test = 0  -- Only real listenings are taken into account
GROUP BY a.title
ORDER BY listener_count DESC  
LIMIT 1;  -- returns the book with the most listeners.


-- Result: "The Subtle Art of Not Giving a F*ck" is the book that the most people listen to, listener quantity is 1133

#4.Find the book that people most often listen to until the end.

SELECT * 
FROM audiobooks;  -- let's check the tables first

SELECT * 
FROM audio_cards;

SELECT 
    a.title,
    COUNT(DISTINCT ac.user_id) AS finished_count  -- counts unique users who have finished reading each book
FROM audio_cards ac
    JOIN audiobooks a ON ac.audiobook_uuid = a.uuid
WHERE ac.state = 'finished'  -- indicates that the user has completed the book
GROUP BY a.title
ORDER BY finished_count DESC
LIMIT 1;

-- Result: The book that people most often listen to until the end is "The Subtle Art of Not Giving a F*ck"