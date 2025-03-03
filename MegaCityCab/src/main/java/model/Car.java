package model;

public class Car {
    private int carId;
    private String carModel;
    private String carNumber;
    private String carType;
    private int capacity;
    private String status;

    public Car() {}

    public Car(String carModel, String carNumber, String carType, int capacity) {
        this.carModel = carModel;
        this.carNumber = carNumber;
        this.carType = carType;
        this.capacity = capacity;
    }

    public int getCarId() { return carId; }
    public void setCarId(int carId) { this.carId = carId; }

    public String getCarModel() { return carModel; }
    public void setCarModel(String carModel) { this.carModel = carModel; }

    public String getCarNumber() { return carNumber; }
    public void setCarNumber(String carNumber) { this.carNumber = carNumber; }

    public String getCarType() { return carType; }
    public void setCarType(String carType) { this.carType = carType; }

    public int getCapacity() { return capacity; }
    public void setCapacity(int capacity) { this.capacity = capacity; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
