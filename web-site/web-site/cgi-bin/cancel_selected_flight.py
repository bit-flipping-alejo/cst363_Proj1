#!/usr/bin/env python3



import cgitb
import cgi
import mysql.connector

cgitb.enable()
form = cgi.FieldStorage()

deleteVal = form["cancel"].value

cnx = mysql.connector.connect(user='root', password='toor', database='proj1', host='127.0.0.1')


del_user_selected_flight = "DELETE FROM proj1.reservations WHERE reservationID=%s"
del_cur = cnx.cursor()
del_cur.execute(del_user_selected_flight, ( deleteVal,))
del_cur.close()


print("Content-type: text/html")
print("")
print('<head><style type="text/css">h1{color:#356ecc;}</style></head>')
print("<body>")
print("<h1> Reservation number " + str(deleteVal) + " has now been deleted </h1>")
print("<h1> User is no longer on the flight </h1>")
print("<h2>Please logout and log back in to see your reservations table reflect the update<h2>")
print("</body>")

cnx.commit()
cnx.close()
