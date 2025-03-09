<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Book Your Ride</title>
    <link rel="stylesheet" href="../css/HomePage.css">
</head>
<body>

    <!-- Header Section -->
    <header>
        <div class="container">
            <h1>Mega City Cab</h1>
            <p>Your Reliable Ride, Anytime, Anywhere</p>
            <a href="login.jsp" class="btn">For Login</a>
        </div>
    </header>

    <section id="system-instructions">
        <div class="container">
            <h2> How to Use Mega City Cab - Step by Step Guide</h2>

            <!-- Step 1: User Registration -->
            <div class="step">
                <h3>User Registration (For New Users)</h3>
                <p><strong>Step 1:</strong> Click on the <strong>"Register"</strong> button on the login page.</p>
                <p><strong>Step 2:</strong> Enter the required details:</p>
                <ul>
                    <li>Username (must be unique)</li>
                    <li>Password (choose a strong password)</li>
                    <li>Email (must be a valid email address)</li>
                    <li>Phone Number (enter a valid mobile number)</li>
                    <li>Full Name</li>
                    <li>Address</li>
                    <li>NIC Number (National Identity Card Number)</li>
                </ul>
                <p><strong>Step 3:</strong> Click the <strong>"Register"</strong> button to submit.</p>
                <p><strong>Step 4:</strong> If successful, a confirmation message appears.</p>
                <p><strong>Step 5:</strong> You will be redirected to the login page.</p>
            </div>

            <!-- Step 2: Logging In -->
            <div class="step">
                <h3>Logging In to the System</h3>
                <p><strong>Step 1:</strong> Enter your <strong>Username</strong> and <strong>Password</strong>.</p>
                <p><strong>Step 2:</strong> Click the <strong>"Login"</strong> button.</p>
                <p><strong>Step 3:</strong> If successful, you will be redirected to the <strong>User Dashboard</strong>.</p>
                <p><strong>Step 4:</strong> If incorrect, an error message will be displayed.</p>
            </div>

            <!-- Step 3: Booking a Ride -->
            <div class="step">
                <h3> Booking a Ride</h3>
                <p><strong>Step 1:</strong> Click on <strong>"Book a Ride"</strong> in the Navigation Bar.</p>
                <p><strong>Step 2:</strong> Select your <strong>Pickup Location</strong> and <strong>Destination</strong>.</p>
                <p><strong>Step 3:</strong> The system calculates and displays the <strong>fare</strong> for your trip.</p>
                <p><strong>Step 4:</strong> Click <strong>"Book Now"</strong> to confirm your ride.</p>
                <p><strong>Step 5:</strong> A confirmation message appears for successful booking.</p>
            </div>

            <!-- Step 4: Viewing Bookings -->
            <div class="step">
                <h3> Viewing Your Bookings</h3>
                <p><strong>Step 1:</strong> Click on <strong>"My Bookings"</strong> in the Navigation Bar.</p>
                <p><strong>Step 2:</strong> A list of past and current bookings will be displayed.</p>
                <p><strong>Step 3:</strong> You can check booking details:</p>
                <ul>
                    <li>Pickup Location</li>
                    <li>Destination</li>
                    <li>Fare</li>
                    <li>Booking Status (Confirmed, Completed, Canceled)</li>
                </ul>
            </div>

            <!-- Step 5: Logging Out -->
            <div class="step">
                <h3> Logging Out</h3>
                <p><strong>Step 1:</strong> Click on <strong>"Logout"</strong> in the Navigation Bar.</p>
                <p><strong>Step 2:</strong> You will be safely logged out of your account.</p>
                <p><strong>Step 3:</strong> You will be redirected back to the <strong>Login Page</strong>.</p>
            </div>
        </div>
    </section>


    <!-- Services Section -->
    <section id="services">
        <div class="container">
            <h2>Our Services</h2>
            <div class="service-box">
                <h3>City Rides</h3>
                <p>Quick and affordable city rides at your convenience.</p>
            </div>
            <div class="service-box">
                <h3>Airport Transfers</h3>
                <p>Reliable rides to and from the airport, on time.</p>
            </div>
            <div class="service-box">
                <h3>Luxury Rides</h3>
                <p>Experience comfort with our premium luxury rides.</p>
            </div>
        </div>
    </section>

    <!-- Why Choose Us -->
    <section id="why-choose-us">
        <div class="container">
            <h2>Why Choose Mega City Cab?</h2>
            <div class="features">
                <div class="feature-item">Fast & Reliable</div>
                <div class="feature-item">Safe & Secure</div>
                <div class="feature-item">24/7 Availability</div>
                <div class="feature-item">Affordable Pricing</div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2025 Mega City Cab | All Rights Reserved</p>
            <p>Contact: support@megacitycab.com | Phone: +123-456-7890</p>
        </div>
    </footer>

</body>
</html>
