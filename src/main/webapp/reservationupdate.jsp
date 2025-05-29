<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, com.dao.ReservationDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Update Reservation | ReserveEase</title>
<style>
  /* Reset and base */
  *, *::before, *::after {
    box-sizing: border-box;
  }
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #e6f0fa; /* light blue background */
    color: #333;
    padding: 2rem 1rem;
    min-height: 100vh;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }
  .container {
    max-width: 600px;
    margin: 0 auto;
    background: white;
    border-radius: 14px;
    box-shadow: 0 6px 20px rgba(63,81,181,0.15);
    overflow: hidden;
  }
  .header {
    background: #3f51b5; /* main blue */
    color: white;
    padding: 2rem 2rem;
    text-align: center;
    border-radius: 14px 14px 0 0;
    box-shadow: 0 6px 15px rgba(63,81,181,0.3);
  }
  .header h1 {
    font-size: 2rem;
    font-weight: 700;
    margin-bottom: 0.25rem;
  }
  .header p {
    font-size: 1rem;
    opacity: 0.85;
    font-weight: 400;
  }
  .content {
    padding: 2rem 2rem;
  }
  .error {
    background: #ffebee; /* soft red background */
    color: #d32f2f; /* red text */
    padding: 1rem 1.5rem;
    border-radius: 10px;
    margin-bottom: 2rem;
    font-weight: 600;
    box-shadow: 0 4px 14px rgba(211,47,47,0.2);
  }
  form {
    background: #f9fbff; /* very light blue */
    border-radius: 12px;
    padding: 2rem;
    border: 1px solid #c5cae9; /* light blue border */
  }
  .form-group {
    margin-bottom: 1.5rem;
  }
  label {
    display: block;
    margin-bottom: 0.6rem;
    font-weight: 600;
    color: #3f51b5; /* main blue */
    font-size: 0.95rem;
  }
  input[type="text"],
  input[type="date"],
  input[type="number"] {
    width: 100%;
    padding: 0.85rem 1rem;
    border: 2px solid #d6e3fc; /* lighter blue border */
    border-radius: 10px;
    font-size: 1rem;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
    background: white;
    color: #303f9f; /* dark blue text inside input */
  }
  input[type="text"]:focus,
  input[type="date"]:focus,
  input[type="number"]:focus {
    outline: none;
    border-color: #303f9f; /* darker blue on focus */
    box-shadow: 0 0 8px 2px rgba(48,63,159,0.4);
  }
  .actions {
    display: flex;
    gap: 1rem;
    justify-content: center;
    margin-top: 2rem;
    flex-wrap: wrap;
  }
  button, .btn {
    padding: 0.9rem 2.2rem;
    border: none;
    border-radius: 10px;
    font-weight: 700;
    font-size: 1rem;
    cursor: pointer;
    color: white;
    transition: background 0.3s ease, transform 0.2s ease;
    min-width: 160px;
    user-select: none;
    box-shadow: 0 3px 10px rgba(63,81,181,0.15);
  }
  .update-btn {
    background: #3f51b5;
  }
  .update-btn:hover {
    background: #303f9f;
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(48,63,159,0.3);
  }
  .cancel-btn {
    background: transparent;
    color: #3f51b5;
    border: 2px solid #3f51b5;
    border-radius: 10px;
    text-align: center;
    line-height: 1.5;
    display: inline-block;
    text-decoration: none;
    font-weight: 600;
    min-width: 160px;
    user-select: none;
    padding: 0.9rem 1.8rem;
    transition: background-color 0.3s ease, color 0.3s ease, box-shadow 0.3s ease, transform 0.2s ease;
  }
  .cancel-btn:hover {
    background: #3f51b5;
    color: white;
    box-shadow: 0 6px 20px rgba(63,81,181,0.25);
    transform: translateY(-2px);
  }
  .hidden-input {
    display: none;
  }

  @media (max-width: 768px) {
    body {
      padding: 1rem 0.5rem;
    }
    .header {
      padding: 1.5rem 1.2rem;
    }
    .header h1 {
      font-size: 1.6rem;
    }
    .content {
      padding: 1.8rem 1.5rem;
    }
    form {
      padding: 1.5rem;
    }
    .actions {
      flex-direction: column;
      align-items: stretch;
    }
    button, .btn, .cancel-btn {
      width: 100%;
      min-width: unset;
    }
  }
</style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Update Reservation</h1>
        <p>Modify reservation details with ease</p>
    </div>
    <div class="content">
        <%
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect("reservationdisplay.jsp");
            return;
        }
        int id = Integer.parseInt(idParam);
        ReservationDAO reservationDAO = new ReservationDAO();
        Reservation reservation = reservationDAO.selectReservation(id);
        if (reservation == null) {
            response.sendRedirect("reservationdisplay.jsp");
            return;
        }
        if (request.getAttribute("errorMessage") != null) { 
        %>
            <div class="error"><%= request.getAttribute("errorMessage") %></div>
        <% } %>

        <form action="UpdateReservationServlet" method="post" novalidate>
            <input type="hidden" name="reservationId" value="<%= reservation.getReservationId() %>" class="hidden-input">

            <div class="form-group">
                <label for="customerName">Customer Name</label>
                <input type="text" id="customerName" name="customerName" 
                       value="<%= reservation.getCustomerName() %>" required placeholder="Enter customer name" />
            </div>

            <div class="form-group">
                <label for="roomNumber">Room Number</label>
                <input type="text" id="roomNumber" name="roomNumber" 
                       value="<%= reservation.getRoomNumber() %>" required placeholder="Enter room number" />
            </div>

            <div class="form-group">
                <label for="checkIn">Check-In Date</label>
                <input type="date" id="checkIn" name="checkIn" required
                       value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckIn()) %>" />
            </div>

            <div class="form-group">
                <label for="checkOut">Check-Out Date</label>
                <input type="date" id="checkOut" name="checkOut" required
                       value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckOut()) %>" />
            </div>

            <div class="form-group">
                <label for="totalAmount">Total Amount ($)</label>
                <input type="number" id="totalAmount" name="totalAmount" step="0.01" min="0" required
                       value="<%= reservation.getTotalAmount() %>" placeholder="0.00" />
            </div>

            <div class="actions">
                <button type="submit" class="update-btn">Update Reservation</button>
                <a href="reservationdisplay.jsp" class="cancel-btn">Cancel</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
