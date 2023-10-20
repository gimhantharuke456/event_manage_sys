<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Order" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Orders List</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2>Orders List</h2>
        <!-- Display the list of orders -->
        <table class="table">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Ordered By</th>
                    <th>Ordered At</th>
                    <th>Address</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Order> orders = (List<Order>) request.getAttribute("orders");
                    if (orders != null) {
                        for (Order order : orders) { %>
                            <tr>
                                <td><%= order.getId() %></td>
                                <td><%= order.getOrderedBy() %></td>
                                <td><%= order.getOrderedAt() %></td>
                                <td><%= order.getAddress() %></td>
                                <td>
                                    <!-- Edit button with data-order-id attribute -->
                                    <a href="<%= request.getContextPath() %>/orders?action=edit&orderId=<%=order.getId()%>" class="btn btn-primary editOrderLink" data-order-id="<%= order.getId()%>">Edit</a>
                                    <!-- Delete button with data-order-id attribute -->
                                    <a href="#" class="btn btn-danger deleteOrderLink" data-order-id="<%= order.getId()%>" data-toggle="modal" data-target="#deleteConfirmationModal">Delete</a>
                                </td>
                            </tr>
                <% } } %>
            </tbody>
        </table>

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
                        Are you sure you want to delete this order?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        
                        <a href="#" class="btn btn-danger" id="deleteOrderLink">Delete</a>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                // Delete Order link click handler
                $('.deleteOrderLink').click(function () {
                    var orderId = $(this).data('order-id');
                    
                    $('#deleteOrderLink').attr('href', '<%= request.getContextPath() %>/orders?action=delete&orderId=' + orderId);
                    // Show the delete confirmation modal
                    $('#deleteConfirmationModal').modal('show');
                });

                // Delete confirmation modal "Delete" button click handler
                $('#deleteOrderLink').click(function () {
                    var deleteUrl = $(this).attr('href');

                    // Make an AJAX request to the servlet to delete the order
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
                            console.error('Failed to delete order. Error: ' + error);
                        }
                    });
                });
            });
        </script>
    </div>
</body>
</html>
