package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Booking;
import dao.BookingDAO;

import java.io.IOException;

@WebServlet("/UpdateBookingServlet")
public class UpdateBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Use POST method for updating booking status
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingIdStr = request.getParameter("booking_id");
        String status = request.getParameter("status");

        // Validate input
        if (bookingIdStr == null || status == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Booking ID or Status is missing.");
            return;
        }

        try {
            int bookingId = Integer.parseInt(bookingIdStr);

            // Fetch booking from the database
            BookingDAO bookingDAO = new BookingDAO();
            Booking booking = bookingDAO.getBookingById(bookingId);

            if (booking != null) {
                // Update the booking status
                booking.setStatus(status);
                bookingDAO.updateBookingStatus(bookingId, status);

                // Set success message and forward
                request.setAttribute("message", "Booking status updated successfully.");
                request.setAttribute("booking", booking);
                request.getRequestDispatcher("/views/updateBooking.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Booking not found.");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Booking ID format.");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating the booking.");
        }
    }
}
