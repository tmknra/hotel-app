<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="public"/>
    <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<h1><g:message code="default.show.label" args="[entityName]"/></h1>

<div id="show-country" class="entityContentShow" role="main">
        <div class="showMessage" role="status">
            <h3>
                <g:message message="${flash.message}" error="${flash.error}"/>
            </h3>
        </div>
    <f:display bean="country"/>
    <g:form class="onEntityActions" resource="${this.country}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.country}">
                <g:message code="default.button.edit.label" default="Edit"/>
            </g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
