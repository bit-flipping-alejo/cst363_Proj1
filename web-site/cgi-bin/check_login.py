#!/usr/bin/env python3

import cgitb
import cgi
import mysql.connector
cgitb.enable()
form = cgi.FieldStorage()

# get fields
username = form["username"].value
password = form["password"].value


register = False
login = False
if "register" in form:
    register = True
elif "login" in form:
    login = True

# Open Connection
cnx = mysql.connector.connect(user='root', password='toor', database='proj1', host='127.0.0.1')

# /////////////////////////
# login verification query
# /////////////////////////

# login TABLE COLUMN VALUES = (userName, password, customerID  )
check_user_id = 'SELECT * FROM login WHERE userName= \'' + username + '\''

cur = cnx.cursor()
cur.execute(check_user_id)
result = cur.fetchone()
cur.close()

if login:

    if result is None:
        print("Content-type: text/html")
        print("")
        print('<head><style type="text/css">h1{color:#d82222;}</style></head>')
        print('<body><h1>That username and password combination doesnt exist</h1></body>')
        cnx.close()
        quit()
    # here the user exists
    # check password
    if result[1] != password:
        print("Content-type: text/html")
        print("")
        print('<head><style type="text/css">h1{color:#d82222;}</style></head>')
        print('<body><h1>Password is invalid</h1></body>')
        cnx.close()
        quit()


    #get user info query
    get_user_info = "SELECT customerID,firstName,lastName,rewardsPoints,rewardLevel,points_until_flight FROM customers c JOIN rewards r ON r.rewardsID=c.rewardsID WHERE customerID=" + str(result[2])
    user_info_cur = cnx.cursor()
    user_info_cur.execute(get_user_info)
    user_info = user_info_cur.fetchone()

    # get departure and arrival city info
    get_departures = "SELECT * FROM departures"
    get_destinations = "SELECT * FROM destinations"
    get_loc_cur = cnx.cursor()
    get_loc_cur.execute(get_departures)

    deps = get_loc_cur.fetchall()
    get_loc_cur.execute(get_destinations)
    dests = get_loc_cur.fetchall()
    get_loc_cur.close()

    #get current user reservations
    get_res = "SELECT reservationID, f.flightID, state, departureDay, departureTime, numberOnRes, arrivalTime, dep.cityName, dest.cityName FROM reservations r JOIN flights f ON r.flightID = f.flightID JOIN departures dep ON f.departureID = dep.departureID JOIN destinations dest ON dest.destinationID = f.destinationID WHERE r.customerID=" + str(result[2])
    res_curs = cnx.cursor()
    res_curs.execute(get_res)
    res = res_curs.fetchall()


    # here username and password match
    cookie = result[2]  # this is a string value
    print("Set-Cookie:curUser = " + str(cookie) + ";path=/;")



    print("Content-type: text/html")
    print("")
    print(" <head> ")
    print("     <title>Registered User Login</title>")
    print("     <style type=\"text/css\">")
    print("table {border-collapse: collapse;")
    print("border: 2px solid rgb(200,200,200);")
    print("letter-spacing: 1px;")
    print("font-size: 0.8rem;")
    print("}")
    print("")
    print("td, th {")
    print("border: 1px solid rgb(190,190,190);")
    print("padding: 10px 20px;")
    print("}")
    print("")
    print("th {")
    print("background-color: rgb(235,235,235);")
    print("}")
    print("")
    print("td {")
    print("text-align: center;")
    print("}")
    print("")
    print("tr:nth-child(even) td {")
    print("background-color: rgb(250,250,250);")
    print("}")
    print("")
    print("tr:nth-child(odd) td {")
    print("background-color: rgb(245,245,245);")
    print("}")
    print("")
    print("caption {")
    print("padding: 10px;")
    print("}")
    print("")
    print("h4{")
    print("border-style: solid;")
    print("border-width: 2px;")
    print("")
    print("}")
    print(" </style></head> ")

    print(" <body><h1> Welcome back " + user_info[1] + " " + user_info[2] + "</h1><br/>")
    print("<h2> You are a " + user_info[4] + " member with " + str(user_info[3]) + " points </h2>")
    print("<h2>your next free flight is at " + str(user_info[5]) + " </h2>")

    print("<h4>Search for Flights</h4>")
    print("<form action=\"/cgi-bin/search_for_flights.py\">")
    print("<div>")
    print("<ul>Departure City</ul>")
    print("<ul><select name=\"departureCity\">")
    for i in range(0, len(deps)):
        print("<option name=\"arrivalCity\" value=\"" + str(deps[i][0]) + "\">" + deps[i][1] + "</option>")
    print("</select></ul>")

    print("<ul>Arrival City</ul>")
    print("<ul><select name=\"arrivalCity\">")
    for i in range(0, len(dests)):
        print("<option name=\"departureCity\" value=\"" + str(dests[i][0]) + "\">" + dests[i][1] + "</option>")
    print("</select></ul>")
    print("<ul>Search Available Flights</ul>")
    print("<ul><input type=\"submit\" value=\"search\"/></ul>")
    print("</div>")

    print("</form>")

    print("<br/><h4>Your reservation history</h4>")

