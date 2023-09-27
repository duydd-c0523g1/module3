<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/27/2023
  Time: 1:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<h1>SIMPLE CALCULATOR</h1>
<fieldset>
    <legend>Calculator</legend>

    <form action="/?" method="post">
        <table>
            <tr>
                <td><label for="firstOp">First operand </label></td>
                <td><input type="number" name="firstOp" id="firstOp"><br></td>
            </tr>
            <tr>
                <td><label for="operator">Operator: </label></td>
                <td>
                    <select name="operator" id="operator">
                        <option value="Addition">Addition</option>
                        <option value="Subtraction">Subtraction</option>
                        <option value="Multiplication">Multiplication</option>
                        <option value="Division">Division</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="secondOp">Second operand </label></td>
                <td><input type="number" name="secondOp" id="secondOp"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Calculate"></td>
                <td><p>Result: ${result}</p></td>
            </tr>
        </table>
    </form>
</fieldset>
</body>
</html>
