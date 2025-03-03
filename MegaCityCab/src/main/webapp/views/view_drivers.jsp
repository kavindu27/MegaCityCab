<%@ page import="java.util.List, model.Driver, dao.DriverDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Driver Management</title>
   <link rel="stylesheet" href="../css/view_drivers.css">
</head>
<body>
    <!-- Back Button Container -->
    <div class="back-button-container">
        <button type="button" onclick="window.location.href='managerdashboard.jsp'">Back</button>
    </div>

    <h2>Driver List</h2>

    <% if(request.getParameter("message") != null) { %>
        <p style="color: green;"><%= request.getParameter("message") %></p>
    <% } %>

    <table border="1">
        <tr>
            <th>Driver Name</th>
            <th>License Number</th>
            <th>Phone Number</th>
            <th>Status</th>
        </tr>
        <%
            DriverDAO driverDAO = new DriverDAO();
            List<Driver> drivers = driverDAO.getAllDrivers();
            for (Driver driver : drivers) {
        %>
        <tr>
            <td><%= driver.getDriverName() %></td>
            <td><%= driver.getLicenseNumber() %></td>
            <td><%= driver.getPhone() %></td>
            <td><%= driver.getStatus() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
