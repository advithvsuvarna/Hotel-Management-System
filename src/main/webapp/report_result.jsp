<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, java.util.List, java.util.Arrays" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Report Results | Ganya Resorts</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background:   #e6f0fa;
    min-height: 100vh;
    padding: 2rem 1rem;
    color: #333;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    background: white;
    border-radius: 16px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    overflow: hidden;
    backdrop-filter: blur(10px);
}

.header {
    background: #3f51b5;
    color: white;
    padding: 2.5rem 2rem;
    text-align: center;
    position: relative;
}

.header::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(45deg, rgba(255,255,255,0.1) 0%, transparent 50%);
}

.header h1 {
    font-size: 2rem;
    margin-bottom: 0.5rem;
    font-weight: 700;
    position: relative;
    z-index: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
}

.header h1::before {
    content: '📊';
    font-size: 1.5rem;
}

.header p {
    opacity: 0.9;
    font-size: 1rem;
    position: relative;
    z-index: 1;
}

.content {
    padding: 2.5rem 2rem;
}

.report-type-badge {
    display: inline-block;
    background: #3f51b5;
    color: white;
    padding: 0.5rem 1.5rem;
    border-radius: 20px;
    font-weight: 600;
    font-size: 0.9rem;
    margin-bottom: 2rem;
    box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
}

.revenue-card {
    background: linear-gradient(135deg, #10b981, #059669);
    color: white;
    padding: 2.5rem;
    border-radius: 16px;
    text-align: center;
    margin: 2rem 0;
    box-shadow: 0 20px 40px rgba(16, 185, 129, 0.3);
    position: relative;
    overflow: hidden;
}

.revenue-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(45deg, rgba(255,255,255,0.1) 0%, transparent 50%);
}

.revenue-card h2 {
    font-size: 1.5rem;
    margin-bottom: 1rem;
    position: relative;
    z-index: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
}

.revenue-card h2::before {
    content: '💰';
    font-size: 1.3rem;
}

