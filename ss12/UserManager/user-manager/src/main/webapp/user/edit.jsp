<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/29/2023
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Manager</title>
</head>
<body>
<form action="/?action=edit" method="post">
    <table>
        <tr>
            <td><label for="id">User ID: </label></td>
            <td><input type="number" value="${user.id}" id="id" name="id" readonly></td>
        </tr>
        <tr>
            <td><label for="name">User name: </label></td>
            <td><input type="text" value="${user.name}" id="name" name="name" required></td>
        </tr>
        <tr>
            <td><label for="email">Email: </label></td>
            <td><input type="text" value="${user.email}" id="email" name="email" required></td>
        </tr>
        <tr>
            <td><label for="country">Country: </label></td>
            <td><input type="text" value="${user.country}" id="country" name="country" required></td>
        </tr>
        <tr>
            <td><input type="submit" value="Save"></td>
        </tr>
    </table>
</form>
</body>
</html>
