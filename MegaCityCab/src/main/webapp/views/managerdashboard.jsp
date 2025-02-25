<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manager Dashboard</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <h1>Welcome Manager</h1>
    <p>Welcome to the Manager Dashboard</p>
    
    <!-- Manager-specific content -->
    <div>
        <h3>View Bookings</h3>
        <p>Here you can view and manage bookings.</p>
        <a href="viewBookings.jsp">Go to Bookings</a>
    </div>

    <div>
        <h3>Manage Staff</h3>
        <p>Manage your staff's schedules and performance.</p>
        <a href="manageStaff.jsp">Go to Staff Management</a>
    </div>

    <div>
        <a href="/MegaCityCab/LogoutServlet">Logout</a>
    </div>
</body>
</html>