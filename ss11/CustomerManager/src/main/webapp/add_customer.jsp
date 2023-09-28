<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/28/2023
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new customer</title>
</head>
<body>
<form action="/?action=create" method="post">
    <table>
        <tr>
            <label for="name">Customer's name</label>
            <td><input type="text" name="name" id="name" required></td>
        </tr>
        <tr>
            <label for="email">Customer's email</label>
            <td><input type="text" name="email" id="email" required></td>
        </tr>
        <tr>
            <label for="email">Customer's address</label>
            <td><input type="text" name="address" id="address" required></td>
        </tr>
        <tr><td><input type="submit" value="Add"></td></tr>
    </table>
</form>
</body>
</html>
