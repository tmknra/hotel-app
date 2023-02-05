<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="public"/>
    <g:set var="entityName" value="${message(code: 'hotel.label', default: 'Hotel')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<h1><g:message code="default.show.label" args="[entityName]"/></h1>

<div id="show-hotel" class="entityContentShow" role="main">
    <g:if test="${flash.message}">
        <div class="showMessage" role="status">
            <h3>
                <g:message message="${flash.message}" error="${flash.error}"/>
            </h3>
        </div>
    </g:if>
    <ol class="property-list hotel">
        <li class="fieldContain">
            <span id="name-label" class="property-label">Name</span>

            <div class="property-value"><f:display bean="hotel" property="name"/>
            </div>
        </li>
        <li class="fieldContain">
            <span id="rating-label" class="property-label">Rating</span>

            <div class="property-value"><f:display bean="hotel" property="rating"/>
            </div>
        </li>
        <li class="fieldContain">
            <span id="country-label" class="property-label">Country</span>

            <div class="property-value">
                <f:display bean="hotel" property="country"/>
            </div></li>
        <li class="fieldContain">
            <span id="site-url-label" class="property-label">Site Url</span>

            <div class="property-value">
                <a href="${hotel.siteUrl}" target="_blank">
                    <f:display bean="hotel" property="siteUrl"/>
                </a>
            </div>
        </li>
    </ol>
    <g:form class="onEntityActions" resource="${this.hotel}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${this.hotel}"><g:message code="default.button.edit.label"
                                                                                   default="Edit"/></g:link>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
