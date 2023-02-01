<%@ page import="org.hotelApp.Country; org.hotelApp.Country" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="public"/>
    <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}"/>
    <title>Countries</title>
</head>

<body>
<g:form class="newEntity" controller="country" action="saveNewCountry" method="post">
    <f:field property="name" label="Name" required="true">
        <g:textField name="name" value=""/>
    </f:field>
    <f:field property="capital" label="Capital" required="true">
        <g:textField name="capital" value=""/>
    </f:field>
    <g:submitButton name="New Country" class="save"/>
</g:form>

<div class="hotel-list">
    <g:form class="filter" controller="country" action="index" params="${[offset ?: 0, max ?: 10]}" method="get">
%{--        <label>Choose from list:<g:select name="country" from="${Country.list().name}" noSelection="['': 'Any']"/></label>--}%
        <label>Enter country name: <g:field type="text" name="searchInput" placeholder="Search..."/></label>
        <g:submitButton name="Search"/>
    </g:form>
    <g:include view="country/countryList.gsp"/>
</div>

</body>
</html>