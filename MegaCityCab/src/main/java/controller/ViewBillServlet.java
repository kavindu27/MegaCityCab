package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DBConnection;
import model.Bill;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/ViewBillServlet")
public class ViewBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String billIdParam = request.getParameter("bill_id");

        if (billIdParam == null || billIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Bill ID is missing or invalid.");
            return;
        }

        try {
            int billId = Integer.parseInt(billIdParam);
            System.out.println("Received bill_id: " + billId);  // Debugging

            String query = "SELECT bill_id, booking_id, total_amount, bill_time FROM bills WHERE bill_id = ?";
            System.out.println("Executing SQL Query: " + query);  // Debugging

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement = connection.prepareStatement(query)) {
                
                statement.setInt(1, billId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    
                    if (resultSet.next()) {
                        Bill bill = new Bill(
                            resultSet.getInt("bill_id"),
                            resultSet.getInt("booking_id"),
                            resultSet.getDouble("total_amount"),
                            resultSet.getTimestamp("bill_time")
                        );

                        System.out.println("Bill found: " + bill.getBillId());  // Debugging

                        request.setAttribute("bill", bill);
                        request.getRequestDispatcher("/views/viewBill.jsp").forward(request, response);
                    } else {
                        System.out.println("No bill found with ID: " + billId);  // Debugging
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Bill not found.");
                    }
                }
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid Bill ID format: " + billIdParam);  // Debugging
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Bill ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        }
    }
}
