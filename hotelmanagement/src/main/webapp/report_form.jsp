
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Report</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f3f4f6;
        }
        .container {
            max-width: 700px;
        }
        .card {
            background-color: #ffffff;
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }
        .btn {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 600;
            text-align: center;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-primary {
            background-color: #4f46e5;
            color: #ffffff;
        }
        .btn-primary:hover {
            background-color: #4338ca;
            transform: translateY(-2px);
        }
        .btn-secondary {
            background-color: #6b7280;
            color: #ffffff;
        }
        .btn-secondary:hover {
            background-color: #4b5563;
            transform: translateY(-2px);
        }
        .form-input, .form-select {
            padding: 0.75rem 1rem;
            border: 1px solid #d1d5db; /* gray-300 */
            border-radius: 0.5rem;
            width: 100%;
            box-sizing: border-box;
        }
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #374151; /* gray-700 */
        }
        .alert {
            padding: 1rem;
            border-radius: 0.5rem;
            margin-bottom: 1rem;
            font-weight: 500;
        }
        .alert-error {
            background-color: #fee2e2;
            color: #991b1b;
            border: 1px solid #ef4444;
        }
    </style>
    <script>
        // JavaScript to toggle date/customer name input visibility based on report type
        function toggleReportFields() {
            const reportType = document.getElementById('reportType').value;
            const dateRangeFields = document.getElementById('dateRangeFields');
            const customerNameField = document.getElementById('customerNameField');

            dateRangeFields.classList.add('hidden');
            customerNameField.classList.add('hidden');

            // Reset input values when fields are hidden
            document.getElementById('startDate').value = '';
            document.getElementById('endDate').value = '';
            document.getElementById('customerName').value = '';

            if (reportType === 'reservationsDateRange' || reportType === 'totalRevenue') {
                dateRangeFields.classList.remove('hidden');
            } else if (reportType === 'reservationsByCustomer') {
                customerNameField.classList.remove('hidden');
            }
        }

        // Call on page load to set initial state
        document.addEventListener('DOMContentLoaded', toggleReportFields);
    </script>
</head>
<body class="flex items-center justify-center min-h-screen">
    <div class="container mx-auto p-4 md:p-8">
        <div class="card p-6 md:p-10">
            <h1 class="text-2xl md:text-3xl font-bold text-center text-purple-700 mb-8">Generate Report</h1>

            <%-- Display error messages --%>
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-error">
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>

            <form action="generateReport" method="post" class="space-y-6">
                <div>
                    <label for="reportType" class="form-label">Select Report Type:</label>
                    <select id="reportType" name="reportType" class="form-select" onchange="toggleReportFields()" required>
                        <option value="">-- Select a Report --</option>
                        <option value="reservationsDateRange">Reservations in a Date Range</option>
                        <option value="roomsMostFrequently">Rooms Booked Most Frequently</option>
                        <option value="totalRevenue">Total Revenue Over a Period</option>
                        <option value="reservationsByCustomer">Reservations by Customer Name</option>
                    </select>
                </div>

                <div id="dateRangeFields" class="hidden space-y-6">
                    <div>
                        <label for="startDate" class="form-label">Start Date:</label>
                        <input type="date" id="startDate" name="startDate" class="form-input">
                    </div>
                    <div>
                        <label for="endDate" class="form-label">End Date:</label>
                        <input type="date" id="endDate" name="endDate" class="form-input">
                    </div>
                </div>

                <div id="customerNameField" class="hidden">
                    <div>
                        <label for="customerName" class="form-label">Customer Name (partial match allowed):</label>
                        <input type="text" id="customerName" name="customerName" class="form-input" placeholder="e.g., John Doe or John">
                    </div>
                </div>

                <div class="flex flex-col sm:flex-row justify-between space-y-4 sm:space-y-0 sm:space-x-4">
                    <button type="submit" class="btn btn-primary w-full sm:w-auto">Generate Report</button>
                    <a href="index.jsp" class="btn btn-secondary w-full sm:w-auto">Back to Home</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
