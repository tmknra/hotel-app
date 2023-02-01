<%@ page import="org.hotelApp.Country" %>
<table>
    <thead>
    <g:sortableColumn property="name" title="Country" titleKey="country.name"/>
    <g:sortableColumn property="capital" title="Capital" titleKey="country.capital"/>
    </thead>
    <tbody>
    <g:each in="${countryList}" var="country">
        <tr>
            <td>
                <a href="country/show/${country.id}" target="_blank">${country.name}</a>
            </td>
            <td>${country.capital}</td>
        </tr>
    </g:each>
    </tbody>
</table>

<div class="pagination">
    <g:paginate total="${countryTotal}" controller="country" action="" params="${params}"/>
</div>
