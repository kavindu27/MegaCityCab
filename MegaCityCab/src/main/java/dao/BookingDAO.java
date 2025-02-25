package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.DBConnection;
import model.Booking; // Assuming you have a Booking class to hold booking data

public class BookingDAO {

    public boolean bookRide(int customerId, String pickup, String destination, double fare) {
        Connection conn = null;
        CallableStatement stmt = null;

        try {
            conn = DBConnection.getConnection();

            // Call the stored procedure to book a ride
            String sql = "{CALL BookRide(?, ?, ?, ?)}";
            stmt = conn.prepareCall(sql);
            stmt.setInt(1, customerId);
            stmt.setString(2, pickup);
            stmt.setString(3, destination);
            stmt.setDouble(4, fare);

            // Execute the stored procedure
            stmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method to create a booking
    public boolean createBooking(int customerId, String pickup, String destination, double fare) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO bookings (customer_name, pickup_location, destination, fare, status) "
                       + "VALUES ((SELECT customer_name FROM customers WHERE customer_id = ?), ?, ?, ?, 'Pending')";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, customerId);
            stmt.setString(2, pickup);
            stmt.setString(3, destination);
            stmt.setDouble(4, fare);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; // Return true if the booking was successfully created
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;  // Return false if the creation failed
    }

    // Method to cancel a booking
    public boolean cancelBooking(int bookingId) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE bookings SET status = 'Cancelled' WHERE booking_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, bookingId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;  // Return true if the update was successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;  // Return false if the cancellation failed
    }

    // Method to update booking status
    public boolean updateBookingStatus(int bookingId, String status) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE bookings SET status = ? WHERE booking_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, status);
            stmt.setInt(2, bookingId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;  // Return true if the update was successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;  // Return false if the update failed
    }

    // Method to get all bookings
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM bookings";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            // Iterate through the result set and create Booking objects
            while (rs.next()) {
            	Booking booking = new Booking(
            		    rs.getInt("booking_id"),
            		    rs.getString("customer_name"),
            		    rs.getString("pickup_location"),
            		    rs.getString("destination"),
            		    rs.getDouble("fare"),
            		    rs.getString("status"),
            		    rs.getTimestamp("booking_time")
            		);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;  // Return the list of bookings
    }
}
