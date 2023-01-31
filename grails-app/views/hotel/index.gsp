<%@ page import="hotel.app.HotelController; org.hotelApp.Country; org.hotelApp.Hotel" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="public"/>
    <g:set var="entityName" value="${message(code: 'hotel.label', default: 'Hotel')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>


<g:form controller="hotel" action="saveNewHotel" method="post"
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
    <g:submitButton name="New Hotel" class="save" style="margin: 5% 10%; width: 80%"/>
</g:form>
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
%{--    <g:if test="${flash.message}">--}%
%{--        <div class="message" role="status">${flash.message}</div>--}%
%{--    </g:if>--}%
        <g:form controller="hotel" action="hotelList">
            <div class="hotels">
%{--                <g:field type="text" name="searchInput" placeholder="Search..."/>--}%
%{--                <g:submitButton name="Search" onclick="params.setProperty('offset', 0); params.setProperty('max', 10)"/>--}%
                    <g:include controller="hotel" action="hotelList" view="hotel/_hotelList.gsp"
                               params="['offset': 0, 'max': 10]"/>
            </div>
        </g:form>
</body>
</html>