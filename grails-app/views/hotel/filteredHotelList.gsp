<%@ page import="org.hotelApp.Hotel" %>
<table id="hotelTable" class="contentTable">
    <thead>
    <g:sortableColumn property="rating" title="Stars" titleKey="hotel.rating"/>
    <g:sortableColumn property="name" title="Hotel" titleKey="hotel.name"/>
    <th>Site</th>
    </thead>
    <tbody>
    <g:if test="${hotelList.size() != 0}">
        <div class="foundedHotelsCount">Found hotels: ${hotelTotalCount}</div>
        <g:each in="${hotelList}" var="hotel">
            <tr>
                <td>${hotel.rating}</td>
                <td>
                    <a href="hotel/show/${hotel.id}">${hotel.name}</a>
                </td>
                <td>
                    <a href="${hotel.siteUrl}" content="${hotel.siteUrl}" target="_blank">link</a>
                </td>
            </tr>
        </g:each>
    </g:if>
    <g:else>
        <tr>
            <td class="noResults">No results</td>
        </tr>
    </g:else>
    </tbody>
</table>

<div class="pagination">
    <g:paginate total="${hotelTotalCount}" controller="hotel" action="" params="${params}"/>
</div>