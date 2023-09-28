<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/28/2023
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Manager</title>
</head>
<body>
<table>
  <form action="/product-controller?action=add" method="post">
    <table>
      <tr>
        <th>Add new product</th>
      </tr>
      <tr>
        <td><label for="name">Product name</label></td>
        <td><input type="text" name="name" id="name" required></td>
      </tr>
      <tr>
        <td><label for="price">Product price</label></td>
        <td><input type="number" name="price" id="price" required></td>
      </tr>
      <tr>
        <td><label for="manufacturer">Manufacturer</label></td>
        <td><input type="text" name="manufacturer" id="manufacturer" required></td>
      </tr>
      <tr>
        <td><label for="description">Description</label></td>
        <td><input type="text" name="description" id="description" required></td>
      </tr>
      <tr>
        <td>
          <input type="submit" value="Add">
        </td>
      </tr>
    </table>
  </form>
</table>
</body>
</html>