.revenue-amount {
    font-size: 3rem;
    font-weight: 700;
    position: relative;
    z-index: 1;
    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.table-container {
    background: linear-gradient(135deg, #f8f9fc 0%, #ffffff 100%);
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    margin: 2rem 0;
    border: 1px solid #e5e7eb;
}

.table-header {
    background: #3f51b5	;
    color: white;
    padding: 1.5rem 2rem;
    font-weight: 600;
    font-size: 1.1rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.table-header::before {
    content: '📋';
    font-size: 1.2rem;
}

table {
    width: 100%;
    border-collapse: collapse;
    background: white;
}

th {
    background: linear-gradient(135deg, #f8f9fc, #e5e7eb);
    padding: 1rem 1.5rem;
    text-align: left;
    font-weight: 600;
    color: #374151;
    border-bottom: 2px solid #e5e7eb;
    font-size: 0.9rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

td {
    padding: 1rem 1.5rem;
    border-bottom: 1px solid #f3f4f6;
    color: #1f2937;
    font-size: 0.95rem;
}

tr:hover {
    background: linear-gradient(135deg, #f8f9fc, #ffffff);
    transform: translateY(-1px);
    transition: all 0.3s ease;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.no-data {
    text-align: center;
    padding: 3rem 2rem;
    color: #6b7280;
    font-style: italic;
    background: linear-gradient(135deg, #f9fafb, #f3f4f6);
}

.no-data::before {
    content: '📭';
    display: block;
    font-size: 3rem;
    margin-bottom: 1rem;
}

.back-link {
    text-align: center;
    margin-top: 2rem;
    display: flex;
    gap: 1rem;
    justify-content: center;
    flex-wrap: wrap;
}

.back-link a {
    color: #ffff;
    text-decoration: none;
    font-weight: 500;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    transition: all 0.3s ease;
    padding: 0.75rem 1.5rem;
    border-radius: 8px;
    background: #3f51b5;
    border: 1px solid rgba(102, 126, 234, 0.2);
}

.back-link a:hover {
    background:#3f51b5 ;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
}

.back-link a.home::before {
    content: '🏠';
}

.back-link a.dashboard::before {
    content: '📊';
}

.back-link a.generate::before {
    content: '📈';
}

/* Responsive design */
@media (max-width: 768px) {
    body {
        padding: 1rem 0.5rem;
    }
    
    .header {
        padding: 2rem 1.5rem;
    }
    
    .header h1 {
        font-size: 1.6rem;
        flex-direction: column;
        gap: 0.3rem;
    }
    
    .content {
        padding: 2rem 1.5rem;
    }
    
    .table-container {
        margin: 1.5rem -1.5rem;
        border-radius: 0;
    }
    
    table {
        font-size: 0.85rem;
    }
    
    th, td {
        padding: 0.75rem 1rem;
    }
    
    .revenue-amount {
        font-size: 2.5rem;
    }
    
    .back-link {
        flex-direction: column;
        align-items: center;
    }
}

/* Animation for page load */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.container {
    animation: fadeInUp 0.6s ease-out;
}

.table-container {
    animation: fadeInUp 0.6s ease-out 0.1s both;
}

.revenue-card {
    animation: fadeInUp 0.6s ease-out 0.2s both;
}

/* Print styles */
@media print {
    body {
        background: white;
        padding: 0;
    }
    
    .container {
        box-shadow: none;
        border-radius: 0;
    }
    
    .back-link {
        display: none;
    }
    
    .header {
        background: #667eea !important;
        -webkit-print-color-adjust: exact;
    }
}

/* Enhanced table styling */
.amount-cell {
    font-weight: 600;
    color: #059669;
}

.id-cell {
    font-family: 'Courier New', monospace;
    font-weight: 600;
    color: #667eea;
}

.date-cell {
    color: #6b7280;
}

/* Status indicators */
.booking-count {
    background: linear-gradient(135deg, #fbbf24, #f59e0b);
    color: white;
    padding: 0.25rem 0.75rem;
    border-radius: 12px;
    font-weight: 600;
    font-size: 0.85rem;
    display: inline-block;
}

/* Loading animation for future use */
@keyframes pulse {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.5; }
}

.loading {
    animation: pulse 2s infinite;
}
</style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Report Results</h1>
        <p>Comprehensive analytics and insights</p>
    </div>

    <div class="content">
        <%
        String reportType = (String) request.getAttribute("reportType");

        if (reportType != null) {
        %>
        <div class="report-type-badge">
            <%= reportType.equals("dateRange") ? "📅 Reservations by Date Range" :
                reportType.equals("revenue") ? "💰 Revenue Report" :
                reportType.equals("popularRooms") ? "🏆 Popular Rooms Report" : "📊 Report" %>
        </div>
        <%
        }

        if ("dateRange".equals(reportType)) {
            List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
        %>
        <div class="table-container">
            <div class="table-header">Reservation Details</div>
            <table>
                <thead>
                    <tr>
                        <th>Reservation ID</th>
                        <th>Customer Name</th>
                        <th>Room Number</th>
                        <th>Check-In Date</th>
                        <th>Check-Out Date</th>
                        <th>Total Amount</th>
                    </tr>
                </thead>
                <tbody>
                <%
                if (reservations != null && !reservations.isEmpty()) {
                    for (Reservation reservation : reservations) {
                %>
                    <tr>
                        <td><%= reservation.getReservationId() %></td>
                        <td><%= reservation.getCustomerName() %></td>
                        <td><%= reservation.getRoomNumber() %></td>
                        <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckIn()) %></td>
                        <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckOut()) %></td>
                        <td>$<%= String.format("%.2f", reservation.getTotalAmount()) %></td>
                    </tr>
                <%
                    }
                } else {
                %>
                    <tr><td colspan="6" class="no-data">No reservations found for the selected date range.</td></tr>
                <%
                }
                %>
                </tbody>
            </table>
        </div>
        <%
        } else if ("revenue".equals(reportType)) {
            Double totalRevenue = (Double) request.getAttribute("totalRevenue");
        %>
        <div class="revenue-card">
            <h2>Total Revenue Generated</h2>
            <div class="revenue-amount">$<%= String.format("%.2f", totalRevenue != null ? totalRevenue : 0.0) %></div>
        </div>
        <%
        } else if ("popularRooms".equals(reportType)) {
            List<String[]> popularRooms = (List<String[]>) request.getAttribute("popularRooms");
        %>
        <div class="table-container">
            <div class="table-header">Most Popular Rooms</div>
            <table>
                <thead>
                    <tr>
                        <th style="text-align:center">Room Number</th>
                        <th style="text-align:center">Number of Bookings</th>
                    </tr>
                </thead>
                <tbody>
                
                
                
                
                <%
    if (popularRooms != null && !popularRooms.isEmpty()) {
        for (String[] room : popularRooms) {
            if (room.length >= 2) {
%>
    <tr>
        <td  style="text-align:center" class="centered-cell"><%= room[0] %></td>
        <td style="text-align:center" class="centered-cell"><%= room[1] %></td>
    </tr>
<%
            }
        }
    } else {
%>
    <tr>
        <td colspan="2" class="no-data centered-cell">No booking data available.</td>
    </tr>
<%
    }
%>

                </tbody>
            </table>
        </div>
        <%
        }
        %>

        <div class="back-link">
            <a href="index.jsp">🏠 Back to Home</a>
            <a href="reports.jsp">📄 Generate New Report</a>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function () {
    // Table row hover effect
    document.querySelectorAll('tbody tr').forEach(row => {
        row.addEventListener('mouseenter', () => {
            row.style.transform = 'translateY(-2px)';
            row.style.boxShadow = '0 4px 15px rgba(0,0,0,0.1)';
        });
        row.addEventListener('mouseleave', () => {
            row.style.transform = 'translateY(0)';
            row.style.boxShadow = 'none';
        });
    });

    // Animate revenue
    const revenueAmount = document.querySelector('.revenue-amount');
    if (revenueAmount) {
        const amount = revenueAmount.textContent;
        revenueAmount.textContent = '₹0.00';
        setTimeout(() => {
            revenueAmount.textContent = amount;
            revenueAmount.style.transform = 'scale(1.1)';
            setTimeout(() => revenueAmount.style.transform = 'scale(1)', 200);
        }, 300);
    }

    // Animate popular room counts
    document.querySelectorAll('.booking-count').forEach((el, index) => {
        setTimeout(() => {
            el.style.transform = 'scale(1.1)';
            setTimeout(() => el.style.transform = 'scale(1)', 150);
        }, index * 100);
    });

    // Keyboard shortcuts
    document.addEventListener('keydown', function (e) {
        if (e.ctrlKey && e.key === 'p') {
            e.preventDefault();
            window.print();
        } else if (e.key === 'Escape') {
            window.location.href = 'index.jsp';
        } else if (e.ctrlKey && e.key === 'h') {
            e.preventDefault();
            window.location.href = 'index.jsp';
        }
    });

    // Add loading state on back links
    document.querySelectorAll('.back-link a').forEach(link => {
        link.addEventListener('click', function () {
            this.style.opacity = '0.6';
            this.innerHTML = '⏳ Loading...';
        });
    });
});
</script>

</body>

</html>