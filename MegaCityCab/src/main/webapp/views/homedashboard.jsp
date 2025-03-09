<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="../css/UserDashboard.css">
</head>
<body>
    <%
        // Retrieve the user object from the existing session (No need to declare session again)
        User user = (User) request.getSession(false).getAttribute("user"); // Get the user object from the session
        
        // If the user is not logged in, redirect to the login page
        if (user == null) {
            response.sendRedirect("views/login.jsp?error=Please%20login%20first");
            return;
        }
    %>

    <div class="container">
        <!-- Header Section -->
        <header>
            <h1>Welcome, <%= user.getUsername() %>!</h1> <!-- Display the logged-in user's username -->
            <p>Welcome to your dashboard</p>
        </header>

        <!-- Dashboard Content Section -->
        <section class="dashboard-content">
            <!-- Book a Ride Section -->
            <div class="section">
                <h3>Book a Ride</h3>
                <p>Book your ride from here.</p>
                <a href="booking.jsp" class="button">Go to Booking</a>
            </div>

            <!-- View Past Bookings Section -->
            <div class="section">
                <h3>Your Past Bookings</h3>
                <p>View your previous ride bookings.</p>
			    <a href="ViewMyBookings.jsp" class="button">Go to Your Bookings</a>

            </div>
        </section>
        
            <!-- Logout Button -->
            <div class="logout">
                <a href="/MegaCityCab/LogoutServlet" class="button logout-btn">Logout</a>
            </div>
    </div>
</body>
</html>
