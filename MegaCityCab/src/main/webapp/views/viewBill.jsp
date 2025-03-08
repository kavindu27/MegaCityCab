<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Bill</title>
</head>
<body>
    <h2>View Bill Details</h2>

    <%
        // Retrieve the bill_id parameter from the request URL
        String billIdParam = request.getParameter("bill_id");

        if (billIdParam == null || billIdParam.isEmpty()) {
            out.println("<p>Error: Bill ID is missing or invalid!</p>");
        } else {
            try {
                // Parse the bill_id parameter if it's valid
                int billId = Integer.parseInt(billIdParam);

                // SQL query to fetch the bill details based on the bill_id
                String query = "SELECT b.bill_id, b.booking_id, b.total_amount, b.bill_time, bo.pickup_location, bo.destination " +
                               "FROM bills b JOIN bookings bo ON b.booking_id = bo.booking_id WHERE b.bill_id = ?";
                
                // Establish a connection to the database
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setInt(1, billId);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
    %>

    <table border="1">
        <tr>
            <th>Bill ID</th>
            <td><%= resultSet.getInt("bill_id") %></td>
        </tr>
        <tr>
            <th>Booking ID</th>
            <td><%= resultSet.getInt("booking_id") %></td>
        </tr>
        <tr>
            <th>Total Amount</th>
            <td><%= resultSet.getDouble("total_amount") %></td>
        </tr>
        <tr>
            <th>Bill Time</th>
            <td><%= resultSet.getTimestamp("bill_time") %></td>
        </tr>
        <tr>
            <th>Pickup Location</th>
            <td><%= resultSet.getString("pickup_location") %></td>
        </tr>
        <tr>
            <th>Destination</th>
            <td><%= resultSet.getString("destination") %></td>
        </tr>
    </table>

    <% 
                } else {
                    out.println("<p>No bill found with the provided ID.</p>");
                }

                // Close the database resources
                resultSet.close();
                statement.close();
                connection.close();

            } catch (NumberFormatException e) {
                out.println("<p>Error: Invalid Bill ID format. It should be a number.</p>");
            }
        }
    %>

    <br>
    <a href="adminDashboard.jsp">Back to Dashboard</a>
</body>
</html>
