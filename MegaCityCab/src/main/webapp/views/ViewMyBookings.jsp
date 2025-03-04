<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.BookingDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Booking" %>
<%@ page import="model.User" %>

<!DOCTYPE html>
<html>
<head>
    <title>View My Bookings</title>
    <link rel="stylesheet" href="../css/ViewMybookings.css"> 
</head>
<body>

    <h2>My Bookings</h2>

    <%
        // Get the logged-in user from the session
        User loggedInUser = (User) session.getAttribute("user");

        // Debugging: Print the session info
        System.out.println("Session ID: " + session.getId());
        if (loggedInUser != null) {
            System.out.println("User " + loggedInUser.getUsername());
        } else {
            System.out.println("No logged-in user found in session.");
        }

        // Check if the user is logged in
        if (loggedInUser == null) {
    %>
        <p>You must log in to view your bookings.</p>
    <%
        } else {
            // Retrieve all bookings for the logged-in user
            BookingDAO bookingDAO = new BookingDAO();
            List<Booking> bookings = bookingDAO.getBookingsByUserId(loggedInUser.getUserId());

            // Check if bookings list is empty
            if (bookings == null || bookings.isEmpty()) {
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
                            <td><%= loggedInUser.getUsername() %></td> <!-- Display logged-in user's username -->
                            <td><%= b.getPickupLocation() %></td>
                            <td><%= b.getDestination() %></td>
                            <td><%= b.getFare() %></td>
                            <td><%= b.getStatus() %></td>
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
