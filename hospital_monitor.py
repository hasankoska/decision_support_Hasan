import tkinter as tk
from tkinter import ttk
import psycopg2
import random
from datetime import datetime

DB_CONFIG = {
    "host": "localhost",
    "database": "hospital_dss",
    "user": "postgres",
    "password": "1234",
    "port": "5432"
}

REFRESH_MS = 20000  # 5 saniye


def get_connection():
    return psycopg2.connect(**DB_CONFIG)


def get_latest_patient_data():
    conn = get_connection()
    cur = conn.cursor()

    query = """
    SELECT
        p.patient_id,
        p.full_name,
        p.room_number,
        p.diagnosis,
        v.heart_rate,
        v.temperature,
        v.oxygen_level,
        v.systolic_bp,
        v.diastolic_bp,
        v.respiratory_rate,
        v.measurement_time
    FROM patients p
    JOIN LATERAL (
        SELECT *
        FROM vital_signs vs
        WHERE vs.patient_id = p.patient_id
        ORDER BY vs.vital_id DESC
        LIMIT 1
    ) v ON true
    ORDER BY p.patient_id;
    """

    cur.execute(query)
    rows = cur.fetchall()

    cur.close()
    conn.close()
    return rows


def calculate_status(heart_rate, temperature, oxygen_level):
    if oxygen_level < 90 or temperature > 38.5 or heart_rate > 120:
        return "Critical"
    elif 90 <= oxygen_level <= 94 or 37.6 <= temperature <= 38.5 or 101 <= heart_rate <= 120:
        return "Warning"
    else:
        return "Stable"


def generate_alert_message(status, patient_name, hr, temp, ox):
    if status == "Critical":
        return f"{patient_name}: CRITICAL! HR={hr}, Temp={temp}, O2={ox}"
    elif status == "Warning":
        return f"{patient_name}: Warning. HR={hr}, Temp={temp}, O2={ox}"
    return f"{patient_name}: Stable."


