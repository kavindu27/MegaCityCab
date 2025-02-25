<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book a Ride</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>Book a Ride</h2>
    <form action="/MegaCityCab/BookingServlet" method="post">
        <label for="pickup">Pickup Location:</label>
        <input type="text" id="pickup" name="pickup" required>

        <label for="destination">Destination:</label>
        <input type="text" id="destination" name="destination" required>

        <label for="fare">Estimated Fare:</label>
        <input type="text" id="fare" name="fare" required>

        <button type="submit">Book Now</button>
    </form>
</body>
</html>

