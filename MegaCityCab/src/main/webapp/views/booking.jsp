<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.LocationDAO" %>
<html>
<head>
    <title>Book a Ride</title>
    <link rel="stylesheet" href="styles.css">
    <script>
        function calculateFare() {
            var pickup = document.getElementById("pickup").value;
            var destination = document.getElementById("destination").value;

            if (pickup && destination) {
                // You can call a JavaScript function or AJAX to fetch the coordinates and calculate the distance
                // For simplicity, assume you are calculating distance with hardcoded coordinates for now
                var pickupCoordinates = getCoordinates(pickup);  // Get coordinates for pickup
                var destinationCoordinates = getCoordinates(destination);  // Get coordinates for destination

                var distance = calculateDistance(pickupCoordinates, destinationCoordinates);
                var fare = distance * 120; // Rs 120 per km
                document.getElementById("fare").value = fare.toFixed(2); // Update fare
            }
        }

        // Placeholder function for getting coordinates (you can replace this with an AJAX call to your backend)
        function getCoordinates(location) {
            // Example: Just using some static coordinates
            var coordinates = {
                "Colombo": [79.9741, 6.9271],
                "Moratuwa": [79.9871, 6.7611]
            };
            return coordinates[location] || [0, 0]; // Default to [0, 0] if not found
        }

        function calculateDistance(coords1, coords2) {
            var lon1 = coords1[0], lat1 = coords1[1];
            var lon2 = coords2[0], lat2 = coords2[1];

            var R = 6371; // Radius of the Earth in kilometers
            var dLat = toRad(lat2 - lat1);
            var dLon = toRad(lon2 - lon1);

            var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                    Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) *
                    Math.sin(dLon / 2) * Math.sin(dLon / 2);
            var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

            return R * c; // Distance in kilometers
        }

        function toRad(deg) {
            return deg * (Math.PI / 180);
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
