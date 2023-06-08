# Book-sharer - Share your favorite books with friends!

# running book-sharer-app

Assumes a working Python 3 installation (with python=python3 and pip=pip3).

(1) Run the code below to install the dependencies.
>$ pip install -r requirements.txt

//(2) Initialize the database, by running the SQL files (Creating the necessary tables) 
psql [-U username] < initialize_database.sql

(3) In the app.py-file, set your own database username and password

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



# De andres ting 

(1) Create account / You start by pressing the 'Create Account' button, you then get to page where you choose your username and password.

(2) Login / Now you can login on your account by typing in your username and password.

(3) Frontpage / On the frontpage you will see 10 random NFT's (cryptopunks) and some different filter options.

(4) Punks / Each punk have their own page where you can see 'attributes', price and you have the option to add the punk to your favourites.

(5) Searching / You can get to a random punk by pushing the 'random' button, you will also have the option to type in the 'punk ID'.
		On the frontpage the searching is made easy by types you can choose. It can e.g. be a 'male', 'human', 'medium' skin color, 
		then you can type in some specific 'accessories' and at last choose the amount of accessories the punk should have.
		
(6) Accessories / Under 'accessories' you can search for a lot of things e.g. "mohawk", "beard", "earring", "cigarette", "lipstick", "glasses",
		  "nerd glasses", "bandana", "eye patch", "VR", "3D glasses", specfic colors like "green" and etc.

(7) User page / Each user have their own individual page where they can see their favourite punks.

(8) Contact / At last we have a 'contact' page so you have an option to contact the three founders and thank them for their awesome work!


