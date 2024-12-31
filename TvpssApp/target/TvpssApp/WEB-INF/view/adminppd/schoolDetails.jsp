<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Details</title>
    <link rel="stylesheet" href="/TvpssApp/resources/css/superAdminDashboard.css">
    <style>
/* Reset and Base Styles */
body, html {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

.main-container {
    display: flex;
    min-height: 100vh;
    width: 100%;
}

/* Sidebar Styling */
.sidebar {
    width: 220px;
    background-color: #f1f5f9;
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    padding: 20px 0;
    box-shadow: 2px 0 5px rgba(0,0,0,0.1);
    z-index: 1000;
}

.sidebar .logo {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 30px;
}

.sidebar .logo img {
    max-width: 50px;
    margin-right: 10px;
}

.sidebar nav ul {
    list-style: none;
    padding: 0;
}

.sidebar nav ul li {
    margin-bottom: 10px;
}

.sidebar nav ul li a {
    display: block;
    padding: 10px 20px;
    color: #4B5563;
    text-decoration: none;
    transition: all 0.3s ease;
    border-radius: 8px;
    margin: 0 10px;
}

.sidebar nav ul li a:hover {
    background-color: #4B6CB7;
    color: white;
    transform: translateX(5px);
    box-shadow: 0 4px 6px rgba(75, 108, 183, 0.2);
}

.sidebar nav ul li a.active {
    background-color: #4B6CB7;
    color: white;
    box-shadow: 0 4px 6px rgba(75, 108, 183, 0.2);
}

/* Content Area Styling */
.content {
    margin-left: 220px;
    width: calc(100% - 220px);
    background-color: #f9f9f9;
}

.header {
    padding: 15px 20px;
    background-color: #ffffff;
    border-bottom: 1px solid #e5e7eb;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}

.header h1 {
    margin: 0;
    color: #4B5563;
    font-size: 24px;
}

/* Details Container */
.details-container {
    display: flex;
    gap: 20px;
    padding: 20px;
    max-width: 1200px;
    margin: 0 auto;
}

.details-section, .checklist-section {
    background: #ffffff;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    flex: 1;
}

.details-section {
    max-width: 60%;
}

.checklist-section {
    max-width: 40%;
}

.details-section h4, .checklist-section h4 {
    margin-top: 0;
    color: #4B5563;
    border-bottom: 2px solid #E5E7EB;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

.details-list, .checklist {
    list-style: none;
    padding: 0;
    margin: 0;
}

.details-list li, .checklist li {
    margin-bottom: 15px;
    display: flex;
    justify-content: space-between;
    padding: 10px 0;
    border-bottom: 1px solid #f1f5f9;
}

.details-list li:last-child, 
.checklist li:last-child {
    border-bottom: none;
}

.details-list li span:first-child,
.checklist li label {
    font-weight: 600;
    color: #4B5563;
}

.details-list li span:last-child {
    color: #6B7280;
}

.checklist li {
    align-items: center;
}

.checklist li input[type="checkbox"] {
    margin-right: 10px;
    accent-color: #4B6CB7;
}

.update-button {
    width: 100%;
    background-color: #4B6CB7;
    color: #fff;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.update-button:hover {
    background-color: #3759a1;
}

/* Enhanced Modal Styling */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex; /* This line ensures the modal is only visible when JavaScript updates the style */
    justify-content: center;
    align-items: center;
    z-index: 1000;
}


.modal-content {
    background-color: #FFFFFF;
    border-radius: 16px;
    padding: 30px;
    text-align: center;
    max-width: 500px;
    width: 90%;
    box-shadow: 0 15px 50px rgba(0,0,0,0.1);
    position: relative;
    overflow: hidden;
}

.modal-content::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: linear-gradient(135deg, #4B6CB7 0%, #4B6CB7 50%, transparent 50%);
    transform: rotate(-45deg);
    z-index: -1;
    opacity: 0.1;
}

.modal-content h3 {
    font-size: 22px;
    color: #4B5563;
    margin-bottom: 15px;
}

.modal-content p {
    font-size: 16px;
    color: #6B7280;
    margin-bottom: 25px;
    line-height: 1.6;
}

.modal-actions {
    display: flex;
    justify-content: center;
    gap: 15px;
}

.modal-actions .btn {
    padding: 10px 20px;
    border-radius: 8px;
    font-weight: 600;
    transition: all 0.3s ease;
    cursor: pointer;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.modal-actions .btn.cancel {
    background-color: #F3F4F6;
    color: #4B5563;
    border: 1px solid #E5E7EB;
}

.modal-actions .btn.cancel:hover {
    background-color: #E5E7EB;
}

.modal-actions .btn.submit {
    background-color: #4B6CB7;
    color: white;
    border: none;
}

.modal-actions .btn.submit:hover {
    background-color: #3A56A3;
    transform: translateY(-2px);
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

/* Responsive Design */
@media (max-width: 1024px) {
    .sidebar {
        width: 180px;
    }

    .content {
        margin-left: 180px;
        width: calc(100% - 180px);
    }

    .details-container {
        flex-direction: column;
    }

    .details-section, 
    .checklist-section {
        max-width: 100%;
    }
}

@media (max-width: 768px) {
    .sidebar {
        width: 100%;
        height: auto;
        position: relative;
    }

    .content {
        margin-left: 0;
        width: 100%;
    }

    .details-container {
        padding: 10px;
    }
}
    </style>
</head>	
<body>
<div class="main-container">
    <aside class="sidebar">
        <div class="logo">
            <img src="/TvpssApp/resources/images/TvpssLogo.png" alt="TVPSS Logo">
            <h2>TVPSS</h2>
        </div>
        <nav>
            <ul>
                <li><a href="/TvpssApp/adminppd/dashboard">Dashboard</a></li>
                <li><a href="/TvpssApp/adminppd/schoolValidation" class="active">School TVPSS Validation</a></li>
            </ul>
        </nav>
    </aside>

    <main class="content">
        <header class="header">
            <h1>School Details</h1>
        </header>

      <div class="details-container">
    <!-- School Information Section -->
    <div class="details-section">
        <h4>School Information</h4>
        <ul class="details-list">
            <li><span>School Code:</span><span>${school.code}</span></li>
            <li><span>School Name:</span><span>${school.name}</span></li>
            <li><span>Address 1:</span><span>${school.address1}</span></li>
            <li><span>Address 2:</span><span>${school.address2}</span></li>
            <li><span>Postcode:</span><span>${school.postcode}</span></li>
            <li><span>State:</span><span>${school.state}</span></li>
            <li><span>Telephone:</span><span>${school.telephoneNumber}</span></li>
            <li><span>Email:</span><span>${school.email}</span></li>
            <li><span>Logo TVPSS:</span><span>${school.tvpssLogo}</span></li>
            <c:if test="${not empty school.logoFilename}">
                <img src="/resources/static/uploads/school-logos/${school.logoFilename}" alt="School Logo" width="100">
            </c:if>
            <c:if test="${empty school.logoFilename}">
                <span>No logo uploaded</span>
            </c:if>
            <li><span>YouTube Link:</span>
                <c:if test="${not empty school.youtubeLink}">
                    <a href="${school.youtubeLink}" target="_blank">${school.youtubeLink}</a>
                </c:if>
                <c:if test="${empty school.youtubeLink}">
                    <span>No link provided</span>
                </c:if>
            </li>
        </ul>
    </div>

    <!-- Checklist Section -->
    <div class="checklist-section">
        <h4>Requirements Checklist</h4>
        <form id="checklistForm" method="post" action="/TvpssApp/adminppd/updateSchoolDetails">
            <input type="hidden" name="schoolCode" value="${school.code}">
            <input type="hidden" name="name" value="${school.name}">
            <ul class="checklist">
                <li>
                    <input type="checkbox" name="tvpssLogo" value="true" ${school.tvpssLogo ? "checked" : ""}>
                    <label>Logo TVPSS</label>
                </li>
                <li>
                    <input type="checkbox" name="studio" value="true" ${school.studio ? "checked" : ""}>
                    <label>Corner/Mini/TV Studio</label>
                </li>
                <li>
                    <input type="checkbox" name="youtubeUpload" value="true" ${school.youtubeUpload ? "checked" : ""}>
                    <label>Upload to YouTube</label>
                </li>
                <li>
                    <input type="checkbox" name="recordingInSchool" value="true" ${school.recordingInSchool ? "checked" : ""}>
                    <label>Recording in School</label>
                </li>
                <li>
                    <input type="checkbox" name="recordingInOutSchool" value="true" ${school.recordingInOutSchool ? "checked" : ""}>
                    <label>Recording in and out of School</label>
                </li>
            </ul>
          <button type="button" class="update-button" onclick="openModal()">Update</button>

        </form>
    </div>
</div>

<!-- Confirmation Modal -->
<div class="modal" id="confirmationModal">
    <div class="modal-content">
        <h3>Confirmation Message</h3>
        <p>Are you sure you want to update the school details?</p>
        <div class="modal-actions">
            <button class="btn cancel" onclick="closeModal()">Cancel</button>
            <button class="btn submit" onclick="submitUpdate()">Confirm</button>
        </div>
    </div>
</div>

<script>
function openModal() {
    document.getElementById('confirmationModal').style.display = 'flex';
}


    function closeModal() {
        document.getElementById('confirmationModal').style.display = 'none';
    }

    function submitUpdate() {
        window.location.href = "/TvpssApp/adminppd/schoolValidation";
    }

</script>
</body>
</html>
