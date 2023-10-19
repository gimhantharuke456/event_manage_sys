<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Package" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Packages Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Add your additional styles if needed -->
</head>
<body>

<div class="container mt-4">
    <h2>Packages Management</h2>

    <!-- Display success or error messages -->

    <!-- Display all packages -->
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Package ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Package> packages = (List<Package>) request.getAttribute("packages");
            if (packages != null) {
                for (Package pkg : packages) {
        %>
        <tr>
            <td><%= pkg.getId() %></td>
            <td><%= pkg.getName() %></td>
            <td><%= pkg.getPrice() %></td>
            <td>
                <!-- Edit button with data-package-id attribute -->
                <a href="#" class="btn btn-primary editPackageLink" data-package-id="<%= pkg.getId() %>">Edit</a>
                <!-- Delete button with data-package-id attribute -->
                <a href="#" class="btn btn-danger deletePackageLink" data-package-id="<%= pkg.getId() %>">Delete</a>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
    <!-- Add a link to create a new package -->
    <a href="#" id="addPackageLink" class="btn btn-success">Create New Package</a>

</div>

<!-- Add Package Modal -->
<div id="addPackageModal" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Add Package</h3>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <!-- Add Package Form with client-side validation -->
                <form action="<%= request.getContextPath() %>/package?action=create" method="post" id="addPackageForm">
                    <div class="form-group">
                        <label for="packageName">Package Name:</label>
                        <input type="text" class="form-control" id="packageName" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="packagePrice">Package Price:</label>
                        <input type="text" class="form-control" id="packagePrice" name="price" required>
                    </div>
                    <!-- Add other form fields as needed -->
                    <button type="submit" class="btn btn-primary">Add Package</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Edit Package Modal -->
<div id="editPackageModal" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Edit Package</h3>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <!-- Edit Package Form with client-side validation -->
                <form action="<%= request.getContextPath() %>/package?action=update" method="post" id="editPackageForm">
                    <input type="hidden" id="editPackageId" name="id">
                    <div class="form-group">
                        <label for="editPackageName">Package Name:</label>
                        <input type="text" class="form-control" id="editPackageName" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="editPackagePrice">Package Price:</label>
                        <input type="text" class="form-control" id="editPackagePrice" name="price" required>
                    </div>
                    <!-- Add other form fields as needed -->
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div id="deleteConfirmationModal" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Confirm Deletion</h3>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this package?</p>
            </div>
            <div class="modal-footer">
                <a href="#" id="deletePackageLink" class="btn btn-danger">Delete</a>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
    // Show add package modal on click
    $('#addPackageLink').click(function() {
        $('#addPackageModal').show();
    });

    // Show edit package modal on click
    $('.editPackageLink').click(function() {
        var packageId = $(this).data('package-id');
        // Load package data using AJAX and populate the edit modal
        loadEditData(packageId);
    });

    // Show delete confirmation modal on click
    $('.deletePackageLink').click(function() {
        var packageId = $(this).data('package-id');
        // Set the delete link href dynamically based on packageId
        $('#deletePackageLink').attr('href', '<%= request.getContextPath() %>/package?action=delete&id=' + packageId);
        $('#deleteConfirmationModal').show();
    });

    // Client-side validation for Add Package Form
    $('#addPackageForm').submit(function(event) {
        // Example: Add validation logic for each field
        if ($('#packageName').val().trim() === '' || $('#packagePrice').val().trim() === '') {
            alert('Package Name and Price are required.');
            event.preventDefault(); // Prevent form submission
        }
    });

    // Client-side validation for Edit Package Form
    $('#editPackageForm').submit(function(event) {
        // Example: Add validation logic for each field
        if ($('#editPackageName').val().trim() === '' || $('#editPackagePrice').val().trim() === '') {
            alert('Package Name and Price are required.');
            event.preventDefault(); // Prevent form submission
        }
    });

    function loadEditData(packageId) {
        // Make an AJAX request to fetch data for the selected package
        fetch('<%= request.getContextPath() %>/package?action=edit&id=' + packageId, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        })
        .then(response => response.json())
        .then(data => {
            // Populate the fields in the edit modal with the fetched data
            $('#editPackageId').val(packageId);  // Set the package ID in the hidden input field
            $('#editPackageName').val(data.name);
            $('#editPackagePrice').val(data.price);

            // Show the edit modal
            $('#editPackageModal').show();
        })
        .catch(error => {
            // Handle errors
            console.error('Failed to fetch data for package ID: ' + packageId);
        });
    }
});
</script>
</body>
</html>


