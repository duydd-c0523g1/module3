<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/28/2023
  Time: 11:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Customer Manager</title>
</head>
<body>
<table>
  <tr>
    <form action="/?action=find-by-id" method="post">
      <td>Find customer</td>
      <td><input type="number" name="id" id="id" placeholder="Place ID here"></td>
      <td><input type="submit" value="Find"></td>
    </form>
  </tr>
</table>
<p>${result}</p>
<table border="1" style="border-collapse: collapse">
  <tr>
    <th colspan="3">Customer List</th>
  </tr>
  <tr>
    <th>Customer's name</th>
    <th>Customer's email</th>
    <th>Customer's address</th>
    <th colspan="2">Functions</th>
  </tr>
  <c:forEach var="customer" items="${customerList}">
    <tr>
      <td>${customer.name}</td>
      <td>${customer.email}</td>
      <td>${customer.address}</td>
      <td><a href="?customerId=${customer.id}&action=edit" value="${customer.id}">Edit</a></td>
      <td><a href="?customerId=${customer.id}&action=delete" value="${customer.id}">Delete</a></td>
    </tr>
  </c:forEach>
  <tr>
    <td style="text-align: center" colspan="5"><a href="add_customer.jsp">Add new customer</a></td>
  </tr>
</table>
</body>
</html>
