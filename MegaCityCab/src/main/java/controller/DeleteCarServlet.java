package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class DeleteCarServlet
 */
@WebServlet("/DeleteCarServlet")
public class DeleteCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Use doGet for the delete request
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the car_id from the request parameter
        String carIdStr = request.getParameter("car_id");

        // Ensure car_id is present in the request
        if (carIdStr == null || carIdStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Car ID is missing.");
            return;
        }

        try {
            int carId = Integer.parseInt(carIdStr);

            // Query to delete the car from the database
            String query = "DELETE FROM cars WHERE car_id = ?";

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement = connection.prepareStatement(query)) {

                statement.setInt(1, carId);

                // Execute the delete operation
                int rowsAffected = statement.executeUpdate();

                // If the car was deleted, redirect; otherwise, show an error
                if (rowsAffected > 0) {
                    // Successfully deleted the car, redirecting to manage cars page
                    response.sendRedirect("/MegaCityCab/views/manageCars.jsp");
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Car not found.");
                }
            } catch (SQLException e) {
                // Handle SQL errors (e.g., connection issues)
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
            }

        } catch (NumberFormatException e) {
            // Handle invalid car_id format
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Car ID format.");
        }
    }
}
