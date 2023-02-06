<%@ page import="hotel.app.HotelController; org.hotelApp.Country; org.hotelApp.Hotel" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="public"/>
    <g:set var="entityName" value="${message(code: 'hotel.label', default: 'Hotel')}"/>
    <title>Hotels</title>
</head>

<body>
<div class="messageOnCreation">
    <h3>
        <g:message error="${flash.error}" message="${flash.message}"/>
    </h3>
</div>
<g:form class="newEntityCreationForm" controller="hotel" action="createNewHotel" method="post">
    <h2>Add new hotel</h2>
    <f:field property="name" label="Name" required="true">
        <g:textField name="name" value="" required="true"/>
    </f:field>
    <f:field property="country" label="Country" required="true">
        <g:select from="${countryNameList}" name="country" noSelection="['': 'Choose country...']" required="true"/>
    </f:field>
    <f:field property="rating" label="Stars" required="true">
        <g:select from="12345" name="rating" noSelection="['': '']" required="true"/>
    </f:field>
    <f:field property="site" label="Site" required="false">
        <g:textField class="hotelSiteUrlInput" name="site" pattern="(http[s]?:\\/\\/www\\.[\\w]+\\.[a-z]{2,3})"
                     onclick="this.title='Example: http[s]://www.hotel.org'"/>
    </f:field>
    <g:submitButton name="New Hotel" class="createButton"/>
</g:form>

<div class="entityList">
    <g:form class="filterForm" controller="hotel" action="index" params="${[offset ?: 0, max ?: 10]}" method="get">
        <label>Country:
        <g:if test="${params.country != null}">
            <g:select name="country" from="${countryNameList}" value="${params.country}"/>
        </g:if>
        <g:else>
            <g:select name="country" from="${countryNameList}" noSelection="['': 'Any']"/>
        </g:else>
        </label>
        <label>Hotel:
        <g:if test="${params.entityPatternSearchInput != null}">
            <g:field type="text" name="entityPatternSearchInput" value="${params.entityPatternSearchInput}"/>
        </g:if>
        <g:else>
            <g:field type="text" name="entityPatternSearchInput" placeholder="Search..."/>
        </g:else>

        </label>
        <g:submitButton name="Search"/>
    </g:form>
    <g:if test="${(params.entityPatternSearchInput.toString().isEmpty() || params.entityPatternSearchInput == null)
            && (params.country.toString().isEmpty() || params.country == null)}">
        <g:include view="hotel/hotelList.gsp"/>
    </g:if>
    <g:else>
        <g:include view="hotel/filteredHotelList.gsp"/>
    </g:else>
</div>

</body>
</html>