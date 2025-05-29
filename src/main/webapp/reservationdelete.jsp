<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, com.dao.ReservationDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Delete Reservation | ReserveEase</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #e0f2ff; /* Light blue background */
    min-height: 100vh;
    padding: 2rem 1rem;
    color: #ffffff;
}

.container {
    max-width: 600px;
    margin: 0 auto;
    background: linear-gradient(135deg, #1e3a8a, #3b82f6); /* Dark blue gradient */
    border-radius: 16px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
    overflow: hidden;
    animation: fadeInUp 0.6s ease-out;
}

.header {
    padding: 2.5rem 2rem;
    text-align: center;
    position: relative;
}

.header h1 {
    font-size: 2rem;
    margin-bottom: 0.5rem;
    font-weight: 700;
    color: white;
}

.header p {
    opacity: 0.9;
    font-size: 1rem;
    color: #dbeafe;
}

.content {
    padding: 2rem;
}

.reservation-details {
    background: white;
    color: #1e293b;
    border-radius: 12px;
    padding: 2rem;
    margin-bottom: 2rem;
    box-shadow: 0 4px 16px rgba(0,0,0,0.1);
    animation: fadeInUp 0.6s ease-out 0.1s both;
}

.reservation-details h3 {
    margin-bottom: 1.5rem;
    font-size: 1.3rem;
    font-weight: 600;
    color: #1e3a8a;
}

.detail-row {
    display: flex;
    justify-content: space-between;
    padding: 0.75rem 0;
    border-bottom: 1px solid #e5e7eb;
}

.detail-row:last-child {
    border-bottom: none;
    font-weight: 600;
    color: #059669;
    font-size: 1.1rem;
}

.detail-label {
    font-weight: 600;
    color: #334155;
}

.detail-value {
    color: #475569;
}

.actions {
    display: flex;
    gap: 1rem;
    justify-content: center;
    margin-top: 2rem;
    animation: fadeInUp 0.6s ease-out 0.2s both;
}

.btn {
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: 8px;
    font-weight: 600;
    font-size: 1rem;
    cursor: pointer;
    transition: all 0.3s ease;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 140px;
}

.delete-btn {
    background: #dc2626;
    color: white;
}

.delete-btn:hover {
    background: #b91c1c;
    transform: translateY(-2px);
}

.cancel-btn {
    background: #6b7280;
    color: white;
}

.cancel-btn:hover {
    background: #4b5563;
    transform: translateY(-2px);
}

/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0; top: 0;
    width: 100%; height: 100%;
    background-color: rgba(0,0,0,0.5);
    backdrop-filter: blur(5px);
}

.modal-content {
    background: white;
    margin: 15% auto;
    padding: 2rem;
    border-radius: 12px;
    width: 90%;
    max-width: 400px;
    text-align: center;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
    color: #1e293b;
}

.modal-content h3 {
    color: #dc2626;
    margin-bottom: 1rem;
}

.modal-actions {
    display: flex;
    gap: 1rem;
    justify-content: center;
}

.modal-btn {
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: 6px;
    font-weight: 600;
    cursor: pointer;
}

.confirm-btn {
    background: #dc2626;
    color: white;
}

.confirm-btn:hover {
    background: #b91c1c;
}

.modal-cancel-btn {
    background: #6b7280;
    color: white;
}

.modal-cancel-btn:hover {
    background: #4b5563;
}

/* Animation */
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

/* Responsive */
@media (max-width: 768px) {
    .content, .header {
        padding: 1.5rem;
    }

    .actions {
        flex-direction: column;
        align-items: stretch;
    }

    .btn {
        width: 100%;
    }

    .detail-row {
        flex-direction: column;
        align-items: flex-start;
    }
}
</style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Delete Reservation</h1>
        <p>Review the details before confirming deletion</p>
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

        if (request.getAttribute("errorMessage") != null) { %>
            <div class="error"><%= request.getAttribute("errorMessage") %></div>
        <% } %>

        <div class="reservation-details">
            <h3>Reservation Details</h3>
            <div class="detail-row">
                <span class="detail-label">Reservation ID:</span>
                <span class="detail-value">#<%= reservation.getReservationId() %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Customer Name:</span>
                <span class="detail-value"><%= reservation.getCustomerName() %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Room Number:</span>
                <span class="detail-value"><%= reservation.getRoomNumber() %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Check-In Date:</span>
                <span class="detail-value"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(reservation.getCheckIn()) %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Check-Out Date:</span>
                <span class="detail-value"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(reservation.getCheckOut()) %></span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Total Amount:</span>
                <span class="detail-value">$<%= String.format("%.2f", reservation.getTotalAmount()) %></span>
            </div>
        </div>

        <div class="actions">
            <button type="button" class="btn delete-btn" onclick="showConfirmModal()">Delete Reservation</button>
            <a href="reservationdisplay" class="btn cancel-btn">Cancel</a>
        </div>
    </div>
</div>

<!-- Confirmation Modal -->
<div id="confirmModal" class="modal">
    <div class="modal-content">
        <h3>Confirm Deletion</h3>
        <p>Are you absolutely sure you want to delete this reservation?</p>
        <div class="modal-actions">
            <form action="DeleteReservationServlet" method="post" style="display: inline;">
                <input type="hidden" name="reservationId" value="<%= reservation.getReservationId() %>">
                <button type="submit" class="modal-btn confirm-btn">Yes, Delete</button>
            </form>
            <button type="button" class="modal-btn modal-cancel-btn" onclick="hideConfirmModal()">Cancel</button>
        </div>
    </div>
</div>

<script>
function showConfirmModal() {
    document.getElementById('confirmModal').style.display = 'block';
}

function hideConfirmModal() {
    document.getElementById('confirmModal').style.display = 'none';
}

window.onclick = function(event) {
    const modal = document.getElementById('confirmModal');
    if (event.target == modal) {
        hideConfirmModal();
    }
}

document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        hideConfirmModal();
    }
});
</script>

</body>
</html>
