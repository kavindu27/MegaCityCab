package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class CalculateFareServlet
 */
@WebServlet("/CalculateFareServlet")
public class CalculateFareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pickup = request.getParameter("pickup");
        String destination = request.getParameter("destination");

        double fare = calculateFare(pickup, destination);

        // Send the fare back as a JSON response
        response.setContentType("application/json");
        response.getWriter().write("{\"fare\": " + fare + "}");
    }

    // Dummy method to calculate fare based on pickup and destination
    private double calculateFare(String pickup, String destination) {
        // Here you can call a service that calculates the distance and then the fare
        // For now, just return a random fare for simplicity
        double distance = getDistance(pickup, destination);
        return distance * 120; // Rs 120 per km
    }

    private double getDistance(String pickup, String destination) {
        // Placeholder logic to return a distance value. You should replace this with actual logic.
        if ("Colombo".equals(pickup) && "Moratuwa".equals(destination)) {
            return 22.5; // Example distance in kilometers
        }
        return 10.0; // Default fallback
    }
}
