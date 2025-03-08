package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DBConnection;
import model.Car;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/UpdateCarServlet")
public class UpdateCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int carId = Integer.parseInt(request.getParameter("car_id"));

        // Fetch current car details
        String query = "SELECT * FROM cars WHERE car_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, carId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                Car car = new Car();
                car.setCarId(resultSet.getInt("car_id"));
                car.setCarModel(resultSet.getString("car_model"));
                car.setCarNumber(resultSet.getString("car_number"));
                car.setCarType(resultSet.getString("car_type"));
                car.setCapacity(resultSet.getInt("capacity"));
                car.setStatus(resultSet.getString("status"));

                // Set the car object as an attribute in the request
                request.setAttribute("car", car);
                request.getRequestDispatcher("/views/updateCar.jsp").forward(request, response);
            } else {
                response.sendRedirect("/views/manageCars.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }

    // Handles the POST request to update the car details
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int carId = Integer.parseInt(request.getParameter("car_id"));
        String carModel = request.getParameter("car_model");
        String carNumber = request.getParameter("car_number");
        String carType = request.getParameter("car_type");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String status = request.getParameter("status");

        String query = "UPDATE cars SET car_model = ?, car_number = ?, car_type = ?, capacity = ?, status = ? WHERE car_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, carModel);
            statement.setString(2, carNumber);
            statement.setString(3, carType);
            statement.setInt(4, capacity);
            statement.setString(5, status);
            statement.setInt(6, carId);

            statement.executeUpdate();
            response.sendRedirect("/MegaCityCab/views/manageCars.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        }
    }
}
