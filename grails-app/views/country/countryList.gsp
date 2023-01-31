<%@ page import="org.hotelApp.Country; org.hotelApp.Country" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="public"/>
    <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-country" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<g:form controller="country" action="saveNewCountry" method="post"
        style="margin: 0 auto; width:320px; float: right; justify-content: center">
    <f:field property="name" label="Name" required="true">
        <g:textField name="name" value=""/>
    </f:field>
    <f:field property="country" label="Country" required="true">
        <g:select from="${Country.list().name}" name="country"/>
    </f:field>
    <f:field property="rating" label="Stars" required="true">
        <g:select from="12345" name="rating"/>
    </f:field>
    <f:field property="site" label="Site" required="false">
        <g:textField name="site"/>
    </f:field>
    <g:submitButton name="New Country" class="save" style="margin: 5% 10%; width: 80%"/>
</g:form>
<div id="list-country" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
        <div>
            <g:include controller="country" action="countryList" view="country/_countryList.gsp"/>
        </div>

</body>
</html>