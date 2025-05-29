package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.sql.Date;

public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reportDAO;

    @Override
    public void init() {
        reportDAO = new ReservationDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String reportType = request.getParameter("reportType");

        try {
            if (reportType == null || reportType.trim().isEmpty()) {
                throw new IllegalArgumentException("Report type is missing.");
            }

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            sdf.setLenient(false);

            switch (reportType) {
                case "dateRange": {
                    String start = request.getParameter("startDate");
                    String end = request.getParameter("endDate");

                    if (start == null || end == null || start.isEmpty() || end.isEmpty()) {
                        throw new IllegalArgumentException("Start date or end date is missing.");
                    }

                    java.util.Date parsedStart = sdf.parse(start.trim());
                    java.util.Date parsedEnd = sdf.parse(end.trim());
                    Date startDate = new Date(parsedStart.getTime());
                    Date endDate = new Date(parsedEnd.getTime());

                    List<Reservation> reservations = reportDAO.getReservationsByDateRange(startDate, endDate);
                    request.setAttribute("reservations", reservations);
                    break;
                }

                case "revenue": {
                    String start = request.getParameter("startDate");
                    String end = request.getParameter("endDate");

                    if (start == null || end == null || start.isEmpty() || end.isEmpty()) {
                        throw new IllegalArgumentException("Start date or end date is missing.");
                    }

                    java.util.Date parsedStart = sdf.parse(start.trim());
                    java.util.Date parsedEnd = sdf.parse(end.trim());
                    Date startDate = new Date(parsedStart.getTime());
                    Date endDate = new Date(parsedEnd.getTime());

                    double totalRevenue = reportDAO.getTotalRevenue(startDate, endDate);
                    request.setAttribute("totalRevenue", totalRevenue);
                    break;
                }

                case "popularRooms": {
                    Map<String, Integer> roomMap = reportDAO.getMostPopularRooms();
                    List<String[]> popularRooms = new ArrayList<>();

                    for (Map.Entry<String, Integer> entry : roomMap.entrySet()) {
                        popularRooms.add(new String[]{entry.getKey(), String.valueOf(entry.getValue())});
                    }

                    request.setAttribute("popularRooms", popularRooms);
                    request.setAttribute("reportType", "popularRooms");
                  //  request.getRequestDispatcher("report_result.jsp").forward(request, response);
                    break;
                }


                default:
                    throw new IllegalArgumentException("Invalid report type.");
            }

            request.setAttribute("reportType", reportType);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            String errorMessage = "Error generating report: " + e.getMessage();
            response.sendRedirect("report_form.jsp?error=" + java.net.URLEncoder.encode(errorMessage, "UTF-8"));
        }
    }
}
