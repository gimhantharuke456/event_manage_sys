<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="models.Order" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Edit Order</title>
    <!-- Include Bootstrap CSS -->
    <link
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
  </head>
  <body class="bg-light">
    <div class="container mt-5">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <h2>Edit Order</h2>
          <!-- Edit order form -->
          <% Order order = (Order) request.getAttribute("order");
          if(order!=null){ %>
          <form action="<%= request.getContextPath() %>/orders?action=edit" method="post">
            <input type="hidden" name="action" value="update" />
            <input
              type="hidden"
              name="orderId"
              value="<%= order.getId() %>"
            />
            <div class="form-group"  style="display:none">
              <label for="orderedBy">Ordered By:</label>
              <input
                type="text"
                class="form-control"
                id="orderedBy"
                name="orderedBy"
                value="<%= order.getOrderedBy() %>"
                required
               
              />
            </div>
             <div class="form-group">
              <label for="address">Ordered Address:</label>
              <input
                type="text"
                class="form-control"
                id="address"
                name="address"
                value="<%= order.getAddress()%>"
                required
              />
             </div>
            <div class="form-group" style="display:none">
              <label for="orderedAt">Ordered At:</label>
              <input
                type="text"
                class="form-control"
                id="orderedAt"
                name="orderedAt"
                value="<%= order.getOrderedAt() %>"
                required
              />
            </div>
            <!-- Add more fields for editing order details as needed -->
            <button type="submit" class="btn btn-primary">Save Changes</button>
          </form>
          <% } %>
        </div>
      </div>
    </div>

    <!-- Include Bootstrap JS and Popper.js -->
    <script
      src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
