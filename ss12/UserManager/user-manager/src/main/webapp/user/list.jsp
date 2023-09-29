<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/29/2023
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User Manager</title>
</head>
<body>
<form action="/?action=find-country" method="post">
    <table>
        <tr>
            <td><input type="text" required placeholder="Find by country" name="country"></td>
            <td><input type="submit" value="Find"></td>
        </tr>
        <tr>
            <td><a href="/?action=order-name">Sort list by name</a></td>
        </tr>
    </table>
</form>
<table border="1" style="border-collapse: collapse">
    <tr>
        <th colspan="6">User List</th>
    </tr>
    <tr>
        <td colspan="6" style="text-align: center"><a href="user/create.jsp">Add new user</a></td>
    </tr>
    <tr>
        <th>Order</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
    </tr>
    <c:forEach items="${userList}" var="user" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><a href="/?action=edit&id=${user.id}">Edit</a></td>
            <td><a href="/?action=delete&id=${user.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
