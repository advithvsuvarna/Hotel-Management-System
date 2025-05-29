<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Reservation | ReserveEase</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: url('https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80') center/cover no-repeat fixed;
    min-height: 100vh;
    padding: 2rem 1rem;
    position: relative;
}

/* Dark overlay for better text readability */
body::before {
    content: '';
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.4);
    z-index: -1;
}

.container {
    max-width: 520px;
    margin: 0 auto;
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(15px);
    border-radius: 20px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
    overflow: hidden;
    border: 1px solid rgba(255, 255, 255, 0.3);
}

.header {
    background: linear-gradient(135deg, rgba(75, 108, 183, 0.3), rgba(24, 40, 72, 0.4));
    backdrop-filter: blur(15px);
    color: white;
    padding: 2.5rem 2rem;
    text-align: center;
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
    position: relative;
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

.header::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(135deg, rgba(75, 108, 183, 0.1), rgba(24, 40, 72, 0.1));
    backdrop-filter: blur(5px);
    z-index: -1;
}

.header h1 {
    font-size: 2rem;
    margin-bottom: 0.5rem;
    font-weight: 700;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

.header p {
    opacity: 0.95;
    font-size: 0.95rem;
    font-weight: 400;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
}

.form-section {
    padding: 2rem;
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(20px);
    position: relative;
}

.form-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(5px);
    z-index: -1;
}

.form-group {
    margin-bottom: 1.5rem;
}

label {
    display: block;
    margin-bottom: 0.6rem;
    font-weight: 600;
    color: #1f2937;
    font-size: 0.9rem;
    text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.8);
}

input {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid rgba(255, 255, 255, 0.3);
    border-radius: 12px;
    font-size: 1rem;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    transition: all 0.3s ease;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    color: #1f2937;
}

input:focus {
    outline: none;
    border-color: rgba(255, 255, 255, 0.6);
    box-shadow: 0 0 0 4px rgba(75, 108, 183, 0.3), 0 4px 12px rgba(0, 0, 0, 0.15);
    background: rgba(255, 255, 255, 0.3);
}

.submit-btn {
    width: 100%;
    background: linear-gradient(135deg, rgba(75, 108, 183, 0.4), rgba(24, 40, 72, 0.5));
    color: white;
    border: 2px solid rgba(255, 255, 255, 0.3);
    padding: 0.95rem;
    border-radius: 12px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.25s ease;
    backdrop-filter: blur(15px);
    box-shadow: 0 4px 15px rgba(75, 108, 183, 0.3);
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
}

.submit-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(75, 108, 183, 0.4);
    background: linear-gradient(135deg, rgba(75, 108, 183, 0.6), rgba(24, 40, 72, 0.7));
    border-color: rgba(255, 255, 255, 0.5);
}

.back-link {
    display: inline-block;
    margin-top: 1.8rem;
    background: rgba(255, 255, 255, 0.2);
    color: #ffffff;
    font-weight: 600;
    text-decoration: none;
    padding: 0.6rem 1.2rem;
    border-radius: 10px;
    transition: all 0.3s ease;
    border: 2px solid rgba(255, 255, 255, 0.3);
    backdrop-filter: blur(10px);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
}

.back-link:hover {
    background: rgba(255, 255, 255, 0.3);
    color: #ffffff;
    border: 2px solid rgba(255, 255, 255, 0.5);
    transform: translateY(-1px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
}

.back-link::before {
    content: '← ';
    margin-right: 0.4rem;
}

/* Hotel icon decoration */
.header::after {
    content: '🏨';
    font-size: 2rem;
    position: absolute;
    top: 1rem;
    right: 2rem;
    opacity: 0.7;
}

@media (max-width: 640px) {
    body {
        padding: 1rem;
    }

    .header {
        padding: 2rem 1.5rem;
    }

    .header h1 {
        font-size: 1.6rem;
    }

    .form-section {
        padding: 1.5rem;
    }
    
    .header::after {
        top: 1rem;
        right: 1.5rem;
        font-size: 1.5rem;
    }
}

/* Additional glass effect */
.container {
    position: relative;
}

.container::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.8), transparent);
}
</style>
</head>
<body>

<%
String status = request.getParameter("status");
String errorMessage = (String) request.getAttribute("error");
if ("fail".equals(status) && errorMessage != null) {
%>
<script>
alert("Reservation failed: <%= errorMessage.replace("\"", "\\\"") %>");
if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.pathname);
}
</script>
<%
}
%>

<div class="container">
    <div class="header">
        <h1>Add New Reservation</h1>
        <p>Fill in the details below to create your booking</p>
    </div>

    <div class="form-section">
        <form action="AddReservationServlet" method="post">
            <div class="form-group">
                <label for="customerName">Customer Name:</label>
                <input type="text" id="customerName" name="customerName" required>
            </div>

            <div class="form-group">
                <label for="roomNumber">Room Number:</label>
                <input type="text" id="roomNumber" name="roomNumber" required>
            </div>

            <div class="form-group">
                <label for="checkIn">Check-In Date:</label>
                <input type="date" id="checkIn" name="checkIn" required>
            </div>

            <div class="form-group">
                <label for="checkOut">Check-Out Date:</label>
                <input type="date" id="checkOut" name="checkOut" required>
            </div>

            <div class="form-group">
                <label for="totalAmount">Total Amount:</label>
                <input type="number" id="totalAmount" name="totalAmount" step="0.01" required>
            </div>

            <button type="submit" class="submit-btn">Add Reservation</button>
        </form>

        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>
</div>

</body>
</html>