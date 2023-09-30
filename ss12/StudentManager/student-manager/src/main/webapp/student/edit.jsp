<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/30/2023
  Time: 9:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Manager</title>
</head>
<body>
<form action="/?action=save" method="post">
  <table>
    <tr>
      <label for="id">ID: </label>
      <td><input type="number" name="id" id="id" value="${student.id}" readonly></td>
    </tr>
    <tr>
      <label for="name">Name: </label>
      <td><input type="text" name="name" id="name" value="${student.name}" required></td>
    </tr>
    <tr>
      <label for="dob">Birthday: </label>
      <td><input type="date" name="dob" id="dob" value="${student.dob}" required></td>
    </tr>
    <tr>
      <label for="class">Class: </label>
      <td><input type="text" name="class" id="class" value="${student.classId}"></td>
    </tr>
    <tr>
      <label for="email">Email: </label>
      <td><input type="email" name="email" id="email" value="${student.email}"></td>
    </tr>
    <tr>
      <label for="phone">Phone: </label>
      <td><input type="tel" name="phone" id="phone" value="${student.phone}" required></td>
    </tr>
    <tr>
      <td><input type="submit" value="Save"></td>
    </tr>
  </table>
</form>
</body>
</html>
