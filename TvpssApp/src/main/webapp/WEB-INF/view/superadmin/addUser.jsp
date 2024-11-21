<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add User</title>
    <link rel="stylesheet" href="/TvpssApp/resources/css/superAdminDashboard.css"> <!-- Reference your existing CSS -->
    <style>
        .form-container {
            background: #FFFFFF; /* White background for the form */
            border-radius: 10px;
            padding: 30px;
            max-width: 500px;
            margin: 40px auto; /* Center horizontally and add space on top */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-container h1 {
            font-size: 24px;
            color: #4B6CB7; /* Blue heading */
            margin-bottom: 20px;
            text-align: center;
        }

        .form-container label {
            display: block;
            font-size: 14px;
            color: #6B7280; /* Neutral gray for labels */
            margin-bottom: 5px;
        }

        .form-container input, .form-container select {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #D1D5DB; /* Light gray border */
            border-radius: 5px;
            margin-bottom: 20px;
            background: #F9FAFB; /* Light gray background */
        }

        .form-container button {
            width: 48%;
            padding: 10px;
            font-size: 14px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-container .submit-btn {
            background: #4B6CB7; /* Blue submit button */
            color: #FFFFFF;
        }

        .form-container .submit-btn:hover {
            background: #354A9F; /* Darker blue on hover */
        }

        .form-container .cancel-btn {
            background: #E5E7EB; /* Neutral light gray cancel button */
            color: #4B5563; /* Neutral dark gray text */
        }

        .form-container .cancel-btn:hover {
            background: #D1D5DB; /* Darker gray on hover */
        }

        .breadcrumb {
            margin: 20px 30px; /* Space for the breadcrumb above the form */
            font-size: 14px;
            color: #6B7280; /* Neutral gray for breadcrumb */
        }

        .breadcrumb span {
            font-weight: bold;
            color: #4B6CB7; /* Blue color for active breadcrumb */
        }
    </style>
    <script>
        // JavaScript function to validate passwords
        function validatePasswords() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false; // Prevent form submission
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="dashboard">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="logo">
                <img src="/TvpssApp/resources/images/TvpssLogo.png" alt="TVPSS Logo">
                <h2>TVPSS</h2>
            </div>
            <nav>
                <ul>
                    <li><a href="/TvpssApp/dashboard">Dashboard</a></li>
                    <li><a href="/TvpssApp/manageUsers" class="active">User Management</a></li>
                </ul>
            </nav>
            <div class="settings">
                <div class="setting-item">
                    <i class="icon-settings"></i> Setting
                </div>
                <div class="divider"></div>
                <div class="setting-item">
                    <i class="icon-logout"></i> Logout
                </div>
            </div>
        </aside>

        <!-- Main Content -->
        <main class="content">
            <!-- Header -->
            <header class="header">
                <div class="header-top">
                    <!-- Notification Icon -->
                    <div class="notification">
                        <div class="notification-icon">
                            <i class="icon-bell"></i>
                            <span class="notification-badge"></span>
                        </div>
                    </div>
                    <div class="user-info">
                        <img src="/TvpssApp/resources/images/superAdminLogo.png" alt="User Avatar">
                        <span>User<br>Super Admin</span>
                    </div>
                </div>
            </header>

            <!-- Breadcrumb -->
            <div class="breadcrumb">
                <span>User Management</span> &gt; <span>Create New User</span>
            </div>

            <!-- Add User Form -->
            <div class="form-container">
                <h1>Create New User</h1>
                <form action="/TvpssApp/addUser" method="post" onsubmit="return validatePasswords()">
                    <label for="username">Full Name:</label>
                    <input type="text" id="username" name="username" required placeholder="Fill in your name">

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required placeholder="email@moe.gov.my">

                    <label for="role">Type of Role:</label>
                    <select id="role" name="role" required>
                        <option value="" disabled selected>Select type of role</option>
                        <option value="1">Super Admin</option>
                        <option value="2">PPD Admin</option>
                        <option value="3">State Admin</option>
                        <option value="4">School Admin</option>
                        <option value="5">Student</option>
                    </select>

                    <label for="state">State:</label>
                    <select id="state" name="state" required>
                        <option value="" disabled selected>Select a state</option>
                        <option value="Johor">Johor</option>
                        <option value="Kedah">Kedah</option>
                        <option value="Kelantan">Kelantan</option>
                        <option value="Melaka">Melaka</option>
                        <option value="Negeri Sembilan">Negeri Sembilan</option>
                        <option value="Pahang">Pahang</option>
                        <option value="Perak">Perak</option>
                        <option value="Perlis">Perlis</option>
                        <option value="Pulau Pinang">Pulau Pinang</option>
                        <option value="Sabah">Sabah</option>
                        <option value="Sarawak">Sarawak</option>
                        <option value="Selangor">Selangor</option>
                        <option value="Terengganu">Terengganu</option>
                        <option value="Kuala Lumpur">Kuala Lumpur</option>
                        <option value="Labuan">Labuan</option>
                        <option value="Putrajaya">Putrajaya</option>
                    </select>

                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required placeholder="Enter a secure password">

                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Re-enter the password">

                    <div style="display: flex; justify-content: space-between;">
                        <button type="button" class="cancel-btn" onclick="location.href='/TvpssApp/manageUsers'">Cancel</button>
                        <button type="submit" class="submit-btn">Submit</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>
