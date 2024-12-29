<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View School Version Status</title>
    <link rel="stylesheet" href="/TvpssApp/resources/css/superAdminDashboard.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F8FAFF;
            margin: 0;
            padding: 0;
        }

        .breadcrumb-container {
            margin: 20px 10px;
            font-size: 14px;
            color: #6B7280;
        }

        .breadcrumb-container span {
            font-weight: bold;
            color: #4B6CB7;
        }

        .dashboard-container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .table-container {
            margin-top: 20px;
            background-color: #FFFFFF;
            border-radius: 12px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        table th, table td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #F3F4F6;
            color: #4B6CB7; /* Updated for blue header text */
        }

        table tr:hover {
            background-color: #F9FAFB;
        }

        .btn-view {
            background-color: #4B6CB7;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }

        .btn-view:hover {
            background-color: #354A9F;
        }

        .search-bar-container {
            display: flex;
            margin-bottom: 20px;
            justify-content: space-between;
            align-items: center;
        }

        .search-bar-container input {
            width: 100%;
            max-width: 400px;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #CBD5E1;
            border-radius: 5px;
        }

        .search-bar-container button {
            margin-left: 10px;
            padding: 10px 20px;
            background-color: #4B6CB7;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .search-bar-container button:hover {
            background-color: #3a56a3;
        }

        .no-data {
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
            color: #6B7280;
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
                    <li><a href="/TvpssApp/adminstate/viewCertApplication">Generate E-Certificate</a></li>
                    <li><a href="/TvpssApp/schoolVersion/view" class="active">View School Version Status</a></li>
                </ul>
            </nav>
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
                        <span>User<br>State Admin</span>
                    </div>
                </div>
                <div class="welcome-search">
                    <h1>View School Version Status</h1>
                </div>
            </header>

            <div class="dashboard-container">
                <!-- Search Bar -->
                <div class="search-bar-container">
                    <input type="text" id="searchBox" placeholder="Search by School Name, Code, or District">
                    <button onclick="filterTable()">Search</button>
                </div>

                <!-- Table Container -->
                <div class="table-container">
                    <table id="schoolTable">
                        <thead>
                            <tr>
                                <th>School Code</th>
                                <th>School Name</th>
                                <th>District</th>                          
                                <th>Contact Person</th>
                                <th>Version Status</th>
                                
                                <th>Version</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="version" items="${versions}">
                                <tr>
                                    <td>${version.schoolCode}</td>
                                    <td>${version.schoolName}</td>
                                    <td>${version.district}</td>
                                    <td>${version.versionStatus}</td>
                                    <td>${version.contactPerson}</td>
                                    <td>${version.version}</td>
                                    <td>${version.status}</td>
                                    <td>
                                        <a href="/TvpssApp/schoolVersion/details/${version.schoolCode}" class="btn-view">View</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${empty versions}">
                        <div class="no-data">No school versions available to display.</div>
                    </c:if>
                </div>
            </div>
        </main>
    </div>
    
    <script>
        // Function to filter table rows based on search input
        function filterTable() {
            const searchValue = document.getElementById('searchBox').value.toLowerCase();
            const rows = document.querySelectorAll('#schoolTable tbody tr');
            rows.forEach(row => {
                const schoolCode = row.children[0].textContent.toLowerCase();
                const schoolName = row.children[1].textContent.toLowerCase();
                const district = row.children[2].textContent.toLowerCase();
                row.style.display = schoolCode.includes(searchValue) || schoolName.includes(searchValue) || district.includes(searchValue) ? '' : 'none';
            });
        }
    </script>
</body>
</html>
