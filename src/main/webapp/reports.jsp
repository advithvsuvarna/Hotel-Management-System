<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Reports | ReserveEase</title>
  <style>
    * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background: #e1f5fe; /* very light blue */
  color: #0d47a1; /* deep blue */
  padding: 2rem 1rem;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.container {
  max-width: 800px;
  margin: auto;
  background: #1565c0; /* dark blue */
  border-radius: 18px;
  padding: 2rem;
  box-shadow: 0 12px 28px rgba(21, 101, 192, 0.3);
  animation: fadeInUp 0.5s ease-out;
  color: white;
}

.header {
  text-align: center;
  margin-bottom: 2rem;
}

.header h1 {
  font-size: 2.4rem;
  font-weight: bold;
  margin-bottom: 0.4rem;
  color: #e3f2fd; /* soft light blue */
}

.header p {
  font-size: 1.1rem;
  color: #bbdefb; /* light bluish text */
}

.report-options {
  display: grid;
  gap: 1.5rem;
}

.report-option {
  background: #e3f2fd; /* lighter blue card */
  border-radius: 12px;
  padding: 1.5rem;
  color: #0d47a1;
  box-shadow: 0 6px 18px rgba(13, 71, 161, 0.15);
  transition: transform 0.3s ease, box-shadow 0.3s ease, background 0.3s ease;
}

.report-option:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 28px rgba(13, 71, 161, 0.25);
  background: #bbdefb; /* hover with more color depth */
}

.report-option h3 {
  font-size: 1.3rem;
  margin-bottom: 0.5rem;
  font-weight: 600;
  color: #1565c0;
}

.report-option p {
  font-size: 0.95rem;
  color: #1a237e; /* dark blue text */
  margin-bottom: 1rem;
}

.report-option a {
  text-decoration: none;
  padding: 0.6rem 1.2rem;
  background: #1e88e5; /* vibrant blue */
  color: white;
  font-weight: 600;
  border-radius: 8px;
  transition: background-color 0.3s ease, transform 0.2s ease;
  display: inline-block;
}

.report-option a:hover {
  background: #0d47a1;
  transform: translateY(-2px);
}

.back-link {
  display: inline-block;
  margin-top: 2rem;
  color: #e3f2fd;
  background: rgba(255, 255, 255, 0.1);
  padding: 0.6rem 1.2rem;
  border-radius: 6px;
  text-decoration: none;
  font-weight: 500;
  transition: background 0.3s ease, transform 0.3s ease;
}

.back-link:hover {
  background: rgba(255, 255, 255, 0.25);
  transform: translateX(-3px);
}

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

@media (max-width: 768px) {
  .header h1 {
    font-size: 2rem;
  }
  .report-option h3 {
    font-size: 1.1rem;
  }
}

  </style>
</head>
<body>

  <div class="container">
    <div class="header">
      <h1>Reports Dashboard</h1>
      <p>Generate reports and gain hotel insights</p>
    </div>

    <div class="report-options">
      <div class="report-option">
        <h3>Reservations by Date Range</h3>
        <p>View all bookings between specific dates with guest details.</p>
        <a href="report_form.jsp?reportType=dateRange">Generate Report</a>
      </div>

      <div class="report-option">
        <h3>Total Revenue</h3>
        <p>Calculate revenue over a time period with financial breakdown.</p>
        <a href="report_form.jsp?reportType=revenue">Generate Report</a>
      </div>

      <div class="report-option">
        <h3>Most Popular Rooms</h3>
        <p>See the most frequently booked rooms and their occupancy trends.</p>
        <a href="report_form.jsp?reportType=popularRooms">Generate Report</a>
      </div>
    </div>

    <a href="index.jsp" class="back-link">← Back to Home</a>
  </div>

</body>
</html>
