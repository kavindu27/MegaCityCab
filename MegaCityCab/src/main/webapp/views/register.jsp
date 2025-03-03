<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" href="../css/register.css">
</head>
<body>
    <h2>User Registration</h2>

    <form action="/MegaCityCab/RegisterServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" required><br><br>

        <label for="password">Password:</label>
        <input type="password" name="password" required><br><br>

        <label for="email">Email:</label>
        <input type="email" name="email" required><br><br>

        <label for="phone">Phone:</label>
        <input type="text" name="phone" required><br><br>

        <label for="name">Full Name:</label>
        <input type="text" name="name" required><br><br>

        <label for="address">Address:</label>
        <textarea name="address" required></textarea><br><br>

        <label for="nic">NIC Number:</label>
        <input type="text" name="nic" required><br><br>

        <button type="submit">Register</button>
    </form>

    <p>Already have an account? <a href="login.jsp">Login here</a></p>
</body>
</html>
