<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="public" />
        <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-country" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="edit-country" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:hasErrors bean="${this.country}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.country}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.country}" method="PUT">
                <g:hiddenField name="version" value="${this.country?.version}" />
                <fieldset class="form">
                    <f:all bean="country"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
