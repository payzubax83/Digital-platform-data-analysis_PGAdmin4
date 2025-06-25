# Digital platform data analysis (Data analysis using PostgreSQL)
## Project Objective
Data Analysis of Digital platform. 

## Database used
- <a href="https://github.com/payzubax83/Digital-platform-data-analysis_PGAdmin4/blob/main/postgresqldb.sql">Dataset</a>

##  General Business Description:
●	The company receives books and audiobooks from rights holders based on revenue sharing from user subscriptions.
●	Access to content is provided through applications for web and mobile platforms.
●	In the application, users can read public domain books and self-uploaded books for free.
●	When reading more than 10% of a book from the paid catalog or listening to more than 10% of an audiobook, the user encounters a paywall.
●	At the paywall, users are offered an auto-renewing subscription. There are three types of subscriptions: books, audiobooks, or a combined subscription for both types of content.
●	50% of the subscription fee paid by the user is distributed to the rights holders.
●	Users come organically (via search, app store rankings) and are attracted through a pay-per-install model.

## Questions and KPIs
1. Display how many users added the book 'Coraline' and how many users listened to more than 10% of it.  
2. For each operating system and book title, display the number of users and the total listening time in hours, excluding test listenings.  
3. Find the book that is listened to by the most people.  
4. Find the book that is most frequently listened to in its entirety.

## Process
- Create a new database named `test_db` in PostgreSQL 
- Create tables in it by executing all queries from the file `PostgreSQL_DB`.
- After creating the database and tables, complete the abovementioned queries one by one

## SQL script
- <a href="https://github.com/payzubax83/Digital-platform-data-analysis_PGAdmin4/blob/main/PostgreSQL%20project%201.sql">SQL script</a>

## Project insight
1.The book 'Coraline' addded 199 users, 49 users listened to more than 10%
2.14	rows returned
3."The Subtle Art of Not Giving a F*ck" is the book that the most people listen to, listener quantity is 1133
4.The book that people most often listen to until the end is "The Subtle Art of Not Giving a F*ck"
