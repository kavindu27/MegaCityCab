package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.BookingDAO;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String pickup = request.getParameter("pickup");
        String destination = request.getParameter("destination");
        String fareStr = request.getParameter("fare");
        
        // Check if the user is logged in (check the session for user_id)
        String customerIdStr = (String) request.getSession().getAttribute("user_id");
        if (customerIdStr == null) {
            // Redirect to login page if the user is not logged in
            response.sendRedirect("views/login.jsp?error=Please%20login%20first");
            return;
        }

        // Convert fare to decimal and customerId to int
        double fare = Double.parseDouble(fareStr);
        int customerId = Integer.parseInt(customerIdStr);

        // Call BookingDAO to book a ride
        BookingDAO bookingDAO = new BookingDAO();
        boolean isBooked = bookingDAO.bookRide(customerId, pickup, destination, fare);

        // Redirect based on success or failure
        if (isBooked) {
            response.sendRedirect("views/booking_confirmation.jsp?msg=Booking%20Successful");
        } else {
            response.sendRedirect("views/error.jsp?msg=Booking%20Failed");
        }
    }
}
