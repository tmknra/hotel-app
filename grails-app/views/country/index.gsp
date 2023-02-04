<%@ page import="org.hotelApp.Country; org.hotelApp.Country" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="public"/>
    <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}"/>
    <title>Countries</title>
</head>

<body>
<g:form class="newEntityCreation" controller="country" action="createNewCountry" method="post">
    <f:field property="name" label="Name" required="true">
        <g:textField name="name" required="true"/>
    </f:field>
    <f:field property="capital" label="Capital" required="true">
        <g:textField name="capital" required="true"/>
    </f:field>
    <g:submitButton name="New Country" class="save"/>
</g:form>

<div class="hotel-list">
    <g:form class="filterForm" controller="country" action="index" params="${[offset ?: 0, max ?: 10]}" method="get">
        <label>Enter country name: <g:field type="text" name="entityPatternSearchInput" placeholder="Search..."/></label>
        <g:submitButton name="Search"/>
    </g:form>
    <g:include view="country/countryList.gsp"/>
</div>

</body>
</html>