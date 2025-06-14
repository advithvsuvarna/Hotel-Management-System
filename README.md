# Hotel Management System – HotelWebApp 🏨

## 📌 Project Purpose
The **Hotel Management System** is a web-based application designed to efficiently manage hotel operations such as reservations, room availability, and billing. It provides a user-friendly interface for hotel staff to handle bookings and generate key reports.

---

## ⚙️ Features & Modules

### 🔸 Core Functionalities:
- **ReservationAdd**: Book new reservations
- **ReservationUpdate**: Modify existing reservation details
- **ReservationDelete**: Cancel existing reservations
- **ReservationDisplay**: View all current reservations

### 📊 Reports:
- View reservations within a selected date range
- Identify rooms that are booked most frequently
- Calculate total revenue generated over a custom period

---

## 🗄️ Database Structure
sql
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    RoomNumber VARCHAR(10),
    CheckIn DATE,
    CheckOut DATE,
    TotalAmount DECIMAL(10,2)
);

## 🏗️ Project Structure

pgsql
Copy
Edit

HotelWebApp/
├── WebContent/
│   ├── index.jsp
│   ├── reservationadd.jsp
│   ├── reservationupdate.jsp
│   ├── reservationdelete.jsp
│   ├── reservationdisplay.jsp
│   ├── reports.jsp
│   ├── report_form.jsp
│   └── report_result.jsp
├── src/
│   ├── com/
│   ├── dao/
│   │   └── ReservationDAO.java
│   ├── model/
│   │   └── Reservation.java
│   └── servlet/
│       ├── AddReservationServlet.java
│       ├── UpdateReservationServlet.java
│       ├── DeleteReservationServlet.java
│       ├── DisplayReservationsServlet.java
│       ├── ReportServlet.java
│       └── ReportCriteriaServlet.java
└── WEB-INF/
    └── web.xml
##🔧 Technologies Used
Java (Servlets, JSP)

JDBC

MySQL

HTML/CSS

Eclipse IDE

Apache Tomcat (via XAMPP)

## 🚀 How to Run
Import project into Eclipse.

Configure MySQL database using the above schema.

Connect using JDBC in DAO classes.

Deploy on Apache Tomcat Server.

Access via browser at: http://localhost:8080/HotelWebApp/

## 👤 Author
Advith V Suvarna
Student, Alva's Institute of Engineering & Technology

## 📜 License
This project is for educational use only.
You may freely modify and build upon it.

yaml
Copy
Edit

## ✅ Project Outcomes
This Hotel Management System helps achieve the following objectives:

Streamlined Reservation Management
Add, update, delete, and view reservations through an intuitive interface.

Automated Report Generation
Generate meaningful reports based on:

Date range

Revenue

Booking frequency of rooms

Practical Understanding of MVC in Java Web Apps
Utilizes:

Model → JavaBeans (POJOs)

View → JSP

Controller → Servlets

Database Integration Mastery
Learn how to perform CRUD operations via JDBC and MySQL.

Deployment Skills
Build and run the project in Eclipse using Apache Tomcat (XAMPP), simulating real-world web deployment.

## 🧪 Testing & Validation
The following manual tests can be used to validate the functionality of the application:

🔹 Reservation Module
Test Case	Input	Expected Result
Add Reservation	Valid customer name, room no., dates	Reservation added and visible in reservation list
Update Reservation	Existing Reservation ID + new dates	Booking dates updated successfully
Delete Reservation	Existing Reservation ID	Reservation removed from DB
View Reservations	--	Shows table of all current reservations

🔹 Report Module
Test Case	Input	Expected Result
Date-wise Reservations	From: 2025-05-01 To: 2025-05-30	Displays reservations made in that range
Revenue Report	From: 2025-01-01 To: 2025-05-30	Shows total revenue generated
Frequently Booked Rooms	Click report	Returns most booked room number
