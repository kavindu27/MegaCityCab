<%@ page import="java.util.List, model.Car, dao.CarDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Car Management</title>
    <link rel="stylesheet" href="../css/view_cars.css">
</head>
<body>
    <!-- Back Button Positioned at the Top Right -->
    <div class="back-button-container">
        <button class="back-button" type="button" onclick="window.location.href='managerdashboard.jsp'">Back</button>
    </div>

    <h2>Car List</h2>
    <table border="1">
        <tr>
            <th>Car Model</th>
            <th>Car Number</th>
            <th>Car Type</th>
            <th>Capacity</th>
            <th>Status</th>
        </tr>
        <%
            CarDAO carDAO = new CarDAO();
            List<Car> cars = carDAO.getAllCars();
            for (Car car : cars) {
        %>
        <tr>
            <td><%= car.getCarModel() %></td>
            <td><%= car.getCarNumber() %></td>
            <td><%= car.getCarType() %></td>
            <td><%= car.getCapacity() %></td>
            <td><%= car.getStatus() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
