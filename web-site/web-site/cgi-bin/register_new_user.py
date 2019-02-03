#!/usr/bin/env python3


import cgitb
import cgi
from os import environ #for the cookies
import mysql.connector

cgitb.enable()
form = cgi.FieldStorage()

# get fields
username = form["username"].value
password = form["password"].value
firstName = form["firstName"].value
lastName = form["lastName"].value

cnx = mysql.connector.connect(user='root', password='toor', database='proj1', host='127.0.0.1')


# user_exist_query2 = "SELECT userName FROM proj1.login WHERE userName=\'" + username + "\'"
user_exist_query = "SELECT userName FROM proj1.login WHERE userName=%s"

user_ex_cur = cnx.cursor()
user_ex_cur.execute(user_exist_query, (username,))

user_ex = user_ex_cur.fetchone()
user_ex_cur.close()

if user_ex is not None:
    print("Content-type: text/html")
    print("")
    print('<head><style type="text/css">h1{color:#d82222;}</style></head>')
    print('<body><h1>That username is taken please click back on your browser and select another</h1></body>')
    cnx.close()
    quit()

#insert into customers, get customerID then make login insertion
# insert_customerID2 = "INSERT INTO proj1.customers VALUES (default, \'" + firstName + "\', \'" + lastName + "\', 1, 0 )"
insert_customerID = "INSERT INTO proj1.customers VALUES (default, %s, %s, 1, 0 )"
insert_cus_cur = cnx.cursor()
insert_cus_cur.execute(insert_customerID, (firstName, lastName))
insert_cus_cur.close()

#get_user_id = "SELECT customerID FROM proj1.customers WHERE (firstName=\'" + firstName + "\' AND lastName = \'" + lastName + "\');"
get_user_id = "SELECT customerID FROM proj1.customers WHERE (firstName=%s AND lastName = %s);"
get_new_cusID_cur = cnx.cursor()
get_new_cusID_cur.execute(get_user_id, (firstName, lastName) )
newCustomerID = get_new_cusID_cur.fetchone()
get_new_cusID_cur.close()

#insert_customerID = "INSERT INTO proj1.login VALUES (\'" + username + "\', \'" + password + "\'," + str(newCustomerID[0]) + ")"
insert_customerID = "INSERT INTO proj1.login VALUES (%s, %s, %s )"
insert_cus_cur = cnx.cursor()
insert_cus_cur.execute(insert_customerID, (username, password, newCustomerID[0]))
insert_cus_cur.close()

cnx.commit()
cnx.close()
#here we can register them
print("Content-type: text/html")
print("")
print('<head><style type="text/css">h1{color:#356ecc;}</style></head>')
print("<body>")
print("<h1> User has now been registered in the system </h1>")
print("<h1> We look forward serving you </h1>")
print("<h2>Please return to the previous page and log in to continue<h2>")
print("</body>")
