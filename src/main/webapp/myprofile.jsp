<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.UserModel" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>My profile | Heara</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/indexStyle.css"/>
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="swiper-bundle.min.css">
    <!-- Unicons CSS -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
    <script src="script.js" defer></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <script src="script.js" defer></script>
    <style>
    .left30{
      width: 30%;
    margin-left: 1%;
    float:left;
    }
    .ul{
      list-style-type: none;
    background-color: gray;
    padding: 11px;
    margin: 5%;
    border-radius: 10px;
    text-align: center;
    }
    .left70{
      width: 60%;
      background:gray;
      float:left;
      height:500px;
      margin: 1%;
    border-radius: 10px;
    }
    .formDiv{
      width:40%;
      margin:0 auto;
    }
    .inputText{
      width:100%;
      padding:5px;
      border:1px solid black;
      border-radius:5px;
    }
    .logoutbtn{
      padding: 10px 42%;
      background: red;
      border-radius: 10px;
   
    }
    .updatebtn{
      padding: 10px;
      background: green;
      border-radius: 10px;
      margin: 0 18%;
  
    }
    .dltbtn{
      padding: 10px;
      background: red;
      border-radius: 10px;
    }
    .dltbtn:hover{
        background:#960f0f;
    }
    .updatebtn:hover{
        background:#127a19;
    }
    .logoutbtn:hover{
        background:#960f0f;
    }
</style>
</head>
<body>

<!--header------------>
<nav class="nav">
    <!-- Your existing navigation content -->
</nav>

<div style="width: 100%; float: left; margin-bottom: 6%;">
    <div class="left30">
        <ul class="ul">
            <li>User Profile</li>
        </ul>
    </div>
    <div class="left70">
        <div class="formDiv">
            <% if (request.getAttribute("user") != null) { %>
                <div>
              
                    <!-- Display user information -->
                    <form>
                        <label>Name</label>
                        <input type='text' name='name' class='inputText' value='<%= ((UserModel)request.getAttribute("user")).getName() %>' readonly><br>
                        <label>User Name</label>
                        <input type='text' name='username' class='inputText' value='<%= ((UserModel)request.getAttribute("user")).getUsername() %>' readonly><br>
                        <label>Email</label>
                        <input type='text' name='email' class='inputText' value='<%= ((UserModel)request.getAttribute("user")).getEmail() %>' readonly><br>
                    </form>
              </div>

                <!-- Update form -->
                <form action="profile" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="email" value='<%= ((UserModel)request.getAttribute("user")).getEmail() %>'>

                    <label>New Full Name</label>
                    <input type="text" name="fullName" class="inputText" required><br>

                  <div style="margin: 5% 24%;display:flex;">

                    <button type="submit" class="updatebtn">Update</button>
                  
            		
        		</div>
        		
                </form>
                <form action="profile?action=delete" method="post">
                
                <button type="submit"  class="dltbtn">Delete</a>
                </form>
            <% } %>
        </div>
        
    </div>
</div>

<!--footer------------>
<!-- Your existing footer content -->
</body>
</html>
