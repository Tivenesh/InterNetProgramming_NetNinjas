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
        /* The existing CSS code */
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
                    <li><span>Logo TVPSS:</span>
                        <c:if test="${not empty school.logoFilename}">
                            <img src="/resources/static/uploads/school-logos/${school.logoFilename}" alt="School Logo" width="100">
                        </c:if>
                        <c:if test="${empty school.logoFilename}">
                            <span>No logo uploaded</span>
                        </c:if>
                    </li>
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
                <form id="checklistForm" method="post" action="/TvpssApp/adminppd/updateVersionStatus">
                    <input type="hidden" name="schoolCode" value="${school.code}">
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
                    <label>Update Version Status:</label>
                    <select name="versionStatus">
                        <option value="Active" ${school.versionStatus == 'Active' ? 'selected' : ''}>Active</option>
                        <option value="Inactive" ${school.versionStatus == 'Inactive' ? 'selected' : ''}>Inactive</option>
                    </select>
                    <button type="submit" class="update-button">Update</button>
                </form>
            </div>
        </div>
    </main>
</div>
</body>
</html>
