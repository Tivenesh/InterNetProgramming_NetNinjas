<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Information</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/schoolInformation.css' />">
</head>
<body>
	  <div class="main-container">
        <!-- Sidebar -->
    <%@ include file="/WEB-INF/view/common/adSchoolsidebar.jsp" %>

        <!-- Main Content -->
        <section class="content">
            <%@ include file="/WEB-INF/view/common/adSchoolheader.jsp" %>
         
        <div class="content-container">   
        <h2>School Information</h2>
        <p><strong>School Code:</strong> ${school.code != null ? school.code : "Not available"}</p>
		<p><strong>School Name:</strong> ${school.name != null ? school.name : "Not available"}</p>
		<p><strong>Address 1:</strong> ${school.address1 != null ? school.address1 : "Not available"}</p>
		<p><strong>Address 2:</strong> ${school.address2 != null ? school.address2 : "Not available"}</p>
		<p><strong>Postcode:</strong> ${school.postcode != null ? school.postcode : "Not available"}</p>
		<p><strong>State:</strong> ${school.state != null ? school.state : "Not available"}</p>
		<p><strong>Telephone:</strong> ${school.telephoneNumber != null ? school.telephoneNumber : "Not available"}</p>
		<p><strong>Email:</strong> ${school.email != null ? school.email : "Not available"}</p>
		<p><strong>Logo:</strong> 
            <c:if test="${not empty school.logo}">
                <img src="/resources/static/uploads/school-logos/${school.logo}" alt="School Logo" width="100">
            </c:if>
            <c:if test="${empty school.logo}">
                <span>No logo uploaded</span>
            </c:if>
        </p>
        <p><strong>YouTube Link:</strong> 
            <c:if test="${not empty school.youtubeLink}">
                <a href="${school.youtubeLink}" target="_blank">${school.youtubeLink}</a>
            </c:if>
            <c:if test="${empty school.youtubeLink}">
                <span>No link provided</span>
            </c:if>
        </p>
        
        <button onclick="window.history.back()">Back</button>
   </div>
    </section>
    </div>
</body>
</html>
