package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Car;
import model.DBConnection;

public class CarDAO {
    public boolean addCar(Car car) {
        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO cars (car_model, car_number, car_type, capacity) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, car.getCarModel());
            stmt.setString(2, car.getCarNumber());
            stmt.setString(3, car.getCarType());
            stmt.setInt(4, car.getCapacity());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Car> getAllCars() {
        List<Car> cars = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM cars";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Car car = new Car();
                car.setCarId(rs.getInt("car_id"));
                car.setCarModel(rs.getString("car_model"));
                car.setCarNumber(rs.getString("car_number"));
                car.setCarType(rs.getString("car_type"));
                car.setCapacity(rs.getInt("capacity"));
                car.setStatus(rs.getString("status"));
                cars.add(car);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cars;
    }
}
