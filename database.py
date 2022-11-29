import mysql.connector

database = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="app_kps",
    port="8889"
)

# database = mysql.connector.connect(
#     host="your_host",
#     user="your_user",
#     password="your_password",
#     database="your_dbb"
# )