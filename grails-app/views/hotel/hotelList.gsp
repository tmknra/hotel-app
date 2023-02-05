<%@ page import="org.hotelApp.Hotel" %>
<table id="hotelTable" class="contentTable">
    <thead>
    <g:sortableColumn property="name" title="Hotel" titleKey="hotel.name"/>
    <g:sortableColumn property="country" title="Country" titleKey="hotel.country.name"/>
    <g:sortableColumn property="rating" title="Stars" titleKey="hotel.rating"/>
    <th>Site</th>
    </thead>
    <tbody>
    <g:each in="${hotelList}" var="hotel">
        <tr>
            <td>
                <a href="hotel/show/${hotel.id}">${hotel.name}</a>
            </td>
            <td>
                <a href="country/show/${hotel.country.id}" target="_blank">${hotel.country.name}</a>
            </td>
            <td>${hotel.rating}</td>
            <td>
                <g:if test="${hotel.siteUrl!=null}">
                    <a href="${hotel.siteUrl}" content="${hotel.siteUrl}" target="_blank">Link</a>
                </g:if>
                <g:else>
                    -
                </g:else>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<div class="pagination">
    <g:paginate total="${hotelTotalCount}" controller="hotel" action="" params="${params}"/>
</div>