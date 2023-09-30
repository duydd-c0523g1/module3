<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/30/2023
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Student Manager</title>
</head>
<body>
<table border="1" style="border-collapse: collapse">
    <tr>
        <th colspan="8" style="text-align: center">Student List <a href="student/add.jsp"><subtext>Add</subtext></a></th>
    </tr>
    <tr style="text-align: center">
        <td>Order</td>
        <td><a href="/?action=sort-name">Name</a></td>
        <td>Date of birth</td>
        <td>Class</td>
        <td>Email</td>
        <td>Phone</td>
    </tr>
    <c:forEach items="${studentList}" var="student" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${student.name}</td>
            <td>${student.dob}</td>
            <td>${student.classId}</td>
            <td>${student.email}</td>
            <td>${student.phone}</td>
            <td><a href="/?action=edit&id=${student.id}">Edit</a></td>
            <td><a href="/?action=delete&id=${student.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
