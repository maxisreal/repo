import mysql.connector


connection = mysql.connector.connect(user='maximillianw6',
                                    password='203892179',
                                    host='10.8.37.226',
                                    database='maximillianw6_db')


cursor = connection.cursor()




val = int(input("Enter student ID: "))




query = ""




cursor.execute(query)
for row in cursor:
   print(row[0], row[1])
   a.append(row)




cursor.close()
connection.close()
