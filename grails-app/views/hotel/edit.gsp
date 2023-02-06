<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="public"/>
    <g:set var="entityName" value="${message(code: 'hotel.label', default: 'Hotel')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<h1><g:message code="default.edit.label" args="[entityName]"/></h1>

<div id="edit-hotel" class="entityContentShow" role="main">
    <g:form class="entityUpdateForm" resource="${this.hotel}" method="PUT">
        <g:hiddenField name="version" value="${this.hotel?.version}"/>
        <fieldset class="onEntityActions">
            <f:all bean="hotel" required="true" except="siteUrl"/>
            <f:field bean="hotel" property="siteUrl" pattern="(http[s]?:\\/\\/www\\.[\\w]+\\.[a-z]{2,3})"/>
            <span class="hotelSiteUrlPattern">Example: http[s]://www.hotel.org</span>
        </fieldset>
        <fieldset class="buttons">
            <input class="save" type="submit"
                   value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
