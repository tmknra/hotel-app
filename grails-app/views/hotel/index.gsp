<%@ page import="hotel.app.HotelController; org.hotelApp.Country; org.hotelApp.Hotel" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="public"/>
    <g:set var="entityName" value="${message(code: 'hotel.label', default: 'Hotel')}"/>
    <title>Hotels</title>
</head>

<body>

<g:form class="newEntity" controller="hotel" action="saveNewHotel" method="post">
    <f:field property="name" label="Name" required="true">
        <g:textField name="name" value=""/>
    </f:field>
    <f:field property="country" label="Country" required="true">
        <g:select from="${Country.list().name}" name="country" noSelection="['': '']"/>
    </f:field>
    <f:field property="rating" label="Stars" required="true">
        <g:select from="12345" name="rating"/>
    </f:field>
    <f:field property="site" label="Site" required="false">
        <g:textField name="site"/>
    </f:field>
    <g:submitButton name="New Hotel" class="save"/>
</g:form>

<div class="hotel-list">
    <g:form class="filter" controller="hotel" action="index" params="${[offset ?: 0, max ?: 10]}" method="get">
        <label>Country:<g:select name="country" from="${Country.list().name}" noSelection="['': 'Any']"/></label>
        <label>Hotel: <g:field type="text" name="searchInput" placeholder="Search..."/></label>
        <g:submitButton name="Search"/>
    </g:form>
    <g:if test="${params.searchInput == null}">
        <g:include view="hotel/hotelList.gsp"/>
    </g:if>
    <g:else>
        <g:include view="hotel/filteredList.gsp"/>
    </g:else>
</div>

</body>
</html>