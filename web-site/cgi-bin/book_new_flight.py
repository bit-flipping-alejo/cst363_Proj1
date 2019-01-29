#!/usr/bin/env python


import cgitb
import cgi
from os import environ #for the cookies
import mysql.connector

form = cgi.FieldStorage()
cgitb.enable()
flightID = form["flightIDToBook"].value


if 'HTTP_COOKIE' in environ:
    for cookie in environ['HTTP_COOKIE'].split(";"):
        (key, value) = cookie.split("=")
        if key == "curUser":
            curUserID = value

if curUserID is None:
    curUserID = 0

cnx = mysql.connector.connect(user='root', password='toor', database='proj1', host='127.0.0.1')

book_selected_flight_query = "INSERT INTO proj1.reservations VALUES (DEFAULT, " + str(curUserID) + " , 1 , " + str(flightID) + ", 'Not Confirmed')"
book_cur = cnx.cursor()
book_cur.execute(book_selected_flight_query )
book_cur.close()


print("Content-type: text/html")
print("")
print('<head><style type="text/css">h1{color:#356ecc;}</style></head>')
print("<body>")
print("<h1> User has now been booked onto flight# " + str(flightID) + " </h1>")
print("<h1> We look forward to flying the friendly skies with you </h1>")
print("<h2>Please logout and log back in to see your reservations table reflect the update<h2>")
print("</body>")

cnx.commit()
cnx.close()
