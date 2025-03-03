package model;

public class Driver {
    private int driverId;
    private String driverName;
    private String licenseNumber;
    private String phone;
    private String status;

    // Default constructor
    public Driver() {
    }

    // Parameterized constructor
    public Driver(String driverName, String licenseNumber, String phone) {
        this.driverName = driverName;
        this.licenseNumber = licenseNumber;
        this.phone = phone;
        this.status = "Available"; // Default status
    }

    public int getDriverId() { return driverId; }
    public void setDriverId(int driverId) { this.driverId = driverId; }

    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }

    public String getLicenseNumber() { return licenseNumber; }
    public void setLicenseNumber(String licenseNumber) { this.licenseNumber = licenseNumber; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
