<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete User Confirmation</title>
    <link rel="stylesheet" href="../css/DeleteUser.css">
    
</head>
<body>
    <h2>Are you sure you want to delete this user?</h2>

    <%
        // Get user details based on the ID from the URL parameter
        int userId = Integer.parseInt(request.getParameter("id"));
        String query = "SELECT * FROM users WHERE user_id = ?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, userId);
        ResultSet resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
    %>

    <form action="/MegaCityCab/DeleteUserServlet" method="GET">
        <input type="hidden" name="id" value="<%= userId %>">
        
        <p><strong>Username:</strong> <%= resultSet.getString("username") %></p>
        <p><strong>Email:</strong> <%= resultSet.getString("email") %></p>
        <p><strong>Phone:</strong> <%= resultSet.getString("phone") %></p>
        <p><strong>Role:</strong> <%= resultSet.getString("role") %></p>

        <button type="submit">Yes, Delete User</button>
        <a href="/admin">Cancel</a>
    </form>

    <% } else { %>
        <p>User not found!</p>
    <% } %>

</body>
</html>
