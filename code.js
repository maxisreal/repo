import mysql.connector

connection = mysql.connector.connect(user='maximillianw6',
                                    password='203892179',
                                    host='10.8.37.226',
                                    database='maximillianw6_db')

cursor = connection.cursor()
val = int(input("Enter student ID:"))
pd = 0
cursor.execute(f"CALL get_student_schedule({val})")
for row in cursor:
   pd += 1
   print()
   print(f"Period: {pd}")
   print(f"Course: {row[0]}")
   print(f"Room: {row[1]}")
   print(f"Teacher: {row[2]} {row[3]}")
cursor.close()
connection.close()

