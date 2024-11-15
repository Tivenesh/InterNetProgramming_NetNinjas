<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Admin Dashboard</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/schooAdmindashboard.css' />">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<div class="dashboard-container">
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="sidebar-logo">
            <img src="<c:url value='/resources/images/TvpssLogo.png' />" alt="TVPSS Logo">
            <span>Management Information System</span>
        </div>
        <nav class="sidebar-menu">
            <a href="#" class="menu-item active">Dashboard</a>
            <a href="#" class="menu-item">Crew Application</a>
            <a href="#" class="menu-item">Student Achievement</a>
            <a href="#" class="menu-item">School Information</a>
            <a href="#" class="menu-item">Submit TVPSS Version</a>
        </nav>
        <div class="sidebar-footer">
            <a href="#" class="menu-item">Settings</a>
            <a href="#" class="menu-item">Log Out</a>
        </div>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <header class="dashboard-header">
            <h1>Welcome Admin School!</h1>
            <div class="header-tools">
                <button class="filter-btn">Weekly</button>
                <input type="text" class="date-range" placeholder="1 Jun 2024 - 8 Jun 2024">
                <button class="export-btn">Export</button>
                <div class="profile">
                    <img src="<c:url value='/resources/images/profile.png' />" alt="Profile">
                    <span>Cikgu Imran <br> School Admin</span>
                </div>
            </div>
        </header>

        <!-- Dashboard Cards -->
        <section class="stats-cards">
            <div class="card">
                <div class="card-icon"></div>
                <div class="card-info">
                    <span>Number of Students</span>
                    <h2>500</h2>
                </div>
            </div>
            <div class="card">
                <div class="card-icon"></div>
                <div class="card-info">
                    <span>Total Achievement</span>
                    <h2>120</h2>
                </div>
            </div>
            <div class="card">
                <div class="card-icon"></div>
                <div class="card-info">
                    <span>Number of Crew</span>
                    <h2>20</h2>
                </div>
            </div>
        </section>

        <!-- Charts Section -->
        <section class="charts">
	    <div class="bar-chart">
	        <h3>Crew Overview</h3>
	        <canvas id="crewBarChart" width="400" height="300"></canvas>
	    </div>
	    <div class="pie-chart">
	        <h3>Division of Crew by Gender</h3>
	        <canvas id="genderPieChart" width="300" height="300"></canvas>
	    </div>
		</section>
    </main>
</div>
<script>
// Bar Chart for Crew Overview
const ctxBar = document.getElementById('crewBarChart').getContext('2d');
const crewBarChart = new Chart(ctxBar, {
    type: 'bar',
    data: {
        labels: ['01 Jun', '02 Jun', '03 Jun', '04 Jun', '05 Jun', '06 Jun', '07 Jun'],
        datasets: [{
            label: 'Crew',
            data: [40, 30, 50, 40, 20, 30, 25],
            backgroundColor: '#515B92'
        }]
    },
    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    stepSize: 10
                }
            }
        }
    }
});

// Pie Chart for Gender Division
const ctxPie = document.getElementById('genderPieChart').getContext('2d');
const genderPieChart = new Chart(ctxPie, {
    type: 'pie',
    data: {
        labels: ['Male', 'Female'],
        datasets: [{
            label: 'Division of Crew by Gender',
            data: [70, 30], // Example data: 70% male, 30% female
            backgroundColor: ['#14B8A6', '#FACC15']
        }]
    },
    options: {
        responsive: true
    }
});
</script>
</body>
</html>

