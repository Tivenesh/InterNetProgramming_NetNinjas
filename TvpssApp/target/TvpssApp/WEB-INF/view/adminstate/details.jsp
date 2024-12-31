<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Version Details</title>
    <link rel="stylesheet" href="/TvpssApp/resources/css/superAdminDashboard.css">
    <style>
        .dashboard-container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .details-container {
            margin-top: 20px;
            background-color: #FFFFFF;
            border-radius: 12px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .details-container h2 {
            text-align: center;
            color: #4B5563;
            margin-bottom: 20px;
        }

        .details-container p {
            font-size: 16px;
            color: #374151;
            margin: 10px 0;
        }

        .details-container p strong {
            color: #1F2937;
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .btn {
            background-color: #4B6CB7;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #3a56a3;
        }

        .btn:focus {
            outline: none;
        }
    </style>
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
                    <li><a href="/TvpssApp/schoolVersion/dashboard">Dashboard</a></li>
                     <li><a href="/TvpssApp/adminstate/viewCertApplication" class="menu-item ${page == 'viewCertApplication' || page == 'generateCertificate' ? 'active' : ''}">Generate E-Certificate</a><li>
                    <li><a href="/TvpssApp/schoolVersion/view" class="active">View School Version Status</a></li>
                </ul>
            </nav>
            
              <div class="settings">
                <div class="setting-item">
                    <i class="icon-settings"></i> Setting
                </div>
                <div class="divider"></div>
                <div class="setting-item">
                    <i class="icon-logout"></i>
                    <a href="/TvpssApp/login" style="text-decoration: none; color: inherit;">Logout</a>
                </div>
            </div>
            
        </aside>

        <!-- Main Content -->
        <main class="content">
            <header class="header">
                <div class="header-top">
                    <div class="notification">
                        <div class="notification-icon">
                            <i class="icon-bell"></i>
                            <span class="notification-badge"></span>
                        </div>
                    </div>
                    <div class="user-info">
                        <img src="/TvpssApp/resources/images/PPDAdminLogo.png" alt="User Avatar">
                        <span>User<br>Admin State</span>
                    </div>
                </div>
                <div class="welcome-search">
                    <h1>School Version Details</h1>
                </div>
            </header>

            <div class="dashboard-container">
                <!-- Details Section -->
                <div class="details-container">
                    <h2>School Version Information</h2>
                    <p><strong>School Code:</strong> ${school.schoolCode != null ? school.schoolCode : "Not available"}</p>
                    <p><strong>School Name:</strong> ${school.schoolName != null ? school.schoolName : "Not available"}</p>
                    <p><strong>District:</strong> ${school.district != null ? school.district : "Not available"}</p>
                    <p><strong>Version Status:</strong> ${school.versionStatus != null ? school.versionStatus : "Not available"}</p>
                    <p><strong>Contact Person:</strong> ${school.contactPerson != null ? school.contactPerson : "Not available"}</p>
                    <p><strong>Version:</strong> ${school.version != null ? school.version : "Not available"}</p>
                    <p><strong>Status:</strong> ${school.status != null ? school.status : "Not available"}</p>
                </div>

                <!-- Back Button -->
                <div class="button-container">
                    <button class="btn" onclick="window.location.href='/TvpssApp/schoolVersion/view'">Back to View</button>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
