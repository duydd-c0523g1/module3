<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/28/2023
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Customer</title>
</head>
<body>
<table>
  <form action="/?action=update-customer" method="post">
    <tr>
      <td><label for="id">Customer's ID</label></td>
      <td><input type="number" name="id" id="id" value="${customer.id}" readonly></td>
    </tr>
    <tr>
      <td><label for="name">Customer's name: </label></td>
      <td><input type="text" name="name" id="name" value="${customer.name}" required></td>
    </tr>
    <tr>
      <td><label for="email">Customer's email: </label></td>
      <td><input type="text" name="email" id="email" value="${customer.email}" required></td>
    </tr>
    <tr>
      <td><label for="address">Customer's address: </label></td>
      <td><input type="text" name="address" id="address" value="${customer.address}" required></td>
    </tr>
    <tr>
      <td><input type="submit" value="Save"></td>
    </tr>
  </form>
</table>
</body>
</html>
