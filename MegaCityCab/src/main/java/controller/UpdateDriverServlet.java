package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DBConnection;
import model.Driver;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/UpdateDriverServlet")
public class UpdateDriverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int driverId = Integer.parseInt(request.getParameter("driver_id"));

        // Query to fetch driver details
        String query = "SELECT * FROM drivers WHERE driver_id = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, driverId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                Driver driver = new Driver();
                driver.setDriverId(resultSet.getInt("driver_id"));
                driver.setDriverName(resultSet.getString("driver_name"));
                driver.setLicenseNumber(resultSet.getString("license_number"));
                driver.setPhone(resultSet.getString("phone"));
                driver.setStatus(resultSet.getString("status"));

                // Set the driver object as an attribute in the request
                request.setAttribute("driver", driver);

                // Forward to updateDriver.jsp
                request.getRequestDispatcher("/views/updateDriver.jsp").forward(request, response);
            } else {
                // Redirect if the driver is not found
                response.sendRedirect("/views/updateDriver.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }

    // Handles the POST request to update the driver in the database
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int driverId = Integer.parseInt(request.getParameter("driver_id"));
        String driverName = request.getParameter("driver_name");
        String licenseNumber = request.getParameter("license_number");
        String phone = request.getParameter("phone");
        String status = request.getParameter("status");

        // SQL query to update the driver details
        String query = "UPDATE drivers SET driver_name = ?, license_number = ?, phone = ?, status = ? WHERE driver_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, driverName);
            statement.setString(2, licenseNumber);
            statement.setString(3, phone);
            statement.setString(4, status);
            statement.setInt(5, driverId);

            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                // If update is successful, redirect to the driver list page
                response.sendRedirect("/MegaCityCab/views/manageDrivers.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update driver details.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        }
    }
}