#    reservationID,
#    f.flightID,
#    state,
#    departureDay,
#    departureTime,
#    numberOnRes,
#    arrivalTime,
#    dep.cityName,
#    dest.cityName

    if res is None:
        #if res is none fill with n/a
        res = []
        res.append('N/A')
        res.append('N/A')
        res.append('N/A')
        res.append('N/A')
        res.append('N/A')
        res.append('N/A')
        res.append('N/A')
        res.append('N/A')
        res.append('N/A')

    print("<table><tr>")
    print("<th scope=\"col\"> Reservation ID</th> ")
    print("<th scope=\"col\"> Flight ID</th>")
    print("<th scope=\"col\"> Status</th>")
    print("<th scope=\"col\"> Departure Day</th>")
    print("<th scope=\"col\"> Departure TIme</th>")
    print("<th scope=\"col\"> People on Reservation</th>")
    print("<th scope=\"col\"> Arrival Time</th>")
    print("<th scope=\"col\"> Departure City</th>")
    print("<th scope=\"col\"> Arrival City</th>")
    print("</tr>")

    for i in range(0, len(res)):
        print("<tr>")
        for j in range(0, len(res[0])):
            print("<td>" + str(res[i][j]) + "</td>")

        print("</tr>")

    print("</table>")
    print("<h4>To cancel a reservation</h4>")
    print("<br/>")
    print("<form action=\"/cgi-bin/load_cancellation_page.py\"  method=\"post\">")
    print("<input type=\"submit\" value=\"Proceed to Cancel page\"/>")
    print("</form>")
    print("</body>")


elif register:

    print(" <!DOCTYPE html>")
    print("")
    print("<html>")
    print(" <head>")
    print(" <title>")
    print("     FReserve Register")
    print(" </title>")
    print("     <style type=\"text / css\">")
    print("         h1 {")
    print("         font-weight: bold;")
    print(" ")
    print("         }")
    print(" ")
    print("         form {")
    print("             background-color: #70e7ff;")
    print("             border-style: solid;")
    print("             border-width: 2px;")
    print(" ")
    print("         }")
    print("     </style>")
    print(" </head>")
    print(" ")
    print(" <body>")
    print(" <h1>")
    print("     Please Register as a new user")
    print(" </h1>")
    print(" <form action=\"/cgi-bin/register_new_user.py\" method=\"post\">")
    print("     Please fill out all text boxes <br/><br/>")
    print("     User Name <input type=\"text\" name=\"username\" required ><br/>")
    print("     Password  <input type=\"text\" name=\"password\" required ><br/>")
    print("     First Name  <input type=\"text\" name=\"firstName\" required ><br/>")
    print("     Last Name <input type=\"text\" name=\"lastName\" required ><br/>")
    print("     <input name=\"Complete Registration\" value=\"complete\" type=\"submit\"/>")
    print(" </form>")
    print(" </body>")
    print(" </html>")


cnx.close()
