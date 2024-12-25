<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Student Achievement</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/achievement.css' />">
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
                <h2>Student Achievement</h2>
            </div>
            
            <div class="breadcrumb-container">
		    <nav aria-label="breadcrumb">
		        <ol class="breadcrumb">
		            <li><a href="student-achievement">Student Achievement List</a></li>
		            <li aria-current="page">Submit Student Achievement</li>
		        </ol>
		    </nav>
			</div>
		<div class="form-container">
		    <h1>Student Information</h1>
		    <form method="POST" action="<c:url value='/adminschool/submit-achievement' />" enctype="multipart/form-data">
		        <!-- Select Form Mode -->
		        <div class="form-group">
		        	<label for="form-mode">Select Form Application</label>
		         	<div class="input-wrapper">
				        <select id="form-mode" name="formMode" onchange="toggleFormMode()">
				        	<option disabled selected>- Choose Form Type-</option>
				            <option value="single">Individual Achievement Form</option>
				            <option value="multiple">Multiple Achievement Form</option>
				        </select>
		            </div>
   				</div>
    					 
		        <!-- Individual Form -->
		        <div id="single-form" style="display: block;">
		        
			        <div class="form-group">
			            <label for="ic-number">IC Number</label>
			            <div class="input-wrapper">
			            	<input type="text" id="ic-number" name="icNumber" value="${achievements.icNumber}" required>
			            </div>
	   				</div>
			        <div class="form-group">   				
			            <label for="full-name">Full Name</label>
			            <div class="input-wrapper">
			            	<input type="text" id="full-name" name="fullName" value="${achievements.fullName}" required>
			            </div>
	   				</div>
	   				<div class="form-group">  		            
			            <label for="activity-name">Activity Name</label>
			            <div class="input-wrapper">
			            <input type="text" id="activity-name-single" name="activityName" value="${achievements.activityName}" required>
			            </div>
	   				</div>
	   				<div class="form-group">  		
			            <label for="category">Category</label>
			            <div class="input-wrapper">
				            <select id="category-single" name="category" required>
		                        <option disabled selected>- Choose Achievement Category -</option>
				                <option value="Academic">Academic Achievement</option>
				                <option value="Cultural">Cultural Achievement</option>
				                <option value="Innovation">Innovation Achievement</option>
				                <option value="Sport">Sport Achievement</option>
				                <option value="Volunteer">Volunteer</option>
				            </select>
			            </div>
	   				</div>
	   				<div class="form-group">  		
			            <label for="sub-category">Sub-category</label>
			            <div class="input-wrapper">
			            	<input type="text" id="sub-category" name="subCategory" >
			            </div>
	   				</div> 	
					<div class="form-group">  
			            <label for="award-info">Award Information</label>
			            <div class="input-wrapper">
				            <select id="award-info" name="awardInfo">
		                        <option disabled selected>- Choose Award -</option>
				                <option value="Champion">Champion / Gold</option>
				                <option value="Runner-up">Runner-up / Silver</option>
				                <option value="Third Place">Third Place / Bronze</option>
				                <option value="Consolation">Consolation / Other Awards</option>
				                <option value="Participation">Participation</option>
				            </select>
			            </div>
	   				</div>
		        </div>
		
		        <!-- Multiple Form -->
		        <div id="multiple-form" style="display: none;">
		        
			        <div class="form-group">  	
			        	<label for="category">Category</label>
			        	<div class="input-wrapper">
				            <select id="category-multiple" name="category" required>
		                        <option disabled selected>- Choose Achievement Category -</option>
				                <option value="Academic">Academic Achievement</option>
				                <option value="Cultural">Cultural Achievement</option>
				                <option value="Innovation">Innovation Achievement</option>
				                <option value="Sport">Sport Achievement</option>
				                <option value="Volunteer">Volunteer</option>
				            </select>
			            </div>
	   				</div>
					<div class="form-group">  
			            <label for="activity-name">Activity Name</label>
			            <div class="input-wrapper">
			            	<input type="text" id="activity-name-multiple" name="activityName" value="${achievements.activityName}" required>
			            </div>
	   				</div>
			        <div class="form-group">     
			            <label for="csv-file">Choose CSV/Excel File</label>
			            <div class="input-wrapper">
			            	<input type="file" id="uploadDoc" name="uploadDoc" accept=".csv, .xlsx">
			            </div>
	   				</div>
					<div class="form-group">  
			            <label for="support-files">Choose Supporting Documents</label>
			            <div class="input-wrapper">
			            	<input type="file" id="support-files" name="supportDoc" multiple>
			            </div>
	   				</div>
		        </div>
			
		        <div class="form-actions">
	                <button type="button" class="btn cancel" onclick="window.history.back()">Cancel</button>
	                <button type="submit" class="btn submit">Submit</button>
                </div>
                
			    </form>
			</div>
			
			<div id="confirmation-dialog" class="confirmation-dialog hidden">
	    		<div class="confirmation-content">
	        		<h3>Are you sure you want to submit the school information?</h3>
	        		<p>The data in your form will be saved if you leave the tab.</p>
	        	<div class="dialog-actions">
	            	<button class="btn cancel" onclick="closeConfirmationDialog()">Cancel</button>
	            	<button class="btn submit" onclick="submitForm()">Submit</button>
	        	</div>
	        	</div>
	        </div>
	        
	        <!-- Success Dialog -->
		    <div id="successModal" class="modal">
		        <div class="modal-content">
		            <span class="close" onclick="closeSuccessDialog()">&times;</span>
		            <h2>${successMessage}</h2>
		            <p>Your data has been recorded to the system.</p>
		        </div>
		    </div>
		</section>
	</div>
	
