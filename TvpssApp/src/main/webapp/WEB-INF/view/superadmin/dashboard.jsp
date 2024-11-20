<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<%@ page isELIgnored = "false" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Super Admin Dashboard</title>
    <link rel="stylesheet" href="/TvpssApp/resources/css/superAdminDashboard.css">

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
                    <li><a href="#" class="active">Dashboard</a></li>
                    <li><a href="/TvpssApp/manageUsers">User Management</a></li>
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
			            <span>User</span>
			        </div>
			    </div>
			    <div class="divider"></div> <!-- Thin dividing line -->
			    <!-- Bottom Section: Welcome and Search Bar -->
			    <div class="welcome-search">
			        <h1>Hello, welcome!</h1>
			        <div class="search-bar">
			            <input type="text" placeholder="Search here...">
			        </div>
			    </div>
			</header>



            <section class="stats">
                <div class="stat">
                    <h3>Number of State Admin</h3>
                    <p>63</p>
                </div>
                <div class="stat">
                    <h3>Number of PPD Admin</h3>
                    <p>85</p>
                </div>
                <div class="stat">
                    <h3>Number of School Admin</h3>
                    <p>102</p>
                </div>
            </section>
            
            <section class="charts">
			    <div class="chart-container">
			        <div class="chart">
			            <h3>Number of active users</h3>
			            <canvas id="activeUsersChart"></canvas>
			        </div>
			    </div>
			    <div class="chart-container">
			        <div class="chart">
					    <h3>User in Term</h3>
					    <div class="circle-chart">
					        <span>80%</span>
					    </div>
					    <p>Percentage of active users</p>
					</div>
			    </div>
			</section>
        </main>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="<c:url value='/resources/js/SAscript.js' />"></script>
</body>
</html>
