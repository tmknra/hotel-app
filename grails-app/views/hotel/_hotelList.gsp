<%@ page import="org.hotelApp.Hotel" %>
<table id="hotelTable">
    <thead>
            <g:sortableColumn property="name" title="Hotel" titleKey="hotel.name"/>
            <g:sortableColumn property="country" title="Country" titleKey="hotel.country.name"/>
            <g:sortableColumn property="rating" title="Stars" titleKey="hotel.rating"/>
    <th>URL</th>
    </thead>
    <tbody>
    <g:each in="${Hotel.list(params as Map)}" var="hotel">
        <tr>
            <td>
                <a href="show/${hotel.id}" target="_blank">${hotel.name}</a>
            </td>
            <td>${hotel.country.name}</td>
            <td>${hotel.rating}</td>
            <td>
                <a href="${hotel.siteUrl}" content="${hotel.siteUrl}" target="_blank">${hotel.siteUrl}</a>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<div class="pagination">
    <g:paginate total="${Hotel.count}" controller="hotel" action="hotelList"
                max="${10}" offset="${0}"/>
</div>
