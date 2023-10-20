<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Supplier" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Supplier List</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2>Supplier List</h2>
        <!-- Display the list of suppliers -->
        <table class="table">
            <thead>
                <tr>
                    <th>Email</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Contact Number</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers");
                    if (suppliers != null) {
                        for (Supplier supplier : suppliers) { %>
                            <tr>
                                <td><%= supplier.getEmail() %></td>
                                <td><%= supplier.getName() %></td>
                                <td><%= supplier.getAddress() %></td>
                                <td><%= supplier.getContactNumber() %></td>
                                <td>
                                    <!-- Edit button with data-supplier-email attribute -->
                                    <a href="<%= request.getContextPath() %>/suppliers?action=edit&email=<%=supplier.getEmail()%>" class="btn btn-primary editSupplierLink" data-supplier-email="<%= supplier.getEmail()%>">Edit</a>
                                    <!-- Delete button with data-supplier-email attribute -->
                                    <a href="#" class="btn btn-danger deleteSupplierLink" data-supplier-email="<%= supplier.getEmail()%>" data-toggle="modal" data-target="#deleteConfirmationModal">Delete</a>
                                </td>
                            </tr>
                <%} } %>
            </tbody>
        </table>
        <!-- Add new supplier form -->
        <h2>Add New Supplier</h2>
        <form action="${pageContext.request.contextPath}/suppliers?action=create" method="post" id="supplierForm">
            <input type="hidden" name="action" id="formAction" value="create">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="contactNumber">Contact Number:</label>
                <input type="tel" class="form-control" id="contactNumber" name="contactNumber" required>
            </div>
            <button type="submit" class="btn btn-success">Add Supplier</button>
        </form>
    </div>

    <!-- Delete confirmation modal -->
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
                    Are you sure you want to delete this supplier?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    
                    <a href="#" class="btn btn-danger" id="deleteSupplierLink">Delete</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JS and Popper.js -->
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
            // Delete Supplier link click handler
            $('.deleteSupplierLink').click(function () {
                var supplierEmail = $(this).data('supplier-email');
                
                $('#deleteSupplierLink').attr('href', '<%= request.getContextPath() %>/suppliers?action=delete&email=' + supplierEmail);
                // Show the delete confirmation modal
                $('#deleteConfirmationModal').modal('show');
            });

            // Delete confirmation modal "Delete" button click handler
            $('#deleteSupplierLink').click(function () {
                var deleteUrl = $(this).attr('href');

                // Make an AJAX request to the servlet to delete the supplier
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
                        console.error('Failed to delete supplier. Error: ' + error);
                    }
                });
            });
        });
    </script>
</body>
</html>
