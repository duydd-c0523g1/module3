<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/29/2023
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Manager</title>
</head>
<body>
<form action="/?action=create" method="post">
    <table>
        <tr>
            <th>Add new user</th>
        </tr>
        <tr>
            <td><label for="name">User name: </label></td>
            <td><input type="text" name="name" id="name" required></td>
        </tr>
        <tr>
            <td><label for="email">User email: </label></td>
            <td><input type="text" name="email" id="email" required></td>
        </tr>
        <tr>
            <td><label for="country">Country: </label></td>
            <td><input type="text" name="country" id="country" required></td>
        </tr>
        <tr>
            <td><input type="submit" value="Add"></td>
        </tr>
    </table>
</form>
</body>
</html>
