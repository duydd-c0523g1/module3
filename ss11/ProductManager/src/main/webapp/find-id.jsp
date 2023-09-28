<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/28/2023
  Time: 10:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Manager</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<table border="1" style="border-collapse: collapse">
    <tr style="text-align: center">
        <th colspan="4">Product Found!</th>
    </tr>
    <tr style="text-align: center">
        <th>Product name</th>
        <th>Product price</th>
        <th>Product manufacturer</th>
        <th>Product description</th>
    </tr>
    <tr>
        <td>${result.name}</td>
        <td>${result.price}</td>
        <td>${result.manufacturer}</td>
        <td>${result.description}</td>
    </tr>
    <tr style="text-align: center">
        <td colspan="4"><a href="product-controller?action=list">< Back</a></td>
    </tr>
</table>
</body>
</html>
