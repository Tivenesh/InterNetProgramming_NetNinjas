<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Users</title>
    <link rel="stylesheet" href="/TvpssApp/resources/css/superAdminDashboard.css">
    <style>
    	/* General Styling */
		body {
		    font-family: Arial, sans-serif;
		    background-color: #F8FAFF;
		    margin: 0;
		    padding: 0;
		}
		
		/* Breadcrumb Styling */
.breadcrumb {
    font-size: 14px;
    color: #6B7280; /* Neutral gray */
    margin-bottom: 20px;
}

.breadcrumb span {
    display: inline-block;
    margin-right: 5px;
}

.breadcrumb span:last-child {
    font-weight: bold; /* Highlight the current page */
}

.breadcrumb i {
    margin-right: 5px;
    color: #6B7280; /* Neutral gray for icons */
}

/* Sidebar Styling for Active Item */
.sidebar nav ul li a.active {
    background: #4B6CB7; /* Highlighted background */
    color: #FFFFFF; /* White text */
    display: flex;
    align-items: center;
    padding-left: 15px; /* Add some padding for alignment */
}

.sidebar nav ul li a:hover {
    background: #354A9F; /* Darker highlight on hover */
    color: #FFFFFF;
}

/* Adjust the Search and Add User Section */
.manage-users-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.manage-users-header .search-bar input {
    width: 300px; /* Adjust input width */
    padding: 10px;
    border: 1px solid #D1D5DB;
    border-radius: 8px;
    font-size: 14px;
}

/* Add User Button */
.add-user-btn {
            background-color: #4B6CB7;
            color: #FFFFFF;
            padding: 10px 15px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
        }

        .add-user-btn:hover {
            background-color: #354A9F;
        }

        .user-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .user-table th,
        .user-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #F1F5FF;
        }

        .user-table th {
            background-color: #F9FAFF;
            color: #4B6CB7;
            font-size: 14px;
            text-transform: uppercase;
        }

        .user-table tr:hover {
            background-color: #F9FAFF;
        }

        .user-table td {
            color: #555;
        }

        .edit-btn {
            background-color: #28A745;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 12px;
        }

        .edit-btn:hover {
            background-color: #218838;
        }

        .delete-btn {
            background-color: #DC3545;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 12px;
        }

        .delete-btn:hover {
            background-color: #C82333;
        }

        .pagination {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    gap: 5px;
		    margin-top: 20px;
		}
		
		.pagination button {
		    background-color: #FFFFFF;
		    color: #4B6CB7;
		    border: 1px solid #4B6CB7;
		    padding: 5px 10px;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 14px;
		}
		
		.pagination button.active {
		    background-color: #4B6CB7;
		    color: white;
		    border: none;
		}
		
		.pagination button:hover {
		    background-color: #354A9F;
		    color: white;
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
			        <h1>User Management</h1>
			    </div>
			</header>

<!-- Breadcrumb Section -->
<div class="breadcrumb">
    <i class="icon-user"></i>
    <span>User Management</span> &gt; <span>All Users</span>
</div>

<!-- Search Bar, Sort Dropdown, and Add User Button -->
<section class="manage-users-header">
    <div class="search-bar">
        <input type="text" placeholder="Search Users">
    </div>
    <div class="sort-dropdown">
        <label for="sort">Sort by:</label>
        <select id="sort">
            <option value="newest">Newest</option>
            <option value="oldest">Oldest</option>
        </select>
    </div>
    <button class="add-user-btn" onclick="location.href='/TvpssApp/addUser?username=${user.username}'">+ Add New User</button>
</section>


        <!-- User Table -->
        <section class="user-table-container">
            <table class="user-table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>State</th>
                        <th>Type of Role</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.state}</td>
                            <td>${user.getUserRoleName()}</td>
                            <td>${user.email}</td>
                            <td>
                                <button class="edit-btn" onclick="location.href='/TvpssApp/editUser?username=${user.username}'">Edit</button>
                                <form action="/TvpssApp/deleteUser" method="post" style="display:inline;">
                                    <input type="hidden" name="username" value="${user.username}">
                                    <button type="submit" class="delete-btn">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>

        <!-- Pagination Section -->
		<div class="pagination">
		    <c:if test="${currentPage > 1}">
		        <button onclick="location.href='?page=${currentPage - 1}'">&lt;</button>
		    </c:if>
		
		    <c:forEach begin="1" end="${totalPages}" var="i">
		        <button 
		            class="${currentPage == i ? 'active' : ''}" 
		            onclick="location.href='?page=${i}'">${i}</button>
		    </c:forEach>
		
		    <c:if test="${currentPage < totalPages}">
		        <button onclick="location.href='?page=${currentPage + 1}'">&gt;</button>
		    </c:if>
		</div>

    </main>
</div>

</body>
</html>
