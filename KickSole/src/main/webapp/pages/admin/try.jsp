<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Random Form</title>
</head>
<body>
    <h1>Random Form Submission</h1>
    <form action="<%= request.getContextPath() %>/RandomServletJava" method="post">
    
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="favorite_color">Favorite Color:</label>
        <input type="text" id="favorite_color" name="favorite_color"><br><br>

        <input type="hidden" name="hiddenField" value="randomValue123">

        <button type="submit">Submit</button>
    </form>
</body>
</html>

