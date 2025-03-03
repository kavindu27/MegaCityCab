<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                <h3>System Settings</h3>
                <p>Manage system settings and configurations.</p>
                <a href="systemSettings.jsp" class="button">Go to System Settings</a>
            </div>

            <div class="logout">
                <a href="/MegaCityCab/LogoutServlet" class="button logout-btn">Logout</a>
            </div>
        </section>
    </div>
</body>
</html>
