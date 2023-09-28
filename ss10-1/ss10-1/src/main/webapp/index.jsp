<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/27/2023
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
  <table border="1" style="border-collapse: collapse">
    <tr>
      <th colspan="4" style="text-align: center">Danh sách khách hàng</th>
    </tr>
    <tr>
      <th>Tên</th>
      <th>Ngày sinh</th>
      <th>Địa chỉ</th>
      <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customersList}" varStatus="thisCustomer">
      <tr>
        <td style="padding: 10px">${customer.name}</td>
        <td style="padding: 10px">${customer.dob}</td>
        <td style="padding: 10px">${customer.address}</td>
        <td><img src="${customer.picture}" alt="" style="width: 100px" height="auto"></td>
      </tr>
    </c:forEach>

  </table>
  </body>
</html>
