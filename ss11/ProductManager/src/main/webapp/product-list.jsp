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
    <link rel="stylesheet" href="style.css">
</head>
<body>

<table border="1" style="border-collapse: collapse">
    <form action="product-controller?action=findId" method="post">
        <tr>
            <td><label for="id">Find product by ID: </label></td>
            <td colspan="2"><input type="number" name="idToFind" id="id" required></td>
            <td colspan="3" style="text-align: center; padding: 0px 10px"><input type="submit" value="Find"></td>
        </tr>
        <tr>
            <td style="color: red; text-align: center" colspan="6"><p>${result}</p>
        </tr>
        </td>
    </form>
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
            <td><a href="product-controller?action=fill&productId=${product.id}">Edit</a></td>
            <td><a href="product-controller?action=delete&productId=${product.id}">Delete</a></td>
        </tr>
    </c:forEach>
    <tr style="text-align: center">
        <td colspan="6" style="color: red"><p>${listEmpty}</p></td>
    </tr>
</table>
</body>
</html>
