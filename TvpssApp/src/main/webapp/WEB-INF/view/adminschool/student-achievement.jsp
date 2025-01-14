<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Student Achievement</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/viewAchievement.css' />">
    <link rel="stylesheet" href="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' />">
    <style>
		.btn.achievement {
            background-color: #4B6CB7;
            color: #FFFFFF;
            padding: 10px 15px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            display:flex;
			align-item: center;
        }

        .btn.achievement :hover {
            background-color: #354A9F;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <!-- Sidebar -->
        <%@ include file="/WEB-INF/view/common/adSchoolsidebar.jsp" %>

        <!-- Main Content -->
        <section class="content">
            <%@ include file="/WEB-INF/view/common/adSchoolheader.jsp" %>
            
            <hr class="divider">
            <!-- School Information Form -->
            <div class="title-container">
                <h2>${achievementTitle}</h2>
            </div>
            
            <!-- Search bar -->
            <div class="search-container">
                <input type="text" id="search" placeholder="Find Achievement..." oninput="filterTable()">
                <button class="btn view">Search</button>
                
                <!-- Add Achievement Button -->
                <button class="btn achievement" onclick="window.location.href='<c:url value='/adminschool/submit-achievement' />'">+ Add Achievement</button>
            </div>
            
            <!-- Table -->
            <div class="table-container">
                <table id="achievementTable">
                    <thead>
                        <tr>
                            <th>Activity Name</th>
                            <th>Category</th>
                            <th>Form Mode</th>
                            <th>Status</th>
                            <th>More Details</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="achievement" items="${achievements}">
                            <tr>
                                <td>${achievement.activityName}</td>
                                <td>${achievement.category}</td>
                                <td>${achievement.formMode}</td>
                                <td>
                                    <span style="color: <c:choose>
                                                <c:when test='${achievement.status == "Pending"}'>orange</c:when>
                                                <c:when test='${achievement.status == "Generated"}'>green</c:when>
                                                <c:when test='${achievement.status == "Rejected"}'>red</c:when>
                                                <c:otherwise>grey</c:otherwise>
                                            </c:choose>; font-weight: bold;">
                                        ${achievement.status}
                                    </span>
                                </td>
                                <td><button class="btn view" onclick="window.location.href='<c:url value='/adminschool/view-achievement?id=${achievement.achievementId}' />'">View</button></td>
                                <td>
                                    <button class="btn edit" onclick="window.location.href='<c:url value='/adminschool/edit-achievement?id=${achievement.achievementId}' />'"><i class="fa fa-edit"></i></button>
                                    <button class="btn delete" onclick="showDeleteModal('${achievement.achievementId}')"><i class='fa fa-trash'></i></button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="pagination">
                <button class="active">1</button>
                <button>2</button>
                <button>3</button>
                <button>Next</button>
            </div>
        </section>
    </div>
    
     <!-- Delete Confirmation Modal -->
     <div id="deleteModal" class="modal hidden">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3>Confirm Deletion</h3>
            <p>Are you sure you want to delete this achievement?</p>
            <div class="modal-actions">
                <button class="btn" onclick="closeModal()">Cancel</button>
                <button class="btn delete" id="confirmDelete">Confirm</button>
            </div>
        </div>
    </div>

    <script>
    function filterTable() {
        const searchValue = document.getElementById('search').value.toLowerCase();
        const rows = document.querySelectorAll('#achievementTable tbody tr');

        rows.forEach(row => {
            const category = row.cells[1].textContent.toLowerCase();
            const activityName = row.cells[2].textContent.toLowerCase();

            if (category.includes(searchValue) || activityName.includes(searchValue)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    }

    function showDeleteModal(achievementId) {
            deleteAchievementId = achievementId;
            document.getElementById('deleteModal').classList.remove('hidden');
        }


        function closeModal() {
            document.getElementById('deleteModal').classList.add('hidden');
            deleteAchievementId = null;
        }


        document.getElementById('confirmDelete').addEventListener('click', function () {
            if (deleteAchievementId) {
                fetch(`/adminschool/delete-achievement`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: `achievementId=${achievementId}`
                })
                    .then(response => {
                        if (response.ok) {
                            window.location.reload();
                        } else {
                            alert('Failed to delete achievement.');
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('An error occurred while deleting the achievement.');
                    });

                closeModal();
            }
        });

    </script>
</body>
</html>
