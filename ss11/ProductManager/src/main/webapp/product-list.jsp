<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/28/2023
  Time: 7:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product Manager</title>
</head>
<body>
<table border="1" style="border-collapse: collapse">
  <tr>
    <th colspan="5" style="text-align: center;">Product List</th>
  </tr>
  <tr>
    <td>Product name</td>
    <td>Price</td>
    <td>Manufacturer</td>
    <td>Description</td>
  </tr>
  <c:forEach var="product" items="${productList}">
    <tr>
      <td>${product.name}</td>
      <td>${product.price}</td>
      <td>${product.manufaturer}</td>
      <td>${product.description}</td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
