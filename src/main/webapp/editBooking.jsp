<%@ page import="models.Booking" %>
<%@ page import="services.PackageService" %>
<%@ page import="models.Package" %>
<%@ page import="services.BookingService" %>
<%@ page import="java.util.List" %>

<%
    Booking booking = (Booking) request.getAttribute("booking");
    List<Package> packages = (List<Package>) request.getAttribute("packages");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Booking</title>
    <!-- Custom Styles -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 20px auto;
            width: 70%;
        }

        form {
            width: 100%;
            margin: auto;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Edit Booking</h1>

    <form method="POST" action="bookings?action=edit">
        <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">

        <div>
            <label for="packageName">Package Name:</label>
            <select name="packageId" required>
                <% for (Package aPackage : packages) { %>
                    <option value="<%= aPackage.getPackageId() %>" <%= aPackage.getPackageId() == booking.getPackageId() ? "selected" : "" %>><%= aPackage.getPackageName() %></option>
                <% } %>
            </select>
        </div>

        <div>
            <label for="customerName">Customer Name:</label>
            <input type="text" name="customerName" value="<%= booking.getCustomerName() %>" required>
        </div>

        <div>
            <label for="contactNumber">Contact Number:</label>
            <input type="text" name="contactNumber" value="<%= booking.getContactNumber() %>" required>
        </div>

        <div>
            <label for="venueId">Venue:</label>
            <select name="venueId" required>
                <option value="1" <%= 1 == booking.getVenueId() ? "selected" : "" %>>Venue 1</option>
                <option value="2" <%= 2 == booking.getVenueId() ? "selected" : "" %>>Venue 2</option>
                <!-- Add more options as needed -->
            </select>
        </div>

        <button type="submit">Update Booking</button>
    </form>
</div>

</body>
</html>
