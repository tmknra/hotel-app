<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="public"/>
    <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<h1><g:message code="default.edit.label" args="[entityName]"/></h1>

<div id="edit-country" class="entityContentShow" role="main">
    <g:form class="entityUpdateForm" resource="${this.country}" method="PUT">
        <fieldset class="onEntityActions">
            <f:all bean="country" required="true"/>
        </fieldset>
        <fieldset class="buttons">
            <input class="save" type="submit"
                   value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
