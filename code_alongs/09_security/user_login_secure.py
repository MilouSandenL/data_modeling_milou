from connect_postgres import connect_postgres
from sqlalchemy import text

username = input("Enter your username: ")
password = input("Enter your password: ")

# text är en speciell funktion för att man ska kunna göra parameterbind, under utan kommer man då få
with connect_postgres().connect() as conn:
    result = conn.execute(
        text(
            "SELECT * FROM users WHERE username = :username AND password = :password"
        ), {"username": username, "password": password},
    ).fetchall()
    
    print(result)
    
    if result:
        print("Login sucessful")
        print("Eat all icecream")
    else:
        print("Anotha failure")