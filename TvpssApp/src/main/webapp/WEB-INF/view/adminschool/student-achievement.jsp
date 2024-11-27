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
			align-items: center;
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
                <h2>View Student Achievement</h2>
            </div>
            
            <!-- Search bar -->
            <div class="search-container">
                <input type="text" id="search" placeholder="Find Achievement..." oninput="filterTable()">
                <button class="btn view">Search</button>
                
                <!-- Add Achievement Button -->
                <button class="btn achievement" onclick="window.location.href='<c:url value='/adminschool/submit-achievement;' />'">+ Add Achievement</button>
            </div>
            
            <!-- Table -->
            <div class="table-container">
                <table id="achievementTable">
                    <thead>
                        <tr>
                            <th> </th>
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
                                <td>
                                    <input type="checkbox" name="id" value="${achievement.achievementId}" class="rowCheckbox">
                                </td>
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
                                <td><button class="btn view">View</button></td>
                                <td>
                                    <button class="btn edit" onclick="window.location.href='<c:url value='/adminschool/submit-achievement?id=$:{achievementId};' />'"><i class="fa fa-edit"></i></button>
                                    <button class="btn delete" onclick="showModal('${achievement.achievementId}')"><i class='fa fa-trash'></i></button>
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
    
    <!-- Confirmation Modal -->
    <div id="confirmationModal" class="modal hidden">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 id="modalTitle"></h2>
            <p id="modalBody"></p>
            <div class="modal-actions">
                <button class="btn cancel" onclick="closeModal()">Cancel</button>
                <button class="btn confirm" id="confirmButton" onclick="confirmAction()">Confirm</button>
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

    function viewAchievement(id) {
        window.location.href = `/adminschool/view/${id}`;
    }

    function closeModal() {
        document.getElementById('confirmationModal').classList.add('hidden');
    }

    function showModal(achievementId) {
    	console.log('Modal shown for Achievement ID:', achievementId);
        const modal = document.getElementById('confirmationModal');
        const modalTitle = document.getElementById('modalTitle');
        const modalBody = document.getElementById('modalBody');
        const confirmButton = document.getElementById('confirmButton');

        modalTitle.textContent = 'Confirm Deletion';
        modalBody.textContent = `Are you sure you want to delete the achievement with ID ${achievementId}?`;
        confirmButton.onclick = () => confirmAction(achievementId);

        modal.classList.remove('hidden');
    }

    function confirmAction(achievementId) {
        // Example of sending a delete request using Fetch API
        fetch(`/adminschool/delete/${achievementId}`, {
            method: 'DELETE'
        })
            .then(response => {
                if (response.ok) {
                    // Reload the page or remove the row from the table
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

    </script>
</body>
</html>
