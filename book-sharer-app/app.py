from flask import Flask, render_template, redirect, url_for, session, abort, request, flash
import requests
from bs4 import BeautifulSoup
import psycopg2
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
import os
import glob
import pandas as pd
import random
from datetime import date

app = Flask(__name__ , static_url_path='/static')

# set your own database name, username and password
db = "dbname='qianq' user='qianq' host='localhost' password='psql'" #potentially wrong password
conn = psycopg2.connect(db)
cursor = conn.cursor()



@app.route("/")
def account():
    return render_template("index.html")


@app.route("/createuser", methods=["GET","POST"])
def create():
    cur = conn.cursor()
    if request.method == "POST":
        user = request.form["createuser"]
        password = request.form["createpassword"]
        language = request.form["Language"]
        education = request.form["Education"]
        cur.execute(f'''SELECT username FROM users WHERE username LIKE '{user}' ''')
        unique = cur.fetchall()
        print(unique)
        if len(unique) == 0:
            today = date.today()
            cur.execute("INSERT INTO users(Username, Password, Creation_date) VALUES (%s, %s, %s)", (user, password, today))
            cur.execute("INSERT INTO Readers(Username, Education, Language) VALUES (%s, %s, %s)", (user, education, language))
            flash("Account created.")
            conn.commit()
            return redirect(url_for("my_books"))
    return render_template("create_user.html")
                


@app.route("/bookdetails", methods=["POST","GET"])  
def book_details():
    cur= conn.cursor()
    isbn = request.args.get('isbn',default =0, type = str)
    cur.execute(f'''SELECT * FROM Books WHERE ISBN LIKE '{isbn}' ''')
    data = cur.fetchall()
    cur.execute(f'''SELECT * FROM Has_genre WHERE ISBN LIKE '{isbn}' ''')
    genres = cur.fetchall() #tupples with isbn and genres 
    print(genres)
    if request.method =="POST":
            print("KNAP TRYKKET")
            if session.get('logged_in'):
                print("LOGGET IND OG GEM")
                user = session['username']
                today = date.today()
                cur.execute("INSERT INTO Reads(Username, ISBN, Start_date, Completion_date, Current_pages) VALUES (%s, %s, %s, NULL, 0)", (user, isbn, today)) #bog ind i 
                conn.commit()
            else:
                flash("cannot save book if not logged in lul dnur")

    return render_template("book_details.html", data = data, bookgenre = genres, len = len(genres))
 

@app.route("/discover")
def discover():
    cur = conn.cursor()
    cur.execute(f'''SELECT ISBN, Title, Author, Average_rate FROM Books OFFSET floor(random() * ( SELECT COUNT(*) FROM Books) ) LIMIT 5;''')
    data =cur.fetchall()
    return render_template("discover.html", data = data)


@app.route("/login", methods=["GET","POST"])
def index():
    cur = conn.cursor()
    if session.get('logged_in') :
        return redirect(url_for("account"))
    if request.method == "POST":
            user = request.form["user"]
            password = request.form["password"]
            cur.execute("SELECT username FROM users WHERE username LIKE %s AND password LIKE %s", (user, password))
            unique = cur.fetchall()
            if len(unique) != 0:
                session['logged_in'] = True
                session['username'] = user
                return redirect(url_for("my_books", name = user))
            else:
                flash("wrong pass or name. how about DNUR")
    return render_template("login.html")


@app.route("/logout")
def logout():
    session['logged_in'] = False
    session['username'] = ""
    return render_template("logout.html")

@app.route("/mybooks")
def my_books():
    cur = conn.cursor()
    if not session.get('logged_in') :
        return redirect(url_for("account"))
    else:
        user = session['username']
        cur.execute(f'''SELECT ISBN, Title, Author, (ISBN IN (SELECT ISBN FROM Favorite_book WHERE Username LIKE '{user}')) AS Favorite FROM (Books NATURAL JOIN Reads) WHERE Username = '{user}';''')
        data = cur.fetchall()
        
        return render_template("mybooks.html", name=session['username'],len = len(data), data = data)
    

@app.route("/bookrate", methods=["POST","GET"])
def ratings():
    cur= conn.cursor()
    isbn = request.args.get('isbn',default =0, type = str)
    cur.execute(f'''SELECT Title FROM Books WHERE ISBN = '{isbn}';''')
    title = cur.fetchall()
    user = session['username']
    if request.method == "POST":
        rating = request.form["user-rating"]
        rating = float(rating)
        cur.execute(f'''UPDATE books SET Average_rate = (average_rate * voters + {rating}) / (voters + 1), voters = voters + 1 WHERE ISBN LIKE '{isbn}';''')
        conn.commit()
        cur.execute(f'''INSERT INTO Rates(Username, ISBN, Rating) VALUES ('{user}', '{isbn}', {rating});''')
        conn.commit()
    return render_template("ratings.html", title=title)

if __name__ == "__main__":
    app.secret_key = os.urandom(12)
    app.run(debug=True)

