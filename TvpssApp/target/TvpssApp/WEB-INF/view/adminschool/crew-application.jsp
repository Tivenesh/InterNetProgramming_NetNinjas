<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crew Application</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/crewApplication.css' />">
    <style>
       
    </style>
</head>
<body>
    <div class="main-container">
        <!-- Sidebar -->
        <%@ include file="/WEB-INF/view/common/adSchoolsidebar.jsp" %>

        <!-- Content -->
        <section class="content">
            <%@ include file="/WEB-INF/view/common/adSchoolheader.jsp" %>

			<hr class="divider">
            <!-- School Information Form -->
            <div class="title-container">
            	<h2>Crew Application</h2>
			</div>
            <!-- Search bar -->
            <div class="search-container">
                <input type="text" id="search" placeholder="Find Application" oninput="filterTable()">
                <button class="btn view">Search</button>
                <button class="btn" onclick="resetSearch()">Reset</button>
                <button class="btn reject" onclick="openModal('Rejected')">Reject Application</button>
                <button class="btn accept" onclick="openModal('Accepted')">Accept Application</button>
            </div>

            <!-- Table -->
            <div class="table-container">
                <table id="applicationTable">
                    <thead>
                        <tr>
                        	<th> </th>
                            <th>IC Number</th>
                            <th>Full Name</th>
                            <th>Position</th>
                            <th>Form</th>
                            <th>Status</th>
                            <th>Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Example row; replace with dynamic content -->
                        <c:forEach var="application" items="${applications}">
                            <tr>
                            	<td>
                            	<input type="checkbox" name="id" value="${application.id}" class="rowCheckbox">
                        		</td>
                                <td>${application.icNumber}</td>
                                <td>${application.fullName}</td>
                                <td>${application.position}</td>
                                <td>${application.form}</td>
                                <td>
                				<span style="
			                    color: <c:choose>
			                            <c:when test="${application.status == 'Pending'}">orange</c:when>
			                            <c:when test="${application.status == 'Approved'}">green</c:when>
			                            <c:when test="${application.status == 'Rejected'}">red</c:when>
			                            <c:otherwise>black</c:otherwise>
			                          </c:choose>;
					                    font-weight: bold;">
					                    ${application.status}
					                </span>
					            </td>
                                <td><button class="btn view" onclick="viewApplication(${application.id})">View</button></td>
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
            <h2 id="modalTitle" style="font-size: 16px; font-weight: 600;"></h2>
            <p id="modalBody" style="font-size: 13px; color: #6b7280;"></p>
            <div class="modal-actions">
                <button class="btn cancel" onclick="closeModal()">Cancel</button>
                <button class="btn confirm" id="confirmButton" onclick="confirmAction()">Confirm</button>
            </div>
        </div>
    </div>

    <script>
        // Example function to reset search
        function resetSearch() {
            const searchInput = document.getElementById('search');
            searchInput.value = '';
            filterTable(); // Reset the table to show all rows
        }
        
     // Function to filter the table rows based on the search input
        function filterTable() {
	    const searchValue = document.getElementById('search').value.toLowerCase();
	    const table = document.getElementById('applicationTable');
	    const rows = table.getElementsByTagName('tr');
	
	    for (let i = 1; i < rows.length; i++) { // Skip the header row
	        const icCell = rows[i].getElementsByTagName('td')[1]; // IC Number column
	        const nameCell = rows[i].getElementsByTagName('td')[2]; // Full Name column
	
	        const icText = icCell ? icCell.innerText.toLowerCase() : '';
	        const nameText = nameCell ? nameCell.innerText.toLowerCase() : '';
	
	        // Check if the search value matches either IC or Name
	        if (icText.includes(searchValue) || nameText.includes(searchValue)) {
	            rows[i].style.display = ''; // Show row
	        } else {
	            rows[i].style.display = 'none'; // Hide row
	        }
	    }
	}

        // Example function for "View" button
        function viewApplication(id) {
            window.location.href = `/crewApplication/view/${id}`;
        }
        
        function updateStatus(status) {
            const selectedCheckboxes = document.querySelectorAll('.rowCheckbox:checked');
            if (selectedCheckboxes.length === 0) {
                alert('Please select at least one application.');
                return;
            }

            // Add the status to the form
            const form = document.getElementById('applicationForm');
            const statusInput = document.createElement('input');
            statusInput.type = 'hidden';
            statusInput.name = 'status';
            statusInput.value = status;
            form.appendChild(statusInput);

            // Submit the form
            form.submit();
        }
        
        let selectedStatus = ""; // Variable to store the action (Accept/Reject)

        // Function to open the modal with custom messages
        // Function to open the modal with custom messages
function openModal(action) {
    const modal = document.getElementById("confirmationModal");
    const modalTitle = document.getElementById("modalTitle");
    const modalBody = document.getElementById("modalBody");
    const confirmButton = document.getElementById("confirmButton");

    selectedStatus = action; // Store the action (Accept/Reject)

    // Calculate the number of selected rows
    const selectedCheckboxes = document.querySelectorAll(".rowCheckbox:checked");
    const count = selectedCheckboxes.length;

   
 // If no applications are selected, alert the user and do not open the modal
    if (count === 0) {
        alert("Please select at least one application.");
        return;
    }

    if (action === "Accepted") {
        modalTitle.textContent = "Are you sure you want to accept this application?";
        modalBody.textContent = "There are " + count + " applications that will be accepted.";
        confirmButton.textContent = "Accept";
        confirmButton.classList.add("accept");
        confirmButton.classList.remove("reject");
    } else if (action === "Rejected") {
        modalTitle.textContent = "Are you sure you want to reject this application?";
        modalBody.textContent = "There are " + count + " applications that will be rejected.";
        confirmButton.textContent = "Reject";
        confirmButton.classList.add("reject");
        confirmButton.classList.remove("accept");
    }

    modal.classList.remove("hidden");
}

        // Function to close the modal
        function closeModal() {
            const modal = document.getElementById("confirmationModal");
            modal.classList.add("hidden");
        }

        // Function to handle confirmation action
        function confirmAction() {
            const selectedCheckboxes = document.querySelectorAll(".rowCheckbox:checked");
            if (selectedCheckboxes.length === 0) {
                alert("Please select at least one application.");
                return;
            }

            selectedCheckboxes.forEach((checkbox) => {
                const row = checkbox.closest("tr");
                const statusCell = row.querySelector("td:nth-child(6) span"); // Status column

                if (selectedStatus === "Accepted") {
                    statusCell.textContent = "Accepted";
                    statusCell.style.color = "green";
                } else if (selectedStatus === "Rejected") {
                    row.remove(); // Remove the row for rejected applications
                }
            });

            closeModal(); // Close the modal
        }
        
        function toggleAllCheckboxes(selectAllCheckbox) {
            const checkboxes = document.querySelectorAll('.rowCheckbox');
            checkboxes.forEach(checkbox => checkbox.checked = selectAllCheckbox.checked);
        }
    </script>
</body>
</html>
