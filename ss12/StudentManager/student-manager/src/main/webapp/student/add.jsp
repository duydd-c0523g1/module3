<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/30/2023
  Time: 8:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Manager</title>
</head>
<body>
<form action="/?action=add" method="post">
  <table>
    <tr>
      <td><label for="name">Name: </label></td>
      <td><input type="text" name="name" id="name" required></td>
    </tr>
    <tr>
      <td><label for="dob">Brithday: </label></td>
      <td><input type="date" name="dob" id="dob" required></td>
    </tr>
    <tr>
      <td><label for="class">Class: </label></td>
      <td><input type="text" name="class" id="class" value="Pending"></td>
    </tr>
    <tr>
      <td><label for="email">Email: </label></td>
      <td><input type="email" name="email" id="email" value="Pending"></td>
    </tr>
    <tr>
      <td><label for="phone">Phone: </label></td>
      <td><input type="tel" name="phone" id="phone" required></td>
    </tr>
    <tr>
      <td>
        <input type="submit" value="Add">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
