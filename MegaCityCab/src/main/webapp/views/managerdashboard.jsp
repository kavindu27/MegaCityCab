<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manager Dashboard</title>
    <link rel="stylesheet" href="../css/ManagerDashboard.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Welcome Manager</h1>
            <p>Welcome to the Manager Dashboard</p>
        </header>

        <section class="dashboard-content">
            <!-- Manager-specific content -->
            <div class="section">
                <h3>View Bookings</h3>
                <p>Here you can view and manage bookings.</p>
                <a href="viewbookings.jsp" class="button">Go to Bookings</a>
            </div>

            <div class="section">
                <h3>Manage Cars</h3>
                <p>Here you can add new cars and view existing ones.</p>
                <a href="add_car.jsp" class="button">Add New Car</a>
                <a href="view_cars.jsp" class="button">View Cars</a>
            </div>

            <div class="section">
                <h3>Manage Drivers</h3>
                <p>Here you can add new drivers and view existing ones.</p>
                <a href="add_driver.jsp" class="button">Add New Driver</a>
                <a href="view_drivers.jsp" class="button">View Drivers</a>
            </div>

        </section>
                    <!-- Logout Button -->
            <div class="logout">
                <a href="/MegaCityCab/LogoutServlet" class="button logout-btn">Logout</a>
            </div>
    </div>
</body>
</html>
