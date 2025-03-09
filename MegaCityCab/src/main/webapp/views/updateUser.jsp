<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
    <link rel="stylesheet" href="../css/UpdateUser.css">
    
</head>
<body>
    <h2>Update User</h2>
    
    <% 
        int userId = Integer.parseInt(request.getParameter("id"));
        String query = "SELECT * FROM users WHERE user_id = ?";
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, userId);
        ResultSet resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
    %>

    <form action="/MegaCityCab/UpdateUserServlet" method="POST">
        <input type="hidden" name="userId" value="<%= userId %>">
        
        <label for="username">Username:</label>
        <input type="text" name="username" value="<%= resultSet.getString("username") %>" required>
        
        <label for="email">Email:</label>
        <input type="email" name="email" value="<%= resultSet.getString("email") %>" required>
        
        <label for="phone">Phone:</label>
        <input type="text" name="phone" value="<%= resultSet.getString("phone") %>" required>
        
        <label for="role">Role:</label>
        <select name="role">
            <option value="user" <% if (resultSet.getString("role").equals("user")) { %>selected<% } %>>User</option>
            <option value="admin" <% if (resultSet.getString("role").equals("admin")) { %>selected<% } %>>Admin</option>
        </select>
        
        <button type="submit">Update User</button>
    </form>

    <% } %>
</body>
</html>
