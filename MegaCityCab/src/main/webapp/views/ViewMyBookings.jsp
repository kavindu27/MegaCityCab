<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.BookingDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Booking" %>
<%@ page import="model.User" %> <!-- Import User model if needed -->

<html>
<head>
    <title>View My Bookings</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>My Bookings</h2>

    <%
        // Get the logged-in user from the session (session is available implicitly)
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        // Check if the user is logged in
        if (loggedInUser == null) {
    %>
        <p>You must log in to view your bookings.</p>
    <%
        } else {
            // Retrieve all bookings for the logged-in user
            BookingDAO bookingDAO = new BookingDAO();
            List<Booking> bookings = bookingDAO.getBookingsByUserId(loggedInUser.getUserId());

            // Check if there are no bookings
            if (bookings.isEmpty()) {
    %>
                <p>No bookings found.</p>
            <%
            } else {
            %>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Customer Name</th>
                            <th>Pickup Location</th>
                            <th>Destination</th>
                            <th>Fare</th>
                            <th>Status</th>
                            <th>Booking Time</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            // Loop through the bookings and display each one
                            for (Booking b : bookings) { 
                        %>
                        <tr>
                            <td><%= b.getBookingId() %></td>
                            <td><%= loggedInUser.getUsername() %></td>  <!-- Assuming loggedInUser object has username -->
                            <td><%= b.getPickupLocation() %></td>
                            <td><%= b.getDestination() %></td>
                            <td><%= b.getFare() %></td>
                            <td><%= b.getStatus() %></td>
                            <td><%= b.getBookingTime() %></td>
                            <td>
                                <% if ("Pending".equals(b.getStatus())) { %>
                                    <a href="UpdateBookingServlet?bookingId=<%= b.getBookingId() %>&status=Completed">Mark as Completed</a> |
                                    <a href="CancelBookingServlet?bookingId=<%= b.getBookingId() %>">Cancel</a>
                                <% } else { %>
                                    No Actions
                                <% } %>
                            </td>
                        </tr>
                        <% 
                            } 
                        %>
                    </tbody>
                </table>
            <% 
            }
        }
    %>
</body>
</html>
