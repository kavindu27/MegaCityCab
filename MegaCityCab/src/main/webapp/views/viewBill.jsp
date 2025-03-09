<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Bill" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bill Details</title>
</head>
<body>
    <h2>Bill Details</h2>
    <%
        Bill bill = (Bill) request.getAttribute("bills");
        if (bill != null) {
    %>
        <p><strong>Bill ID:</strong> <%= bill.getBillId() %></p>
        <p><strong>Booking ID:</strong> <%= bill.getBookingId() %></p>
        <p><strong>Total Amount:</strong> $<%= bill.getTotalAmount() %></p>
        <p><strong>Bill Time:</strong> <%= bill.getBillTime() %></p>
    <%
        } else {
    %>
        <p>No bill found.</p>
    <%
        }
    %>
    <br>
    <a href="manageBills.jsp">Back to Bills Management</a>
</body>
</html>
