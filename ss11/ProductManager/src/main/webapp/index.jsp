<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 9/28/2023
  Time: 7:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Manager</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #1c2630;
        }
        a {
            border: white solid 3px;
            border-radius: 10px;
            padding: 10px 30px;
            color: white;
            text-decoration: none;
            font-size: 2em;
            font-weight: bold;
            transition: 0.5s;
        }
        a:hover {
            letter-spacing: 0.1em;
            font-size: 2.1em;
        }
    </style>
</head>
<body>
<a href="product-controller?action=list">Start Program</a>
</body>
</html>
