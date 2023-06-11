# Book-sharer - Share your favorite books with friends!

# running book-sharer-app
We have two ways to run our program. 
Both Assumes a working Python 3 installation (with python=python3 and pip=pip3).

(1) In the app.py-file, set your own database, username and password

(2) In the makefile, change postgres to your postgres username

(3) Write "make all" in the terminal

----------------------------------------------------------------------------

(1) In the app.py-file, set your own database username and password


(2) initilize the databases like this: 
> psql -U [username] < book-sharer-app/initialize_database.sql


(3) Run the code below to install the dependencies.
>$ pip install -r requirements.txt

(4) Run Web-App
>$ python src/app.py

----------------------------------------------------------------------------------------------

# How to use the application:

(1) Create your account / Start off by pressing create user, where you can make an account by making an name and a password. This will automaticly log you in

(2) My books / You are now at the books you've saved, which is probably empty, head into discover, to see 5 different books. 

(3) Discover / You now see 5 different books which we've speceficly (randomly) choosen for you! Press one you find interresting 

(4) Book details / Now you see all the details about the book, like the author, the description, the rating, and much more, you can press save book to save it for your collection!
				You notice you can also rate the book, you try pressing the button

(5) Ratings / You've now end up on a page where you can rate the book, you can rate it from 1-5, and you can see the the rating update if you go back to book details!

(6) Logout / the only thing left to do is logout, since you've seen everything we have implemented

----------------------------------------------------------------------------------------------

# Intended use that did not make it:

(1) The project scope changed from the initial idea. Refer to the new E/R diagram to see the revised database scope.

(2) Due to lack of time, some database elements were implemented though they are not used (e.g. favorite_[entity]). We wanted users to choose favorite entities and receive recommendations based on their favorites, but did not have the time to implement this features properly.

(3) Omitted due to lack of time: We wanted the website to have more error handling (e.g. error messages, input verification, checks using database).

(4) Omitted due to lack of time: We wanted the website to show book statistics (e.g. average completion time, personal rates, popularity).

(5) Omitted due to lack of time: We wanted users to have friends and share their reads and statistics with friends.

----------------------------------------------------------------------------------------------

# Made by:

Group 104 - Astrid Arhnung Schou-Hanssen - sjv575
Group 104 - Natacha Nielsen 			 - zkc122
Group 104 - Sofia B. Øregaard 		  	 - lzx163
Group 89  - Nicklas B. S. Jørgensen 	 - czj173
Group 89  - Qianqian Fang 				 - tgq379