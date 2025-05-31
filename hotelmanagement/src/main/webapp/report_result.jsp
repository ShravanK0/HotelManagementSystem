<%-- WebContent/report_result.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.model.Reservation" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Results</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f3f4f6;
        }
        .container {
            max-width: 1000px;
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
        .btn-secondary {
            background-color: #6b7280;
            color: #ffffff;
        }
        .btn-secondary:hover {
            background-color: #4b5563;
            transform: translateY(-2px);
        }
        .table-header {
            background-color: #4f46e5; /* indigo-600 */
            color: #ffffff;
            padding: 0.75rem 1rem;
            text-align: left;
            font-weight: 600;
            border-bottom: 2px solid #3730a3; /* indigo-800 */
        }
        .table-cell {
            padding: 0.75rem 1rem;
            border-bottom: 1px solid #e5e7eb; /* gray-200 */
        }
        .table-row:nth-child(even) {
            background-color: #f9fafb; /* gray-50 */
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
</head>
<body class="flex items-center justify-center min-h-screen py-8">
    <div class="container mx-auto p-4 md:p-8">
        <div class="card p-6 md:p-10">
            <h1 class="text-2xl md:text-3xl font-bold text-center text-purple-700 mb-8">Report Results</h1>
            <h2 class="text-xl md:text-2xl font-semibold text-center text-gray-800 mb-6">
                <%= request.getAttribute("reportTitle") != null ? request.getAttribute("reportTitle") : "Report" %>
            </h2>

            <%-- Display error messages --%>
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-error">
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>

            <%
                String reportType = (String) request.getAttribute("reportType");
                if ("reservationsDateRange".equals(reportType) || "reservationsByCustomer".equals(reportType)) {
                    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reportData");
                    if (reservations != null && !reservations.isEmpty()) {
            %>
                        <div class="overflow-x-auto mb-8">
                            <table class="min-w-full divide-y divide-gray-200 rounded-lg overflow-hidden">
                                <thead>
                                    <tr>
                                        <th class="table-header rounded-tl-lg">ID</th>
                                        <th class="table-header">Customer Name</th>
                                        <th class="table-header">Room Number</th>
                                        <th class="table-header">Check-in</th>
                                        <th class="table-header">Check-out</th>
                                        <th class="table-header rounded-tr-lg">Total Amount</th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <% for (Reservation res : reservations) { %>
                                        <tr class="table-row">
                                            <td class="table-cell"><%= res.getReservationID() %></td>
                                            <td class="table-cell"><%= res.getCustomerName() %></td>
                                            <td class="table-cell"><%= res.getRoomNumber() %></td>
                                            <td class="table-cell"><%= res.getCheckIn() %></td>
                                            <td class="table-cell"><%= res.getCheckOut() %></td>
                                            <td class="table-cell">$<%= String.format("%.2f", res.getTotalAmount()) %></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
            <%
                    } else {
            %>
                        <p class="text-center text-gray-600 text-lg mb-8">No reservations found for the given criteria.</p>
            <%
                    }
                } else if ("roomsMostFrequently".equals(reportType)) {
                    List<String[]> frequentRooms = (List<String[]>) request.getAttribute("reportData");
                    if (frequentRooms != null && !frequentRooms.isEmpty()) {
            %>
                        <div class="overflow-x-auto mb-8">
                            <table class="min-w-full divide-y divide-gray-200 rounded-lg overflow-hidden">
                                <thead>
                                    <tr>
                                        <th class="table-header rounded-tl-lg">Room Number</th>
                                        <th class="table-header rounded-tr-lg">Booking Count</th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <% for (String[] roomData : frequentRooms) { %>
                                        <tr class="table-row">
                                            <td class="table-cell"><%= roomData[0] %></td>
                                            <td class="table-cell"><%= roomData[1] %></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
            <%
                    } else {
            %>
                        <p class="text-center text-gray-600 text-lg mb-8">No room booking data available.</p>
            <%
                    }
                } else if ("totalRevenue".equals(reportType)) {
                    BigDecimal totalRevenue = (BigDecimal) request.getAttribute("reportData");
            %>
                    <div class="text-center text-2xl font-bold text-green-700 mb-8">
                        Total Revenue: $<%= totalRevenue != null ? String.format("%.2f", totalRevenue) : "0.00" %>
                    </div>
            <%
                } else {
            %>
                    <p class="text-center text-gray-600 text-lg mb-8">No report data to display or invalid report type.</p>
            <%
                }
            %>

            <div class="mt-8 text-center flex flex-col sm:flex-row justify-center space-y-4 sm:space-y-0 sm:space-x-4">
                <a href="reportCriteria" class="btn btn-secondary w-full sm:w-auto">Generate Another Report</a>
                <a href="index.jsp" class="btn btn-secondary w-full sm:w-auto">Back to Home</a>
            </div>
        </div>
    </div>
</body>
</html>
