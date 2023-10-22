<%@ page import="java.util.List" %>
<%@ page import="models.Booking" %>
<%@ page import="models.Package" %>
<%@ page import="services.BookingService" %>
<%@ page import="services.PackageService" %>
<%
    PackageService pkg = new PackageService();
    List<Booking> bookings =(List<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking List</title>
    <!-- Add your Bootstrap CSS link here -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyO2BUbuKRcJNoN9vI82+cO+hXO1NQPD8X"
          crossorigin="anonymous">
    <style>
        body {
            padding: 20px;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            text-align: left;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #dee2e6;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
        /* styles.css */

body {
    font-family: 'Arial', sans-serif;
    background-color: #f8f9fa;
}

.container {
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin-top: 20px;
}

h1 {
    color: #007bff;
}

.btn-primary {
    background-color: #007bff;
    border: 1px solid #007bff;
}

.btn-primary:hover {
    background-color: #0056b3;
    border: 1px solid #0056b3;
}

.table {
    width: 100%;
    margin-top: 20px;
    border-collapse: collapse;
    text-align: left;
}

.table th, .table td {
    padding: 12px;
    border-bottom: 1px solid #dee2e6;
}

.table th {
    background-color: #007bff;
    color: white;
}

.table tbody tr:hover {
    background-color: #f5f5f5;
}
        
    </style>
</head>
<body>

<div class="container">
    <h1 class="mt-4 mb-4">Booking List</h1>
	<a href="bookreserve.jsp">Add Booking</a>
    
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Booking ID</th>
            <th>Package Name</th>
            <th>Name</th>
            
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (Booking booking : bookings) { 
        	int id =booking.getPackageId();
        	Package pakg = pkg.getPackageById(id);
        %>
        	
            <tr>
                <td><%= booking.getBookingId() %></td>
                
                <td><%= pakg.getPackageName() %></td>
                <td><%= booking.getCustomerName() %></td>
                <!-- Add more columns as needed -->
                <td>
                    <a href="bookings?action=edit&id=<%= booking.getBookingId() %>" class="btn btn-primary btn-sm">Edit</a>
                    <a href="bookings?action=delete&id=<%= booking.getBookingId() %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>

<!-- Add your Bootstrap JS and jQuery scripts here -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-XrEUWmON8ZlVaCz9dILC7NjuEfnN6gngVrj4yzgF3HcqTQp0FqRIpswqLQlmh/jW"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyO2BUbuKRcJNoN9vI82+cO+hXO1NQPD8X"
        crossorigin="anonymous"></script>

</body>
</html>
