from flask import Flask, render_template

app = Flask(__name__)
@app.route("/") #måden man vælger hvilken url der fører hen
def hello():
    return "Hello word!"

@app.route("/bob") #for at finde den her, launcher man websiden, og appender /bob på sin URL for at komme derhen
def bob():
    return "jeg er bob"

@app.route("/<name>") # Man kan få user til at give variable i URL'en sådan her
def variabelting():
    return "Hej" + name + "!"

def vis_HTML():
    return render_template("test.html") #måske skal den have en specefik path? måske den skal være en

def bad_html():
    return "<h1>bad!</h1>" #html direkte ind i koden

if __name__=="__Main__":
    app.run(debug = True, host = "0.0.0.0", port =3000)