<script>
function toggleFormMode() {
    const formMode = document.getElementById("form-mode").value;
    const singleForm = document.getElementById("single-form");
    const multipleForm = document.getElementById("multiple-form");

    if (formMode === "single") {
        singleForm.style.display = "block";
        multipleForm.style.display = "none";
    } else if (formMode === "multiple"){
        singleForm.style.display = "none";
        multipleForm.style.display = "block";
    }
}

document.addEventListener('DOMContentLoaded', function () {
    const form = document.querySelector('form');
    const submitButton = document.querySelector('.form-actions .btn.submit');
    const confirmationDialog = document.getElementById('confirmation-dialog');

    submitButton.addEventListener('click', function (event) {
        event.preventDefault(); // Prevent default form submission
        
        // Validate both single and multiple form modes
        const formMode = document.getElementById('form-mode').value;
        
        if (formMode === '') {
            alert('Please select a form application type');
            return;
        }

        if (validateForm(formMode)) {
            openConfirmationDialog();
        }
    });

    function validateForm(formMode) {
        let isValid = true;
        
        // Clear previous error messages
        document.querySelectorAll('.error').forEach(el => el.classList.remove('error'));
        document.querySelectorAll('.error-message').forEach(el => el.remove());

        if (formMode === 'single') {
            // Validate single form fields
            const singleFormFields = document.querySelectorAll('#single-form input[required], #single-form select[required]');
            singleFormFields.forEach(field => {
                if (!field.value.trim()) {
                    isValid = false;
                    addErrorToField(field);
                }
            });
        } else if (formMode === 'multiple') {
            // Validate multiple form fields
            const multipleCategory = document.getElementById('category-multiple');
            const activityName = document.getElementById('activity-name-multiple');
            const fileInput = document.getElementById('uploadDoc');

            if (!multipleCategory.value) {
                isValid = false;
                addErrorToField(multipleCategory);
            }

            if (!activityName.value.trim()) {
                isValid = false;
                addErrorToField(activityName);
            }

            if (!fileInput.files.length) {
                isValid = false;
                addErrorToField(fileInput);
            }
        }

        return isValid;
    }

    function addErrorToField(field) {
        field.classList.add('error');
        const errorText = document.createElement('span');
        errorText.classList.add('error-message');
        errorText.textContent = 'This field is required';
        field.parentNode.appendChild(errorText);
    }

    function openConfirmationDialog() {
        confirmationDialog.classList.remove('hidden');
    }

    function closeConfirmationDialog() {
        confirmationDialog.classList.add('hidden');
    }

    function submitForm() {
        closeConfirmationDialog();
        form.submit();
    }

    // Confirmation dialog buttons
    const cancelButton = document.querySelector('.dialog-actions .btn.cancel');
    cancelButton.addEventListener('click', closeConfirmationDialog);

    const confirmButton = document.querySelector('.dialog-actions .btn.submit');
    confirmButton.addEventListener('click', submitForm);
});
</script>

</body>
</html>
