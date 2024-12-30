<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit TVPSS Version</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/schoolInformation.css' />">
    <style>
        /* Modal Styling */
        .modal {
            position: fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            visibility: hidden;
            opacity: 0;
            transition: visibility 0.3s, opacity 0.3s;
        }

        .modal-content {
            position: absolute;
            width: 700px;
            height: 223px;
            background: white;
            padding: 20px;
            text-align: center;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .modal-actions {
            margin-top: 20px;
            display: flex;
            justify-content: space-evenly;
        }

        .modal .btn {
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 4px;
        }

        .modal .btn.submit {
            background-color: #007bff;
            color: white;
        }

        .modal .btn.cancel {
            background-color: #dc3545;
            color: white;
        }

        .modal.visible {
            visibility: visible;
            opacity: 1;
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
            <!-- TVPSS Version Form -->
            <div class="title-container">
                <h2>Submit TVPSS Version</h2>
            </div>
            
            <div class="form-container">
                
                <form action="<c:url value='/adminschool/view-submitted-tvpss-form'/>" method="POST" enctype="multipart/form-data" id="tvpssForm">
                    <div class="form-group">
                        <label for="schoolCode">School Code</label>
                        <input type="text" name="code" placeholder="Enter school code" value="${school.code}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="schoolName">School Name</label>
                        <input type="text" name="name" placeholder="Enter school name" value="${school.name}" required>
                    </div>

                    <div class="form-group">
                        <label for="address1">Address 1</label>
                        <input type="text" name="address1" placeholder="Enter address 1" value="${school.address1}" required>
                    </div>

                    <div class="form-group">
                        <label for="address2">Address 2</label>
                        <input type="text" name="address2" placeholder="Enter address 2" value="${school.address2}">
                    </div>

                    <div class="form-group">
                        <label for="postcode">Postcode</label>
                        <input type="text" name="postcode" placeholder="Enter postcode" value="${school.postcode}" required>
                    </div>

                    <div class="form-group">
                        <label for="state">State</label>
                        <input type="text" name="state" placeholder="Enter state" value="${school.state}" required>
                    </div>

                    <div class="form-group">
                        <label for="telephoneNumber">Telephone Number</label>
                        <input type="text" name="telephoneNumber" placeholder="Enter telephone number" value="${school.telephoneNumber}" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" name="email" placeholder="Enter email" value="${school.email}" required>
                    </div>

                    <div class="form-group">
                        <label for="logo">School Logo</label>
                        <input type="file" name="logo" accept="image/*">
                    </div>

                    <div class="form-group">
                        <label for="youtubeLink">YouTube Link</label>
                        <input type="url" name="youtubeLink" placeholder="Enter YouTube link" value="${school.youtubeLink}">
                    </div>

                    <!-- Additional TVPSS Version Fields -->
                    <div class="form-group">
                        <label for="connerminittv">Connerminittv Available</label>
                        <select name="connerminittv" required>
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="recordingEquipment">Recording Equipment Available</label>
                        <select name="recordingEquipment" required>
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="greenScreenTechnology">Green Screen Technology</label>
                        <select name="greenScreenTechnology" required>
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
                        </select>
                    </div>

                    <!-- Submit Button -->
                    <div class="form-actions">
                        <button type="button" class="btn submit" onclick="showConfirmationModal()">Submit</button>
                    </div>
                </form>
            </div>
        </section>
    </div>

    <!-- Confirmation Modal -->
    <div id="confirmationModal" class="modal">
        <div class="modal-content">
            <h3>Confirmation Message</h3>
            <p>Are you sure you want to submit the TVPSS version?</p>
            <div class="modal-actions">
                <button class="btn cancel" onclick="hideConfirmationModal()">Cancel</button>
                <button class="btn submit" onclick="submitTvpssForm()">Confirm</button>
            </div>
        </div>
    </div>

    <script>
        // Show the confirmation modal
        function showConfirmationModal() {
            const modal = document.getElementById('confirmationModal');
            modal.classList.add('visible');
        }

        // Hide the confirmation modal
        function hideConfirmationModal() {
            const modal = document.getElementById('confirmationModal');
            modal.classList.remove('visible');
        }

        // Submit the form when the user confirms
        function submitTvpssForm() {
            hideConfirmationModal(); // Close the modal
            document.getElementById('tvpssForm').submit(); // Submit the form
        }
    </script>
</body>
</html>
