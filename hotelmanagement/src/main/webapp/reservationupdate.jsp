<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.model.Reservation" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Reservation</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
        }

        .card {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            max-width: 700px;
            width: 100%;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
        }

        h1, h2 {
            text-align: center;
            color: #4f46e5;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #374151;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 1rem;
        }

        input[readonly] {
            background-color: #e5e7eb;
            cursor: not-allowed;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            margin-top: 20px;
            flex-wrap: wrap;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            width: 100%;
            max-width: 200px;
        }

        .btn-primary {
            background-color: #4f46e5;
            color: white;
        }

        .btn-primary:hover {
            background-color: #4338ca;
        }

        .btn-secondary {
            background-color: #6b7280;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #4b5563;
        }

        .alert {
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .alert-success {
            background-color: #d1fae5;
            color: #065f46;
            border: 1px solid #34d399;
        }

        .alert-error {
            background-color: #fee2e2;
            color: #991b1b;
            border: 1px solid #ef4444;
        }

        .validation-error {
            color: #991b1b;
            font-size: 0.9rem;
            margin-top: 5px;
        }

        @media (max-width: 600px) {
            .btn-group {
                flex-direction: column;
                align-items: center;
            }

            .btn {
                max-width: 100%;
            }
        }
    </style>

    <script>
        function validateAmount() {
            const amount = document.getElementById("totalAmount").value;
            const error = document.getElementById("amountError");

            if (amount < 0) {
                error.textContent = "Total amount cannot be negative.";
                return false;
            }

            error.textContent = "";
            return true;
        }
    </script>
</head>
<body>
    <div class="card">
        <h1>Update Reservation</h1>

        <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-success"><%= request.getAttribute("message") %></div>
        <% } %>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-error"><%= request.getAttribute("errorMessage") %></div>
        <% } %>

        <!-- Search Form -->
        <form action="updateReservation" method="get" style="margin-bottom: 20px;">
            <div class="form-group">
                <label for="searchReservationID">Search by Reservation ID:</label>
                <input type="number" id="searchReservationID" name="reservationID"
                       placeholder="Enter Reservation ID" required
                       value="<%= request.getParameter("reservationID") != null ? request.getParameter("reservationID") : "" %>">
            </div>
            <button type="submit" class="btn btn-secondary">Search</button>
        </form>

        <% Reservation reservation = (Reservation) request.getAttribute("reservation"); %>
        <% if (reservation != null) { %>
            <h2>Edit Reservation Details</h2>
            <form action="updateReservation" method="post" onsubmit="return validateAmount();">
                <div class="form-group">
                    <label for="reservationID">Reservation ID:</label>
                    <input type="text" name="reservationID" id="reservationID"
                           value="<%= reservation.getReservationID() %>" readonly>
                </div>
                <div class="form-group">
                    <label for="customerName">Customer Name:</label>
                    <input type="text" name="customerName" id="customerName"
                           value="<%= reservation.getCustomerName() %>" required>
                </div>
                <div class="form-group">
                    <label for="roomNumber">Room Number:</label>
                    <input type="text" name="roomNumber" id="roomNumber"
                           value="<%= reservation.getRoomNumber() %>" required>
                </div>
                <div class="form-group">
                    <label for="checkIn">Check-in Date:</label>
                    <input type="date" name="checkIn" id="checkIn"
                           value="<%= reservation.getCheckIn() %>" required>
                </div>
                <div class="form-group">
                    <label for="checkOut">Check-out Date:</label>
                    <input type="date" name="checkOut" id="checkOut"
                           value="<%= reservation.getCheckOut() %>" required>
                </div>
                <div class="form-group">
                    <label for="totalAmount">Total Amount:</label>
                    <input type="number" step="0.01" name="totalAmount" id="totalAmount"
                           value="<%= reservation.getTotalAmount() %>" required>
                    <div id="amountError" class="validation-error"></div>
                </div>

                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">Update Reservation</button>
                    <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
                </div>
            </form>
        <% } else if (request.getParameter("reservationID") != null) { %>
            <p class="alert alert-error">No reservation found with ID: <%= request.getParameter("reservationID") %></p>
        <% } %>
    </div>
</body>
</html>
