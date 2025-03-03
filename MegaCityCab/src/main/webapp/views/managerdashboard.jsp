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
                <h3>Manage Staff</h3>
                <p>Manage your staff's schedules and performance.</p>
                <a href="manageStaff.jsp" class="button">Go to Staff Management</a>
            </div>

            <!-- Logout Button -->
            <div class="logout">
                <a href="/MegaCityCab/LogoutServlet" class="button logout-btn">Logout</a>
            </div>
        </section>
    </div>
</body>
</html>
