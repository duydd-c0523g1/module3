<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/28/2023
  Time: 9:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
  <table>
      <form action="product-controller?action=edit" method="post">
          <table>
              <tr>
                  <td><label for="id">Product ID: </label></td>
                  <td><input type="number" name="id" id="id" readonly value="${product.id}"></td>
              </tr>
              <tr>
                  <td><label for="name">Product name: </label></td>
                  <td><input type="text" name="name" id="name" required value="${product.name}"></td>
              </tr>
              <tr>
                  <td><label for="price">Product price: </label></td>
                  <td><input type="number" name="price" id="price" required value="${product.price}"></td>
              </tr>
              <tr>
                  <td><label for="manufacturer">Product manufacturer: </label></td>
                  <td><input type="text" name="manufacturer" id="manufacturer" required value="${product.manufacturer}"></td>
              </tr>
              <tr>
                  <td><label for="description">Product description: </label></td>
                  <td><input type="text" name="description" id="description" required value="${product.description}"></td>
              </tr>
              <tr><td colspan="2"><input type="submit" value="Save"></td></tr>
          </table>
      </form>
  </table>
</body>
</html>
