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
 * Servlet implementation class DeleteDriverServlet
 */
@WebServlet("/DeleteDriverServlet")
public class DeleteDriverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the driver_id from the request parameter
        String driverIdStr = request.getParameter("driver_id");

        // Ensure driver_id is present in the request
        if (driverIdStr == null || driverIdStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Driver ID is missing.");
            return;
        }

        try {
            int driverId = Integer.parseInt(driverIdStr);

            // Query to delete the driver from the database
            String query = "DELETE FROM drivers WHERE driver_id = ?";

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement = connection.prepareStatement(query)) {

                statement.setInt(1, driverId);

                // Execute the delete operation
                int rowsAffected = statement.executeUpdate();

                // If driver was deleted, redirect; otherwise, show an error
                if (rowsAffected > 0) {
                    // Successfully deleted the driver, redirecting to manage drivers page
                    response.sendRedirect("/MegaCityCab/views/manageDrivers.jsp");
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Driver not found.");
                }
            } catch (SQLException e) {
                // Handle SQL errors (e.g., connection issues)
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
            }

        } catch (NumberFormatException e) {
            // Handle invalid driver_id format
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Driver ID format.");
        }
    }
}

