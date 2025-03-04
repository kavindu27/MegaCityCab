<%@ page import="model.Bill" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
    <style type="text/css">
    /* General Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #292929; /* Dark background */
    color: #ffffff; /* White text */
    margin: 0;
    padding: 0;
    text-align: center;
}

/* Heading */
h2 {
    color: #ffffff;
    font-size: 36px;
    margin-top: 50px;
}

h3 {
    color: #2f7585; /* Teal color for subheading */
    font-size: 24px;
    margin-top: 30px;
}

/* Paragraphs */
p {
    color: #8d8d8d; /* Light grey color for text */
    font-size: 18px;
    margin-bottom: 15px;
}

/* Button Styling */
button {
    background-color: #20515d; /* Dark teal background */
    color: #ffffff;
    padding: 12px 20px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 20px;
}

button:hover {
    background-color: #2f7585; /* Lighter teal on hover */
}

/* Link styling */
a {
    text-decoration: none;
}

/* Container for content */
div.content {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    background-color: #20515d; /* Dark teal background for the content */
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
    
    
    </style>
</head>
<body>
    <h2>Booking Confirmation</h2>
    <p>Thank you for booking with MegaCity Cab.</p>

    <h3>Booking Details:</h3>
    <% 
        Bill bill = (Bill) request.getAttribute("bill");
        if (bill != null) {
    %>
        <p>Booking ID: <%= bill.getBookingId() %></p>
        <p>Total Amount: Rs <%= bill.getTotalAmount() %></p>
        <p>Bill Time: <%= bill.getBillTime() %></p>

        <!-- Button to download the bill as PDF -->
        <a href="generated_pdfs/bill_<%= bill.getBillId() %>.pdf" download>
            <button>Download Bill as PDF</button>
        </a>
    <% 
        } else {
    %>
        <p>Bill not found. Please try again later.</p>
    <% 
        }
    %>
</body>
</html>
