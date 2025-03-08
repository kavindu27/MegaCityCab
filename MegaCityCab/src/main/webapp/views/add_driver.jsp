<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Driver</title>
    <link rel="stylesheet" href="../css/add_driver.css">
</head>
<body>
    <h2>Add New Driver</h2>
	 <form action="/MegaCityCab/AddDriverServlet" method="POST">
	    <label for="driver_name">Driver Name:</label>
	    <input type="text" name="driver_name" required>
	
	    <label for="license_number">License Number:</label>
	    <input type="text" name="license_number" required>
	
	    <label for="phone">Phone:</label>
	    <input type="text" name="phone" required>
	
	    <label for="status">Status:</label>
	    <select name="status">
	        <option value="Available">Available</option>
	        <option value="Assigned">Assigned</option>
	        <option value="Inactive">Inactive</option>
	    </select>
	
	    <button type="submit">Add Driver</button>
	    
	    <button type="button" onclick="window.location.href='managerdashboard.jsp'">Back</button>
	</form>

    <% if(request.getParameter("error") != null) { %>
        <p style="color: red;"><%= request.getParameter("error") %></p>
    <% } %>
</body>
</html>
