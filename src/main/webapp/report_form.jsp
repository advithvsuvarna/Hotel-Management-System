<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Report | ReserveEase</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            padding: 30px 40px;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            color: #0056b3;
            font-size: 28px;
            margin-bottom: 10px;
        }

        .header p {
            color: #666;
            font-size: 15px;
        }

        .content {
            margin-top: 10px;
        }

        .error-alert {
            background-color: #ffdddd;
            border-left: 5px solid #f44336;
            padding: 10px 15px;
            margin-bottom: 20px;
            border-radius: 6px;
            color: #b30000;
        }

        .report-type-info h2 {
            font-size: 22px;
            color: #0073e6;
            margin-bottom: 10px;
        }

        .report-type-info p {
            font-size: 15px;
            color: #555;
            margin-bottom: 20px;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-label {
            font-weight: 600;
            margin-bottom: 8px;
            color: #004080;
        }

        .form-input {
            padding: 10px 12px;
            font-size: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
            transition: border 0.3s ease;
        }

        .form-input:focus {
            border-color: #0073e6;
            outline: none;
        }

        .btn {
            margin-top: 25px;
            background-color: #0073e6;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background-color: #005bb5;
        }

        .btn:disabled,
        .btn.loading {
            background-color: #0073e6;
            opacity: 0.6;
            cursor: not-allowed;
        }

        .back-link {
            margin-top: 25px;
            text-align: center;
        }

        .back-link a {
            color: #0073e6;
            text-decoration: none;
            font-weight: 500;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

        .no-params-message {
            font-size: 15px;
            padding: 10px 12px;
            background-color: #e6f0ff;
            color: #004080;
            border-left: 4px solid #0073e6;
            border-radius: 6px;
        }

        /* Optional icons based on type */
        .date-range-icon::before {
            content: "\f073";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            margin-right: 8px;
        }

        .revenue-icon::before {
            content: "\f201";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            margin-right: 8px;
        }

        .popular-rooms-icon::before {
            content: "\f015";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            margin-right: 8px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Generate Report</h1>
        <p>Create detailed analytics and insights</p>
    </div>

    <div class="content">
        <%
        String error = request.getParameter("error");
        if (error != null && !error.isEmpty()) {
        %>
            <div class="error-alert">
                <%= error.replaceAll("\"", "&quot;") %>
            </div>
        <%
        }
        %>

        <%
        String reportType = request.getParameter("reportType");
        if (reportType == null) {
        %>
            <div class="error-alert">
                No report type selected. Please select a report type from the main menu.
            </div>
            <div class="back-link">
                <a href="dashboard.jsp">Back to Dashboard</a>
            </div>
        <%
        } else {
        %>
            <div class="report-type-info">
                <h2 class="<%= reportType.equals("dateRange") ? "date-range-icon" : 
                              reportType.equals("revenue") ? "revenue-icon" : 
                              reportType.equals("popularRooms") ? "popular-rooms-icon" : "" %>">
                    <%= reportType.equals("dateRange") ? "Reservations by Date Range" :
                        reportType.equals("revenue") ? "Revenue Report" :
                        reportType.equals("popularRooms") ? "Popular Rooms Report" : "Unknown Report" %>
                </h2>
                <p>
                    <%= reportType.equals("dateRange") ? "Generate a comprehensive list of all reservations within your specified date range." :
                        reportType.equals("revenue") ? "Analyze your revenue performance and financial metrics for the selected period." :
                        reportType.equals("popularRooms") ? "Discover which rooms are most frequently booked and generate insights." : "Report description not available." %>
                </p>
            </div>

            <form action="ReportServlet" method="post" class="report-form">
                <div class="form-container">
                    <input type="hidden" name="reportType" value="<%= reportType %>" class="hidden-input">

                    <%
                    if ("dateRange".equals(reportType) || "revenue".equals(reportType)) {
                    %>
                        <div class="form-group">
                            <label for="startDate" class="form-label">
                                <i class="fas fa-calendar-alt"></i>
                                Start Date
                            </label>
                            <input type="date" id="startDate" name="startDate" class="form-input" required>
                        </div>

                        <div class="form-group">
                            <label for="endDate" class="form-label">
                                <i class="fas fa-calendar-check"></i>
                                End Date
                            </label>
                            <input type="date" id="endDate" name="endDate" class="form-input" required>
                        </div>
                    <%
                    } else if ("popularRooms".equals(reportType)) {
                    %>
                    
                    <%
                    }
                    %>
                </div>

                <button type="submit" class="btn">Generate Report</button>
            </form>

            <div class="back-link">
                <a href="index.jsp">Back to Home</a>
            </div>
        <%
        }
        %>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('.report-form');
    const submitBtn = document.querySelector('.btn');
    const startDateInput = document.getElementById('startDate');
    const endDateInput = document.getElementById('endDate');

    function validateDates() {
        if (startDateInput && endDateInput) {
            const startDate = new Date(startDateInput.value);
            const endDate = new Date(endDateInput.value);
            const today = new Date();
            today.setHours(23, 59, 59, 999);

            if (startDate > today) {
                startDateInput.setCustomValidity('Start date cannot be in the future');
                return false;
            } else if (endDate < startDate) {
                endDateInput.setCustomValidity('End date must be after start date');
                return false;
            } else {
                startDateInput.setCustomValidity('');
                endDateInput.setCustomValidity('');
                return true;
            }
        }
        return true;
    }

    if (startDateInput && endDateInput) {
        startDateInput.addEventListener('change', validateDates);
        endDateInput.addEventListener('change', validateDates);

        const today = new Date().toISOString().split('T')[0];
        startDateInput.setAttribute('max', today);
        endDateInput.setAttribute('max', today);
    }

    if (form) {
        form.addEventListener('submit', function(e) {
            if (!validateDates()) {
                e.preventDefault();
                return;
            }
            submitBtn.disabled = true;
            submitBtn.classList.add('loading');
            submitBtn.innerHTML = '<span>Generating...</span>';
        });
    }
});
</script>

</body>
</html>
