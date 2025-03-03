package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.DBConnection;
import model.Driver;

public class DriverDAO {

    // Method to add a new driver
    public boolean addDriver(Driver driver) {
        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO drivers (driver_name, license_number, phone) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, driver.getDriverName());
            stmt.setString(2, driver.getLicenseNumber());
            stmt.setString(3, driver.getPhone());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to get all drivers from the database
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM drivers";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Driver driver = new Driver();  // Using the default constructor
                driver.setDriverId(rs.getInt("driver_id"));
                driver.setDriverName(rs.getString("driver_name"));
                driver.setLicenseNumber(rs.getString("license_number"));
                driver.setPhone(rs.getString("phone"));
                driver.setStatus(rs.getString("status"));
                drivers.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return drivers;
    }
}
