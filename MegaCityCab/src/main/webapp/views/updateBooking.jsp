<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dao.BookingDAO" %>
<%@ page import="model.Booking" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Booking</title>
</head>
<body>
    <h2>Update Booking</h2>

    <%
        String bookingIdStr = request.getParameter("bookingId");

        if (bookingIdStr != null && !bookingIdStr.isEmpty()) {
            try {
                int bookingId = Integer.parseInt(bookingIdStr);

                // Fetch booking from the database
                BookingDAO bookingDAO = new BookingDAO();
                Booking booking = bookingDAO.getBookingById(bookingId);

                if (booking != null) {
    %>
                    <form action="/MegaCityCab/UpdateBookingServlet" method="POST">
                        <input type="hidden" name="booking_id" value="<%= booking.getBookingId() %>">
                        
                        <div>
                            <label for="customer_name">Customer Name:</label>
                            <input type="text" name="customer_name" value="<%= booking.getCustomerName() %>" required />
                        </div>
                        <div>
                            <label for="pickup_location">Pickup Location:</label>
                            <input type="text" name="pickup_location" value="<%= booking.getPickupLocation() %>" required />
                        </div>
                        <div>
                            <label for="destination">Destination:</label>
                            <input type="text" name="destination" value="<%= booking.getDestination() %>" required />
                        </div>
                        <div>
                            <label for="status">Status:</label>
                            <select name="status">
                                <option value="Pending" <% if ("Pending".equals(booking.getStatus())) { %>selected<% } %>>Pending</option>
                                <option value="Completed" <% if ("Completed".equals(booking.getStatus())) { %>selected<% } %>>Completed</option>
                                <option value="Cancelled" <% if ("Cancelled".equals(booking.getStatus())) { %>selected<% } %>>Cancelled</option>
                            </select>
                        </div>
                        <div>
                            <button type="submit">Update Booking</button>
                        </div>
                    </form>
    <%
                } else {
                    out.println("<p style='color:red;'>Booking not found.</p>");
                }
            } catch (NumberFormatException e) {
                out.println("<p style='color:red;'>Invalid booking ID format.</p>");
            }
        } else {
            out.println("<p style='color:red;'>Booking ID is missing.</p>");
        }
    %>

</body>
</html>