def get_latest_alerts(limit=5):
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        SELECT alert_message, created_at
        FROM alerts
        ORDER BY alert_id DESC
        LIMIT %s
    """, (limit,))

    rows = cur.fetchall()

    cur.close()
    conn.close()
    return rows


def insert_alert(patient_id, status, message):
    if status == "Stable":
        return

    conn = get_connection()
    cur = conn.cursor()

    cur.execute("""
        INSERT INTO alerts (patient_id, alert_level, alert_message, created_at)
        VALUES (%s, %s, %s, %s)
    """, (patient_id, status, message, datetime.now()))

    conn.commit()
    cur.close()
    conn.close()


def simulate_new_vitals():
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("SELECT patient_id FROM patients ORDER BY patient_id;")
    patient_ids = [row[0] for row in cur.fetchall()]

    for patient_id in patient_ids:
        cur.execute("""
            SELECT COUNT(*)
            FROM vital_signs
            WHERE patient_id = %s
        """, (patient_id,))
        count = cur.fetchone()[0]

        phase = (count + patient_id) % 3

        if phase == 0:
            # Stable
            hr = random.randint(72, 95)
            temp = round(random.uniform(36.5, 37.4), 1)
            ox = random.randint(95, 99)
            sys_bp = random.randint(110, 124)
            dia_bp = random.randint(70, 82)
            rr = random.randint(16, 20)

        elif phase == 1:
            # Warning
            hr = random.randint(101, 118)
            temp = round(random.uniform(37.6, 38.4), 1)
            ox = random.randint(90, 94)
            sys_bp = random.randint(126, 140)
            dia_bp = random.randint(83, 92)
            rr = random.randint(21, 24)

        else:
            # Critical
            hr = random.randint(121, 135)
            temp = round(random.uniform(38.6, 39.6), 1)
            ox = random.randint(84, 89)
            sys_bp = random.randint(141, 160)
            dia_bp = random.randint(93, 105)
            rr = random.randint(25, 30)

        cur.execute("""
            INSERT INTO vital_signs (
                patient_id, heart_rate, temperature, oxygen_level,
                systolic_bp, diastolic_bp, respiratory_rate, measurement_time
            )
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """, (patient_id, hr, temp, ox, sys_bp, dia_bp, rr, datetime.now()))

    conn.commit()
    cur.close()
    conn.close()


class HospitalMonitorApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Hospital Patient Monitoring DSS")
        self.root.geometry("1400x650")

        title = tk.Label(
            root,
            text="Hospital Patient Monitoring and Decision Support System",
            font=("Arial", 16, "bold")
        )
        title.pack(pady=10)

        top_button_frame = tk.Frame(root)
        top_button_frame.pack(pady=5)

        refresh_button = tk.Button(
            top_button_frame,
            text="Refresh Now",
            command=self.manual_refresh,
            width=15
        )
        refresh_button.pack()

        self.summary_label = tk.Label(root, text="", font=("Arial", 12, "bold"))
        self.summary_label.pack(pady=5)

        main_frame = tk.Frame(root)
        main_frame.pack(fill="both", expand=True, padx=10, pady=10)

        left_frame = tk.Frame(main_frame)
        left_frame.pack(side="left", fill="both", expand=True)

        right_frame = tk.Frame(main_frame, width=320, bd=1, relief="solid")
        right_frame.pack(side="right", fill="y", padx=(10, 0))
        right_frame.pack_propagate(False)

        columns = (
            "ID", "Name", "Room", "Diagnosis", "Heart Rate", "Temp",
            "Oxygen", "BP", "Resp", "Status", "Last Update"
        )

        self.tree = ttk.Treeview(left_frame, columns=columns, show="headings", height=20)

        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=95, anchor="center")

        self.tree.column("Name", width=150)
        self.tree.column("Diagnosis", width=150)
        self.tree.column("Last Update", width=120)

        self.tree.pack(fill="both", expand=True)

        alert_title = tk.Label(right_frame, text="ALERTS", font=("Arial", 14, "bold"))
        alert_title.pack(pady=10)

        self.alert_listbox = tk.Listbox(right_frame, width=42, height=28, font=("Arial", 10))
        self.alert_listbox.pack(padx=10, pady=10, fill="both", expand=True)

        self.tree.tag_configure("Stable", background="#c8f7c5")
        self.tree.tag_configure("Warning", background="#ffd27f")
        self.tree.tag_configure("Critical", background="#ff8a8a")

        self.after_id = None
        self.update_dashboard()

    def manual_refresh(self):
        if self.after_id is not None:
            self.root.after_cancel(self.after_id)
            self.after_id = None
        self.update_dashboard()

    def update_dashboard(self):
        simulate_new_vitals()
        data = get_latest_patient_data()

        for item in self.tree.get_children():
            self.tree.delete(item)

        stable_count = 0
        warning_count = 0
        critical_count = 0

        for row in data:
            patient_id, name, room, diagnosis, hr, temp, ox, sys_bp, dia_bp, rr, measure_time = row
            temp = float(temp)
            status = calculate_status(hr, temp, ox)
            bp_text = f"{sys_bp}/{dia_bp}"

            if status == "Stable":
                stable_count += 1
            elif status == "Warning":
                warning_count += 1
            else:
                critical_count += 1

            alert_message = generate_alert_message(status, name, hr, temp, ox)
            insert_alert(patient_id, status, alert_message)

            self.tree.insert(
                "",
                "end",
                values=(
                    patient_id,
                    name,
                    room,
                    diagnosis,
                    hr,
                    temp,
                    ox,
                    bp_text,
                    rr,
                    status,
                    measure_time.strftime("%H:%M:%S")
                ),
                tags=(status,)
            )

        self.summary_label.config(
            text=f"Stable: {stable_count}    Warning: {warning_count}    Critical: {critical_count}    Auto refresh: 5 sec"
        )

        alerts = get_latest_alerts()

        self.alert_listbox.delete(0, tk.END)
        for alert_msg, alert_time in alerts:
            display_text = f"{alert_time.strftime('%H:%M:%S')} - {alert_msg}"
            self.alert_listbox.insert(tk.END, display_text)

        self.after_id = self.root.after(REFRESH_MS, self.update_dashboard)


if __name__ == "__main__":
    root = tk.Tk()
    app = HospitalMonitorApp(root)
    root.mainloop()