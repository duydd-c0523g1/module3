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
    <meta charset="UTF-8">
</head>
<body>
<table>
    <form action="product-controller?action=findId" method="post">
        <tr>
            <td><label for="id">Find product by ID: </label></td>
            <td><input type="number" name="idToFind" id="id" required></td>
        </tr>
        <tr>
            <td><input type="submit" value="Find"></td>
        </tr>
        <tr>
            <td><p>${result}</p>
        </tr>
        </td>
    </form>
</table>
<table border="1" style="border-collapse: collapse">
    <tr>
        <th colspan="6" style="text-align: center;">Product List</th>
    </tr>
    <tr>
        <th colspan="6"><a href="/add-product.jsp">Add new product</a></th>
    </tr>
    <tr style="text-align: center">
        <td>Product name</td>
        <td>Price</td>
        <td>Manufacturer</td>
        <td>Description</td>
        <td colspan="2">Functions</td>
    </tr>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.manufacturer}</td>
            <td>${product.description}</td>
            <td><a href="product-controller?action=fill&productId=${product.id}">Edit product</a></td>
            <td><a href="product-controller?action=delete&productId=${product.id}">Delete product</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
