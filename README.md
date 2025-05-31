# HotelManagementSystem
---
 
🚀 Features

Complete CRUD Operations

Add, update, delete, and view guest reservations seamlessly.

Advanced Search

Quickly search reservation records by Guest ID or Booking Number.

Comprehensive Reports

Generate meaningful reports, including:

📈 Guests with bookings above a specified duration

📚 Guests who booked specific room types

🏆 Top N most frequent guests or highest revenue-generating bookings

---

Input Validation

✅ Client-side (HTML5, JavaScript)

✅ Server-side (JSP/Java)

Professional UI

Responsive, user-friendly interface built with Bootstrap 5

Smooth navigation and colorful, clean layouts

Modular design using JSP (View), Servlets (Controller), and JDBC/MySQL (Model)

Database Integration

MySQL backend with JDBC connection pooling

---
🗃️ Database Schema

CREATE TABLE Reservations (

 ReservationID INT PRIMARY KEY,
 
 CustomerName VARCHAR(100),
 
 RoomNumber VARCHAR(10),
 
 CheckIn DATE,
 
 CheckOut DATE,
 
 TotalAmount DECIMAL(10,2)
 
);

---

📋 Prerequisites

Ensure the following software is installed before running the project:

Java Development Kit (JDK 8 or higher)

Apache Tomcat (9.0 or higher)

MySQL Server or XAMPP

MySQL JDBC Driver (mysql-connector-java)

Web Browser: Chrome, Firefox, or Edge

---

| Module Name              | Description                                                   |
| ------------------------ | ------------------------------------------------------------- |
| `ReservationAdd.jsp`     | Add new guest reservations                                    |
| `ReservationUpdate.jsp`  | Update details of existing reservations                       |
| `ReservationDelete.jsp`  | Delete a guest’s reservation record                           |
| `ReservationDisplay.jsp` | View all reservations or search by Guest ID or Booking Number |
| `ReservationReports.jsp` | Generate dynamic reports                                      |

---

🎨 UI Highlights

Clean layout using Bootstrap cards & tables

Color-coded buttons for actions (Add, Update, Delete)

Real-time form feedback and hover effects

Consistent font and spacing (Google Fonts – Poppins)

---

🔧 Technologies Used

Frontend: HTML, CSS, JSP, Bootstrap

Backend: Java (Servlets/JSP), JDBC

Database: MySQL

Server: Apache Tomcat

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Project Structure:

HotelWebApp/                                                            
├── WebContent/                                                  
│ ├── index.jsp                                                       
│ ├── reservationadd.jsp                                                    
│ ├── reservationupdate.jsp                                                                  
│ ├── reservationdelete.jsp                                                         
│ ├── reservationdisplay.jsp                                                          
│ ├── reports.jsp                                                       
│ ├── report_form.jsp                                                             
│ └── report_result.jsp                                                          
├── src/                                                   
│ ├── com/                                                  
│ ├── dao/                                                                   
│ │ └── ReservationDAO.java                                                    
│ ├── model/                                                             
│ │ └── Reservation.java                                                                       
│ └── servlet/                                                                    
│ ├── AddReservationServlet.java                                                         
│ ├── UpdateReservationServlet.java                                                       
│ ├── DeleteReservationServlet.java                                                  
│ ├── DisplayReservationsServlet.java                                                 
│ ├── ReportServlet.java                                          
│ └── ReportCriteriaServlet.java                                                       
└── WEB-INF/web.xml                                        

------------------------------------------------------------------------------------------------🖼️ Screenshots

![image alt](https://github.com/ShravanK0/HotelManagementSystem/blob/main/hotelmanagement/output.screenshots/homepage.png)

![image alt](https://github.com/ShravanK0/HotelManagementSystem/blob/main/hotelmanagement/output.screenshots/addReservastion.png)

![image alt](https://github.com/ShravanK0/HotelManagementSystem/blob/main/hotelmanagement/output.screenshots/updateReservation.png)

![image alt](https://github.com/ShravanK0/HotelManagementSystem/blob/main/hotelmanagement/output.screenshots/cancelReservation.png)

![image alt](https://github.com/ShravanK0/HotelManagementSystem/blob/main/hotelmanagement/output.screenshots/GenerateReport.png)

![image alt](https://github.com/ShravanK0/HotelManagementSystem/blob/main/hotelmanagement/output.screenshots/AllReservations.png)
