<%@ page import="java.util.List" %>
<%@ page import="models.Feedback" %>
<%@ page import="models.Package" %>
<%@ page import="services.FeedbackService" %>
<%@ page import="services.PackageService" %>

<%
    FeedbackService feedbackService = new FeedbackService();
    PackageService packageService = new PackageService();

    // Get feedbacks and packages
    List<Feedback> feedbacks = feedbackService.getAllFeedbacks();
    List<Package> packages = packageService.getAllPackages();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            color: #007bff;
        }

        table {
            width: 80%;
            margin-top: 20px;
            border-collapse: collapse;
            text-align: left;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        form {
            width: 80%;
            margin-top: 20px;
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
        }

        input, textarea, select {
            margin-bottom: 10px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h1>Feedback Management</h1>

<!-- Display feedback list -->
<table border="1">
    <tr>
        <th>Package ID</th>
        <th>Rating 1</th>
        <th>Rating 2</th>
        <th>Rating 3</th>
        <th>Comment</th>
        <th>Actions</th>
    </tr>
    <% for (Feedback feedback : feedbacks) { %>
        <tr>
            <td><%= feedback.getPackageId() %></td>
            <td><%= feedback.getRating1() %></td>
            <td><%= feedback.getRating2() %></td>
            <td><%= feedback.getRating3() %></td>
            <td><%= feedback.getComment() %></td>
            <td>
                <a href="feedbacks?action=edit&id=<%= feedback.getFeedbackId() %>">Edit</a>
                <a href="feedbacks?action=delete&id=<%= feedback.getFeedbackId() %>">Delete</a>
            </td>
        </tr>
    <% } %>
</table>

<!-- Form for adding new feedback -->
<form action="feedbacks" method="post">
    <input type="hidden" name="action" value="create">
    <label for="rId">Package ID:</label>
    <select name="rId">
        <% for (Package aPackage : packages) { %>
            <option value="<%= aPackage.getPackageId() %>"><%= aPackage.getPackageId() %></option>
        <% } %>
    </select><br>
    <label for="rating1">Rating 1:</label>
    <input type="number" name="rating1" required><br>
    <label for="rating2">Rating 2:</label>
    <input type="number" name="rating2" required><br>
    <label for="rating3">Rating 3:</label>
    <input type="number" name="rating3" required><br>
    <label for="comment">Comment:</label>
    <textarea name="comment" required></textarea><br>
    <input type="submit" value="Add Feedback">
</form>

</body>
</html>
