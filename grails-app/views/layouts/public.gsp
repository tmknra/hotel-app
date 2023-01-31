<%--
  Created by IntelliJ IDEA.
  User: Roman
  Date: 28.01.2023
  Time: 16:55
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
    <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>
<div class="navbar">
    <a class="active" href="../hotel">Hotels</a>
    <a href="../country/index">Countries</a>
    <a href="#">Search</a>
</div>


<g:layoutBody/>

<div class="footer" role="contentinfo"></div>
</body>
</html>