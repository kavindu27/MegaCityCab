<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../css/admin_dashboard.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Welcome Admin</h1>
            <p>Welcome to the Admin Dashboard</p>
        </header>

        <section class="dashboard-content">
            <!-- Admin-specific content -->
            <div class="section">
                <h3>Manage Users</h3>
                <p>Here you can manage user accounts.</p>
                <a href="manageUsers.jsp" class="button">Go to User Management</a>
            </div>

            <div class="section">
                <h3>View Bookings</h3>
                <p>Here you can view bookings.</p>
                <a href="viewbookings.jsp" class="button">Go to Bookings</a>
            </div>

            <!-- Manage Cars Section -->
            <div class="section">
                <h3>Manage Cars</h3>
                <p>Here you can add new cars and view existing ones.</p>
                <a href="manageCars.jsp" class="button">Manage Cars</a>
                <a href="view_cars.jsp" class="button">View Cars</a>

            </div>

            <!-- Manage Drivers Section -->
            <div class="section">
                <h3>Manage Drivers</h3>
                <p>Here you can add new drivers and view existing ones.</p>
                <a href="manageDrivers.jsp" class="button">Manage Drivers</a>
                <a href="view_drivers.jsp" class="button">View Drivers</a>
            </div>
            
        </section>
        <div class="logout">
                <a href="/MegaCityCab/LogoutServlet" class="button logout-btn">Logout</a>
            </div>
    </div>
</body>
</html>
