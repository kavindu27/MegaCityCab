<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.LocationDAO" %>
<html>
<head>
    <title>Book a Ride</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function calculateFare() {
            var pickup = document.getElementById("pickup").value;
            var destination = document.getElementById("destination").value;

            if (pickup && destination) {
                // Call the backend to calculate the fare based on the pickup and destination locations
                $.ajax({
                    url: '/MegaCityCab/CalculateFareServlet',
                    method: 'GET',
                    data: { pickup: pickup, destination: destination },
                    success: function(response) {
                        // On success, update the fare field
                        document.getElementById("fare").value = response.fare.toFixed(2);
                    },
                    error: function() {
                        alert('Error calculating fare');
                    }
                });
            }
        }
    </script>
</head>
<body>
    <h2>Book a Ride</h2>
    <form action="/MegaCityCab/BookingServlet" method="post">
        <label for="pickup">Pickup Location:</label>
        <select id="pickup" name="pickup" onchange="calculateFare()" required>
            <%
                LocationDAO locationDAO = new LocationDAO();
                List<String> locations = locationDAO.getLocationNames();
                for (String location : locations) {
            %>
            <option value="<%= location %>"><%= location %></option>
            <% } %>
        </select>

        <label for="destination">Destination:</label>
        <select id="destination" name="destination" onchange="calculateFare()" required>
            <%
                for (String location : locations) {
            %>
            <option value="<%= location %>"><%= location %></option>
            <% } %>
        </select>

        <label for="fare">Estimated Fare (Rs):</label>
        <input type="text" id="fare" name="fare" readonly>

        <button type="submit">Book Now</button>
    </form>
</body>
</html>
