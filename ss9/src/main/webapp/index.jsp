<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/26/2023
  Time: 11:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<form action="/discount-servlet" method="post">
    <table>
        <tr>
            <td>
                <label for="productDesc">Product Description</label>
            </td>
            <td>
                <input type="text" name="prodDesc" id="productDesc"> <br>
            </td>
        </tr>
        <tr>
            <td>
                <label for="price">Price</label>
            </td>
            <td>
                <input type="number" name="prodPrice" id="price"> <br>
            </td>
        </tr>
        <tr>
            <td>
                <label for="discount">Discount Percent</label>
            </td>
            <td>
                <input type="number" name="discountPercent" id="discount"> <br>
            </td>
        </tr>
    </table>
    <input type="submit" value="Calculate">
</form>

</body>
</html>
