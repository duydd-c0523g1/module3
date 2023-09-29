<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/29/2023
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Manager</title>
</head>
<body>
    <table border="1" style="border-collapse: collapse">
        <tr>
            <th>Users in ${user.country}</th>
        </tr>
        <tr>
            <td>Order</td>
            <td>Name</td>
            <td>Email</td>
        </tr>
        <c:forEach items="${result}" var="user" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
            </tr>
        </c:forEach>
        <tr>
            <td>
                <a href="/?action=list">< Back</a>
            </td>
        </tr>
    </table>
</body>
</html>
