#!/usr/bin/env python

import cgitb
import cgi
from os import environ #for the cookies
import mysql.connector

cgitb.enable()


# get cookie
if 'HTTP_COOKIE' in environ:
    for cookie in environ['HTTP_COOKIE'].split(";"):
        (key, value) = cookie.split("=")
        if key == "curUser":
            curUserID = value

if curUserID is None:
    curUserID = 0

print("<!DOCTYPE html>")
print("")
print("<head>")
print("<title>Registered User Login</title>")
print("<style type=\"text/css\">")
print("    table {")
print("       border-collapse: collapse;")
print("       border: 2px solid rgb(200,200,200);")
print("       letter-spacing: 1px;")
print("       font-size: 0.8rem;")
print("       }")
print("")
print("    td, th {")
print("       border: 1px solid rgb(190,190,190);")
print("       padding: 10px 20px;")
print("       }")
print("")
print("    th {")
print("       background-color: rgb(235,235,235);")
print("      }")
print("")
print("    td {")
print("      text-align: center;")
print("      }")
print("")
print("    tr:nth-child(even) td {")
print("      background-color: rgb(250,250,250);")
print("      }")
print("")
print("    tr:nth-child(odd) td {")
print("     background-color: rgb(245,245,245);")
print("      }")
print("")
print("    caption {")
print("      padding: 10px;")
print("    }")
print("")
print("    h4{")
print("      border-style: solid;")
print("      border-width: 2px;")
print("    }")
print("</style>")
print("</head>")

cnx = mysql.connector.connect(user='root', password='toor', database='proj1', host='127.0.0.1')

#get current user reservations
get_res = "SELECT reservationID, f.flightID, state, departureDay, departureTime, numberOnRes, arrivalTime, dep.cityName, dest.cityName FROM reservations r JOIN flights f ON r.flightID = f.flightID JOIN departures dep ON f.departureID = dep.departureID JOIN destinations dest ON dest.destinationID = f.destinationID WHERE r.customerID=" + str(curUserID)
res_curs = cnx.cursor()
res_curs.execute(get_res)
res = res_curs.fetchall()


print("<body>")
print("<h1> Please select the flight you wish to cancel</h1>")
print("<h3> If you do not wish to cancel please click back in the browser</h3>")

print(" <form action=\"/cgi-bin/cancel_selected_flight.py\"> ")
print("<table><tr>")
print("<th scope=\"col\"> Select</th>")
print("<th scope=\"col\"> Reservation ID</th> ")
print("<th scope=\"col\"> Flight ID</th>")
print("<th scope=\"col\"> Status</th>")
print("<th scope=\"col\"> Departure Day</th>")
print("<th scope=\"col\"> Departure TIme</th>")
print("<th scope=\"col\"> People on Reservation</th>")
print("<th scope=\"col\"> Arrival Time</th>")
print("<th scope=\"col\"> Departure City</th>")
print("<th scope=\"col\"> Arrival City</th>")


#>>> res[0]
#(17, 5, u'Not Confirmed', u'Friday', datetime.timedelta(0, 45000), 1, datetime.timedelta(0, 50400), u'Washington', u'Aspen')

# <td> <input type="radio" name="bookFlight" value="offeredFlight1" /> </td>

for i in range(0, len(res)):
    print("<tr>")
    for j in range(0, len(res[0])+1):
        if j == 0:
            print("<td> <input type=\"radio\" name=\"cancel\" value=\"" + str(res[i][0]) + "\" /> </td>")
        else:
            print("<td>" + str(res[i][j-1]) + "</td>")
    print("</tr>")
print("<br/>")
print("<input type=\"submit\"  value=\"Cancel the selected flight\"/>")
print("</form>")














