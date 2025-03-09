<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Driver</title>
    <link rel="stylesheet" href="../css/UpdateDriver.css">
    
    
</head>
<body>
    <h2>Update Driver</h2>

    <%
        // Retrieve driver_id from the query parameter
        int driverId = Integer.parseInt(request.getParameter("id"));

        // Query to fetch the driver details by driver_id
        String query = "SELECT * FROM drivers WHERE driver_id = ?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, driverId);
        ResultSet resultSet = statement.executeQuery();

        // If driver found, set attributes for form
        if (resultSet.next()) {
            String driverName = resultSet.getString("driver_name");
            String licenseNumber = resultSet.getString("license_number");
            String phone = resultSet.getString("phone");
            String status = resultSet.getString("status");
    %>

    <form action="/MegaCityCab/UpdateDriverServlet" method="POST">
        <input type="hidden" name="driver_id" value="<%= driverId %>">

        <label for="driver_name">Driver Name:</label>
        <input type="text" name="driver_name" value="<%= driverName %>" required>

        <label for="license_number">License Number:</label>
        <input type="text" name="license_number" value="<%= licenseNumber %>" required>

        <label for="phone">Phone:</label>
        <input type="text" name="phone" value="<%= phone %>" required>

        <label for="status">Status:</label>
        <select name="status">
            <option value="Available" <%= "Available".equals(status) ? "selected" : "" %>>Available</option>
            <option value="Assigned" <%= "Assigned".equals(status) ? "selected" : "" %>>Assigned</option>
            <option value="Inactive" <%= "Inactive".equals(status) ? "selected" : "" %>>Inactive</option>
        </select>

        <button type="submit">Update Driver</button>
    </form>

    <%
        } else {
            out.println("<p>Error: Driver not found.</p>");
        }
    %>
</body>
</html>
