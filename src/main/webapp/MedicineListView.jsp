<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Medicine" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medicine List</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2>Medicine List</h2>
        <!-- Display the list of medicines -->
        <table class="table">
            <thead>
                <tr>
                    <th>Medicine ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Availability</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                 <% 
                            List<Medicine> medicines = (List<Medicine>) request.getAttribute("medicines");
                            if (medicines != null) {
                                for (Medicine medicine : medicines) { %>
                                    <tr>
                                        <td><%= medicine.getId() %></td>
                                        <td><%= medicine.getName() %></td>
                                        <td><%= medicine.getPrice() %></td>
                                        <td><%= medicine.getAvailability() %></td>
                                        <td>
                                            <!-- Edit button with data-medicine-id attribute -->
                                            <a href="<%= request.getContextPath() %>/medicines?action=edit&medicineId=<%=medicine.getId()%>" class="btn btn-primary editMedicineLink" data-medicine-id="<%= medicine.getId()%>">Edit</a>
                                            <!-- Delete button with data-medicine-id attribute -->
                                            <a href="#" class="btn btn-danger deleteMedicineLink" data-medicine-id="<%= medicine.getId()%>" data-toggle="modal" data-target="#deleteConfirmationModal">Delete</a>
                                        </td>
                                    </tr>
                        <%} } %>
            </tbody>
        </table>
        <!-- Add new medicine form -->
        <h2>Add New Medicine</h2>
        <form action="${pageContext.request.contextPath}/medicines?action=create" method="post" id="medicineForm">
            <input type="hidden" name="action" id="formAction" value="create">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="text" class="form-control" id="price" name="price" required>
            </div>
           <div class="form-group">
    <div class="form-check">
        <input type="checkbox" class="form-check-input" id="availability" name="availability" value="1" checked>
        <label class="form-check-label" for="availability">Available</label>
    </div>
</div>

            <button type="submit" class="btn btn-success">Add Medicine</button>
        </form>
    </div>
    
      <div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmationModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteConfirmationModalLabel">Delete Confirmation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this medicine?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <a href="#" class="btn btn-danger" id="deleteMedicineLink">Delete</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

    <script>
    $(document).ready(function () {
        // Delete Medicine link click handler
        $('.deleteMedicineLink').click(function () {
            var medicineId = $(this).data('medicine-id');

            $('#deleteMedicineLink').attr('href', '<%= request.getContextPath() %>/medicines?action=delete&medicineId=' + medicineId);
            // Show the delete confirmation modal
            $('#deleteConfirmationModal').modal('show');
        });

        // Delete confirmation modal "Delete" button click handler
        $('#deleteMedicineLink').click(function () {
            var deleteUrl = $(this).attr('href');

            // Make an AJAX request to the servlet to delete the medicine
            $.ajax({
                url: deleteUrl,
                type: 'GET',
                success: function (data) {
                    // Handle success, if needed
                    // Reload the page or update the UI
                    window.location.reload();
                },
                error: function (error) {
                    // Handle error, if needed
                    console.error('Failed to delete medicine. Error: ' + error);
                }
            });
        });
    });
    </script>
</body>
</html>
