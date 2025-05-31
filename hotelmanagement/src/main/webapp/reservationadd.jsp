<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Reservation</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            max-width: 600px;
            width: 100%;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #4f46e5;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: 600;
            margin-bottom: 5px;
            display: block;
            color: #374151;
        }

        input[type="text"],
        input[type="date"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 1rem;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            width: 100%;
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
            padding: 10px 15px;
            border-radius: 6px;
            margin-bottom: 15px;
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
    </style>

    <script>
        function validateForm() {
            const totalAmount = document.getElementById("totalAmount").value;
            const errorText = document.getElementById("amountError");

            if (totalAmount < 0) {
                errorText.textContent = "Total amount cannot be negative.";
                return false;
            }

            errorText.textContent = "";
            return true;
        }
    </script>
</head>
<body>
    <div class="card">
        <h1>Add New Reservation</h1>

        <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-success">
                <%= request.getAttribute("message") %>
            </div>
        <% } %>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-error">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <form action="addReservation" method="post" onsubmit="return validateForm();">
            <div class="form-group">
                <label for="customerName">Customer Name:</label>
                <input type="text" name="customerName" id="customerName" required>
            </div>

            <div class="form-group">
                <label for="roomNumber">Room Number:</label>
                <input type="text" name="roomNumber" id="roomNumber" required>
            </div>

            <div class="form-group">
                <label for="checkIn">Check-in Date:</label>
                <input type="date" name="checkIn" id="checkIn" required>
            </div>

            <div class="form-group">
                <label for="checkOut">Check-out Date:</label>
                <input type="date" name="checkOut" id="checkOut" required>
            </div>

            <div class="form-group">
                <label for="totalAmount">Total Amount:</label>
                <input type="number" name="totalAmount" id="totalAmount" step="0.01" required>
                <div id="amountError" class="validation-error"></div>
            </div>

            <div class="btn-group">
                <button type="submit" class="btn btn-primary">Add Reservation</button>
                <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
            </div>
        </form>
    </div>
</body>
</html>
