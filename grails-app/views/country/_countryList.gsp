<%@ page import="org.hotelApp.Country" %>
<table>
    <thead>
    <th>Country</th>
    <th>Capital</th>
    </thead>
    <tbody>
    <g:each in="${Country.list(params)}" var="country">
        <tr>
            <td>
                <a href="show/${country.id}" target="_blank">${country.name}</a>
            </td>
            <td>${country.capital}</td>
        </tr>
    </g:each>
    </tbody>
</table>

<div class="pagination">
    <g:paginate total="${Country.count}" controller="country" action="countryList"
                max="${10}" offset="${0}"/>
</div>
