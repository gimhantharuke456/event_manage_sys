<%@ page import="java.util.List" %>
<%@ page import="models.Feedback" %>
<%@ page import="models.Package" %>
<%@ page import="services.FeedbackService" %>
<%@ page import="services.PackageService" %>

<%
    Feedback feedback = (Feedback) request.getAttribute("feedback");
    List<Package> packages = (List<Package>) request.getAttribute("packages");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Feedback</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom styles -->
    <style>
        body {
            padding: 20px;
        }

        form {
            max-width: 600px;
            margin: auto;
        }

        h1 {
            text-align: center;
        }
    </style>
</head>
<body>

<h1>Edit Feedback</h1>

<!-- Form for editing feedback -->
<form action="feedbacks?action=update&id=<%=feedback.getFeedbackId()%>" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="rId" value="<%= feedback.getFeedbackId() %>">

    <div class="form-group">
        <label for="rating1">Rating 1:</label>
        <input type="number" class="form-control" name="rating1" value="<%= feedback.getRating1() %>" required>
    </div>

    <div class="form-group">
        <label for="rating2">Rating 2:</label>
        <input type="number" class="form-control" name="rating2" value="<%= feedback.getRating2() %>" required>
    </div>

    <div class="form-group">
        <label for="rating3">Rating 3:</label>
        <input type="number" class="form-control" name="rating3" value="<%= feedback.getRating3() %>" required>
    </div>

    <div class="form-group">
        <label for="comment">Comment:</label>
        <textarea class="form-control" name="comment" required><%= feedback.getComment() %></textarea>
    </div>

    <div class="form-group">
        <label for="packageId">Package ID:</label>
        <select class="form-control" name="packageId" disabled>
            <% for (Package aPackage : packages) { %>
                <option value="<%= aPackage.getPackageId() %>" <%= (aPackage.getPackageId() == feedback.getPackageId()) ? "selected" : "" %>><%= aPackage.getPackageId() %></option>
            <% } %>
        </select>
    </div>

    <button type="submit" class="btn btn-primary">Update Feedback</button>
</form>

</body>
</html>
