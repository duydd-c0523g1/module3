<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/28/2023
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find customer by id</title>
</head>
<body>
<table border="1">
    <tr>
        <th colspan="3" style="text-align: center">Result</th>
    </tr>
    <tr>
        <th>Customer's name</th>
        <th>Customer's email</th>
        <th>Customer's address</th>
    </tr>
    <tr>
        <td>${result.name}</td>
        <td>${result.email}</td>
        <td>${result.address}</td>
    </tr>
</table>
</body>
</html>
