<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Driver</title>
    <link rel="stylesheet" href="../css/DeleteDriver.css">
    
</head>
<body>
    <h2>Delete Driver</h2>

    <%
        // Retrieve driver_id from the query parameter
        int driverId = Integer.parseInt(request.getParameter("id"));

        // Query to fetch the driver details by driver_id
        String query = "SELECT * FROM drivers WHERE driver_id = ?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, driverId);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            String driverName = resultSet.getString("driver_name");
    %>

    <p>Are you sure you want to delete the driver <strong><%= driverName %></strong>?</p>
    <form action="/MegaCityCab/DeleteDriverServlet" method="POST">
        <input type="hidden" name="driver_id" value="<%= driverId %>">
        <button type="submit">Yes, Delete</button>
    </form>
    <a href="/MegaCityCab/views/manageDrivers.jsp">Cancel</a>

    <%
        } else {
            out.println("<p>Error: Driver not found.</p>");
        }
    %>
</body>
</html>
