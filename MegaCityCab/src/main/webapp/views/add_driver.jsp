<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Driver</title>
    <link rel="stylesheet" href="../css/add_driver.css">
</head>
<body>
    <h2>Add New Driver</h2>
    <form action="/MegaCityCab/AddDriverServlet" method="post">
        <div>
            <label for="driverName">Driver Name:</label>
            <input type="text" id="driverName" name="driverName" required />
        </div>
        <div>
            <label for="licenseNumber">License Number:</label>
            <input type="text" id="licenseNumber" name="licenseNumber" required />
        </div>
        <div>
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" required />
        </div>
        <div>
            <button type="submit">Add Driver</button>
        </div>
        
         <div>
        <button type="button" onclick="window.location.href='managerdashboard.jsp'">Back</button>
        </div>
    </form>

    <% if(request.getParameter("error") != null) { %>
        <p style="color: red;"><%= request.getParameter("error") %></p>
    <% } %>
</body>
</html>
