<%-- WebContent/reports.jsp --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Reports</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f3f4f6;
        }
        .container {
            max-width: 800px;
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
    </style>
</head>
<body class="flex items-center justify-center min-h-screen">
    <div class="container mx-auto p-4 md:p-8">
        <div class="card p-6 md:p-10">
            <h1 class="text-2xl md:text-3xl font-bold text-center text-purple-700 mb-8">Hotel Reports</h1>

            <p class="text-lg text-gray-700 text-center mb-8">
                Select a report type to view detailed insights into your hotel's performance.
            </p>

            <div class="flex flex-col items-center space-y-6">
                <a href="reportCriteria" class="btn btn-primary w-full max-w-sm">Generate New Report</a>
                <a href="index.jsp" class="btn btn-secondary w-full max-w-sm">Back to Home</a>
            </div>

            <p class="text-center text-gray-500 text-sm mt-10">
                You will be redirected to a form to select specific criteria for your report.
            </p>
        </div>
    </div>
</body>
</html>
