<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Medicine" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medicine Catalog</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2>Medicine Catalog</h2>
        <!-- Display the list of medicines -->
        <div class="row">
            <% 
                List<Medicine> medicines = (List<Medicine>) request.getAttribute("medicines");
                if (medicines != null) {
                    for (Medicine medicine : medicines) { %>
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title"><%= medicine.getName() %></h5>
                                    <p class="card-text">Price: <%= medicine.getPrice() %></p>
                                    <p class="card-text">Availability: <%= medicine.getAvailability() == 1 ? "Available" : "Not Available" %></p>
                                    <!-- Order form for each medicine -->
                                    <form action="<%= request.getContextPath() %>/placeOrder" method="post">
                                        <input type="hidden" name="medicineId" value="<%= medicine.getId() %>">
                                        <input type="hidden" name="medicineName" value="<%= medicine.getName() %>">
                                        <input type="hidden" name="medicinePrice" value="<%= medicine.getPrice() %>">
                                       
                                        <button type="submit" class="btn btn-primary">Buy</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                <%} } %>
        </div>
        
        <a href="<%= request.getContextPath() %>/orders" class="btn btn-info">View Orders</a>
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
</body>
</html>
