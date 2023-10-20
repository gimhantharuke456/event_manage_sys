<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vehicle List</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h2>Vehicle List</h2>
                <!-- Display the list of vehicles -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>Vehicle ID</th>
                            <th>Model</th>
                            <th>Make</th>
                            <th>Availability</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="vehicle" items="${vehicles}">
                            <tr>
                                <td>${vehicle.vehicleId}</td>
                                <td>${vehicle.model}</td>
                                <td>${vehicle.make}</td>
                                <td>${vehicle.availability}</td>
                                <td>
                                    <a href="<%= request.getContextPath() %>/vehicles?action=update&vehicleId=${vehicle.vehicleId}" class="btn btn-warning">Update</a>
                                    <a href="<%= request.getContextPath() %>/vehicles?action=delete&vehicleId=${vehicle.vehicleId}" class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!-- Add new vehicle form -->
                <h2>Add New Vehicle</h2>
                <form action="<%= request.getContextPath() %>/vehicles" method="post">
                    <input type="hidden" name="action" value="create">
                    <div class="form-group">
                        <label for="model">Model:</label>
                        <input type="text" class="form-control" id="model" name="model" required>
                    </div>
                    <div class="form-group">
                        <label for="make">Make:</label>
                        <input type="text" class="form-control" id="make" name="make" required>
                    </div>
                    <div class="form-group">
                        <label for="availability">Availability:</label>
                        <input type="checkbox" class="form-check-input" id="availability" name="availability" value="true">
                    </div>
                    <button type="submit" class="btn btn-success">Add Vehicle</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
