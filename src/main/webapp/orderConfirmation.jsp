<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.Order" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2>Order Confirmation</h2>
        <div class="alert alert-success" role="alert">
            Your order has been placed successfully!
        </div>
        
        <!-- Display order details -->
        <h4>Order Details:</h4>
         <form action="<%= request.getContextPath() %>/orders?action=create" method="post">
        <% 
            Order order = (Order) request.getSession().getAttribute("order");
        Cookie[] cookies = request.getCookies();
        String userEmail = null;

       if (cookies != null) {
           for (Cookie cookie : cookies) {
               if ("email".equals(cookie.getName())) {
                   userEmail = cookie.getValue();
                   break;
               }
           }
       }
      
            %>

       
        	<input style="display:none" name="orderedAt" value="<%= order.getOrderedAt() %>"/>
        	<input style="display:none" name="orderedBy" value="<%= userEmail %>"/>
        	<input style="display:none" name="item_name" value="<%= order.getItemName() %>"/>
        	 <div class="form-group">
                        <label for="email">Address:</label>
                        <input type="text" class="form-control" id="email" name="address"  >
                    </div>
        	<div style="display:flex;gap:16px;">
        	    <button type="submit" class="btn btn-primary">Place Order</button>
            <a href="<%= request.getContextPath() %>/medicine-catalog" class="btn btn-secondary">Back to Medicine Catalog</a>
        	</div>
        </form>
        
        
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
