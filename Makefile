#Installs the reqiurements
pip install -r requirements.txt
# load the database
psql -U postgres < book-sharer-app/initialize_database.sql
#start the app
python book-sharer-app/app.py