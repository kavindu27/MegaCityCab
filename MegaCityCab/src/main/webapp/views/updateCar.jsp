<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Car" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Car</title>
    <link rel="stylesheet" href="../css/UpdateCar.css">
    <style type="text/css">
    /* Reset default styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #292929; /* Dark background */
    color: #ffffff; /* White text */
    margin: 20px;
}

h2 {
    color: #ffffff;
    font-size: 2rem;
    margin-bottom: 20px;
}

form {
    background-color: #2f7585; /* Deep teal for the form */
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 30px;
}

label {
    color: #ffffff;
    font-size: 1rem;
    margin-right: 10px;
    display: block;
    margin-bottom: 5px;
}

input[type="text"], input[type="number"], select {
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #8d8d8d; /* Light gray border */
    background-color: #ffffff;
    color: #292929;
    font-size: 1rem;
    margin-bottom: 15px;
}

button {
    background-color: #20515d; /* Dark greenish blue */
    color: #ffffff;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1rem;
}

button:hover {
    background-color: #2f7585; /* Lighter teal on hover */
}

form div {
    margin-bottom: 20px;
}

select {
    background-color: #ffffff;
    color: #292929;
    padding: 10px;
}

button {
    font-size: 1rem;
    cursor: pointer;
}
    
    </style>
</head>
<body>
    <h2>Update Car</h2>
    <form action="/MegaCityCab/UpdateCarServlet" method="POST">
        <input type="hidden" name="car_id" value="<%= ((Car) request.getAttribute("car")).getCarId() %>">
        
        <label for="car_model">Car Model:</label>
        <input type="text" name="car_model" value="<%= ((Car) request.getAttribute("car")).getCarModel() %>" required><br>
        
        <label for="car_number">Car Number:</label>
        <input type="text" name="car_number" value="<%= ((Car) request.getAttribute("car")).getCarNumber() %>" required><br>
        
        <label for="car_type">Car Type:</label>
        <input type="text" name="car_type" value="<%= ((Car) request.getAttribute("car")).getCarType() %>" required><br>
        
        <label for="capacity">Capacity:</label>
        <input type="number" name="capacity" value="<%= ((Car) request.getAttribute("car")).getCapacity() %>" required><br>
        
        <label for="status">Status:</label>
        <select name="status">
            <option value="Available" <% if ("Available".equals(((Car) request.getAttribute("car")).getStatus())) out.print("selected"); %>>Available</option>
            <option value="In Use" <% if ("In Use".equals(((Car) request.getAttribute("car")).getStatus())) out.print("selected"); %>>In Use</option>
            <option value="Under Maintenance" <% if ("Under Maintenance".equals(((Car) request.getAttribute("car")).getStatus())) out.print("selected"); %>>Under Maintenance</option>
        </select><br>
        
        <button type="submit">Update Car</button>
    </form>
</body>
</html>
