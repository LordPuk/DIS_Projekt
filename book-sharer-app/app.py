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

app = Flask(__name__ , static_url_path='/static')

# set your own database name, username and password
db = "dbname='XXXX' user='XXXX' host='localhost' password='XXXX'" #potentially wrong password
conn = psycopg2.connect(db)
cursor = conn.cursor()


#Kode for login system ..
#
#

@app.route("/book_details")
def book_details():
    return render_template("book_details.html")

@app.route("/discover")
def discvoer():
    return render_template("discover.html")

@app.route("/index")
def index():
    return render_template("index.html")

@app.route("/login")
def login():
    return render_template("login.html")

@app.route("/logout")
def logout():
    return render_template("logout.html")

@app.route("/mybooks")
def my_books():
    return render_template("mybooks.html")

@app.route("/ratings")
def ratings():
    return render_template("ratings.html")

if __name__ == "__main__":
    app.secret_key = os.urandom(12)
    app.run(debug=True)

