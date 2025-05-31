<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        .header {
            background: #0f172a;
            color: #fff;
            text-align: center;
            padding: 40px 20px;
        }

        .header h1 {
            margin-bottom: 10px;
            font-size: 2.2rem;
        }

        .header p {
            font-size: 1rem;
            font-weight: 300;
            color: #cbd5e1;
        }

        .content {
            padding: 30px;
        }

        .modules-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
        }

        .module-card {
            background: #f9fafb;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 20px;
            transition: all 0.3s ease;
        }

        .module-card:hover {
            background: #e0f2fe;
            transform: scale(1.02);
            border-color: #38bdf8;
        }

        .module-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 20px;
        }

        .module-icon {
            width: 40px;
            height: 40px;
            background: #e0f2fe;
            color: #0ea5e9;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.4rem;
        }

        .module-title {
            font-size: 1.2rem;
            font-weight: 600;
        }

        .action-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .action-btn {
            display: flex;
            align-items: center;
            gap: 10px;
            background: white;
            border: 1px solid #cbd5e1;
            padding: 10px 14px;
            border-radius: 6px;
            text-decoration: none;
            color: #1e293b;
            transition: 0.3s ease;
        }

        .action-btn i {
            font-size: 1rem;
        }

        .action-btn:hover {
            background: #bae6fd;
            color: #0c4a6e;
            transform: translateX(4px);
        }

        .footer {
            text-align: center;
            padding: 20px;
            font-size: 0.85rem;
            background-color: #e2e8f0;
            color: #475569;
        }

        @media (max-width: 600px) {
            .header h1 {
                font-size: 1.6rem;
            }

            .content {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>Hotel Management System</h1>
            <p>Efficient Control and Seamless Hotel Operations</p>
        </header>

        <div class="content">
            <div class="modules-grid">
                <!-- Reservations Module -->
                <div class="module-card">
                    <div class="module-header">
                        <div class="module-icon">
                            <i class="fas fa-door-open"></i>
                        </div>
                        <div class="module-title">Reservations</div>
                    </div>
                    <div class="action-list">
                        <a href="reservationadd.jsp" class="action-btn">
                            <i class="fas fa-plus"></i> Add New Reservation
                        </a>
                        <a href="reservationupdate.jsp" class="action-btn">
                            <i class="fas fa-edit"></i> Update Reservation
                        </a>
                        <a href="reservationdelete.jsp" class="action-btn">
                            <i class="fas fa-times"></i> Cancel Reservation
                        </a>
                        <a href="displayReservations" class="action-btn">
                            <i class="fas fa-list"></i> View All Reservations
                        </a>
                    </div>
                </div>

                <!-- Reports Module -->
                <div class="module-card">
                    <div class="module-header">
                        <div class="module-icon" style="background:#ede9fe; color:#7c3aed;">
                            <i class="fas fa-clipboard-list"></i>
                        </div>
                        <div class="module-title">Reports</div>
                    </div>
                    <div class="action-list">
                        <a href="reportCriteria" class="action-btn">
                            <i class="fas fa-file-alt"></i> Generate Reports
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">
            &copy; <script>document.write(new Date().getFullYear())</script> Hotel Management System by shravankumark. All rights reserved.
        </footer>
    </div>
</body>
</html>
