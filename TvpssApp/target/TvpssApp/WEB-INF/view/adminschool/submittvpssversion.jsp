<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit TVPSS Version</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/schoolInformation.css' />">
</head>
<body>
    <div class="main-container">
        <!-- Sidebar -->
        <%@ include file="/WEB-INF/view/common/adSchoolsidebar.jsp" %>

        <!-- Main Content -->
        <section class="content">
            <%@ include file="/WEB-INF/view/common/adSchoolheader.jsp" %>
            
            <hr class="divider">
            <!-- TVPSS Version Form -->
            <div class="title-container">
                <h2>Submit TVPSS Version</h2>
            </div>
            
            <div class="form-container">
                <form action="<c:url value='/adminschool/save-tvpss-version'/>" method="POST" id="tvpssForm">
    <!-- Hidden Field for School Code -->
    <input type="hidden" id="selectedSchoolCode" name="schoolCode" value="">

    <!-- Select School Dropdown -->
    <div class="form-group">
        <label for="schoolSelect">Select School</label>
        <select name="schoolSelect" id="schoolSelect" onchange="fetchSchoolDetails(this.value)" required>
            <option value="" disabled selected>Select a school</option>
            <c:forEach var="school" items="${schools}">
                <option value="${school.code}">${school.name} (${school.code})</option>
            </c:forEach>
        </select>
    </div>

    <!-- Dynamic Fields for School Details -->
    <div class="form-group">
        <label for="schoolName">School Name</label>
        <input type="text" id="schoolName" name="name" value="" readonly>
    </div>

    <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="" readonly>
    </div>

    <div class="form-group">
        <label for="address1">Address 1</label>
        <input type="text" id="address1" name="address1" value="" readonly>
    </div>

    <div class="form-group">
        <label for="address2">Address 2</label>
        <input type="text" id="address2" name="address2" value="" readonly>
    </div>

    <div class="form-group">
        <label for="postcode">Postcode</label>
        <input type="text" id="postcode" name="postcode" value="" readonly>
    </div>

    <div class="form-group">
        <label for="state">State</label>
        <input type="text" id="state" name="state" value="" readonly>
    </div>

    <!-- TVPSS Version Fields -->
    <div class="form-group">
        <label for="connerminittv">Connerminittv Available</label>
        <select name="connerminittv" id="connerminittv" required>
            <option value="Yes">Yes</option>
            <option value="No">No</option>
        </select>
    </div>

    <div class="form-group">
        <label for="recordingEquipment">Recording Equipment Available</label>
        <select name="recordingEquipment" id="recordingEquipment" required>
            <option value="Yes">Yes</option>
            <option value="No">No</option>
        </select>
    </div>

    <div class="form-group">
        <label for="greenScreenTechnology">Green Screen Technology</label>
        <select name="greenScreenTechnology" id="greenScreenTechnology" required>
            <option value="Yes">Yes</option>
            <option value="No">No</option>
        </select>
    </div>

    <!-- Submit Button -->
    <div class="form-actions">
        <button type="submit" class="btn submit">Submit</button>
    </div>
</form>

<script>
    // Fetch school details dynamically based on selected school
    function fetchSchoolDetails(schoolCode) {
        document.getElementById('selectedSchoolCode').value = schoolCode;
        fetch(`/adminschool/get-school-details/${schoolCode}`)
            .then(response => response.json())
            .then(data => {
                if (data) {
                    document.getElementById('schoolName').value = data.name || '';
                    document.getElementById('email').value = data.email || '';
                    document.getElementById('address1').value = data.address1 || '';
                    document.getElementById('address2').value = data.address2 || '';
                    document.getElementById('postcode').value = data.postcode || '';
                    document.getElementById('state').value = data.state || '';
                    document.getElementById('connerminittv').value = data.connerminittv || 'No';
                    document.getElementById('recordingEquipment').value = data.recordingEquipment || 'No';
                    document.getElementById('greenScreenTechnology').value = data.greenScreenTechnology || 'No';
                }
            })
            .catch(error => console.error('Error fetching school details:', error));
    }
</script>

</body>
</html>
