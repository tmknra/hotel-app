<%@ page import="org.hotelApp.Country; org.hotelApp.Country" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="public"/>
    <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}"/>
    <title>Countries</title>
</head>

<body>
<div class="messageOnCreation">
    <h3>
        <g:message error="${flash.error}" message="${flash.message}"/>
    </h3>
</div>
<g:form class="newEntityCreationForm" controller="country" action="createNewCountry" method="post">
    <h2>Add new country</h2>
    <f:field property="name" label="Name" required="true">
        <g:textField name="name" required="true"/>
    </f:field>
    <f:field property="capital" label="Capital" required="true">
        <g:textField name="capital" required="true"/>
    </f:field>
    <g:submitButton name="New Country" class="createButton"/>
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