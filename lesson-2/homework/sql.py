import pyodbc

conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=localhost,1433;'
    'DATABASE=master;'
    'UID=sa;'
    'PWD=YourPassword123!'  
)

cursor = conn.cursor()

cursor.execute("SELECT image_data FROM photos WHERE id = 1")
row = cursor.fetchone()

if row and row[0]:
    with open('retrieved_image.png', 'wb') as file:
        file.write(row[0])
    print(" Image saved as retrieved_image.png")
else:
    print(" No image found.")

cursor.close()
conn.close()