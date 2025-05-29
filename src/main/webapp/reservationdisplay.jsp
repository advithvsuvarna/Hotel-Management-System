<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>View Reservations | ReserveEase</title>
    <style>
        /* Reset and base */
        *, *::before, *::after {
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #e6f0fa; /* Light blue background */
            color: #333;
            margin: 0;
            padding: 2rem;
            line-height: 1.5;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        a {
            text-decoration: none;
            color: #3f51b5;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #303f9f;
        }

        .container {
            max-width: 1100px;
            margin: 0 auto;
        }

        /* Header */
        header {
            background: #3f51b5;
            padding: 2rem 2.5rem;
            border-radius: 12px;
            color: white;
            box-shadow: 0 6px 20px rgba(63,81,181,0.15);
            margin-bottom: 2.5rem;
        }
        header h1 {
            font-weight: 700;
            font-size: 2.4rem;
            margin-bottom: 0.25rem;
        }
        header p {
            font-weight: 400;
            font-size: 1.15rem;
            opacity: 0.85;
        }

        /* Stats */
        .stats {
            display: inline-block;
            background: #d6e3fc; /* lighter blue */
            color: #2c3e9f;
            padding: 0.5rem 1.25rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.2rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 4px 12px rgba(44,62,159,0.12);
        }

        /* Action bar */
        .action-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.8rem;
            flex-wrap: wrap;
            gap: 1rem;
        }
        .btn {
            display: inline-block;
            font-weight: 600;
            font-size: 1rem;
            padding: 0.55rem 1.6rem;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 0 3px 10px rgba(63,81,181,0.15);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            user-select: none;
        }
        .btn-primary {
            background: #3f51b5;
            color: white;
            border: none;
        }
        .btn-primary:hover {
            background: #303f9f;
            box-shadow: 0 6px 20px rgba(48,63,159,0.3);
        }
        .btn-secondary {
            background: transparent;
            color: #3f51b5;
            border: 2px solid #3f51b5;
        }
        .btn-secondary:hover {
            background: #3f51b5;
            color: white;
            border-color: #3f51b5;
            box-shadow: 0 6px 20px rgba(63,81,181,0.25);
        }

        /* Table styles */
        .table-wrapper {
            background: transparent;
            border-radius: 14px;
            overflow-x: auto;
            /* no shadow here to keep light feel */
            border: none;
        }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 0.8rem; /* space between rows for card effect */
            min-width: 700px;
        }
        thead {
            background: #5671d6; /* lighter dark blue */
            color: white;
            border-radius: 12px;
        }
        thead th {
            padding: 1rem 1.3rem;
            font-weight: 600;
            letter-spacing: 0.05em;
            text-transform: uppercase;
            user-select: none;
            border: none;
            text-align: left;
        }
        tbody tr {
            background: white;
            box-shadow: 0 2px 7px rgba(0,0,0,0.06);
            border-radius: 12px;
            transition: transform 0.2s ease, box-shadow 0.3s ease;
        }
        tbody tr:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 18px rgba(44,62,159,0.25);
            background: #f0f4ff;
        }
        tbody td {
            padding: 1rem 1.3rem;
            font-size: 0.95rem;
            vertical-align: middle;
            border: none;
        }

        /* Text and badges */
        .reservation-id {
            font-weight: 700;
            color: #3f51b5;
        }
        .customer-name {
            font-weight: 600;
        }
        .room-number {
            display: inline-block;
            padding: 0.35rem 0.8rem;
            background: #c5cae9;
            color: #303f9f;
            border-radius: 12px;
            font-weight: 600;
            font-size: 0.85rem;
            user-select: none;
        }
        .amount {
            font-weight: 700;
            color: #388e3c;
        }
        .date-cell {
            color: #555;
            font-weight: 500;
        }

        /* Action buttons inside table */
        .actions {
            display: flex;
            gap: 0.7rem;
            flex-wrap: wrap;
        }
        .action-btn {
            padding: 0.4rem 0.9rem;
            border-radius: 7px;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            user-select: none;
            border: none;
            transition: background-color 0.25s ease, color 0.25s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.35rem;
        }
        .update-btn {
            background-color: #e8eaf6;
            color: #3f51b5;
        }
        .update-btn:hover {
            background-color: #c5cae9;
        }
        .delete-btn {
            background-color: #ffebee;
            color: #d32f2f;
        }
        .delete-btn:hover {
            background-color: #ef9a9a;
        }

        /* No data */
        .no-data {
            text-align: center;
            padding: 3rem 1rem;
            color: #999;
            font-style: italic;
            font-size: 1.1rem;
        }

        /* Responsive */
        @media (max-width: 900px) {
            body {
                padding: 1.2rem;
            }
            header {
                padding: 1.5rem 2rem;
            }
            .action-bar {
                flex-direction: column;
                align-items: stretch;
                gap: 0.75rem;
            }
            .table-wrapper {
                min-width: 100%;
            }
            table {
                min-width: 100%;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Current Reservations</h1>
            <p>Manage all your hotel bookings in one place</p>
        </header>

        <%
        List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
        int totalReservations = (reservations != null) ? reservations.size() : 0;
        %>

        <div class="stats">Total Reservations: <%= totalReservations %></div>

        <div class="action-bar">
            <a href="reservationadd.jsp" class="btn btn-primary">+ Add New Reservation</a>
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>Reservation ID</th>
                        <th>Customer Name</th>
                        <th>Room Number</th>
                        <th>Check-In Date</th>
                        <th>Check-Out Date</th>
                        <th>Total Amount</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <%
                if (reservations != null && !reservations.isEmpty()) {
                    for (Reservation reservation : reservations) {
                %>
                    <tr>
                        <td class="reservation-id">#<%= reservation.getReservationId() %></td>
                        <td class="customer-name"><%= reservation.getCustomerName() %></td>
                        <td><span class="room-number"><%= reservation.getRoomNumber() %></span></td>
                        <td class="date-cell"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(reservation.getCheckIn()) %></td>
                        <td class="date-cell"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(reservation.getCheckOut()) %></td>
                        <td class="amount">$<%= String.format("%.2f", reservation.getTotalAmount()) %></td>
                        <td class="actions">
                            <a href="reservationupdate.jsp?id=<%= reservation.getReservationId() %>" class="action-btn update-btn">✏️ Update</a>
                            <a href="reservationdelete.jsp?id=<%= reservation.getReservationId() %>" class="action-btn delete-btn">🗑️ Delete</a>
                        </td>
                    </tr>
                <%
                    }
                } else {
                %>
                    <tr>
                        <td colspan="7" class="no-data">
                            No reservations found. <a href="reservationadd.jsp">Create your first reservation</a>.
                        </td>
                    </tr>
                <%
                }
                %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
