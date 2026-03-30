import psycopg2

try:
    conn = psycopg2.connect(
        host="localhost",
        database="hospital_dss",
        user="postgres",
        password="1234",
        port="5432"
    )

    cur = conn.cursor()
    cur.execute("SELECT * FROM vital_signs;")
    rows = cur.fetchall()

    print("BAGLANTI BASARILI 🔥")
    for row in rows:
        print(row)

    cur.close()
    conn.close()

except Exception as e:
    print("HATA:", e)